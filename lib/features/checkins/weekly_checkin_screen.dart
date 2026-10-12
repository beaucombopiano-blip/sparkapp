import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/shell/page_scaffold.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/models/checkins.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';
import '../onboarding/onboarding_frame.dart' show StepDots;
import '../project/proposal_sheet.dart';

/// Four short friendly screens, then the backend's encouragement and any
/// proposed schedule change (never applied automatically).
class WeeklyCheckinScreen extends ConsumerStatefulWidget {
  const WeeklyCheckinScreen({super.key});

  @override
  ConsumerState<WeeklyCheckinScreen> createState() => _WeeklyCheckinScreenState();
}

class _WeeklyCheckinScreenState extends ConsumerState<WeeklyCheckinScreen> {
  int _page = 0;
  int? _feeling;
  int? _progress;
  final _challenges = TextEditingController();
  bool? _realistic;
  bool _busy = false;
  CheckinResult? _result;

  @override
  void dispose() {
    _challenges.dispose();
    super.dispose();
  }

  bool get _canContinue => switch (_page) {
        0 => _feeling != null,
        1 => _progress != null,
        2 => true,
        _ => _realistic != null,
      };

  Future<void> _submit() async {
    final pid = ref.read(activeProjectIdProvider);
    if (pid == null) return;
    setState(() => _busy = true);
    try {
      final result = await ref.read(engagementRepositoryProvider).submitCheckin(
            projectId: pid,
            feeling: _feeling!,
            progressRating: _progress!,
            challenges: _challenges.text.trim(),
            scheduleStillRealistic: _realistic!,
          );
      if (mounted) setState(() => _result = result);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _submit);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _next() {
    if (_page < 3) {
      setState(() => _page++);
    } else {
      _submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final hasProject = ref.watch(activeProjectIdProvider) != null;

    Widget body;
    if (!hasProject) {
      body = EmptyState(title: l10n.checkinNoProject, icon: Icons.forum_outlined);
    } else if (_result != null) {
      body = ListView(
        padding: const EdgeInsets.all(Space.l),
        children: <Widget>[
          const Center(child: AnimatedSparkLogo(size: 96)),
          const SizedBox(height: Space.m),
          Text(l10n.checkinThanks, style: text.headlineSmall, textAlign: TextAlign.center),
          const SizedBox(height: Space.s),
          Text(_result!.encouragement, style: text.bodyLarge, textAlign: TextAlign.center),
          if (_result!.proposal != null) ...<Widget>[
            const SizedBox(height: Space.l),
            ProposalReview(proposal: _result!.proposal!, inline: true),
          ],
          const SizedBox(height: Space.l),
          SparkButton(label: l10n.checkinDone, expand: true, onPressed: () => context.go(Routes.dashboard)),
        ],
      );
    } else {
      final Widget question = switch (_page) {
        0 => _Scale(
            question: l10n.checkinQ1,
            labels: <String>[l10n.checkinFeeling1, l10n.checkinFeeling2, l10n.checkinFeeling3, l10n.checkinFeeling4, l10n.checkinFeeling5],
            emojis: const <String>['😣', '😕', '😐', '🙂', '😄'],
            value: _feeling,
            onChanged: (v) => setState(() => _feeling = v),
          ),
        1 => _Scale(
            question: l10n.checkinQ2,
            labels: <String>[l10n.checkinProgress1, l10n.checkinProgress2, l10n.checkinProgress3, l10n.checkinProgress4, l10n.checkinProgress5],
            emojis: const <String>['🧱', '🐢', '🚶', '🏃', '🚀'],
            value: _progress,
            onChanged: (v) => setState(() => _progress = v),
          ),
        2 => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(l10n.checkinQ3, style: text.headlineSmall),
              const SizedBox(height: Space.m),
              TextField(
                controller: _challenges,
                minLines: 3,
                maxLines: 6,
                maxLength: 1000,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(hintText: l10n.checkinQ3Hint),
              ),
            ],
          ),
        _ => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(l10n.checkinQ4, style: text.headlineSmall),
              const SizedBox(height: Space.m),
              for (final (value, label) in <(bool, String)>[(true, l10n.checkinYes), (false, l10n.checkinNo)])
                Padding(
                  padding: const EdgeInsets.only(bottom: Space.s),
                  child: _OptionTile(label: label, selected: _realistic == value, onTap: () => setState(() => _realistic = value)),
                ),
            ],
          ),
      };
      body = Padding(
        padding: const EdgeInsets.all(Space.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StepDots(current: _page, total: 4),
            const SizedBox(height: Space.l),
            Expanded(child: SingleChildScrollView(child: question)),
            Row(
              children: <Widget>[
                if (_page > 0) SparkButton.text(label: l10n.commonBack, onPressed: _busy ? null : () => setState(() => _page--)),
                const Spacer(),
                SparkButton(
                  key: const Key('checkin-next'),
                  label: _page == 3 ? l10n.checkinSubmit : l10n.commonNext,
                  loading: _busy,
                  onPressed: _canContinue ? _next : null,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return SparkPageScaffold(title: l10n.checkinTitle, body: body);
  }
}

/// Emoji scale with labels (never emoji alone).
class _Scale extends StatelessWidget {
  const _Scale({
    required this.question,
    required this.labels,
    required this.emojis,
    required this.value,
    required this.onChanged,
  });

  final String question;
  final List<String> labels;
  final List<String> emojis;
  final int? value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(question, style: text.headlineSmall),
        const SizedBox(height: Space.m),
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.s),
            child: _OptionTile(
              leading: ExcludeSemantics(child: Text(emojis[i], style: const TextStyle(fontSize: 26))),
              label: labels[i],
              selected: value == i + 1,
              onTap: () => onChanged(i + 1),
            ),
          ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({required this.label, required this.selected, required this.onTap, this.leading});

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? c.primary : c.card,
        borderRadius: Radii.buttonAll,
        child: InkWell(
          borderRadius: Radii.buttonAll,
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 56),
            padding: const EdgeInsets.symmetric(horizontal: Space.m, vertical: Space.s),
            decoration: BoxDecoration(borderRadius: Radii.buttonAll, border: Border.all(color: selected ? c.primary : c.border)),
            child: Row(
              children: <Widget>[
                if (leading != null) ...<Widget>[leading!, const SizedBox(width: Space.m)],
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: selected ? c.onPrimary : c.textPrimary),
                  ),
                ),
                if (selected) Icon(Icons.check_rounded, color: c.onPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
