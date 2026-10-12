import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/gamification.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';
import '../../data/repositories/project_repository.dart';

part 'gamification_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<List<EarnedBadge>> earnedBadges(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<EarnedBadge>>.value(const <EarnedBadge>[]);
  return ref.watch(engagementRepositoryProvider).watchEarnedBadges(uid);
}

@Riverpod(keepAlive: true)
Stream<List<ChallengeParticipation>> challengeParticipation(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<ChallengeParticipation>>.value(const <ChallengeParticipation>[]);
  return ref.watch(engagementRepositoryProvider).watchParticipation(uid);
}

@Riverpod(keepAlive: true)
Stream<List<Unlock>> unlocks(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<Unlock>>.value(const <Unlock>[]);
  return ref.watch(engagementRepositoryProvider).watchUnlocks(uid);
}

/// Total points; refreshed when badges change.
@riverpod
Future<int> totalPoints(Ref ref) async {
  final uid = ref.watch(currentUidProvider);
  ref.watch(earnedBadgesProvider.select((b) => b.value?.length));
  if (uid == null) return 0;
  return ref.read(engagementRepositoryProvider).totalPoints(uid);
}

@Riverpod(keepAlive: true)
Stream<List<Project>> allProjects(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<Project>>.value(const <Project>[]);
  return ref.watch(projectRepositoryProvider).watchProjects(uid);
}

/// Lifetime stats across every project (denormalised counters).
typedef ProfileStats = ({int tasks, int minutes, int milestones});

@riverpod
ProfileStats profileStats(Ref ref) {
  final projects = ref.watch(allProjectsProvider).value ?? const <Project>[];
  var tasks = 0;
  var minutes = 0;
  var milestones = 0;
  for (final p in projects) {
    tasks += p.completedTaskCount;
    minutes += p.completedMinutes;
    milestones += p.completedMilestoneCount;
  }
  return (tasks: tasks, minutes: minutes, milestones: milestones);
}

/// Latest weekly board for the user's age bracket.
@riverpod
Stream<LeaderboardWeek?> leaderboard(Ref ref) {
  final bracket = ref.watch(userProfileProvider.select((p) => p.value?.ageBracket?.name)) ?? 'teen';
  return ref.watch(engagementRepositoryProvider).watchLatestLeaderboard(bracket == 'adult' ? 'adult' : 'teen');
}
