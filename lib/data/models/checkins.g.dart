// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Checkin _$CheckinFromJson(Map<String, dynamic> json) => _Checkin(
  id: json['id'] as String,
  feeling: (json['feeling'] as num?)?.toInt() ?? 3,
  progressRating: (json['progressRating'] as num?)?.toInt() ?? 3,
  challenges: json['challenges'] as String?,
  scheduleStillRealistic: json['scheduleStillRealistic'] as bool? ?? true,
  encouragement: json['encouragement'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CheckinToJson(_Checkin instance) => <String, dynamic>{
  'id': instance.id,
  'feeling': instance.feeling,
  'progressRating': instance.progressRating,
  'challenges': ?instance.challenges,
  'scheduleStillRealistic': instance.scheduleStillRealistic,
  'encouragement': ?instance.encouragement,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

_CheckinResult _$CheckinResultFromJson(Map<String, dynamic> json) =>
    _CheckinResult(
      encouragement: json['encouragement'] as String? ?? '',
      proposal: json['proposal'] == null
          ? null
          : Proposal.fromJson(json['proposal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckinResultToJson(_CheckinResult instance) =>
    <String, dynamic>{
      'encouragement': instance.encouragement,
      'proposal': ?instance.proposal?.toJson(),
    };

_Reflection _$ReflectionFromJson(Map<String, dynamic> json) => _Reflection(
  id: json['id'] as String,
  month: json['month'] as String? ?? '',
  learned: json['learned'] as String? ?? '',
  change: json['change'] as String? ?? '',
  goals: json['goals'] as String? ?? '',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ReflectionToJson(_Reflection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'month': instance.month,
      'learned': instance.learned,
      'change': instance.change,
      'goals': instance.goals,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_MonthlyReflectionSummary _$MonthlyReflectionSummaryFromJson(
  Map<String, dynamic> json,
) => _MonthlyReflectionSummary(
  month: json['month'] as String? ?? '',
  tasksCompleted: (json['tasksCompleted'] as num?)?.toInt() ?? 0,
  milestonesCompleted:
      (json['milestonesCompleted'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  minutesSpent: (json['minutesSpent'] as num?)?.toInt() ?? 0,
  badges:
      (json['badges'] as List<dynamic>?)
          ?.map((e) => BadgeAward.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BadgeAward>[],
  challenges:
      (json['challenges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  upcomingPriorities:
      (json['upcomingPriorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  existingReflection: json['existingReflection'] == null
      ? null
      : Reflection.fromJson(json['existingReflection'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MonthlyReflectionSummaryToJson(
  _MonthlyReflectionSummary instance,
) => <String, dynamic>{
  'month': instance.month,
  'tasksCompleted': instance.tasksCompleted,
  'milestonesCompleted': instance.milestonesCompleted,
  'minutesSpent': instance.minutesSpent,
  'badges': instance.badges.map((e) => e.toJson()).toList(),
  'challenges': instance.challenges,
  'upcomingPriorities': instance.upcomingPriorities,
  'existingReflection': ?instance.existingReflection?.toJson(),
};
