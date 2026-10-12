import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';
import 'spark_button.dart';
import 'spark_card.dart';

enum ProposalPhase { idle, working, done, failed, cancelled }

/// Shows exactly what a proposed change would do, with Confirm / Not now.
///
/// It never presents a proposal as completed: "Done ✓" appears only after
/// [onConfirm] resolves to `true` (the backend reported success) or the
/// server-side status says the action executed.
class ProposalCard extends StatefulWidget {
  const ProposalCard({
    super.key,
    required this.preview,
    required this.onConfirm,
    this.onNotNow,
    this.title,
    this.details = const <String>[],
    this.serverPhase,
    this.serverError,
    this.confirmLabel,
    this.confirmEnabled = true,
    this.extra,
    this.icon = Icons.auto_fix_high_rounded,
  });

  final String? title;
  final String preview;
  final List<String> details;

  /// Must resolve to true only when the backend confirmed success. Throwing
  /// or returning false shows the failure with Retry.
  final Future<bool> Function() onConfirm;
  final Future<void> Function()? onNotNow;

  /// Status already known from the server (e.g. a proposedActions document).
  final ProposalPhase? serverPhase;
  final String? serverError;
  final String? confirmLabel;
  final bool confirmEnabled;

  /// Extra content (e.g. option chooser) shown above the buttons.
  final Widget? extra;
  final IconData icon;

  @override
  State<ProposalCard> createState() => _ProposalCardState();
}

class _ProposalCardState extends State<ProposalCard> {
  ProposalPhase _phase = ProposalPhase.idle;
  Object? _error;

  ProposalPhase get _effectivePhase {
    if (_phase == ProposalPhase.working) return _phase;
    if (_phase == ProposalPhase.idle && widget.serverPhase != null) return widget.serverPhase!;
    return _phase;
  }

  Future<void> _confirm() async {
    setState(() {
      _phase = ProposalPhase.working;
      _error = null;
    });
    try {
      final ok = await widget.onConfirm();
      if (!mounted) return;
      setState(() => _phase = ok ? ProposalPhase.done : ProposalPhase.failed);
    } on Object catch (e) {
      if (!mounted) return;
      setState(() {
        _phase = ProposalPhase.failed;
        _error = e;
      });
    }
  }

  Future<void> _notNow() async {
    final notNow = widget.onNotNow;
    setState(() {
      _phase = ProposalPhase.working;
      _error = null;
    });
    try {
      if (notNow != null) await notNow();
      if (!mounted) return;
      setState(() => _phase = ProposalPhase.cancelled);
    } on Object catch (e) {
      if (!mounted) return;
      setState(() {
        _phase = ProposalPhase.failed;
        _error = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final phase = _effectivePhase;

    final String? failure = phase == ProposalPhase.failed
        ? (_error != null
            ? errorMessage(l10n, _error!)
            : (widget.serverError ?? l10n.errorUnknown))
        : null;

    final Widget footer = switch (phase) {
      ProposalPhase.working => Semantics(
          liveRegion: true,
          child: Row(
            children: <Widget>[
              SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2.4, color: c.primary)),
              const SizedBox(width: Space.s),
              Text(l10n.proposalWorking, style: text.bodyMedium),
            ],
          ),
        ),
      ProposalPhase.done => Semantics(
          liveRegion: true,
          child: Row(
            children: <Widget>[
              Icon(Icons.check_circle_rounded, color: c.success),
              const SizedBox(width: Space.s),
              Text(l10n.proposalDone, style: text.titleMedium?.copyWith(color: c.success)),
            ],
          ),
        ),
      ProposalPhase.cancelled => Text(l10n.proposalCancelled, style: text.bodyMedium),
      ProposalPhase.failed => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Semantics(
              liveRegion: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.error_outline_rounded, color: c.danger),
                  const SizedBox(width: Space.s),
                  Expanded(
                    child: Text(l10n.proposalFailed(failure!), style: text.bodyMedium?.copyWith(color: c.danger)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Space.s),
            Wrap(
              spacing: Space.s,
              children: <Widget>[
                SparkButton(label: l10n.commonRetry, icon: Icons.refresh_rounded, onPressed: _confirm),
                if (widget.onNotNow != null) SparkButton.text(label: l10n.proposalNotNow, onPressed: _notNow),
              ],
            ),
          ],
        ),
      ProposalPhase.idle => Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: <Widget>[
            SparkButton(
              label: widget.confirmLabel ?? l10n.proposalConfirm,
              icon: Icons.check_rounded,
              onPressed: widget.confirmEnabled ? _confirm : null,
            ),
            if (widget.onNotNow != null) SparkButton.text(label: l10n.proposalNotNow, onPressed: _notNow),
          ],
        ),
    };

    return SparkCard(
      tone: SparkCardTone.tinted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(widget.icon, color: c.primary, size: 20),
              const SizedBox(width: Space.s),
              Expanded(
                child: Text(widget.title ?? l10n.proposalPendingLabel, style: text.labelLarge),
              ),
            ],
          ),
          const SizedBox(height: Space.s),
          Text(widget.preview, style: text.bodyLarge),
          if (widget.details.isNotEmpty) ...<Widget>[
            const SizedBox(height: Space.s),
            Text(l10n.proposalWouldChange, style: text.labelMedium),
            const SizedBox(height: Space.xs),
            for (final line in widget.details)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: Space.s),
                      child: Icon(Icons.circle, size: 6, color: c.secondary),
                    ),
                    Expanded(child: Text(line, style: text.bodyMedium)),
                  ],
                ),
              ),
          ],
          if (widget.extra != null && phase == ProposalPhase.idle) ...<Widget>[
            const SizedBox(height: Space.s),
            widget.extra!,
          ],
          const SizedBox(height: Space.m),
          AnimatedSwitcher(duration: Motion.medium, child: KeyedSubtree(key: ValueKey<ProposalPhase>(phase), child: footer)),
        ],
      ),
    );
  }
}
