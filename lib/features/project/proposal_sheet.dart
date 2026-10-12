import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../core/widgets/proposal_card.dart';
import '../../data/models/schedule.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/schedule_repository.dart';
import 'project_providers.dart';

/// Plain-language lines describing what a proposal changes.
List<String> describeProposal(Proposal proposal, AppLocalizations l10n, String locale, UserClock clock) {
  String day(DateTime? d) => d == null ? '' : DateFormat.MMMEd(locale).format(clock.toWallClock(d));
  return <String>[
    for (final c in proposal.changes)
      switch (c.kind) {
        'move' when c.fromDate != null && c.toDate != null => l10n.changeMove(c.title, day(c.fromDate), day(c.toDate)),
        'move' when c.toDate != null => l10n.changeMoveTo(c.title, day(c.toDate)),
        'add' => l10n.changeAdd(c.title),
        'remove' || 'obsolete' => l10n.changeRemove(c.title),
        'deadline' when c.toDate != null => l10n.changeDeadline(day(c.toDate)),
        _ => c.description ?? c.title,
      },
  ];
}

/// Shows a proposal for review. Nothing changes until the user confirms and
/// `applyProposal` succeeds.
Future<void> showProposalSheet(BuildContext context, Proposal proposal) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => ProposalReview(proposal: proposal),
  );
}

class ProposalReview extends ConsumerStatefulWidget {
  const ProposalReview({super.key, required this.proposal, this.inline = false});

  final Proposal proposal;

  /// Rendered inside a page instead of a sheet.
  final bool inline;

  @override
  ConsumerState<ProposalReview> createState() => _ProposalReviewState();
}

class _ProposalReviewState extends ConsumerState<ProposalReview> {
  String? _optionId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final clock = ref.watch(userClockProvider);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final p = widget.proposal;
    final repo = ref.read(scheduleRepositoryProvider);
    // The backend's record wins: applied elsewhere (or after a timeout here)
    // shows Done; dismissed shows Skipped.
    final status = ref.watch(proposalByIdProvider(p.id)).value?.status ?? p.status;
    final serverPhase = switch (status) {
      ProposalStatus.applied => ProposalPhase.done,
      ProposalStatus.dismissed => ProposalPhase.cancelled,
      ProposalStatus.failed => ProposalPhase.failed,
      _ => null,
    };

    final options = p.needsOptionChoice
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(l10n.proposalChooseOption, style: text.labelLarge),
              RadioGroup<String>(
                groupValue: _optionId,
                onChanged: (v) => setState(() => _optionId = v),
                child: Column(
                  children: <Widget>[
                    for (final o in p.options)
                      RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        value: o.id,
                        title: Text(o.label),
                        subtitle: o.description == null ? null : Text(o.description!),
                      ),
                  ],
                ),
              ),
            ],
          )
        : null;

    final card = ProposalCard(
      title: p.title ?? l10n.proposalDefaultTitle,
      preview: p.summary ?? p.reason ?? l10n.proposalDefaultTitle,
      details: describeProposal(p, l10n, locale, clock),
      extra: options,
      confirmEnabled: !p.needsOptionChoice || _optionId != null,
      serverPhase: serverPhase,
      icon: Icons.event_repeat_rounded,
      onConfirm: () async {
        await repo.applyProposal(p.id, optionId: _optionId);
        return true;
      },
      onNotNow: () => repo.dismissProposal(p.id),
    );

    if (widget.inline) return card;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.l + MediaQuery.viewInsetsOf(context).bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text(l10n.proposalSheetTitle, style: text.titleLarge)),
              IconButton(
                tooltip: l10n.commonClose,
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close_rounded, color: c.iconMuted),
              ),
            ],
          ),
          const SizedBox(height: Space.s),
          card,
        ],
      ),
    );
  }
}
