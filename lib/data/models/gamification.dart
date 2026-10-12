import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamification.freezed.dart';
part 'gamification.g.dart';

@freezed
abstract class Streaks with _$Streaks {
  const factory Streaks({
    @Default(0) int daily,
    @Default(0) int weekly,
    @Default(0) int longestDaily,
  }) = _Streaks;

  factory Streaks.fromJson(Map<String, dynamic> json) => _$StreaksFromJson(json);
}

/// `badges/{key}` (reference catalog).
@freezed
abstract class BadgeDef with _$BadgeDef {
  const factory BadgeDef({
    required String id,
    @Default('') String name,
    @Default('') String description,
    String? howToEarn,
    String? icon,
    @Default(0) int points,
    @Default(0) int order,
  }) = _BadgeDef;

  factory BadgeDef.fromJson(Map<String, dynamic> json) => _$BadgeDefFromJson(json);
}

/// `users/{uid}/badges/{badgeKey}`.
@freezed
abstract class EarnedBadge with _$EarnedBadge {
  const factory EarnedBadge({
    required String id,
    DateTime? earnedAt,
    String? projectId,
  }) = _EarnedBadge;

  factory EarnedBadge.fromJson(Map<String, dynamic> json) => _$EarnedBadgeFromJson(json);
}

/// A badge returned by a callable that just awarded it.
@freezed
abstract class BadgeAward with _$BadgeAward {
  const factory BadgeAward({
    @Default('') String key,
    @Default('') String name,
    String? description,
    String? icon,
    @Default(0) int points,
  }) = _BadgeAward;

  factory BadgeAward.fromJson(Map<String, dynamic> json) => _$BadgeAwardFromJson(json);
}

/// `challenges/{id}` (reference).
@freezed
abstract class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    @Default('') String title,
    @Default('') String description,
    DateTime? startsAt,
    DateTime? endsAt,
    String? criteria,
    String? reward,
    @Default(true) bool active,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) => _$ChallengeFromJson(json);
}

/// `users/{uid}/challengeParticipation/{challengeId}`.
@freezed
abstract class ChallengeParticipation with _$ChallengeParticipation {
  const factory ChallengeParticipation({
    required String id,
    DateTime? joinedAt,
    @Default(0) double progress,
    @Default('active') String status,
    DateTime? completedAt,
  }) = _ChallengeParticipation;

  factory ChallengeParticipation.fromJson(Map<String, dynamic> json) =>
      _$ChallengeParticipationFromJson(json);
}

/// `leaderboards/{board}/weeks/{weekId}`.
@freezed
abstract class LeaderboardWeek with _$LeaderboardWeek {
  const factory LeaderboardWeek({
    required String id,
    String? board,
    DateTime? weekStart,
    @Default(<LeaderboardEntry>[]) List<LeaderboardEntry> entries,
  }) = _LeaderboardWeek;

  factory LeaderboardWeek.fromJson(Map<String, dynamic> json) => _$LeaderboardWeekFromJson(json);
}

@freezed
abstract class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    @Default(0) int rank,
    @Default('') String pseudonym,
    String? characterId,
    @Default(0) int points,
    String? entryId,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) => _$LeaderboardEntryFromJson(json);
}

enum CelebrationKind { badge, milestone, streak, challenge, projectChosen, projectComplete, unknown }

/// Something worth celebrating (from getHomeDashboard.unreadCelebrations or
/// built locally from a callable result).
@freezed
abstract class Celebration with _$Celebration {
  const factory Celebration({
    String? id,
    @JsonKey(unknownEnumValue: CelebrationKind.unknown) @Default(CelebrationKind.badge) CelebrationKind kind,
    @Default('') String title,
    String? message,
    String? badgeKey,
  }) = _Celebration;

  factory Celebration.fromJson(Map<String, dynamic> json) => _$CelebrationFromJson(json);
}

/// `users/{uid}/unlocks/{id}` — earned cosmetics (themes, characters).
@freezed
abstract class Unlock with _$Unlock {
  const factory Unlock({
    required String id,

    /// theme | character
    @Default('theme') String kind,
    @Default('') String key,
    DateTime? unlockedAt,
  }) = _Unlock;

  factory Unlock.fromJson(Map<String, dynamic> json) => _$UnlockFromJson(json);
}
