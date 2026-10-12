import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/checkins.dart';
import '../models/gamification.dart';
import '../models/notifications.dart';

part 'engagement_repository.g.dart';

/// Gamification, check-ins, reflections and notification plumbing.
class EngagementRepository {
  EngagementRepository(this._db, this._functions);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;

  DocumentReference<Map<String, dynamic>> _user(String uid) => _db.collection('users').doc(uid);

  Stream<T> _guard<T>(Stream<T> s) => s.handleError((Object e) => throw mapError(e));

  // --------------------------------------------------------- Gamification

  Stream<List<EarnedBadge>> watchEarnedBadges(String uid) => _guard(
        typedCollection(_user(uid).collection('badges'), EarnedBadge.fromJson)
            .snapshots()
            .map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<List<Unlock>> watchUnlocks(String uid) => _guard(
        typedCollection(_user(uid).collection('unlocks'), Unlock.fromJson)
            .snapshots()
            .map((s) => s.docs.map((d) => d.data()).toList()),
      );

  /// Total points (aggregate sum over the ledger, no full download).
  Future<int> totalPoints(String uid) async {
    try {
      final snap = await _user(uid).collection('pointsLedger').aggregate(sum('points')).get();
      return (snap.getSum('points') ?? 0).round();
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  Stream<List<ChallengeParticipation>> watchParticipation(String uid) => _guard(
        typedCollection(_user(uid).collection('challengeParticipation'), ChallengeParticipation.fromJson)
            .snapshots()
            .map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Future<void> joinChallenge(String challengeId) =>
      _functions.call('joinChallenge', <String, Object?>{'challengeId': challengeId});

  /// Latest weekly board for [board] ("teen" or "adult").
  Stream<LeaderboardWeek?> watchLatestLeaderboard(String board) => _guard(
        typedQuery(
          _db.collection('leaderboards').doc(board).collection('weeks').orderBy('weekStart', descending: true).limit(1),
          LeaderboardWeek.fromJson,
        ).snapshots().map((s) => s.docs.isEmpty ? null : s.docs.first.data()),
      );

  Future<void> markCelebrationsSeen(List<String> ids) => ids.isEmpty
      ? Future<void>.value()
      : _functions.call('markCelebrationsSeen', <String, Object?>{'ids': ids});

  // ------------------------------------------------ Check-ins, reflections

  Future<CheckinResult> submitCheckin({
    required String projectId,
    required int feeling,
    required int progressRating,
    required String challenges,
    required bool scheduleStillRealistic,
  }) async {
    final result = await _functions.call('submitCheckin', <String, Object?>{
      'projectId': projectId,
      'feeling': feeling,
      'progressRating': progressRating,
      'challenges': challenges,
      'scheduleStillRealistic': scheduleStillRealistic,
    }, const Duration(minutes: 2));
    return CheckinResult.fromJson(result);
  }

  Stream<List<Checkin>> watchCheckins(String uid, String pid) => _guard(
        typedQuery(
          _user(uid).collection('projects').doc(pid).collection('checkins').orderBy('createdAt', descending: true),
          Checkin.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Future<MonthlyReflectionSummary> getMonthlyReflection(String projectId, String month) async =>
      MonthlyReflectionSummary.fromJson(
        await _functions.call('getMonthlyReflection', <String, Object?>{'projectId': projectId, 'month': month}),
      );

  Future<void> saveReflection({
    required String projectId,
    required String month,
    required String learned,
    required String change,
    required String goals,
  }) =>
      _functions.call('saveReflection', <String, Object?>{
        'projectId': projectId,
        'month': month,
        'learned': learned,
        'change': change,
        'goals': goals,
      });

  Stream<List<Reflection>> watchReflections(String uid, String pid) => _guard(
        typedQuery(
          _user(uid).collection('projects').doc(pid).collection('reflections').orderBy('month', descending: true),
          Reflection.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  // --------------------------------------------------------- Notifications

  Future<void> registerPushToken(String token, String platform) =>
      _functions.call('registerPushToken', <String, Object?>{'token': token, 'platform': platform});

  Future<NotificationPlan> getNotificationPlan() async =>
      NotificationPlan.fromJson(await _functions.call('getNotificationPlan'));
}

@Riverpod(keepAlive: true)
EngagementRepository engagementRepository(Ref ref) =>
    EngagementRepository(ref.watch(firestoreProvider), ref.watch(functionsClientProvider));
