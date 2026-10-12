// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    _Recommendation(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      whyItMatches: json['whyItMatches'] as String? ?? '',
      tangibleOutcome: json['tangibleOutcome'] as String?,
      difficulty:
          $enumDecodeNullable(
            _$DifficultyEnumMap,
            json['difficulty'],
            unknownValue: Difficulty.stretch,
          ) ??
          Difficulty.starter,
      estimatedTotalHours: (json['estimatedTotalHours'] as num?)?.toInt(),
      suggestedFirstStep: json['suggestedFirstStep'] as String?,
      audienceOrImpact: json['audienceOrImpact'] as String?,
      matchScore: (json['matchScore'] as num?)?.toDouble(),
      catalogItemId: json['catalogItemId'] as String?,
      batch: (json['batch'] as num?)?.toInt() ?? 1,
      parentNote: json['parentNote'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RecommendationToJson(_Recommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'whyItMatches': instance.whyItMatches,
      'tangibleOutcome': ?instance.tangibleOutcome,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'estimatedTotalHours': ?instance.estimatedTotalHours,
      'suggestedFirstStep': ?instance.suggestedFirstStep,
      'audienceOrImpact': ?instance.audienceOrImpact,
      'matchScore': ?instance.matchScore,
      'catalogItemId': ?instance.catalogItemId,
      'batch': instance.batch,
      'parentNote': ?instance.parentNote,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

const _$DifficultyEnumMap = {
  Difficulty.starter: 'starter',
  Difficulty.stretch: 'stretch',
  Difficulty.ambitious: 'ambitious',
};

_AssessmentQuestion _$AssessmentQuestionFromJson(Map<String, dynamic> json) =>
    _AssessmentQuestion(
      id: json['id'] as String,
      text: json['text'] as String? ?? '',
      facet: json['facet'] as String?,
    );

Map<String, dynamic> _$AssessmentQuestionToJson(_AssessmentQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'facet': ?instance.facet,
    };

_AssessmentStep _$AssessmentStepFromJson(Map<String, dynamic> json) =>
    _AssessmentStep(
      sessionId: json['sessionId'] as String,
      done: json['done'] as bool? ?? false,
      question: json['question'] == null
          ? null
          : AssessmentQuestion.fromJson(
              json['question'] as Map<String, dynamic>,
            ),
      index: (json['index'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 30,
      previousAnswer: (json['previousAnswer'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AssessmentStepToJson(_AssessmentStep instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'done': instance.done,
      'question': ?instance.question?.toJson(),
      'index': instance.index,
      'total': instance.total,
      'previousAnswer': ?instance.previousAnswer,
    };

_IdeaInterview _$IdeaInterviewFromJson(Map<String, dynamic> json) =>
    _IdeaInterview(
      id: json['id'] as String,
      status: json['status'] as String? ?? 'active',
      profileSoFar: json['profileSoFar'] == null
          ? null
          : ProjectProfile.fromJson(
              json['profileSoFar'] as Map<String, dynamic>,
            ),
      missingFields:
          (json['missingFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      assumedFields:
          (json['assumedFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      transcript:
          (json['transcript'] as List<dynamic>?)
              ?.map((e) => InterviewMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <InterviewMessage>[],
      nextQuestion: json['nextQuestion'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$IdeaInterviewToJson(_IdeaInterview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'profileSoFar': ?instance.profileSoFar?.toJson(),
      'missingFields': instance.missingFields,
      'assumedFields': instance.assumedFields,
      'transcript': instance.transcript.map((e) => e.toJson()).toList(),
      'nextQuestion': ?instance.nextQuestion,
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

_InterviewMessage _$InterviewMessageFromJson(Map<String, dynamic> json) =>
    _InterviewMessage(
      role: json['role'] as String? ?? 'user',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$InterviewMessageToJson(_InterviewMessage instance) =>
    <String, dynamic>{'role': instance.role, 'content': instance.content};

_SelectProjectResult _$SelectProjectResultFromJson(Map<String, dynamic> json) =>
    _SelectProjectResult(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      newlyEarnedBadges:
          (json['newlyEarnedBadges'] as List<dynamic>?)
              ?.map((e) => BadgeAward.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BadgeAward>[],
    );

Map<String, dynamic> _$SelectProjectResultToJson(
  _SelectProjectResult instance,
) => <String, dynamic>{
  'project': instance.project.toJson(),
  'newlyEarnedBadges': instance.newlyEarnedBadges
      .map((e) => e.toJson())
      .toList(),
};
