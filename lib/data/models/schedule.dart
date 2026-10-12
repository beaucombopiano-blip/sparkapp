import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

/// `users/{uid}/availability/{slotId}`. weekday: 0 = Sunday … 6 = Saturday.
@freezed
abstract class AvailabilitySlot with _$AvailabilitySlot {
  const AvailabilitySlot._();

  const factory AvailabilitySlot({
    String? id,
    required int weekday,

    /// Local "HH:mm".
    required String startTime,
    required int durationMinutes,
    int? maxMinutesPerDay,
  }) = _AvailabilitySlot;

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) => _$AvailabilitySlotFromJson(json);

  Map<String, Object?> toPayload() => <String, Object?>{
        'weekday': weekday,
        'startTime': startTime,
        'durationMinutes': durationMinutes,
        if (maxMinutesPerDay != null) 'maxMinutesPerDay': maxMinutesPerDay,
      };
}

/// `users/{uid}/availabilityExceptions/{id}` (vacations, exams).
@freezed
abstract class AvailabilityException with _$AvailabilityException {
  const factory AvailabilityException({
    String? id,
    required DateTime startDate,
    required DateTime endDate,
    String? reason,
  }) = _AvailabilityException;

  factory AvailabilityException.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityExceptionFromJson(json);
}

enum ProposalStatus { pending, applied, dismissed, expired, failed, unknown }

/// `users/{uid}/proposals/{id}` — a reschedule / plan-change proposal that
/// is only applied after the user confirms (`applyProposal`).
@freezed
abstract class Proposal with _$Proposal {
  const Proposal._();

  const factory Proposal({
    required String id,
    String? projectId,
    @Default('reschedule') String type,
    @JsonKey(unknownEnumValue: ProposalStatus.unknown) @Default(ProposalStatus.pending) ProposalStatus status,
    String? title,
    String? summary,
    String? reason,
    @Default(<ProposalChange>[]) List<ProposalChange> changes,
    @Default(<ProposalOption>[]) List<ProposalOption> options,

    /// False when the work no longer fits and the user must pick an option.
    @Default(true) bool fits,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) = _Proposal;

  factory Proposal.fromJson(Map<String, dynamic> json) => _$ProposalFromJson(json);

  bool get isPending => status == ProposalStatus.pending;
  bool get needsOptionChoice => !fits && options.isNotEmpty;
}

@freezed
abstract class ProposalChange with _$ProposalChange {
  const factory ProposalChange({
    /// move | add | remove | obsolete | deadline | availability | edit
    @Default('edit') String kind,
    @Default('') String title,
    String? description,
    String? taskId,
    String? sessionId,
    DateTime? fromDate,
    DateTime? toDate,
    int? minutes,
  }) = _ProposalChange;

  factory ProposalChange.fromJson(Map<String, dynamic> json) => _$ProposalChangeFromJson(json);
}

@freezed
abstract class ProposalOption with _$ProposalOption {
  const factory ProposalOption({
    required String id,

    /// extendDeadline | cutScope | addHours
    @Default('extendDeadline') String kind,
    @Default('') String label,
    String? description,
    DateTime? newEndDate,
    int? extraMinutesPerWeek,
    @Default(<String>[]) List<String> cutTaskTitles,
  }) = _ProposalOption;

  factory ProposalOption.fromJson(Map<String, dynamic> json) => _$ProposalOptionFromJson(json);
}
