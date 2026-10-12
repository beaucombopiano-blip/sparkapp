// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NextSessionInfo _$NextSessionInfoFromJson(Map<String, dynamic> json) =>
    _NextSessionInfo(
      session: WorkSession.fromJson(json['session'] as Map<String, dynamic>),
      firstTask: json['firstTask'] == null
          ? null
          : Task.fromJson(json['firstTask'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NextSessionInfoToJson(_NextSessionInfo instance) =>
    <String, dynamic>{
      'session': instance.session.toJson(),
      'firstTask': ?instance.firstTask?.toJson(),
    };

_HomeDashboard _$HomeDashboardFromJson(Map<String, dynamic> json) =>
    _HomeDashboard(
      displayName: json['displayName'] as String? ?? '',
      characterId: json['characterId'] as String?,
      activeProject: json['activeProject'] == null
          ? null
          : Project.fromJson(json['activeProject'] as Map<String, dynamic>),
      currentMilestone: json['currentMilestone'] == null
          ? null
          : NamedRef.fromJson(json['currentMilestone'] as Map<String, dynamic>),
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress'] as Map<String, dynamic>),
      nextSession: json['nextSession'] == null
          ? null
          : NextSessionInfo.fromJson(
              json['nextSession'] as Map<String, dynamic>,
            ),
      currentTasks:
          (json['currentTasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Task>[],
      streaks: json['streaks'] == null
          ? null
          : Streaks.fromJson(json['streaks'] as Map<String, dynamic>),
      unreadCelebrations:
          (json['unreadCelebrations'] as List<dynamic>?)
              ?.map((e) => Celebration.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Celebration>[],
      checkinReady: json['checkinReady'] as bool? ?? false,
      monthlyReflectionReady: json['monthlyReflectionReady'] as bool? ?? false,
      quote: json['quote'] as String?,
      quoteAuthor: json['quoteAuthor'] as String?,
    );

Map<String, dynamic> _$HomeDashboardToJson(_HomeDashboard instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'characterId': ?instance.characterId,
      'activeProject': ?instance.activeProject?.toJson(),
      'currentMilestone': ?instance.currentMilestone?.toJson(),
      'progress': ?instance.progress?.toJson(),
      'nextSession': ?instance.nextSession?.toJson(),
      'currentTasks': instance.currentTasks.map((e) => e.toJson()).toList(),
      'streaks': ?instance.streaks?.toJson(),
      'unreadCelebrations': instance.unreadCelebrations
          .map((e) => e.toJson())
          .toList(),
      'checkinReady': instance.checkinReady,
      'monthlyReflectionReady': instance.monthlyReflectionReady,
      'quote': ?instance.quote,
      'quoteAuthor': ?instance.quoteAuthor,
    };
