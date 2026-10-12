import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/milestone_marker.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_progress_bar.dart';
import '../../core/widgets/states.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import 'project_providers.dart';

/// Vertical timeline: dates, phases, milestones, deadlines, work done vs
/// remaining, and estimated progress.
class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeline = ref.watch(activeTimelineProvider);
    final l10n = context.l10n;
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(activeTimelineProvider);
        try {
          await ref.read(activeTimelineProvider.future);
        } on Object {
          // Error state renders below.
        }
      },
      child: AsyncValueView<Timeline?>(
        value: timeline,
        onRetry: () => ref.invalidate(activeTimelineProvider),
        data: (t) => t == null
            ? ListView(children: <Widget>[EmptyState(title: l10n.timelineEmpty, icon: Icons.timeline_rounded)])
            : _TimelineBody(timeline: t),
      ),
    );
  }
}

class _TimelineBody extends ConsumerWidget {
  const _TimelineBody({required this.timeline});
  final Timeline timeline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final t = timeline;
    String date(DateTime? d) => d == null ? '–' : fmt.longDate(clock.toWallClock(d));
    final phases = List<TimelinePhase>.of(t.phases)..sort((a, b) => a.order.compareTo(b.order));

    String statusLabel(MilestoneStatus s) => switch (s) {
          MilestoneStatus.done => l10n.timelineDone,
          MilestoneStatus.inProgress => l10n.timelineInProgress,
          _ => l10n.timelineUpcoming,
        };

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        SparkCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: _DateBlock(label: l10n.timelineStart, value: date(t.startDate), icon: Icons.play_circle_rounded)),
                  Expanded(child: _DateBlock(label: l10n.timelineTarget, value: date(t.targetEndDate), icon: Icons.flag_rounded)),
                ],
              ),
              const SizedBox(height: Space.m),
              Text(l10n.timelineEstimated, style: text.labelLarge),
              const SizedBox(height: Space.xs),
              SparkProgressBar(done: t.percentComplete / 100, projected: t.projectedPercentByWeekEnd / 100),
              const SizedBox(height: Space.xs),
              Text(
                l10n.projectTimeSummary(fmt.duration(t.completedMinutes), fmt.duration(t.remainingMinutes)),
                style: text.bodySmall,
              ),
            ],
          ),
        ),
        if (t.upcomingDeadlines.isNotEmpty) ...<Widget>[
          const SizedBox(height: Space.l),
          Text(l10n.timelineUpcomingDeadlines, style: text.titleMedium),
          const SizedBox(height: Space.s),
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                for (final d in t.upcomingDeadlines)
                  ListTile(
                    leading: Icon(d.kind == 'project' ? Icons.flag_rounded : Icons.diamond_rounded, color: c.secondary),
                    title: Text(d.title),
                    subtitle: Text(date(d.date ?? d.targetDate)),
                  ),
              ],
            ),
          ),
        ],
        const SizedBox(height: Space.l),
        for (var i = 0; i < phases.length; i++)
          _PhaseSection(
            phase: phases[i],
            isLast: i == phases.length - 1,
            statusLabel: statusLabel,
            date: date,
          ),
      ],
    );
  }
}

class _DateBlock extends StatelessWidget {
  const _DateBlock({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Icon(icon, color: context.spark.secondary),
        const SizedBox(width: Space.s),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text(label, style: text.labelSmall), Text(value, style: text.titleSmall)],
          ),
        ),
      ],
    );
  }
}

class _PhaseSection extends StatelessWidget {
  const _PhaseSection({required this.phase, required this.isLast, required this.statusLabel, required this.date});

  final TimelinePhase phase;
  final bool isLast;
  final String Function(MilestoneStatus) statusLabel;
  final String Function(DateTime?) date;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final ms = List<Milestone>.of(phase.milestones)..sort((a, b) => a.order.compareTo(b.order));
    final color = switch (phase.status) {
      MilestoneStatus.done => c.success,
      MilestoneStatus.inProgress => c.primary,
      _ => c.iconMuted,
    };
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: 28,
            child: Column(
              children: <Widget>[
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                  child: phase.status == MilestoneStatus.done
                      ? Icon(Icons.check_rounded, size: 12, color: c.onPrimary)
                      : null,
                ),
                if (!isLast) Expanded(child: Container(width: 3, color: color.withValues(alpha: 0.4))),
              ],
            ),
          ),
          const SizedBox(width: Space.s),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: Space.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Semantics(header: true, child: Text(phase.title, style: text.titleMedium))),
                      SparkChip(label: statusLabel(phase.status)),
                    ],
                  ),
                  if (phase.startDate != null || phase.endDate != null)
                    Text(context.l10n.projectDates(date(phase.startDate), date(phase.endDate)), style: text.bodySmall),
                  const SizedBox(height: Space.s),
                  for (final m in ms)
                    Padding(
                      padding: const EdgeInsets.only(bottom: Space.xs),
                      child: SparkCard(
                        padding: const EdgeInsets.all(Space.s),
                        child: Row(
                          children: <Widget>[
                            MilestoneMarker(status: m.status),
                            const SizedBox(width: Space.s),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(m.title, style: text.titleSmall),
                                  Text(
                                    '${statusLabel(m.status)} · ${date(m.completedAt ?? m.targetDate)}',
                                    style: text.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
