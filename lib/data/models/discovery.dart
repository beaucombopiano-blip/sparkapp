import 'package:freezed_annotation/freezed_annotation.dart';

import 'gamification.dart';
import 'project.dart';

part 'discovery.freezed.dart';
part 'discovery.g.dart';

enum Difficulty { starter, stretch, ambitious }

/// `users/{uid}/recommendations/{rid}`.
@freezed
abstract class Recommendation with _$Recommendation {
  const factory Recommendation({
    required String id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String whyItMatches,
    String? tangibleOutcome,
    @JsonKey(unknownEnumValue: Difficulty.stretch) @Default(Difficulty.starter) Difficulty difficulty,
    int? estimatedTotalHours,
    String? suggestedFirstStep,
    String? audienceOrImpact,
    double? matchScore,
    String? catalogItemId,
    @Default(1) int batch,
    String? parentNote,
    DateTime? createdAt,
  }) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);
}

@freezed
abstract class AssessmentQuestion with _$AssessmentQuestion {
  const factory AssessmentQuestion({
    required String id,
    @Default('') String text,
    String? facet,
  }) = _AssessmentQuestion;

  factory AssessmentQuestion.fromJson(Map<String, dynamic> json) => _$AssessmentQuestionFromJson(json);
}

/// `assessmentNext` result.
@freezed
abstract class AssessmentStep with _$AssessmentStep {
  const factory AssessmentStep({
    required String sessionId,
    @Default(false) bool done,
    AssessmentQuestion? question,

    /// 1-based position of [question].
    @Default(1) int index,
    @Default(30) int total,

    /// The previously saved answer for [question], when resuming.
    int? previousAnswer,
  }) = _AssessmentStep;

  factory AssessmentStep.fromJson(Map<String, dynamic> json) => _$AssessmentStepFromJson(json);
}

/// `users/{uid}/ideaInterviews/{id}`.
@freezed
abstract class IdeaInterview with _$IdeaInterview {
  const factory IdeaInterview({
    required String id,
    @Default('active') String status,
    ProjectProfile? profileSoFar,
    @Default(<String>[]) List<String> missingFields,
    @Default(<String>[]) List<String> assumedFields,
    @Default(<InterviewMessage>[]) List<InterviewMessage> transcript,
    String? nextQuestion,
    DateTime? updatedAt,
  }) = _IdeaInterview;

  factory IdeaInterview.fromJson(Map<String, dynamic> json) => _$IdeaInterviewFromJson(json);
}

@freezed
abstract class InterviewMessage with _$InterviewMessage {
  const factory InterviewMessage({
    @Default('user') String role,
    @Default('') String content,
  }) = _InterviewMessage;

  factory InterviewMessage.fromJson(Map<String, dynamic> json) => _$InterviewMessageFromJson(json);
}

/// `selectProject` result.
@freezed
abstract class SelectProjectResult with _$SelectProjectResult {
  const factory SelectProjectResult({
    required Project project,
    @Default(<BadgeAward>[]) List<BadgeAward> newlyEarnedBadges,
  }) = _SelectProjectResult;

  factory SelectProjectResult.fromJson(Map<String, dynamic> json) => _$SelectProjectResultFromJson(json);
}
