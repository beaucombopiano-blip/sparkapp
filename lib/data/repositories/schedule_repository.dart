import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../../core/utils/user_clock.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/schedule.dart';

part 'schedule_repository.g.dart';

/// What to reschedule (`reschedule({projectId, scope})`).
sealed class RescheduleScope {
  const RescheduleScope();
  Map<String, Object?> toJson();
}

/// Rerun the scheduler on all pending tasks.
class RescheduleAll extends RescheduleScope {
  const RescheduleAll();
  @override
  Map<String, Object?> toJson() => <String, Object?>{'kind': 'all'};
}

/// Move a session's tasks (or specific tasks) to [targetDay], or let the
/// scheduler find a new time when [targetDay] is null.
class RescheduleItems extends RescheduleScope {
  const RescheduleItems({this.sessionId, this.taskIds = const <String>[], this.targetDay});
  final String? sessionId;
  final List<String> taskIds;
  final LocalDay? targetDay;

  @override
  Map<String, Object?> toJson() => <String, Object?>{
        'kind': sessionId != null ? 'session' : 'tasks',
        'sessionId': ?sessionId,
        if (taskIds.isNotEmpty) 'taskIds': taskIds,
        if (targetDay != null) 'targetDate': targetDay!.toIso(),
      };
}

/// Unfinished tasks from missed sessions.
class RescheduleMissed extends RescheduleScope {
  const RescheduleMissed({this.sessionIds = const <String>[]});
  final List<String> sessionIds;
  @override
  Map<String, Object?> toJson() => <String, Object?>{
        'kind': 'missed',
        if (sessionIds.isNotEmpty) 'sessionIds': sessionIds,
      };
}

/// Availability, exceptions, reschedule proposals.
class ScheduleRepository {
  ScheduleRepository(this._db, this._functions);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;

  CollectionReference<Map<String, dynamic>> _user(String uid, String sub) =>
      _db.collection('users').doc(uid).collection(sub);

  Stream<List<AvailabilitySlot>> watchAvailability(String uid) => typedCollection(
        _user(uid, 'availability'),
        AvailabilitySlot.fromJson,
      )
          .snapshots()
          .map((s) => s.docs.map((d) => d.data()).toList()
            ..sort((a, b) {
              final byDay = a.weekday.compareTo(b.weekday);
              return byDay != 0 ? byDay : a.startTime.compareTo(b.startTime);
            }))
          .handleError((Object e) => throw mapError(e));

  Stream<List<AvailabilityException>> watchExceptions(String uid) =>
      typedCollection(_user(uid, 'availabilityExceptions'), AvailabilityException.fromJson)
          .snapshots()
          .map((s) => s.docs.map((d) => d.data()).toList())
          .handleError((Object e) => throw mapError(e));

  /// Replaces the weekly availability. When a plan exists the backend returns
  /// a reschedule proposal (never an automatic change).
  Future<Proposal?> setAvailability(
    List<AvailabilitySlot> slots, {
    List<AvailabilityException>? exceptions,
  }) async {
    final result = await _functions.call('setAvailability', <String, Object?>{
      'slots': slots.map((s) => s.toPayload()).toList(),
      if (exceptions != null)
        'exceptions': exceptions
            .map((e) => <String, Object?>{
                  'startDate': e.startDate.toUtc().toIso8601String(),
                  'endDate': e.endDate.toUtc().toIso8601String(),
                  'reason': ?e.reason,
                })
            .toList(),
    });
    final proposal = result['proposal'];
    return proposal is Map ? Proposal.fromJson(Map<String, dynamic>.from(proposal)) : null;
  }

  Stream<List<Proposal>> watchPendingProposals(String uid) => typedQuery(
        _user(uid, 'proposals').where('status', isEqualTo: 'pending').orderBy('createdAt', descending: true),
        Proposal.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));

  Stream<Proposal?> watchProposal(String uid, String proposalId) =>
      typedDoc(_user(uid, 'proposals').doc(proposalId), Proposal.fromJson)
          .snapshots()
          .map((s) => s.exists ? s.data() : null)
          .handleError((Object e) => throw mapError(e));

  /// Asks the scheduler for a capacity-respecting proposal.
  Future<Proposal> reschedule(String projectId, RescheduleScope scope) async {
    final result = await _functions.call(
      'reschedule',
      <String, Object?>{'projectId': projectId, 'scope': scope.toJson()},
      const Duration(minutes: 2),
    );
    return Proposal.fromJson(Map<String, dynamic>.from(result['proposal'] as Map? ?? result));
  }

  /// Applies a proposal. Returns normally only when the backend confirmed.
  Future<void> applyProposal(String proposalId, {String? optionId}) => _functions.call(
        'applyProposal',
        <String, Object?>{'proposalId': proposalId, 'optionId': ?optionId},
        const Duration(minutes: 2),
      );

  Future<void> dismissProposal(String proposalId) =>
      _functions.call('dismissProposal', <String, Object?>{'proposalId': proposalId});
}

@Riverpod(keepAlive: true)
ScheduleRepository scheduleRepository(Ref ref) =>
    ScheduleRepository(ref.watch(firestoreProvider), ref.watch(functionsClientProvider));
