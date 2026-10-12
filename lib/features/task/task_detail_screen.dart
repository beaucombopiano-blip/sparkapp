import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/milestone_marker.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../agenda/reschedule_actions.dart';
import '../billing/entitlements.dart';
import '../journal/add_journal_entry.dart';
import '../project/project_providers.dart';
import 'task_completion.dart';

/// Task detail: everything about one task plus its actions.
class TaskDetailScreen extends ConsumerWidget {
  const TaskDetailScreen({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskByIdProvider(taskId));
    final l10n = context.l10n;
    return AsyncValueView<Task?>(
      value: task,
      onRetry: () => ref.invalidate(taskByIdProvider(taskId)),
      data: (t) => t == null
          ? EmptyState(title: l10n.taskNotFound, icon: Icons.search_off_rounded)
          : _TaskDetail(task: t),
    );
  }
}

class _TaskDetail extends ConsumerWidget {
  const _TaskDetail({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final completing = ref.watch(taskCompletionProvider).contains(task.id);
    final prereqs = ref.watch(tasksByIdsProvider(task.dependsOn.join(','))).value ?? const <Task>[];
    final session = task.sessionId == null ? null : ref.watch(sessionByIdProvider(task.sessionId!)).value;
    final milestones = ref.watch(activeMilestonesProvider).value ?? const <Milestone>[];
    final milestone = milestones.where((m) => m.id == task.milestoneId).firstOrNull;
    final hasCompanion = ref.watch(hasFeatureProvider(Features.aiCompanion));
    final hasJournal = ref.watch(hasFeatureProvider(Features.journal));
    final canUndo = task.isDone &&
        task.completedAt != null &&
        DateTime.now().toUtc().difference(task.completedAt!) < const Duration(hours: 24);

    final priority = switch (task.priority) {
      TaskPriority.high => l10n.priorityHigh,
      TaskPriority.medium => l10n.priorityMedium,
      TaskPriority.low => l10n.priorityLow,
    };

    Widget infoRow(IconData icon, String label, String value) => Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon, size: 20, color: c.secondary),
              const SizedBox(width: Space.s),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(label, style: text.labelMedium),
                    Text(value, style: text.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        );

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, 96),
      children: <Widget>[
        Semantics(header: true, child: Text(task.title, style: text.headlineSmall)),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.xs,
          children: <Widget>[
            if (task.isDone) SparkChip(label: l10n.taskStatusDone, icon: Icons.check_circle_rounded, tone: SparkChipTone.success),
            if (task.status == TaskStatus.obsolete) SparkChip(label: l10n.taskStatusObsolete, icon: Icons.archive_rounded),
            if (task.status == TaskStatus.skipped) SparkChip(label: l10n.taskStatusSkipped, icon: Icons.skip_next_rounded),
            if (task.isLocked) SparkChip(label: l10n.taskLocked, icon: Icons.lock_rounded, tone: SparkChipTone.warning),
          ],
        ),
        const SizedBox(height: Space.m),
        Text(task.description?.isNotEmpty ?? false ? task.description! : l10n.taskNoDescription, style: text.bodyLarge),
        if (task.completionCriteria != null && task.completionCriteria!.isNotEmpty) ...<Widget>[
          const SizedBox(height: Space.m),
          SparkCard(
            tone: SparkCardTone.tinted,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.taskDoneWhen, style: text.titleSmall),
                const SizedBox(height: Space.xs),
                Text(task.completionCriteria!, style: text.bodyMedium),
              ],
            ),
          ),
        ],
        const SizedBox(height: Space.m),
        SparkCard(
          child: Column(
            children: <Widget>[
              infoRow(Icons.schedule_rounded, l10n.taskEstimate, fmt.duration(task.estimatedMinutes)),
              infoRow(Icons.flag_circle_rounded, l10n.taskPriority, priority),
              if (task.suggestedDate != null)
                infoRow(Icons.event_rounded, l10n.taskSuggestedDate, fmt.fullDay(clock.toWallClock(task.suggestedDate!))),
              if (session != null)
                infoRow(
                  Icons.access_time_filled_rounded,
                  l10n.taskSession,
                  '${fmt.shortDate(clock.toWallClock(session.startsAt))} · ${fmt.timeRange(clock.toWallClock(session.startsAt), clock.toWallClock(session.end))}',
                ),
              if (milestone != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Space.xs),
                  child: Row(
                    children: <Widget>[
                      MilestoneMarker(status: milestone.status),
                      const SizedBox(width: Space.s),
                      Expanded(child: Text('${l10n.taskMilestone}: ${milestone.title}', style: text.bodyMedium)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (task.dependsOn.isNotEmpty) ...<Widget>[
          const SizedBox(height: Space.m),
          Text(l10n.taskPrerequisites, style: text.titleMedium),
          const SizedBox(height: Space.xs),
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                for (final p in prereqs)
                  ListTile(
                    leading: Icon(
                      p.isDone ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                      color: p.isDone ? c.success : c.iconMuted,
                    ),
                    title: Text(p.title),
                    subtitle: Text(p.isDone ? l10n.taskPrereqDone : l10n.taskPrereqPending),
                    onTap: () => context.push(Routes.task(p.id)),
                  ),
              ],
            ),
          ),
        ],
        const SizedBox(height: Space.l),
        if (task.isOpen)
          SparkButton(
            key: const Key('task-complete'),
            label: l10n.taskMarkComplete,
            icon: Icons.check_rounded,
            loading: completing,
            expand: true,
            onPressed: task.isLocked ? null : () => completeTaskWithFeedback(context, ref, task),
          ),
        if (canUndo)
          SparkButton.secondary(
            label: l10n.taskUndo,
            icon: Icons.undo_rounded,
            loading: completing,
            expand: true,
            onPressed: () async {
              final pid = ref.read(activeProjectIdProvider);
              if (pid == null) return;
              try {
                await ref.read(taskCompletionProvider.notifier).undo(pid, task.id);
                if (context.mounted) showInfoSnack(context, l10n.taskUndone);
              } on Object catch (e) {
                if (context.mounted) showErrorSnack(context, e);
              }
            },
          ),
        const SizedBox(height: Space.s),
        if (task.isOpen && !task.isLocked)
          SparkButton.secondary(
            label: l10n.taskStartFocus,
            icon: Icons.center_focus_strong_rounded,
            expand: true,
            onPressed: () => context.push(task.sessionId != null ? Routes.focus(task.sessionId!) : Routes.focusTask(task.id)),
          ),
        if (hasCompanion) ...<Widget>[
          const SizedBox(height: Space.s),
          SparkButton.secondary(
            label: l10n.taskAskCompanion,
            icon: Icons.chat_rounded,
            expand: true,
            onPressed: () => context.push(Routes.companion(taskId: task.id)),
          ),
        ],
        if (task.isOpen) ...<Widget>[
          const SizedBox(height: Space.s),
          SparkButton.secondary(
            label: l10n.taskReschedule,
            icon: Icons.event_repeat_rounded,
            expand: true,
            onPressed: () => showRescheduleMenu(context, ref, RescheduleTarget.task(task)),
          ),
        ],
        if (hasJournal) ...<Widget>[
          const SizedBox(height: Space.s),
          SparkButton.text(
            label: l10n.taskAddJournal,
            icon: Icons.add_a_photo_rounded,
            expand: true,
            onPressed: () => showAddJournalEntrySheet(context, taskId: task.id, milestoneId: task.milestoneId),
          ),
        ],
      ],
    );
  }
}
