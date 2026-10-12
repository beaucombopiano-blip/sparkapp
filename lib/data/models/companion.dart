import 'package:freezed_annotation/freezed_annotation.dart';

import 'resources.dart';

part 'companion.freezed.dart';
part 'companion.g.dart';

/// `users/{uid}/conversations/{cid}`.
@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    String? title,
    String? projectId,
    String? lastMessagePreview,
    DateTime? lastMessageAt,
    DateTime? createdAt,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}

@freezed
abstract class SupportResource with _$SupportResource {
  const factory SupportResource({
    @Default('') String label,
    String? phone,
    String? sms,
    String? url,
    String? description,
  }) = _SupportResource;

  factory SupportResource.fromJson(Map<String, dynamic> json) => _$SupportResourceFromJson(json);
}

@freezed
abstract class SafetyInfo with _$SafetyInfo {
  const factory SafetyInfo({
    @Default(false) bool crisis,
    String? message,
    @Default(<SupportResource>[]) List<SupportResource> resources,
  }) = _SafetyInfo;

  factory SafetyInfo.fromJson(Map<String, dynamic> json) => _$SafetyInfoFromJson(json);
}

/// `users/{uid}/conversations/{cid}/messages/{mid}`.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String id,
    @Default('assistant') String role,
    @Default('') String content,
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> attachments,
    @Default(<String>[]) List<String> proposedActionIds,
    SafetyInfo? safety,
    DateTime? createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  bool get isUser => role == 'user';
  bool get isCrisis => safety?.crisis ?? false;

  List<ChatAttachment> get parsedAttachments =>
      attachments.map(ChatAttachment.fromJson).whereType<ChatAttachment>().toList();
}

/// A resource or opportunity card attached to a companion reply.
sealed class ChatAttachment {
  const ChatAttachment();

  static ChatAttachment? fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String? ?? json['kind'] as String?;
    try {
      if (type == 'opportunity') {
        final inner = json['opportunity'];
        return OpportunityAttachment(Opportunity.fromJson(inner is Map<String, dynamic> ? inner : json));
      }
      final inner = json['resource'];
      final resource = ResourceItem.fromJson(inner is Map<String, dynamic> ? inner : json);
      if (resource.url.isEmpty) return null;
      return ResourceAttachment(resource);
    } on Object {
      return null;
    }
  }
}

class ResourceAttachment extends ChatAttachment {
  const ResourceAttachment(this.resource);
  final ResourceItem resource;
}

class OpportunityAttachment extends ChatAttachment {
  const OpportunityAttachment(this.opportunity);
  final Opportunity opportunity;
}

enum ProposedActionStatus { pending, confirmed, executed, failed, cancelled, unknown }

/// `users/{uid}/proposedActions/{id}` — a companion write action awaiting the
/// user's confirmation. Never treated as done until status == executed.
@freezed
abstract class ProposedAction with _$ProposedAction {
  const ProposedAction._();

  const factory ProposedAction({
    required String id,
    String? conversationId,
    String? messageId,
    @Default('') String type,
    @JsonKey(unknownEnumValue: ProposedActionStatus.unknown)
    @Default(ProposedActionStatus.pending)
    ProposedActionStatus status,

    /// Plain-language preview of exactly what would change.
    @Default('') String preview,
    @Default(<String>[]) List<String> previewDetails,
    @Default(<String, dynamic>{}) Map<String, dynamic> payload,
    String? error,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProposedAction;

  factory ProposedAction.fromJson(Map<String, dynamic> json) => _$ProposedActionFromJson(json);

  bool get isPending => status == ProposedActionStatus.pending;
  bool get isExecuted => status == ProposedActionStatus.executed;
}

/// `confirmAction` result.
@freezed
abstract class ConfirmActionResult with _$ConfirmActionResult {
  const factory ConfirmActionResult({
    @Default(false) bool success,
    String? message,
    @Default(<String, dynamic>{}) Map<String, dynamic> result,
  }) = _ConfirmActionResult;

  factory ConfirmActionResult.fromJson(Map<String, dynamic> json) => _$ConfirmActionResultFromJson(json);
}

/// What the companion currently knows (context sheet). Built from live
/// Firestore data on the client; the backend builds its own context
/// server-side.
class CompanionContextSummary {
  const CompanionContextSummary({
    required this.projectTitle,
    this.milestoneTitle,
    this.nextTaskTitles = const <String>[],
    this.phaseTitle,
  });

  final String projectTitle;
  final String? milestoneTitle;
  final String? phaseTitle;
  final List<String> nextTaskTitles;
}
