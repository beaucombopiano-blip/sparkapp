import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../core/widgets/milestone_marker.dart';
import '../../core/widgets/session_card.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/states.dart';
import '../../core/widgets/task_tile.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/schedule_repository.dart';
import '../project/project_providers.dart';
import '../task/task_completion.dart';
import 'reschedule_actions.dart';

enum AgendaView {
  day,
  week,
  month;

  static AgendaView parse(String? value) =>
      AgendaView.values.firstWhere((v) => v.name == value, orElse: () => AgendaView.day);
}

/// Everything planned on one local day.
@immutable
class AgendaDay {
  const AgendaDay({
    required this.day,
    this.sessions = const <WorkSession>[],
    this.sessionTasks = const <String, List<Task>>{},
    this.looseTasks = const <Task>[],
    this.milestones = const <Milestone>[],
    this.isDeadline = false,
  });

  final LocalDay day;
  final List<WorkSession> sessions;
  final Map<String, List<Task>> sessionTasks;
  final List<Task> looseTasks;
  final List<Milestone> milestones;
  final bool isDeadline;

  List<Task> get allTasks => <Task>[...sessionTasks.values.expand((t) => t), ...looseTasks];
  bool get isEmpty => sessions.isEmpty && looseTasks.isEmpty && milestones.isEmpty && !isDeadline;
  int get plannedMinutes => sessions.fold<int>(0, (sum, s) => sum + s.durationMinutes);
}

/// Groups sessions, tasks and milestones into days for [from]..[to].
List<AgendaDay> buildAgendaDays({
  required LocalDay from,
  required LocalDay to,
  required List<WorkSession> sessions,
  required List<Task> tasks,
  required List<Milestone> milestones,
  required DateTime? deadline,
  required UserClock clock,
}) {
  final taskById = <String, Task>{
    for (final t in tasks)
      if (t.status != TaskStatus.obsolete) t.id: t,
  };
  final usedTaskIds = <String>{};
  final days = <AgendaDay>[];
  final deadlineDay = deadline == null ? null : clock.dayOf(deadline);
  for (var d = from; !d.isAfter(to); d = d.addDays(1)) {
    final daySessions = sessions
        .where((s) => s.status != SessionStatus.cancelled && clock.dayOf(s.startsAt) == d)
        .toList()
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
    final sessionTasks = <String, List<Task>>{};
    for (final s in daySessions) {
      final list = <Task>[];
      for (final id in s.taskIds) {
        final t = taskById[id];
        if (t != null) {
          list.add(t);
          usedTaskIds.add(id);
        }
      }
      // Tasks pointing at this session but missing from taskIds.
      for (final t in taskById.values) {
        if (t.sessionId == s.id && !usedTaskIds.contains(t.id)) {
          list.add(t);
          usedTaskIds.add(t.id);
        }
      }
      sessionTasks[s.id] = list;
    }
    days.add(AgendaDay(
      day: d,
      sessions: daySessions,
      sessionTasks: sessionTasks,
      looseTasks: <Task>[],
      milestones: milestones.where((m) => m.targetDate != null && clock.dayOf(m.targetDate!) == d).toList(),
      isDeadline: d == deadlineDay,
    ));
  }
  // Tasks not in any session go to their suggested day.
  final loose = taskById.values.where((t) => !usedTaskIds.contains(t.id) && t.suggestedDate != null);
  for (final t in loose) {
    final day = clock.dayOf(t.suggestedDate!);
    final index = days.indexWhere((d) => d.day == day);
    if (index >= 0) {
      final d = days[index];
      days[index] = AgendaDay(
        day: d.day,
        sessions: d.sessions,
        sessionTasks: d.sessionTasks,
        looseTasks: <Task>[...d.looseTasks, t]..sort((a, b) => a.order.compareTo(b.order)),
        milestones: d.milestones,
        isDeadline: d.isDeadline,
      );
    }
  }
  return days;
}

