// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectProfile _$ProjectProfileFromJson(Map<String, dynamic> json) =>
    _ProjectProfile(
      goal: json['goal'] as String?,
      motivation: json['motivation'] as String?,
      audienceOrBeneficiary: json['audienceOrBeneficiary'] as String?,
      scale: json['scale'] as String?,
      successDefinition: json['successDefinition'] as String?,
      desiredFinishDate: json['desiredFinishDate'] as String?,
      existingSkillsAndResources: json['existingSkillsAndResources'] as String?,
      constraintsAndChallenges: json['constraintsAndChallenges'] as String?,
      projectType: json['projectType'] as String?,
      title: json['title'] as String?,
      assumedFields:
          (json['assumedFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$ProjectProfileToJson(_ProjectProfile instance) =>
    <String, dynamic>{
      'goal': ?instance.goal,
      'motivation': ?instance.motivation,
      'audienceOrBeneficiary': ?instance.audienceOrBeneficiary,
      'scale': ?instance.scale,
      'successDefinition': ?instance.successDefinition,
      'desiredFinishDate': ?instance.desiredFinishDate,
      'existingSkillsAndResources': ?instance.existingSkillsAndResources,
      'constraintsAndChallenges': ?instance.constraintsAndChallenges,
      'projectType': ?instance.projectType,
      'title': ?instance.title,
      'assumedFields': instance.assumedFields,
    };

_PlanPreview _$PlanPreviewFromJson(Map<String, dynamic> json) => _PlanPreview(
  phases:
      (json['phases'] as List<dynamic>?)
          ?.map((e) => PreviewPhase.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PreviewPhase>[],
  taskCount: (json['taskCount'] as num?)?.toInt() ?? 0,
  firstTasks:
      (json['firstTasks'] as List<dynamic>?)
          ?.map((e) => PreviewTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PreviewTask>[],
);

Map<String, dynamic> _$PlanPreviewToJson(_PlanPreview instance) =>
    <String, dynamic>{
      'phases': instance.phases.map((e) => e.toJson()).toList(),
      'taskCount': instance.taskCount,
      'firstTasks': instance.firstTasks.map((e) => e.toJson()).toList(),
    };

_PreviewPhase _$PreviewPhaseFromJson(Map<String, dynamic> json) =>
    _PreviewPhase(
      title: json['title'] as String,
      milestoneTitles:
          (json['milestoneTitles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$PreviewPhaseToJson(_PreviewPhase instance) =>
    <String, dynamic>{
      'title': instance.title,
      'milestoneTitles': instance.milestoneTitles,
    };

_PreviewTask _$PreviewTaskFromJson(Map<String, dynamic> json) => _PreviewTask(
  title: json['title'] as String,
  estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt(),
  description: json['description'] as String?,
);

Map<String, dynamic> _$PreviewTaskToJson(_PreviewTask instance) =>
    <String, dynamic>{
      'title': instance.title,
      'estimatedMinutes': ?instance.estimatedMinutes,
      'description': ?instance.description,
    };

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  description: json['description'] as String?,
  projectType: json['projectType'] as String?,
  profile: json['profile'] == null
      ? null
      : ProjectProfile.fromJson(json['profile'] as Map<String, dynamic>),
  source: json['source'] as String?,
  sourceId: json['sourceId'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  targetEndDate: json['targetEndDate'] == null
      ? null
      : DateTime.parse(json['targetEndDate'] as String),
  status:
      $enumDecodeNullable(
        _$ProjectStatusEnumMap,
        json['status'],
        unknownValue: ProjectStatus.unknown,
      ) ??
      ProjectStatus.planning,
  scheduleAtRisk: json['scheduleAtRisk'] as bool? ?? false,
  activePlanVersion: (json['activePlanVersion'] as num?)?.toInt(),
  summary: json['summary'] as String?,
  completedMinutes: (json['completedMinutes'] as num?)?.toInt() ?? 0,
  totalMinutes: (json['totalMinutes'] as num?)?.toInt() ?? 0,
  completedTaskCount: (json['completedTaskCount'] as num?)?.toInt() ?? 0,
  totalTaskCount: (json['totalTaskCount'] as num?)?.toInt() ?? 0,
  completedMilestoneCount:
      (json['completedMilestoneCount'] as num?)?.toInt() ?? 0,
  totalMilestoneCount: (json['totalMilestoneCount'] as num?)?.toInt() ?? 0,
  currentMilestoneId: json['currentMilestoneId'] as String?,
  currentPhaseId: json['currentPhaseId'] as String?,
  nextSessionAt: json['nextSessionAt'] == null
      ? null
      : DateTime.parse(json['nextSessionAt'] as String),
  streak: json['streak'] == null
      ? null
      : Streaks.fromJson(json['streak'] as Map<String, dynamic>),
  preview: json['preview'] == null
      ? null
      : PlanPreview.fromJson(json['preview'] as Map<String, dynamic>),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': ?instance.description,
  'projectType': ?instance.projectType,
  'profile': ?instance.profile?.toJson(),
  'source': ?instance.source,
  'sourceId': ?instance.sourceId,
  'startDate': ?instance.startDate?.toIso8601String(),
  'targetEndDate': ?instance.targetEndDate?.toIso8601String(),
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'scheduleAtRisk': instance.scheduleAtRisk,
  'activePlanVersion': ?instance.activePlanVersion,
  'summary': ?instance.summary,
  'completedMinutes': instance.completedMinutes,
  'totalMinutes': instance.totalMinutes,
  'completedTaskCount': instance.completedTaskCount,
  'totalTaskCount': instance.totalTaskCount,
  'completedMilestoneCount': instance.completedMilestoneCount,
  'totalMilestoneCount': instance.totalMilestoneCount,
  'currentMilestoneId': ?instance.currentMilestoneId,
  'currentPhaseId': ?instance.currentPhaseId,
  'nextSessionAt': ?instance.nextSessionAt?.toIso8601String(),
  'streak': ?instance.streak?.toJson(),
  'preview': ?instance.preview?.toJson(),
  'completedAt': ?instance.completedAt?.toIso8601String(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.planning: 'planning',
  ProjectStatus.active: 'active',
  ProjectStatus.paused: 'paused',
  ProjectStatus.completed: 'completed',
  ProjectStatus.abandoned: 'abandoned',
  ProjectStatus.unknown: 'unknown',
};

_Phase _$PhaseFromJson(Map<String, dynamic> json) => _Phase(
  id: json['id'] as String,
  planVersion: (json['planVersion'] as num?)?.toInt(),
  order: (json['order'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  description: json['description'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  status:
      $enumDecodeNullable(
        _$MilestoneStatusEnumMap,
        json['status'],
        unknownValue: MilestoneStatus.unknown,
      ) ??
      MilestoneStatus.upcoming,
);

Map<String, dynamic> _$PhaseToJson(_Phase instance) => <String, dynamic>{
  'id': instance.id,
  'planVersion': ?instance.planVersion,
  'order': instance.order,
  'title': instance.title,
  'description': ?instance.description,
  'startDate': ?instance.startDate?.toIso8601String(),
  'endDate': ?instance.endDate?.toIso8601String(),
  'status': _$MilestoneStatusEnumMap[instance.status]!,
};

const _$MilestoneStatusEnumMap = {
  MilestoneStatus.upcoming: 'upcoming',
  MilestoneStatus.inProgress: 'inProgress',
  MilestoneStatus.done: 'done',
  MilestoneStatus.unknown: 'unknown',
};

_Milestone _$MilestoneFromJson(Map<String, dynamic> json) => _Milestone(
  id: json['id'] as String,
  planVersion: (json['planVersion'] as num?)?.toInt(),
  phaseId: json['phaseId'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  description: json['description'] as String?,
  targetDate: json['targetDate'] == null
      ? null
      : DateTime.parse(json['targetDate'] as String),
  status:
      $enumDecodeNullable(
        _$MilestoneStatusEnumMap,
        json['status'],
        unknownValue: MilestoneStatus.unknown,
      ) ??
      MilestoneStatus.upcoming,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$MilestoneToJson(_Milestone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planVersion': ?instance.planVersion,
      'phaseId': ?instance.phaseId,
      'order': instance.order,
      'title': instance.title,
      'description': ?instance.description,
      'targetDate': ?instance.targetDate?.toIso8601String(),
      'status': _$MilestoneStatusEnumMap[instance.status]!,
      'completedAt': ?instance.completedAt?.toIso8601String(),
    };

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  projectId: json['projectId'] as String?,
  planVersion: (json['planVersion'] as num?)?.toInt(),
  milestoneId: json['milestoneId'] as String?,
  phaseId: json['phaseId'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  description: json['description'] as String?,
  completionCriteria: json['completionCriteria'] as String?,
  estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt() ?? 30,
  priority:
      $enumDecodeNullable(
        _$TaskPriorityEnumMap,
        json['priority'],
        unknownValue: TaskPriority.medium,
      ) ??
      TaskPriority.medium,
  dependsOn:
      (json['dependsOn'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  actionable: json['actionable'] as bool? ?? false,
  suggestedDate: json['suggestedDate'] == null
      ? null
      : DateTime.parse(json['suggestedDate'] as String),
  sessionId: json['sessionId'] as String?,
  status:
      $enumDecodeNullable(
        _$TaskStatusEnumMap,
        json['status'],
        unknownValue: TaskStatus.unknown,
      ) ??
      TaskStatus.pending,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  source: json['source'] as String?,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'projectId': ?instance.projectId,
  'planVersion': ?instance.planVersion,
  'milestoneId': ?instance.milestoneId,
  'phaseId': ?instance.phaseId,
  'order': instance.order,
  'title': instance.title,
  'description': ?instance.description,
  'completionCriteria': ?instance.completionCriteria,
  'estimatedMinutes': instance.estimatedMinutes,
  'priority': _$TaskPriorityEnumMap[instance.priority]!,
  'dependsOn': instance.dependsOn,
  'actionable': instance.actionable,
  'suggestedDate': ?instance.suggestedDate?.toIso8601String(),
  'sessionId': ?instance.sessionId,
  'status': _$TaskStatusEnumMap[instance.status]!,
  'completedAt': ?instance.completedAt?.toIso8601String(),
  'source': ?instance.source,
};

const _$TaskPriorityEnumMap = {
  TaskPriority.high: 'high',
  TaskPriority.medium: 'medium',
  TaskPriority.low: 'low',
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.done: 'done',
  TaskStatus.skipped: 'skipped',
  TaskStatus.obsolete: 'obsolete',
  TaskStatus.unknown: 'unknown',
};

_WorkSession _$WorkSessionFromJson(Map<String, dynamic> json) => _WorkSession(
  id: json['id'] as String,
  projectId: json['projectId'] as String?,
  planVersion: (json['planVersion'] as num?)?.toInt(),
  startsAt: DateTime.parse(json['startsAt'] as String),
  endsAt: json['endsAt'] == null
      ? null
      : DateTime.parse(json['endsAt'] as String),
  durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 60,
  status:
      $enumDecodeNullable(
        _$SessionStatusEnumMap,
        json['status'],
        unknownValue: SessionStatus.unknown,
      ) ??
      SessionStatus.scheduled,
  taskIds:
      (json['taskIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  googleEventId: json['googleEventId'] as String?,
);

Map<String, dynamic> _$WorkSessionToJson(_WorkSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': ?instance.projectId,
      'planVersion': ?instance.planVersion,
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': ?instance.endsAt?.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'taskIds': instance.taskIds,
      'googleEventId': ?instance.googleEventId,
    };

const _$SessionStatusEnumMap = {
  SessionStatus.scheduled: 'scheduled',
  SessionStatus.inProgress: 'inProgress',
  SessionStatus.completed: 'completed',
  SessionStatus.missed: 'missed',
  SessionStatus.cancelled: 'cancelled',
  SessionStatus.unknown: 'unknown',
};

_NamedRef _$NamedRefFromJson(Map<String, dynamic> json) => _NamedRef(
  id: json['id'] as String?,
  title: json['title'] as String? ?? '',
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  targetDate: json['targetDate'] == null
      ? null
      : DateTime.parse(json['targetDate'] as String),
  kind: json['kind'] as String?,
);

Map<String, dynamic> _$NamedRefToJson(_NamedRef instance) => <String, dynamic>{
  'id': ?instance.id,
  'title': instance.title,
  'date': ?instance.date?.toIso8601String(),
  'targetDate': ?instance.targetDate?.toIso8601String(),
  'kind': ?instance.kind,
};

_Progress _$ProgressFromJson(Map<String, dynamic> json) => _Progress(
  percentComplete: (json['percentComplete'] as num?)?.toDouble() ?? 0,
  completedMinutes: (json['completedMinutes'] as num?)?.toInt() ?? 0,
  remainingMinutes: (json['remainingMinutes'] as num?)?.toInt() ?? 0,
  projectedPercentByWeekEnd:
      (json['projectedPercentByWeekEnd'] as num?)?.toDouble() ?? 0,
  currentPhase: json['currentPhase'] == null
      ? null
      : NamedRef.fromJson(json['currentPhase'] as Map<String, dynamic>),
  currentMilestone: json['currentMilestone'] == null
      ? null
      : NamedRef.fromJson(json['currentMilestone'] as Map<String, dynamic>),
  nextDeadline: json['nextDeadline'] == null
      ? null
      : NamedRef.fromJson(json['nextDeadline'] as Map<String, dynamic>),
  daysLeft: (json['daysLeft'] as num?)?.toInt(),
  onTrack: json['onTrack'] as bool? ?? true,
  streaks: json['streaks'] == null
      ? null
      : Streaks.fromJson(json['streaks'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProgressToJson(_Progress instance) => <String, dynamic>{
  'percentComplete': instance.percentComplete,
  'completedMinutes': instance.completedMinutes,
  'remainingMinutes': instance.remainingMinutes,
  'projectedPercentByWeekEnd': instance.projectedPercentByWeekEnd,
  'currentPhase': ?instance.currentPhase?.toJson(),
  'currentMilestone': ?instance.currentMilestone?.toJson(),
  'nextDeadline': ?instance.nextDeadline?.toJson(),
  'daysLeft': ?instance.daysLeft,
  'onTrack': instance.onTrack,
  'streaks': ?instance.streaks?.toJson(),
};

_Timeline _$TimelineFromJson(Map<String, dynamic> json) => _Timeline(
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  targetEndDate: json['targetEndDate'] == null
      ? null
      : DateTime.parse(json['targetEndDate'] as String),
  phases:
      (json['phases'] as List<dynamic>?)
          ?.map((e) => TimelinePhase.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TimelinePhase>[],
  completedMinutes: (json['completedMinutes'] as num?)?.toInt() ?? 0,
  remainingMinutes: (json['remainingMinutes'] as num?)?.toInt() ?? 0,
  percentComplete: (json['percentComplete'] as num?)?.toDouble() ?? 0,
  projectedPercentByWeekEnd:
      (json['projectedPercentByWeekEnd'] as num?)?.toDouble() ?? 0,
  upcomingDeadlines:
      (json['upcomingDeadlines'] as List<dynamic>?)
          ?.map((e) => NamedRef.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NamedRef>[],
);

Map<String, dynamic> _$TimelineToJson(_Timeline instance) => <String, dynamic>{
  'startDate': ?instance.startDate?.toIso8601String(),
  'targetEndDate': ?instance.targetEndDate?.toIso8601String(),
  'phases': instance.phases.map((e) => e.toJson()).toList(),
  'completedMinutes': instance.completedMinutes,
  'remainingMinutes': instance.remainingMinutes,
  'percentComplete': instance.percentComplete,
  'projectedPercentByWeekEnd': instance.projectedPercentByWeekEnd,
  'upcomingDeadlines': instance.upcomingDeadlines
      .map((e) => e.toJson())
      .toList(),
};

_TimelinePhase _$TimelinePhaseFromJson(Map<String, dynamic> json) =>
    _TimelinePhase(
      id: json['id'] as String?,
      title: json['title'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      status:
          $enumDecodeNullable(
            _$MilestoneStatusEnumMap,
            json['status'],
            unknownValue: MilestoneStatus.unknown,
          ) ??
          MilestoneStatus.upcoming,
      milestones:
          (json['milestones'] as List<dynamic>?)
              ?.map((e) => Milestone.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Milestone>[],
    );

Map<String, dynamic> _$TimelinePhaseToJson(_TimelinePhase instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'title': instance.title,
      'order': instance.order,
      'startDate': ?instance.startDate?.toIso8601String(),
      'endDate': ?instance.endDate?.toIso8601String(),
      'status': _$MilestoneStatusEnumMap[instance.status]!,
      'milestones': instance.milestones.map((e) => e.toJson()).toList(),
    };

_CompleteTaskResult _$CompleteTaskResultFromJson(Map<String, dynamic> json) =>
    _CompleteTaskResult(
      currentTasks:
          (json['currentTasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Task>[],
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress'] as Map<String, dynamic>),
      newlyEarnedBadges:
          (json['newlyEarnedBadges'] as List<dynamic>?)
              ?.map((e) => BadgeAward.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BadgeAward>[],
      milestoneCompleted: json['milestoneCompleted'] == null
          ? null
          : NamedRef.fromJson(
              json['milestoneCompleted'] as Map<String, dynamic>,
            ),
      projectCompleted: json['projectCompleted'] as bool? ?? false,
      streaks: json['streaks'] == null
          ? null
          : Streaks.fromJson(json['streaks'] as Map<String, dynamic>),
      promptJournal: json['promptJournal'] as bool? ?? true,
    );

Map<String, dynamic> _$CompleteTaskResultToJson(_CompleteTaskResult instance) =>
    <String, dynamic>{
      'currentTasks': instance.currentTasks.map((e) => e.toJson()).toList(),
      'progress': ?instance.progress?.toJson(),
      'newlyEarnedBadges': instance.newlyEarnedBadges
          .map((e) => e.toJson())
          .toList(),
      'milestoneCompleted': ?instance.milestoneCompleted?.toJson(),
      'projectCompleted': instance.projectCompleted,
      'streaks': ?instance.streaks?.toJson(),
      'promptJournal': instance.promptJournal,
    };

_ScopeCut _$ScopeCutFromJson(Map<String, dynamic> json) => _ScopeCut(
  id: json['id'] as String?,
  title: json['title'] as String? ?? '',
  description: json['description'] as String?,
  minutesSaved: (json['minutesSaved'] as num?)?.toInt(),
);

Map<String, dynamic> _$ScopeCutToJson(_ScopeCut instance) => <String, dynamic>{
  'id': ?instance.id,
  'title': instance.title,
  'description': ?instance.description,
  'minutesSaved': ?instance.minutesSaved,
};

_GeneratePlanResult _$GeneratePlanResultFromJson(Map<String, dynamic> json) =>
    _GeneratePlanResult(
      feasible: json['feasible'] as bool? ?? false,
      planVersion: (json['planVersion'] as num?)?.toInt(),
      suggestedEndDate: json['suggestedEndDate'] == null
          ? null
          : DateTime.parse(json['suggestedEndDate'] as String),
      extraMinutesPerWeekNeeded: (json['extraMinutesPerWeekNeeded'] as num?)
          ?.toInt(),
      scopeCuts:
          (json['scopeCuts'] as List<dynamic>?)
              ?.map((e) => ScopeCut.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ScopeCut>[],
      capacityMinutes: (json['capacityMinutes'] as num?)?.toInt(),
      requiredMinutes: (json['requiredMinutes'] as num?)?.toInt(),
      preview: json['preview'] == null
          ? null
          : PlanPreview.fromJson(json['preview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneratePlanResultToJson(_GeneratePlanResult instance) =>
    <String, dynamic>{
      'feasible': instance.feasible,
      'planVersion': ?instance.planVersion,
      'suggestedEndDate': ?instance.suggestedEndDate?.toIso8601String(),
      'extraMinutesPerWeekNeeded': ?instance.extraMinutesPerWeekNeeded,
      'scopeCuts': instance.scopeCuts.map((e) => e.toJson()).toList(),
      'capacityMinutes': ?instance.capacityMinutes,
      'requiredMinutes': ?instance.requiredMinutes,
      'preview': ?instance.preview?.toJson(),
    };
