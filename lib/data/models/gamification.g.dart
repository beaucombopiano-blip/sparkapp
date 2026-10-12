// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Streaks _$StreaksFromJson(Map<String, dynamic> json) => _Streaks(
  daily: (json['daily'] as num?)?.toInt() ?? 0,
  weekly: (json['weekly'] as num?)?.toInt() ?? 0,
  longestDaily: (json['longestDaily'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$StreaksToJson(_Streaks instance) => <String, dynamic>{
  'daily': instance.daily,
  'weekly': instance.weekly,
  'longestDaily': instance.longestDaily,
};

_BadgeDef _$BadgeDefFromJson(Map<String, dynamic> json) => _BadgeDef(
  id: json['id'] as String,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  howToEarn: json['howToEarn'] as String?,
  icon: json['icon'] as String?,
  points: (json['points'] as num?)?.toInt() ?? 0,
  order: (json['order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BadgeDefToJson(_BadgeDef instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'howToEarn': ?instance.howToEarn,
  'icon': ?instance.icon,
  'points': instance.points,
  'order': instance.order,
};

_EarnedBadge _$EarnedBadgeFromJson(Map<String, dynamic> json) => _EarnedBadge(
  id: json['id'] as String,
  earnedAt: json['earnedAt'] == null
      ? null
      : DateTime.parse(json['earnedAt'] as String),
  projectId: json['projectId'] as String?,
);

Map<String, dynamic> _$EarnedBadgeToJson(_EarnedBadge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'earnedAt': ?instance.earnedAt?.toIso8601String(),
      'projectId': ?instance.projectId,
    };

_BadgeAward _$BadgeAwardFromJson(Map<String, dynamic> json) => _BadgeAward(
  key: json['key'] as String? ?? '',
  name: json['name'] as String? ?? '',
  description: json['description'] as String?,
  icon: json['icon'] as String?,
  points: (json['points'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BadgeAwardToJson(_BadgeAward instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'description': ?instance.description,
      'icon': ?instance.icon,
      'points': instance.points,
    };

_Challenge _$ChallengeFromJson(Map<String, dynamic> json) => _Challenge(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  startsAt: json['startsAt'] == null
      ? null
      : DateTime.parse(json['startsAt'] as String),
  endsAt: json['endsAt'] == null
      ? null
      : DateTime.parse(json['endsAt'] as String),
  criteria: json['criteria'] as String?,
  reward: json['reward'] as String?,
  active: json['active'] as bool? ?? true,
);

Map<String, dynamic> _$ChallengeToJson(_Challenge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startsAt': ?instance.startsAt?.toIso8601String(),
      'endsAt': ?instance.endsAt?.toIso8601String(),
      'criteria': ?instance.criteria,
      'reward': ?instance.reward,
      'active': instance.active,
    };

_ChallengeParticipation _$ChallengeParticipationFromJson(
  Map<String, dynamic> json,
) => _ChallengeParticipation(
  id: json['id'] as String,
  joinedAt: json['joinedAt'] == null
      ? null
      : DateTime.parse(json['joinedAt'] as String),
  progress: (json['progress'] as num?)?.toDouble() ?? 0,
  status: json['status'] as String? ?? 'active',
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$ChallengeParticipationToJson(
  _ChallengeParticipation instance,
) => <String, dynamic>{
  'id': instance.id,
  'joinedAt': ?instance.joinedAt?.toIso8601String(),
  'progress': instance.progress,
  'status': instance.status,
  'completedAt': ?instance.completedAt?.toIso8601String(),
};

_LeaderboardWeek _$LeaderboardWeekFromJson(Map<String, dynamic> json) =>
    _LeaderboardWeek(
      id: json['id'] as String,
      board: json['board'] as String?,
      weekStart: json['weekStart'] == null
          ? null
          : DateTime.parse(json['weekStart'] as String),
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => LeaderboardEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LeaderboardEntry>[],
    );

Map<String, dynamic> _$LeaderboardWeekToJson(_LeaderboardWeek instance) =>
    <String, dynamic>{
      'id': instance.id,
      'board': ?instance.board,
      'weekStart': ?instance.weekStart?.toIso8601String(),
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };

_LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _LeaderboardEntry(
      rank: (json['rank'] as num?)?.toInt() ?? 0,
      pseudonym: json['pseudonym'] as String? ?? '',
      characterId: json['characterId'] as String?,
      points: (json['points'] as num?)?.toInt() ?? 0,
      entryId: json['entryId'] as String?,
    );

Map<String, dynamic> _$LeaderboardEntryToJson(_LeaderboardEntry instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'pseudonym': instance.pseudonym,
      'characterId': ?instance.characterId,
      'points': instance.points,
      'entryId': ?instance.entryId,
    };

_Celebration _$CelebrationFromJson(Map<String, dynamic> json) => _Celebration(
  id: json['id'] as String?,
  kind:
      $enumDecodeNullable(
        _$CelebrationKindEnumMap,
        json['kind'],
        unknownValue: CelebrationKind.unknown,
      ) ??
      CelebrationKind.badge,
  title: json['title'] as String? ?? '',
  message: json['message'] as String?,
  badgeKey: json['badgeKey'] as String?,
);

Map<String, dynamic> _$CelebrationToJson(_Celebration instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'kind': _$CelebrationKindEnumMap[instance.kind]!,
      'title': instance.title,
      'message': ?instance.message,
      'badgeKey': ?instance.badgeKey,
    };

const _$CelebrationKindEnumMap = {
  CelebrationKind.badge: 'badge',
  CelebrationKind.milestone: 'milestone',
  CelebrationKind.streak: 'streak',
  CelebrationKind.challenge: 'challenge',
  CelebrationKind.projectChosen: 'projectChosen',
  CelebrationKind.projectComplete: 'projectComplete',
  CelebrationKind.unknown: 'unknown',
};

_Unlock _$UnlockFromJson(Map<String, dynamic> json) => _Unlock(
  id: json['id'] as String,
  kind: json['kind'] as String? ?? 'theme',
  key: json['key'] as String? ?? '',
  unlockedAt: json['unlockedAt'] == null
      ? null
      : DateTime.parse(json['unlockedAt'] as String),
);

Map<String, dynamic> _$UnlockToJson(_Unlock instance) => <String, dynamic>{
  'id': instance.id,
  'kind': instance.kind,
  'key': instance.key,
  'unlockedAt': ?instance.unlockedAt?.toIso8601String(),
};
