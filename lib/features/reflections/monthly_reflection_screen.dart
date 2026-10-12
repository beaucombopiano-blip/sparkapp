import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/shell/page_scaffold.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/checkins.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';

part 'monthly_reflection_screen.g.dart';

@riverpod
Future<MonthlyReflectionSummary?> monthlySummary(Ref ref, String month) async {
  final pid = ref.watch(activeProjectIdProvider);
  if (pid == null) return null;
  return ref.read(engagementRepositoryProvider).getMonthlyReflection(pid, month);
}

String monthKey(DateTime d) => '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}';

/// Summary card from real data, then three prompts saved with saveReflection.
class MonthlyReflectionScreen extends ConsumerStatefulWidget {
  const MonthlyReflectionScreen({super.key, this.month});

  /// "YYYY-MM"; defaults to the previous month (the prompt arrives on the 1st).
  final String? month;

  @override
  ConsumerState<MonthlyReflectionScreen> createState() => _MonthlyReflectionScreenState();
}

class _MonthlyReflectionScreenState extends ConsumerState<MonthlyReflectionScreen> {
  late DateTime _month;
  final _learned = TextEditingController();
  final _change = TextEditingController();
  final _goals = TextEditingController();
  String? _filledFor;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    final parts = widget.month?.split('-');
    final today = ref.read(userClockProvider).today();
    if (parts != null && parts.length == 2 && int.tryParse(parts[0]) != null && int.tryParse(parts[1]) != null) {
      _month = DateTime(int.parse(parts[0]), int.parse(parts[1]));
    } else {
      _month = DateTime(today.year, today.month - 1);
    }
  }

  @override
  void dispose() {
    _learned.dispose();
    _change.dispose();
    _goals.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final pid = ref.read(activeProjectIdProvider);
    if (pid == null) return;
    setState(() => _busy = true);
    try {
      await ref.read(engagementRepositoryProvider).saveReflection(
            projectId: pid,
            month: monthKey(_month),
            learned: _learned.text.trim(),
            change: _change.text.trim(),
            goals: _goals.text.trim(),
          );
      if (mounted) showInfoSnack(context, context.l10n.monthlySaved);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _save);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _shift(int delta) => setState(() {
        _month = DateTime(_month.year, _month.month + delta);
        _filledFor = null;
      });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final key = monthKey(_month);
    final summary = ref.watch(monthlySummaryProvider(key));
    final today = ref.watch(userClockProvider).today();
    final isFuture = DateTime(today.year, today.month).isBefore(_month);

    // Prefill with an existing reflection once per month.
    final existing = summary.value?.existingReflection;
    if (_filledFor != key && summary.hasValue) {
      _filledFor = key;
      _learned.text = existing?.learned ?? '';
      _change.text = existing?.change ?? '';
      _goals.text = existing?.goals ?? '';
    }

    return SparkPageScaffold(
      title: l10n.monthlyTitle,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(tooltip: l10n.monthlyPrevMonth, onPressed: () => _shift(-1), icon: const Icon(Icons.chevron_left_rounded)),
              Expanded(child: Text(fmt.monthYear(_month), style: text.titleLarge, textAlign: TextAlign.center)),
              IconButton(
                tooltip: l10n.monthlyNextMonth,
                onPressed: isFuture ? null : () => _shift(1),
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          AsyncValueView<MonthlyReflectionSummary?>(
            value: summary,
            compact: true,
            onRetry: () => ref.invalidate(monthlySummaryProvider(key)),
            data: (s) => s == null ? EmptyState(title: l10n.checkinNoProject, compact: true) : _SummaryCard(summary: s),
          ),
          const SizedBox(height: Space.l),
          for (final (controller, prompt) in <(TextEditingController, String)>[
            (_learned, l10n.monthlyLearnedPrompt),
            (_change, l10n.monthlyChangePrompt),
            (_goals, l10n.monthlyGoalsPrompt),
          ]) ...<Widget>[
            Text(prompt, style: text.titleMedium),
            const SizedBox(height: Space.s),
            TextField(
              controller: controller,
              minLines: 3,
              maxLines: 8,
              maxLength: 2000,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: Space.m),
          ],
          SparkButton(
            key: const Key('monthly-save'),
            label: l10n.monthlySave,
            icon: Icons.save_rounded,
            loading: _busy,
            expand: true,
            onPressed: summary.value == null ? null : _save,
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.summary});
  final MonthlyReflectionSummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    Widget list(String title, List<String> items, IconData icon) => items.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: Space.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: text.labelLarge),
                Wrap(
                  spacing: Space.s,
                  runSpacing: Space.xs,
                  children: <Widget>[for (final i in items) SparkChip(label: i, icon: icon)],
                ),
              ],
            ),
          );
    return SparkCard(
      tone: SparkCardTone.tinted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.monthlySummary, style: text.titleMedium),
          const SizedBox(height: Space.s),
          Row(
            children: <Widget>[
              Icon(Icons.task_alt_rounded, color: c.primary),
              const SizedBox(width: Space.s),
              Text(l10n.monthlyTasks(summary.tasksCompleted), style: text.bodyLarge),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.schedule_rounded, color: c.primary),
              const SizedBox(width: Space.s),
              Text(l10n.monthlyTime(context.fmt.duration(summary.minutesSpent)), style: text.bodyLarge),
            ],
          ),
          list(l10n.monthlyMilestones, summary.milestonesCompleted, Icons.diamond_rounded),
          list(l10n.monthlyBadges, summary.badges.map((b) => b.name).toList(), Icons.emoji_events_rounded),
          list(l10n.monthlyChallenges, summary.challenges, Icons.flag_rounded),
          list(l10n.monthlyPriorities, summary.upcomingPriorities, Icons.arrow_forward_rounded),
        ],
      ),
    );
  }
}
