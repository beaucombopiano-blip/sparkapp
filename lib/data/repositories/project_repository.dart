import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../../core/utils/user_clock.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/dashboard.dart';
import '../models/project.dart';
import '../models/schedule.dart';

part 'project_repository.g.dart';

/// Orders tasks by suggested day, then priority (high first), then order.
List<Task> sortCurrentTasks(List<Task> tasks) {
  int day(Task t) {
    final d = t.suggestedDate;
    return d == null ? 1 << 40 : d.millisecondsSinceEpoch ~/ Duration.millisecondsPerDay;
  }

  return List<Task>.of(tasks)
    ..sort((a, b) {
      final byDay = day(a).compareTo(day(b));
      if (byDay != 0) return byDay;
      final byPriority = a.priority.index.compareTo(b.priority.index);
      if (byPriority != 0) return byPriority;
      return a.order.compareTo(b.order);
    });
}

/// How a plan change is requested through `adjustPlan`.
enum PlanChangeKind { newDeadline, scope, goal, regenerateFuture }

/// Projects, plan structure, tasks, sessions and computed views.
class ProjectRepository {
  ProjectRepository(this._db, this._functions);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;

  DocumentReference<Map<String, dynamic>> _project(String uid, String pid) =>
      _db.collection('users').doc(uid).collection('projects').doc(pid);

  Stream<T> _guard<T>(Stream<T> stream) => stream.handleError((Object e) => throw mapError(e));

  Stream<Project?> watchProject(String uid, String pid) =>
      _guard(typedDoc(_project(uid, pid), Project.fromJson).snapshots().map((s) => s.exists ? s.data() : null));

