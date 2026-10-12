import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/errors/app_exception.dart';
import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/companion.dart';

part 'companion_repository.g.dart';

/// Events streamed by the `companionChat` HTTPS function.
sealed class CompanionEvent {
  const CompanionEvent();
}

class CompanionMeta extends CompanionEvent {
  const CompanionMeta(this.conversationId);
  final String conversationId;
}

class CompanionToken extends CompanionEvent {
  const CompanionToken(this.text);
  final String text;
}

/// A read tool is running ("Checking your checklist…").
class CompanionToolActivity extends CompanionEvent {
  const CompanionToolActivity(this.toolName);
  final String toolName;
}

class CompanionAttachmentEvent extends CompanionEvent {
  const CompanionAttachmentEvent(this.attachment);
  final ChatAttachment attachment;
}

/// A write action was proposed (stored in proposedActions, not executed).
class CompanionProposalEvent extends CompanionEvent {
  const CompanionProposalEvent(this.actionId);
  final String actionId;
}

class CompanionSafetyEvent extends CompanionEvent {
  const CompanionSafetyEvent(this.safety);
  final SafetyInfo safety;
}

class CompanionDone extends CompanionEvent {
  const CompanionDone({required this.conversationId, this.messageId});
  final String conversationId;
  final String? messageId;
}

/// Where the user is in the app when they ask (helps the backend pick context).
class CompanionContextHint {
  const CompanionContextHint({required this.screen, this.taskId, this.date});
  final String screen;
  final String? taskId;
  final String? date;

  Map<String, Object?> toJson() =>
      <String, Object?>{'screen': screen, 'taskId': ?taskId, 'date': ?date};
}

class CompanionRepository {
  CompanionRepository(this._db, this._functions, this._streaming);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;
  final StreamingFunctionsClient _streaming;

  CollectionReference<Map<String, dynamic>> _conversations(String uid) =>
      _db.collection('users').doc(uid).collection('conversations');

  /// Sends a message and streams the reply. The backend persists both
  /// messages; cancelling the subscription stops the stream.
  Stream<CompanionEvent> send({
    String? conversationId,
    required String message,
    CompanionContextHint? contextHint,
  }) async* {
    await for (final event in _streaming.stream('companionChat', <String, Object?>{
      'conversationId': ?conversationId,
      'message': message,
      if (contextHint != null) 'contextHint': contextHint.toJson(),
    })) {
      final data = event.json ?? const <String, Object?>{};
      switch (event.event) {
        case 'meta':
          final id = data['conversationId'] as String?;
          if (id != null) yield CompanionMeta(id);
        case 'token':
        case 'delta':
          final text = data['text'] as String? ?? (event.json == null ? event.data : null);
          if (text != null && text.isNotEmpty) yield CompanionToken(text);
        case 'tool':
          final name = data['name'] as String?;
          if (name != null) yield CompanionToolActivity(name);
        case 'attachment':
          final attachment = ChatAttachment.fromJson(Map<String, dynamic>.from(data));
          if (attachment != null) yield CompanionAttachmentEvent(attachment);
        case 'proposal':
          final id = data['actionId'] as String? ?? data['id'] as String?;
          if (id != null) yield CompanionProposalEvent(id);
        case 'safety':
          yield CompanionSafetyEvent(SafetyInfo.fromJson(Map<String, dynamic>.from(data)));
        case 'done':
          final id = data['conversationId'] as String? ?? conversationId;
          if (id == null) throw const AppException(kind: AppErrorKind.server, code: 'chat-missing-conversation');
          yield CompanionDone(conversationId: id, messageId: data['messageId'] as String?);
        case 'error':
          throw AppException(
            kind: data['code'] == 'rate-limited' ? AppErrorKind.rateLimited : AppErrorKind.server,
            message: data['message'] as String?,
            code: data['code'] as String?,
            retryable: data['retryable'] != false,
          );
        default:
          break;
      }
    }
  }

  Stream<List<Conversation>> watchConversations(String uid) => typedQuery(
        _conversations(uid).orderBy('lastMessageAt', descending: true).limit(50),
        Conversation.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));

  Stream<List<ChatMessage>> watchMessages(String uid, String conversationId) => typedQuery(
        _conversations(uid).doc(conversationId).collection('messages').orderBy('createdAt'),
        ChatMessage.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));

  Stream<ProposedAction?> watchProposedAction(String uid, String actionId) => typedDoc(
        _db.collection('users').doc(uid).collection('proposedActions').doc(actionId),
        ProposedAction.fromJson,
      ).snapshots().map((s) => s.exists ? s.data() : null).handleError((Object e) => throw mapError(e));

  /// Executes a proposed action. Returns true only when the backend reports
  /// success; failures throw with the real message.
  Future<bool> confirmAction(String actionId) async {
    final result = ConfirmActionResult.fromJson(
      await _functions.call('confirmAction', <String, Object?>{'actionId': actionId}, const Duration(minutes: 2)),
    );
    if (!result.success) {
      throw AppException(kind: AppErrorKind.server, message: result.message, code: 'action-failed', retryable: true);
    }
    return true;
  }

  Future<void> cancelAction(String actionId) =>
      _functions.call('cancelAction', <String, Object?>{'actionId': actionId});
}

@Riverpod(keepAlive: true)
CompanionRepository companionRepository(Ref ref) => CompanionRepository(
      ref.watch(firestoreProvider),
      ref.watch(functionsClientProvider),
      ref.watch(streamingFunctionsClientProvider),
    );
