import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/user_clock.dart';
import '../../data/models/dashboard.dart';
import '../../data/models/project.dart';
import '../../data/models/schedule.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/schedule_repository.dart';

part 'project_providers.g.dart';

/// (uid, projectId, activePlanVersion) for the active project, or null.
typedef PlanScope = ({String uid, String projectId, int version});

@Riverpod(keepAlive: true)
PlanScope? activePlanScope(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  final project = ref.watch(activeProjectProvider).value;
  final version = project?.activePlanVersion;
  if (uid == null || project == null || version == null) return null;
  return (uid: uid, projectId: project.id, version: version);
}

/// The next 5 actionable tasks (live).
@Riverpod(keepAlive: true)
Stream<List<Task>> currentTasks(Ref ref) {
  final scope = ref.watch(activePlanScopeProvider);
  if (scope == null) return Stream<List<Task>>.value(const <Task>[]);
  return ref.watch(projectRepositoryProvider).watchCurrentTasks(scope.uid, scope.projectId, scope.version);
}

/// `getProgress`, re-fetched whenever the project's progress counters change
/// (completing a task anywhere updates every screen).
@Riverpod(keepAlive: true)
Future<Progress?> activeProgress(Ref ref) async {
  final project = ref.watch(activeProjectProvider).value;
  if (project == null || !project.hasPlan) return null;
  // Watch the denormalised counters so this recomputes after each change.
  ref.watch(activeProjectProvider.select((p) => (
        p.value?.completedMinutes,
        p.value?.totalMinutes,
        p.value?.activePlanVersion,
        p.value?.targetEndDate,
        p.value?.updatedAt,
      )));
  return ref.read(projectRepositoryProvider).getProgress(project.id);
}

/// `getHomeDashboard` (one call); live streams keep the rest fresh.
@riverpod
Future<HomeDashboard> homeDashboard(Ref ref) {
  ref.watch(currentUidProvider);
  return ref.read(projectRepositoryProvider).getHomeDashboard();
}

/// `getTimeline`, refreshed when progress changes.
@riverpod
Future<Timeline?> activeTimeline(Ref ref) async {
  final project = ref.watch(activeProjectProvider).value;
  if (project == null || !project.hasPlan) return null;
  ref.watch(activeProjectProvider.select((p) => (p.value?.completedMinutes, p.value?.activePlanVersion, p.value?.updatedAt)));
  return ref.read(projectRepositoryProvider).getTimeline(project.id);
}

@Riverpod(keepAlive: true)
Stream<List<Milestone>> activeMilestones(Ref ref) {
  final scope = ref.watch(activePlanScopeProvider);
  if (scope == null) return Stream<List<Milestone>>.value(const <Milestone>[]);
  return ref.watch(projectRepositoryProvider).watchMilestones(scope.uid, scope.projectId, scope.version);
}

@Riverpod(keepAlive: true)
Stream<List<Phase>> activePhases(Ref ref) {
  final scope = ref.watch(activePlanScopeProvider);
  if (scope == null) return Stream<List<Phase>>.value(const <Phase>[]);
  return ref.watch(projectRepositoryProvider).watchPhases(scope.uid, scope.projectId, scope.version);
}

/// Sessions whose start falls on local days [from, to].
@riverpod
Stream<List<WorkSession>> sessionsInRange(Ref ref, LocalDay from, LocalDay to) {
  final scope = ref.watch(activePlanScopeProvider);
  if (scope == null) return Stream<List<WorkSession>>.value(const <WorkSession>[]);
  final range = ref.watch(userClockProvider).rangeForDays(from, to);
  return ref.watch(projectRepositoryProvider).watchSessionsInRange(scope.uid, scope.projectId, scope.version, range);
}

/// Tasks suggested for local days [from, to].
@riverpod
Stream<List<Task>> tasksInRange(Ref ref, LocalDay from, LocalDay to) {
  final scope = ref.watch(activePlanScopeProvider);
  if (scope == null) return Stream<List<Task>>.value(const <Task>[]);
  final range = ref.watch(userClockProvider).rangeForDays(from, to);
  return ref.watch(projectRepositoryProvider).watchTasksInRange(scope.uid, scope.projectId, scope.version, range);
}

@riverpod
Stream<Task?> taskById(Ref ref, String taskId) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<Task?>.value(null);
  return ref.watch(projectRepositoryProvider).watchTask(uid, pid, taskId);
}

/// Tasks for a comma-separated id list (family keys must compare by value).
@riverpod
Stream<List<Task>> tasksByIds(Ref ref, String commaSeparatedIds) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  final ids = commaSeparatedIds.split(',').where((s) => s.isNotEmpty).toList();
  if (uid == null || pid == null || ids.isEmpty) return Stream<List<Task>>.value(const <Task>[]);
  return ref.watch(projectRepositoryProvider).watchTasksByIds(uid, pid, ids);
}

@riverpod
Stream<WorkSession?> sessionById(Ref ref, String sessionId) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<WorkSession?>.value(null);
  return ref.watch(projectRepositoryProvider).watchSession(uid, pid, sessionId);
}

/// Next scheduled session from now (live).
@Riverpod(keepAlive: true)
Stream<WorkSession?> nextSession(Ref ref) {
  final scope = ref.watch(activePlanScopeProvider);
  if (scope == null) return Stream<WorkSession?>.value(null);
  // Sessions that started up to 2h ago are still "next" (in progress).
  final from = DateTime.now().toUtc().subtract(const Duration(hours: 2));
  return ref.watch(projectRepositoryProvider).watchNextSession(scope.uid, scope.projectId, scope.version, from);
}

@Riverpod(keepAlive: true)
Stream<List<Proposal>> pendingProposals(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<Proposal>>.value(const <Proposal>[]);
  return ref.watch(scheduleRepositoryProvider).watchPendingProposals(uid);
}

@Riverpod(keepAlive: true)
Stream<List<AvailabilitySlot>> availability(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<AvailabilitySlot>>.value(const <AvailabilitySlot>[]);
  return ref.watch(scheduleRepositoryProvider).watchAvailability(uid);
}

@Riverpod(keepAlive: true)
Stream<List<AvailabilityException>> availabilityExceptions(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<AvailabilityException>>.value(const <AvailabilityException>[]);
  return ref.watch(scheduleRepositoryProvider).watchExceptions(uid);
}

/// Minutes available on [day] according to weekly availability and
/// exceptions (vacations/exams block the whole day).
int availableMinutesOn(LocalDay day, List<AvailabilitySlot> slots, List<AvailabilityException> exceptions, UserClock clock) {
  for (final e in exceptions) {
    final start = clock.dayOf(e.startDate);
    final end = clock.dayOf(e.endDate);
    if (!day.isBefore(start) && !day.isAfter(end)) return 0;
  }
  final daySlots = slots.where((s) => s.weekday == day.jsWeekday);
  var total = daySlots.fold<int>(0, (sum, s) => sum + s.durationMinutes);
  final caps = daySlots.map((s) => s.maxMinutesPerDay).whereType<int>();
  if (caps.isNotEmpty) total = total.clamp(0, caps.reduce((a, b) => a < b ? a : b));
  return total;
}