/// Watches all data for [from]..[to] and builds agenda days.
AsyncValue<List<AgendaDay>> watchAgenda(WidgetRef ref, LocalDay from, LocalDay to) {
  final sessions = ref.watch(sessionsInRangeProvider(from, to));
  final tasks = ref.watch(tasksInRangeProvider(from, to));
  final milestones = ref.watch(activeMilestonesProvider);
  final deadline = ref.watch(activeProjectProvider.select((p) => p.value?.targetEndDate));
  final clock = ref.watch(userClockProvider);
  for (final v in <AsyncValue<Object?>>[sessions, tasks, milestones]) {
    if (v.hasError && !v.hasValue) return AsyncValue<List<AgendaDay>>.error(v.error!, v.stackTrace ?? StackTrace.current);
  }
  if (!sessions.hasValue || !tasks.hasValue || !milestones.hasValue) return const AsyncValue<List<AgendaDay>>.loading();
  return AsyncValue<List<AgendaDay>>.data(buildAgendaDays(
    from: from,
    to: to,
    sessions: sessions.requireValue,
    tasks: tasks.requireValue,
    milestones: milestones.requireValue,
    deadline: deadline,
    clock: clock,
  ));
}

void _retryAgenda(WidgetRef ref, LocalDay from, LocalDay to) {
  ref.invalidate(sessionsInRangeProvider(from, to));
  ref.invalidate(tasksInRangeProvider(from, to));
  ref.invalidate(activeMilestonesProvider);
}

/// Day view: time-ordered sessions with nested, checkable tasks; milestones
/// and the deadline; friendly empty state.
class AgendaDayList extends ConsumerWidget {
  const AgendaDayList({super.key, required this.day, this.header});

  final LocalDay day;
  final Widget? header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agenda = watchAgenda(ref, day, day);
    return AsyncValueView<List<AgendaDay>>(
      value: agenda,
      onRetry: () => _retryAgenda(ref, day, day),
      data: (days) {
        final d = days.first;
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, 96),
          children: <Widget>[
            ?header,
            if (d.isEmpty)
              EmptyState(title: context.l10n.agendaEmptyDay, icon: Icons.wb_sunny_rounded)
            else
              AgendaDayContent(day: d),
          ],
        );
      },
    );
  }
}

/// The sessions/tasks/milestones of one day (shared by day and week views).
class AgendaDayContent extends ConsumerWidget {
  const AgendaDayContent({super.key, required this.day});

  final AgendaDay day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final completing = ref.watch(taskCompletionProvider);
    final nowUtc = clock.nowUtc();

    Widget taskTile(Task t) => TaskTile(
          task: t,
          dense: true,
          completing: completing.contains(t.id),
          onToggle: () => completeTaskWithFeedback(context, ref, t),
          onTap: () => context.push(Routes.task(t.id)),
          onMore: t.isOpen ? () => showRescheduleMenu(context, ref, RescheduleTarget.task(t)) : null,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (final m in day.milestones)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.s),
            child: SparkCard(
              tone: SparkCardTone.accent,
              child: Row(
                children: <Widget>[
                  MilestoneMarker(status: m.status),
                  const SizedBox(width: Space.s),
                  Expanded(child: Text(l10n.agendaMilestoneItem(m.title), style: Theme.of(context).textTheme.titleSmall)),
                ],
              ),
            ),
          ),
        if (day.isDeadline)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.s),
            child: SparkCard(
              tone: SparkCardTone.accent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.flag_rounded, color: c.danger),
                  const SizedBox(width: Space.s),
                  Text(l10n.agendaDeadlineItem, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ),
        for (final s in day.sessions)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.s),
            child: Builder(builder: (context) {
              final tasks = day.sessionTasks[s.id] ?? const <Task>[];
              final missed = s.status == SessionStatus.missed ||
                  (s.status == SessionStatus.scheduled && s.end.isBefore(nowUtc) && tasks.any((t) => t.isOpen));
              return GestureDetector(
                onLongPress: () => showRescheduleMenu(context, ref, RescheduleTarget.session(s), sessionTasks: tasks),
                child: SessionCard(
                  session: s,
                  missed: missed,
                  timeLabel: fmt.timeRange(clock.toWallClock(s.startsAt), clock.toWallClock(s.end)),
                  onMore: () => showRescheduleMenu(context, ref, RescheduleTarget.session(s), sessionTasks: tasks),
                  onRescheduleMissed: missed
                      ? () => requestReschedule(context, ref, RescheduleMissed(sessionIds: <String>[s.id]))
                      : null,
                  children: <Widget>[for (final t in tasks) taskTile(t)],
                ),
              );
            }),
          ),
        if (day.looseTasks.isNotEmpty) ...<Widget>[
          Padding(
            padding: const EdgeInsets.only(top: Space.s, bottom: Space.xs),
            child: Text(l10n.agendaOtherTasks, style: Theme.of(context).textTheme.labelLarge),
          ),
          SparkCard(
            padding: const EdgeInsets.fromLTRB(Space.s, Space.xs, Space.xs, Space.xs),
            child: Column(children: <Widget>[for (final t in day.looseTasks) taskTile(t)]),
          ),
        ],
      ],
    );
  }
}