  Stream<List<Project>> watchProjects(String uid) => _guard(
        typedQuery(
          _db.collection('users').doc(uid).collection('projects').orderBy('createdAt', descending: true),
          Project.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<List<Phase>> watchPhases(String uid, String pid, int planVersion) => _guard(
        typedQuery(
          _project(uid, pid).collection('phases').where('planVersion', isEqualTo: planVersion).orderBy('order'),
          Phase.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<List<Milestone>> watchMilestones(String uid, String pid, int planVersion) => _guard(
        typedQuery(
          _project(uid, pid).collection('milestones').where('planVersion', isEqualTo: planVersion).orderBy('order'),
          Milestone.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  // ------------------------------------------------------------- Tasks

  /// The next [limit] actionable tasks: planVersion == active,
  /// actionable == true, status == pending, ordered by suggestedDate, then
  /// priority, then order. Priority is a string on the task, so the query
  /// orders by date/order and the priority tie-break is applied here.
  Stream<List<Task>> watchCurrentTasks(String uid, String pid, int planVersion, {int limit = 5}) => _guard(
        typedQuery(
          _project(uid, pid)
              .collection('tasks')
              .where('planVersion', isEqualTo: planVersion)
              .where('actionable', isEqualTo: true)
              .where('status', isEqualTo: 'pending')
              .orderBy('suggestedDate')
              .orderBy('order')
              .limit(limit * 3),
          Task.fromJson,
        ).snapshots().map((s) => sortCurrentTasks(s.docs.map((d) => d.data()).toList()).take(limit).toList()),
      );

  /// Tasks whose suggestedDate falls in [range] (daily/weekly/monthly views).
  Stream<List<Task>> watchTasksInRange(String uid, String pid, int planVersion, UtcRange range) => _guard(
        typedQuery(
          _project(uid, pid)
              .collection('tasks')
              .where('planVersion', isEqualTo: planVersion)
              .where('suggestedDate', isGreaterThanOrEqualTo: Timestamp.fromDate(range.start))
              .where('suggestedDate', isLessThan: Timestamp.fromDate(range.end))
              .orderBy('suggestedDate'),
          Task.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<List<Task>> watchMilestoneTasks(String uid, String pid, int planVersion, String milestoneId) => _guard(
        typedQuery(
          _project(uid, pid)
              .collection('tasks')
              .where('planVersion', isEqualTo: planVersion)
              .where('milestoneId', isEqualTo: milestoneId)
              .orderBy('order'),
          Task.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<Task?> watchTask(String uid, String pid, String taskId) => _guard(
        typedDoc(_project(uid, pid).collection('tasks').doc(taskId), Task.fromJson)
            .snapshots()
            .map((s) => s.exists ? s.data() : null),
      );

  /// Tasks by id (prerequisites, a session's tasks). Firestore `whereIn`
  /// accepts up to 30 ids per query.
  Stream<List<Task>> watchTasksByIds(String uid, String pid, List<String> ids) {
    if (ids.isEmpty) return Stream<List<Task>>.value(const <Task>[]);
    final limited = ids.take(30).toList();
    return _guard(
      typedQuery(
        _project(uid, pid).collection('tasks').where(FieldPath.documentId, whereIn: limited),
        Task.fromJson,
      ).snapshots().map((s) {
        final byId = <String, Task>{for (final d in s.docs) d.id: d.data()};
        return <Task>[for (final id in limited) ?byId[id]];
      }),
    );
  }

  Future<CompleteTaskResult> completeTask(String pid, String taskId) async {
    final result = await _functions.call('completeTask', <String, Object?>{'projectId': pid, 'taskId': taskId});
    return CompleteTaskResult.fromJson(result);
  }

  Future<void> undoCompleteTask(String pid, String taskId) =>
      _functions.call('undoCompleteTask', <String, Object?>{'projectId': pid, 'taskId': taskId});

  // ---------------------------------------------------------- Sessions

  Stream<List<WorkSession>> watchSessionsInRange(String uid, String pid, int planVersion, UtcRange range) => _guard(
        typedQuery(
          _project(uid, pid)
              .collection('sessions')
              .where('planVersion', isEqualTo: planVersion)
              .where('startsAt', isGreaterThanOrEqualTo: Timestamp.fromDate(range.start))
              .where('startsAt', isLessThan: Timestamp.fromDate(range.end))
              .orderBy('startsAt'),
          WorkSession.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<WorkSession?> watchSession(String uid, String pid, String sessionId) => _guard(
        typedDoc(_project(uid, pid).collection('sessions').doc(sessionId), WorkSession.fromJson)
            .snapshots()
            .map((s) => s.exists ? s.data() : null),
      );

  /// The next scheduled session starting after [from].
  Stream<WorkSession?> watchNextSession(String uid, String pid, int planVersion, DateTime from) => _guard(
        typedQuery(
          _project(uid, pid)
              .collection('sessions')
              .where('planVersion', isEqualTo: planVersion)
              .where('status', isEqualTo: 'scheduled')
              .where('startsAt', isGreaterThanOrEqualTo: Timestamp.fromDate(from))
              .orderBy('startsAt')
              .limit(1),
          WorkSession.fromJson,
        ).snapshots().map((s) => s.docs.isEmpty ? null : s.docs.first.data()),
      );

  // ---------------------------------------------------- Computed views

  Future<Progress> getProgress(String pid) async =>
      Progress.fromJson(await _functions.call('getProgress', <String, Object?>{'projectId': pid}));

  Future<Timeline> getTimeline(String pid) async =>
      Timeline.fromJson(await _functions.call('getTimeline', <String, Object?>{'projectId': pid}));

  Future<HomeDashboard> getHomeDashboard() async =>
      HomeDashboard.fromJson(await _functions.call('getHomeDashboard'));

  // -------------------------------------------------------------- Plans

  /// Generates the plan. Returns feasible: false (and writes nothing) when the
  /// work doesn't fit; [overrides] carry the user's choice on the feasibility
  /// screen (new deadline / accepted scope cuts).
  Future<GeneratePlanResult> generatePlan(
    String pid, {
    bool preview = false,
    DateTime? targetEndDate,
    List<String> acceptedScopeCuts = const <String>[],
  }) async {
    final result = await _functions.call(
      'generatePlan',
      <String, Object?>{
        'projectId': pid,
        'mode': preview ? 'preview' : 'full',
        if (targetEndDate != null || acceptedScopeCuts.isNotEmpty)
          'overrides': <String, Object?>{
            if (targetEndDate != null) 'targetEndDate': targetEndDate.toUtc().toIso8601String(),
            if (acceptedScopeCuts.isNotEmpty) 'scopeCuts': acceptedScopeCuts,
          },
      },
      const Duration(minutes: 5),
    );
    return GeneratePlanResult.fromJson(result);
  }

  /// Previews a plan change. Completed work is always kept; the returned
  /// proposal is applied only through [ScheduleRepository.applyProposal].
  Future<Proposal> adjustPlan(
    String pid, {
    required PlanChangeKind kind,
    DateTime? targetEndDate,
    String? description,
  }) async {
    final result = await _functions.call(
      'adjustPlan',
      <String, Object?>{
        'projectId': pid,
        'change': <String, Object?>{
          'kind': kind.name,
          if (targetEndDate != null) 'targetEndDate': targetEndDate.toUtc().toIso8601String(),
          'description': ?description,
        },
      },
      const Duration(minutes: 5),
    );
    return Proposal.fromJson(Map<String, dynamic>.from(result['proposal'] as Map? ?? result));
  }
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(Ref ref) =>
    ProjectRepository(ref.watch(firestoreProvider), ref.watch(functionsClientProvider));
