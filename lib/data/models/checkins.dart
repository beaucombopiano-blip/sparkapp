import 'package:freezed_annotation/freezed_annotation.dart';

import 'gamification.dart';
import 'schedule.dart';

part 'checkins.freezed.dart';
part 'checkins.g.dart';

/// `users/{uid}/projects/{pid}/checkins/{id}`.
@freezed
abstract class Checkin with _$Checkin {
  const factory Checkin({
    required String id,
    @Default(3) int feeling,
    @Default(3) int progressRating,
    String? challenges,
    @Default(true) bool scheduleStillRealistic,
    String? encouragement,
    DateTime? createdAt,
  }) = _Checkin;

  factory Checkin.fromJson(Map<String, dynamic> json) => _$CheckinFromJson(json);
}

/// `submitCheckin` result.
@freezed
abstract class CheckinResult with _$CheckinResult {
  const factory CheckinResult({
    @Default('') String encouragement,
    Proposal? proposal,
  }) = _CheckinResult;

  factory CheckinResult.fromJson(Map<String, dynamic> json) => _$CheckinResultFromJson(json);
}

/// `users/{uid}/projects/{pid}/reflections/{id}`.
@freezed
abstract class Reflection with _$Reflection {
  const factory Reflection({
    required String id,

    /// "YYYY-MM"
    @Default('') String month,
    @Default('') String learned,
    @Default('') String change,
    @Default('') String goals,
    DateTime? createdAt,
  }) = _Reflection;

  factory Reflection.fromJson(Map<String, dynamic> json) => _$ReflectionFromJson(json);
}

/// `getMonthlyReflection` result, built from real data.
@freezed
abstract class MonthlyReflectionSummary with _$MonthlyReflectionSummary {
  const factory MonthlyReflectionSummary({
    @Default('') String month,
    @Default(0) int tasksCompleted,
    @Default(<String>[]) List<String> milestonesCompleted,
    @Default(0) int minutesSpent,
    @Default(<BadgeAward>[]) List<BadgeAward> badges,
    @Default(<String>[]) List<String> challenges,
    @Default(<String>[]) List<String> upcomingPriorities,
    Reflection? existingReflection,
  }) = _MonthlyReflectionSummary;

  factory MonthlyReflectionSummary.fromJson(Map<String, dynamic> json) =>
      _$MonthlyReflectionSummaryFromJson(json);
}