/// Week view: each day as a section with its sessions and tasks, plus
/// weekly totals.
class AgendaWeekList extends ConsumerWidget {
  const AgendaWeekList({super.key, required this.weekStart, this.header});

  final LocalDay weekStart;
  final Widget? header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final fmt = context.fmt;
    final end = weekStart.addDays(6);
    final today = ref.watch(userClockProvider).today();
    final agenda = watchAgenda(ref, weekStart, end);
    return AsyncValueView<List<AgendaDay>>(
      value: agenda,
      onRetry: () => _retryAgenda(ref, weekStart, end),
      data: (days) {
        final tasks = days.expand((d) => d.allTasks).toList();
        final done = tasks.where((t) => t.isDone).length;
        final planned = days.fold<int>(0, (sum, d) => sum + d.plannedMinutes);
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, 96),
          children: <Widget>[
            ?header,
            SparkCard(
              tone: SparkCardTone.tinted,
              child: Row(
                children: <Widget>[
                  Icon(Icons.insights_rounded, color: context.spark.primary),
                  const SizedBox(width: Space.s),
                  Expanded(
                    child: Text(
                      l10n.agendaWeekTotals(done, tasks.length, fmt.duration(planned)),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
            for (final d in days) ...<Widget>[
              Padding(
                padding: const EdgeInsets.only(top: Space.l, bottom: Space.s),
                child: Semantics(
                  header: true,
                  child: Text(
                    fmt.dayLabel(d.day, today) == fmt.shortDate(d.day.asDateTime)
                        ? fmt.fullDay(d.day.asDateTime)
                        : '${fmt.dayLabel(d.day, today)} · ${fmt.shortDate(d.day.asDateTime)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              if (d.isEmpty)
                Text(l10n.agendaEmptyDay, style: Theme.of(context).textTheme.bodySmall)
              else
                AgendaDayContent(day: d),
            ],
          ],
        );
      },
    );
  }
}

/// Month view: compact list grouped by week with counts and milestone /
/// deadline highlights. Tapping a day jumps to day view.
class AgendaMonthList extends ConsumerWidget {
  const AgendaMonthList({super.key, required this.month, required this.onDayTap, this.header});

  final LocalDay month;
  final ValueChanged<LocalDay> onDayTap;
  final Widget? header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final fmt = context.fmt;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final from = month.startOfMonth;
    final to = month.endOfMonth;
    final agenda = watchAgenda(ref, from, to);
    return AsyncValueView<List<AgendaDay>>(
      value: agenda,
      onRetry: () => _retryAgenda(ref, from, to),
      data: (days) {
        final busy = days.where((d) => !d.isEmpty).toList();
        final weeks = <LocalDay, List<AgendaDay>>{};
        for (final d in busy) {
          weeks.putIfAbsent(d.day.startOfWeek, () => <AgendaDay>[]).add(d);
        }
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, 96),
          children: <Widget>[
            ?header,
            if (busy.isEmpty) EmptyState(title: l10n.agendaMonthEmpty, icon: Icons.calendar_month_rounded),
            for (final entry in weeks.entries) ...<Widget>[
              Padding(
                padding: const EdgeInsets.only(top: Space.m, bottom: Space.xs),
                child: Text(
                  l10n.agendaWeekRange(fmt.monthDay(entry.key.asDateTime), fmt.monthDay(entry.key.addDays(6).asDateTime)),
                  style: text.labelLarge,
                ),
              ),
              SparkCard(
                padding: const EdgeInsets.symmetric(vertical: Space.xs),
                child: Column(
                  children: <Widget>[
                    for (final d in entry.value)
                      ListTile(
                        onTap: () => onDayTap(d.day),
                        title: Text(fmt.shortDate(d.day.asDateTime)),
                        subtitle: Text(l10n.agendaMonthDaySummary(d.sessions.length, d.allTasks.length)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            for (final m in d.milestones) MilestoneMarker(status: m.status, size: 16),
                            if (d.isDeadline) Icon(Icons.flag_rounded, color: c.danger, size: 18),
                            const Icon(Icons.chevron_right_rounded),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
