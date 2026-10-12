import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/errors/app_exception.dart';
import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/discovery.dart';
import '../models/project.dart';

part 'discovery_repository.g.dart';

/// Events streamed by the `ideaInterview` HTTPS function.
sealed class InterviewEvent {
  const InterviewEvent();
}

/// A chunk of the AI's next question.
class InterviewToken extends InterviewEvent {
  const InterviewToken(this.text);
  final String text;
}

/// The live "Your project so far" profile.
class InterviewProfileUpdate extends InterviewEvent {
  const InterviewProfileUpdate({
    required this.interviewId,
    required this.profile,
    this.missingFields = const <String>[],
    this.assumedFields = const <String>[],
  });

  final String interviewId;
  final ProjectProfile profile;
  final List<String> missingFields;
  final List<String> assumedFields;
}

/// The turn finished. [nextQuestion] is null when the interview is complete.
class InterviewTurnDone extends InterviewEvent {
  const InterviewTurnDone({required this.interviewId, this.nextQuestion, this.complete = false});
  final String interviewId;
  final String? nextQuestion;
  final bool complete;
}

class DiscoveryRepository {
  DiscoveryRepository(this._db, this._functions, this._streaming);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;
  final StreamingFunctionsClient _streaming;

  // ---------------------------------------------------------- Path A

  /// One interview turn. Starts a new interview when [interviewId] is null.
  Stream<InterviewEvent> interviewTurn({String? interviewId, required String message}) async* {
    await for (final event in _streaming.stream('ideaInterview', <String, Object?>{
      'interviewId': ?interviewId,
      'message': message,
    })) {
      final data = event.json ?? const <String, Object?>{};
      switch (event.event) {
        case 'token':
        case 'delta':
          final text = data['text'] as String? ?? (event.json == null ? event.data : null);
          if (text != null && text.isNotEmpty) yield InterviewToken(text);
        case 'profile':
          yield _profileEvent(data, interviewId);
        case 'done':
        case 'turn':
          if (data['profileSoFar'] is Map) yield _profileEvent(data, interviewId);
          final id = data['interviewId'] as String? ?? interviewId;
          if (id == null) throw const AppException(kind: AppErrorKind.server, code: 'interview-missing-id');
          yield InterviewTurnDone(
            interviewId: id,
            nextQuestion: data['nextQuestion'] as String?,
            complete: data['complete'] == true || data['nextQuestion'] == null,
          );
        case 'error':
          throw AppException(
            kind: AppErrorKind.server,
            message: data['message'] as String?,
            code: data['code'] as String?,
            retryable: data['retryable'] != false,
          );
        default:
          break;
      }
    }
  }

  InterviewProfileUpdate _profileEvent(Map<String, Object?> data, String? fallbackId) {
    final profile = data['profileSoFar'];
    return InterviewProfileUpdate(
      interviewId: data['interviewId'] as String? ?? fallbackId ?? '',
      profile: profile is Map<String, Object?>
          ? ProjectProfile.fromJson(Map<String, dynamic>.from(profile))
          : const ProjectProfile(),
      missingFields: (data['missingFields'] as List<Object?>?)?.whereType<String>().toList() ?? const <String>[],
      assumedFields: (data['assumedFields'] as List<Object?>?)?.whereType<String>().toList() ?? const <String>[],
    );
  }

  Stream<IdeaInterview?> watchInterview(String uid, String interviewId) =>
      watchDoc(_db.collection('users').doc(uid).collection('ideaInterviews').doc(interviewId), IdeaInterview.fromJson)
          .handleError((Object e) => throw mapError(e));

  /// The most recent unfinished interview (to resume after quitting).
  Stream<IdeaInterview?> watchLatestInterview(String uid) => typedQuery(
        _db.collection('users').doc(uid).collection('ideaInterviews').orderBy('updatedAt', descending: true).limit(1),
        IdeaInterview.fromJson,
      ).snapshots().map((s) => s.docs.isEmpty ? null : s.docs.first.data()).handleError((Object e) => throw mapError(e));

  // ---------------------------------------------------------- Path B

  /// Saves [answer] for the current question (if any) and returns the next
  /// step. Starts a session when [sessionId] is null.
  Future<AssessmentStep> assessmentNext({String? sessionId, String? questionId, int? answer}) async {
    final result = await _functions.call('assessmentNext', <String, Object?>{
      'sessionId': ?sessionId,
      if (questionId != null && answer != null) 'answer': <String, Object?>{'questionId': questionId, 'value': answer},
    });
    return AssessmentStep.fromJson(result);
  }

  // ------------------------------------------------- Recommendations

  /// Generates a batch (10) of recommendations. Earlier batches are kept.
  Future<void> recommendProjects({required String sessionId, int? batch}) => _functions.call(
        'recommendProjects',
        <String, Object?>{'sessionId': sessionId, 'batch': ?batch},
        const Duration(minutes: 3),
      );

  Stream<List<Recommendation>> watchRecommendations(String uid) => typedQuery(
        _db.collection('users').doc(uid).collection('recommendations').orderBy('batch'),
        Recommendation.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));

  /// Creates the project from a recommendation or a finished interview
  /// (with the user's edits to the reviewed profile).
  Future<SelectProjectResult> selectProject({
    String? recommendationId,
    String? interviewId,
    ProjectProfile? profile,
  }) async {
    final result = await _functions.call('selectProject', <String, Object?>{
      'recommendationId': ?recommendationId,
      'interviewId': ?interviewId,
      if (profile != null) 'profile': profile.toJson(),
    });
    return SelectProjectResult.fromJson(result);
  }
}

@Riverpod(keepAlive: true)
DiscoveryRepository discoveryRepository(Ref ref) => DiscoveryRepository(
      ref.watch(firestoreProvider),
      ref.watch(functionsClientProvider),
      ref.watch(streamingFunctionsClientProvider),
    );
