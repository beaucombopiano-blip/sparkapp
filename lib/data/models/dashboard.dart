import 'package:freezed_annotation/freezed_annotation.dart';

import 'gamification.dart';
import 'project.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
abstract class NextSessionInfo with _$NextSessionInfo {
  const factory NextSessionInfo({
    required WorkSession session,
    Task? firstTask,
  }) = _NextSessionInfo;

  factory NextSessionInfo.fromJson(Map<String, dynamic> json) => _$NextSessionInfoFromJson(json);
}

/// `getHomeDashboard` result (one call). Live Firestore streams keep the
/// project, tasks and proposals fresh after it loads.
@freezed
abstract class HomeDashboard with _$HomeDashboard {
  const factory HomeDashboard({
    @Default('') String displayName,
    String? characterId,
    Project? activeProject,
    NamedRef? currentMilestone,
    Progress? progress,
    NextSessionInfo? nextSession,
    @Default(<Task>[]) List<Task> currentTasks,
    Streaks? streaks,
    @Default(<Celebration>[]) List<Celebration> unreadCelebrations,
    @Default(false) bool checkinReady,
    @Default(false) bool monthlyReflectionReady,
    String? quote,
    String? quoteAuthor,
  }) = _HomeDashboard;

  factory HomeDashboard.fromJson(Map<String, dynamic> json) => _$HomeDashboardFromJson(json);
}
