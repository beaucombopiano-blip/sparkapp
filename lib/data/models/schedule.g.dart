// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailabilitySlot _$AvailabilitySlotFromJson(Map<String, dynamic> json) =>
    _AvailabilitySlot(
      id: json['id'] as String?,
      weekday: (json['weekday'] as num).toInt(),
      startTime: json['startTime'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      maxMinutesPerDay: (json['maxMinutesPerDay'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AvailabilitySlotToJson(_AvailabilitySlot instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'weekday': instance.weekday,
      'startTime': instance.startTime,
      'durationMinutes': instance.durationMinutes,
      'maxMinutesPerDay': ?instance.maxMinutesPerDay,
    };

_AvailabilityException _$AvailabilityExceptionFromJson(
  Map<String, dynamic> json,
) => _AvailabilityException(
  id: json['id'] as String?,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$AvailabilityExceptionToJson(
  _AvailabilityException instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'reason': ?instance.reason,
};

_Proposal _$ProposalFromJson(Map<String, dynamic> json) => _Proposal(
  id: json['id'] as String,
  projectId: json['projectId'] as String?,
  type: json['type'] as String? ?? 'reschedule',
  status:
      $enumDecodeNullable(
        _$ProposalStatusEnumMap,
        json['status'],
        unknownValue: ProposalStatus.unknown,
      ) ??
      ProposalStatus.pending,
  title: json['title'] as String?,
  summary: json['summary'] as String?,
  reason: json['reason'] as String?,
  changes:
      (json['changes'] as List<dynamic>?)
          ?.map((e) => ProposalChange.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProposalChange>[],
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => ProposalOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProposalOption>[],
  fits: json['fits'] as bool? ?? true,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$ProposalToJson(_Proposal instance) => <String, dynamic>{
  'id': instance.id,
  'projectId': ?instance.projectId,
  'type': instance.type,
  'status': _$ProposalStatusEnumMap[instance.status]!,
  'title': ?instance.title,
  'summary': ?instance.summary,
  'reason': ?instance.reason,
  'changes': instance.changes.map((e) => e.toJson()).toList(),
  'options': instance.options.map((e) => e.toJson()).toList(),
  'fits': instance.fits,
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'expiresAt': ?instance.expiresAt?.toIso8601String(),
};

const _$ProposalStatusEnumMap = {
  ProposalStatus.pending: 'pending',
  ProposalStatus.applied: 'applied',
  ProposalStatus.dismissed: 'dismissed',
  ProposalStatus.expired: 'expired',
  ProposalStatus.failed: 'failed',
  ProposalStatus.unknown: 'unknown',
};

_ProposalChange _$ProposalChangeFromJson(Map<String, dynamic> json) =>
    _ProposalChange(
      kind: json['kind'] as String? ?? 'edit',
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      taskId: json['taskId'] as String?,
      sessionId: json['sessionId'] as String?,
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      toDate: json['toDate'] == null
          ? null
          : DateTime.parse(json['toDate'] as String),
      minutes: (json['minutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProposalChangeToJson(_ProposalChange instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'title': instance.title,
      'description': ?instance.description,
      'taskId': ?instance.taskId,
      'sessionId': ?instance.sessionId,
      'fromDate': ?instance.fromDate?.toIso8601String(),
      'toDate': ?instance.toDate?.toIso8601String(),
      'minutes': ?instance.minutes,
    };

_ProposalOption _$ProposalOptionFromJson(Map<String, dynamic> json) =>
    _ProposalOption(
      id: json['id'] as String,
      kind: json['kind'] as String? ?? 'extendDeadline',
      label: json['label'] as String? ?? '',
      description: json['description'] as String?,
      newEndDate: json['newEndDate'] == null
          ? null
          : DateTime.parse(json['newEndDate'] as String),
      extraMinutesPerWeek: (json['extraMinutesPerWeek'] as num?)?.toInt(),
      cutTaskTitles:
          (json['cutTaskTitles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$ProposalOptionToJson(_ProposalOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'label': instance.label,
      'description': ?instance.description,
      'newEndDate': ?instance.newEndDate?.toIso8601String(),
      'extraMinutesPerWeek': ?instance.extraMinutesPerWeek,
      'cutTaskTitles': instance.cutTaskTitles,
    };
