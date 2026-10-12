import 'package:freezed_annotation/freezed_annotation.dart';

import 'gamification.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectStatus { planning, active, paused, completed, abandoned, unknown }

enum TaskStatus { pending, inProgress, done, skipped, obsolete, unknown }

enum TaskPriority { high, medium, low }

enum SessionStatus { scheduled, inProgress, completed, missed, cancelled, unknown }

enum MilestoneStatus { upcoming, inProgress, done, unknown }

enum ProjectScale { small, medium, large }

/// Structured project profile filled by the idea interview or a
/// recommendation.
@freezed
abstract class ProjectProfile with _$ProjectProfile {
  const factory ProjectProfile({
    String? goal,
    String? motivation,
    String? audienceOrBeneficiary,
    String? scale,
    String? successDefinition,
    String? desiredFinishDate,
    String? existingSkillsAndResources,
    String? constraintsAndChallenges,
    String? projectType,
    String? title,
    @Default(<String>[]) List<String> assumedFields,
  }) = _ProjectProfile;

  factory ProjectProfile.fromJson(Map<String, dynamic> json) => _$ProjectProfileFromJson(json);
}

/// Readable by every plan (Basic plan preview).
@freezed
abstract class PlanPreview with _$PlanPreview {
  const factory PlanPreview({
    @Default(<PreviewPhase>[]) List<PreviewPhase> phases,
    @Default(0) int taskCount,
    @Default(<PreviewTask>[]) List<PreviewTask> firstTasks,
  }) = _PlanPreview;

  factory PlanPreview.fromJson(Map<String, dynamic> json) => _$PlanPreviewFromJson(json);
}

@freezed
abstract class PreviewPhase with _$PreviewPhase {
  const factory PreviewPhase({
    required String title,
    @Default(<String>[]) List<String> milestoneTitles,
  }) = _PreviewPhase;

  factory PreviewPhase.fromJson(Map<String, dynamic> json) => _$PreviewPhaseFromJson(json);
}

@freezed
abstract class PreviewTask with _$PreviewTask {
  const factory PreviewTask({
    required String title,
    int? estimatedMinutes,
    String? description,
  }) = _PreviewTask;

  factory PreviewTask.fromJson(Map<String, dynamic> json) => _$PreviewTaskFromJson(json);
}

/// `users/{uid}/projects/{pid}` with denormalised progress counters.
@freezed
abstract class Project with _$Project {
  const Project._();

  const factory Project({
    required String id,
    @Default('') String title,
    String? description,
    String? projectType,
    ProjectProfile? profile,
    String? source,
    String? sourceId,
    DateTime? startDate,
    DateTime? targetEndDate,
    @JsonKey(unknownEnumValue: ProjectStatus.unknown) @Default(ProjectStatus.planning) ProjectStatus status,
    @Default(false) bool scheduleAtRisk,
    int? activePlanVersion,
    String? summary,
    @Default(0) int completedMinutes,
    @Default(0) int totalMinutes,
    @Default(0) int completedTaskCount,
    @Default(0) int totalTaskCount,
    @Default(0) int completedMilestoneCount,
    @Default(0) int totalMilestoneCount,
    String? currentMilestoneId,
    String? currentPhaseId,
    DateTime? nextSessionAt,
    Streaks? streak,
    PlanPreview? preview,
    DateTime? completedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  bool get hasPlan => activePlanVersion != null;
  double get fractionComplete => totalMinutes <= 0 ? 0 : (completedMinutes / totalMinutes).clamp(0, 1);
  int get remainingMinutes => (totalMinutes - completedMinutes).clamp(0, 1 << 31);
}

@freezed
abstract class Phase with _$Phase {
  const factory Phase({
    required String id,
    int? planVersion,
    @Default(0) int order,
    @Default('') String title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    @JsonKey(unknownEnumValue: MilestoneStatus.unknown) @Default(MilestoneStatus.upcoming) MilestoneStatus status,
  }) = _Phase;

  factory Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);
}

@freezed
abstract class Milestone with _$Milestone {
  const factory Milestone({
    required String id,
    int? planVersion,
    String? phaseId,
    @Default(0) int order,
    @Default('') String title,
    String? description,
    DateTime? targetDate,
    @JsonKey(unknownEnumValue: MilestoneStatus.unknown) @Default(MilestoneStatus.upcoming) MilestoneStatus status,
    DateTime? completedAt,
  }) = _Milestone;

  factory Milestone.fromJson(Map<String, dynamic> json) => _$MilestoneFromJson(json);
}

@freezed
abstract class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    String? projectId,
    int? planVersion,
    String? milestoneId,
    String? phaseId,
    @Default(0) int order,
    @Default('') String title,
    String? description,
    String? completionCriteria,
    @Default(30) int estimatedMinutes,
    @JsonKey(unknownEnumValue: TaskPriority.medium) @Default(TaskPriority.medium) TaskPriority priority,
    @Default(<String>[]) List<String> dependsOn,
    @Default(false) bool actionable,
    DateTime? suggestedDate,
    String? sessionId,
    @JsonKey(unknownEnumValue: TaskStatus.unknown) @Default(TaskStatus.pending) TaskStatus status,
    DateTime? completedAt,
    String? source,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  bool get isDone => status == TaskStatus.done;
  bool get isOpen => status == TaskStatus.pending || status == TaskStatus.inProgress;

  /// Locked until prerequisites are done.
  bool get isLocked => isOpen && !actionable && dependsOn.isNotEmpty;
}

/// `users/{uid}/projects/{pid}/sessions/{id}` — a scheduled work session.
@freezed
abstract class WorkSession with _$WorkSession {
  const WorkSession._();

  const factory WorkSession({
    required String id,
    String? projectId,
    int? planVersion,
    required DateTime startsAt,
    DateTime? endsAt,
    @Default(60) int durationMinutes,
    @JsonKey(unknownEnumValue: SessionStatus.unknown) @Default(SessionStatus.scheduled) SessionStatus status,
    @Default(<String>[]) List<String> taskIds,
    String? googleEventId,
  }) = _WorkSession;

  factory WorkSession.fromJson(Map<String, dynamic> json) => _$WorkSessionFromJson(json);

  DateTime get end => endsAt ?? startsAt.add(Duration(minutes: durationMinutes));
}

@freezed
abstract class NamedRef with _$NamedRef {
  const factory NamedRef({
    String? id,
    @Default('') String title,
    DateTime? date,
    DateTime? targetDate,
    String? kind,
  }) = _NamedRef;

  factory NamedRef.fromJson(Map<String, dynamic> json) => _$NamedRefFromJson(json);
}

/// `getProgress` result. Percentages are 0–100.
@freezed
abstract class Progress with _$Progress {
  const Progress._();

  const factory Progress({
    @Default(0) double percentComplete,
    @Default(0) int completedMinutes,
    @Default(0) int remainingMinutes,
    @Default(0) double projectedPercentByWeekEnd,
    NamedRef? currentPhase,
    NamedRef? currentMilestone,
    NamedRef? nextDeadline,
    int? daysLeft,
    @Default(true) bool onTrack,
    Streaks? streaks,
  }) = _Progress;

  factory Progress.fromJson(Map<String, dynamic> json) => _$ProgressFromJson(json);

  double get doneFraction => (percentComplete / 100).clamp(0, 1);
  double get projectedFraction => (projectedPercentByWeekEnd / 100).clamp(doneFraction, 1);
}

/// `getTimeline` result.
@freezed
abstract class Timeline with _$Timeline {
  const factory Timeline({
    DateTime? startDate,
    DateTime? targetEndDate,
    @Default(<TimelinePhase>[]) List<TimelinePhase> phases,
    @Default(0) int completedMinutes,
    @Default(0) int remainingMinutes,
    @Default(0) double percentComplete,
    @Default(0) double projectedPercentByWeekEnd,
    @Default(<NamedRef>[]) List<NamedRef> upcomingDeadlines,
  }) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) => _$TimelineFromJson(json);
}

@freezed
abstract class TimelinePhase with _$TimelinePhase {
  const factory TimelinePhase({
    String? id,
    @Default('') String title,
    @Default(0) int order,
    DateTime? startDate,
    DateTime? endDate,
    @JsonKey(unknownEnumValue: MilestoneStatus.unknown) @Default(MilestoneStatus.upcoming) MilestoneStatus status,
    @Default(<Milestone>[]) List<Milestone> milestones,
  }) = _TimelinePhase;

  factory TimelinePhase.fromJson(Map<String, dynamic> json) => _$TimelinePhaseFromJson(json);
}

/// `completeTask` result.
@freezed
abstract class CompleteTaskResult with _$CompleteTaskResult {
  const factory CompleteTaskResult({
    @Default(<Task>[]) List<Task> currentTasks,
    Progress? progress,
    @Default(<BadgeAward>[]) List<BadgeAward> newlyEarnedBadges,
    NamedRef? milestoneCompleted,
    @Default(false) bool projectCompleted,
    Streaks? streaks,
    @Default(true) bool promptJournal,
  }) = _CompleteTaskResult;

  factory CompleteTaskResult.fromJson(Map<String, dynamic> json) => _$CompleteTaskResultFromJson(json);
}

@freezed
abstract class ScopeCut with _$ScopeCut {
  const factory ScopeCut({
    String? id,
    @Default('') String title,
    String? description,
    int? minutesSaved,
  }) = _ScopeCut;

  factory ScopeCut.fromJson(Map<String, dynamic> json) => _$ScopeCutFromJson(json);
}

/// `generatePlan` result.
@freezed
abstract class GeneratePlanResult with _$GeneratePlanResult {
  const factory GeneratePlanResult({
    @Default(false) bool feasible,
    int? planVersion,
    DateTime? suggestedEndDate,
    int? extraMinutesPerWeekNeeded,
    @Default(<ScopeCut>[]) List<ScopeCut> scopeCuts,
    int? capacityMinutes,
    int? requiredMinutes,
    PlanPreview? preview,
  }) = _GeneratePlanResult;

  factory GeneratePlanResult.fromJson(Map<String, dynamic> json) => _$GeneratePlanResultFromJson(json);
}
