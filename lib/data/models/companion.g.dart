// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      title: json['title'] as String?,
      projectId: json['projectId'] as String?,
      lastMessagePreview: json['lastMessagePreview'] as String?,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': ?instance.title,
      'projectId': ?instance.projectId,
      'lastMessagePreview': ?instance.lastMessagePreview,
      'lastMessageAt': ?instance.lastMessageAt?.toIso8601String(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_SupportResource _$SupportResourceFromJson(Map<String, dynamic> json) =>
    _SupportResource(
      label: json['label'] as String? ?? '',
      phone: json['phone'] as String?,
      sms: json['sms'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SupportResourceToJson(_SupportResource instance) =>
    <String, dynamic>{
      'label': instance.label,
      'phone': ?instance.phone,
      'sms': ?instance.sms,
      'url': ?instance.url,
      'description': ?instance.description,
    };

_SafetyInfo _$SafetyInfoFromJson(Map<String, dynamic> json) => _SafetyInfo(
  crisis: json['crisis'] as bool? ?? false,
  message: json['message'] as String?,
  resources:
      (json['resources'] as List<dynamic>?)
          ?.map((e) => SupportResource.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SupportResource>[],
);

Map<String, dynamic> _$SafetyInfoToJson(_SafetyInfo instance) =>
    <String, dynamic>{
      'crisis': instance.crisis,
      'message': ?instance.message,
      'resources': instance.resources.map((e) => e.toJson()).toList(),
    };

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  role: json['role'] as String? ?? 'assistant',
  content: json['content'] as String? ?? '',
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const <Map<String, dynamic>>[],
  proposedActionIds:
      (json['proposedActionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  safety: json['safety'] == null
      ? null
      : SafetyInfo.fromJson(json['safety'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'content': instance.content,
      'attachments': instance.attachments,
      'proposedActionIds': instance.proposedActionIds,
      'safety': ?instance.safety?.toJson(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_ProposedAction _$ProposedActionFromJson(Map<String, dynamic> json) =>
    _ProposedAction(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String?,
      messageId: json['messageId'] as String?,
      type: json['type'] as String? ?? '',
      status:
          $enumDecodeNullable(
            _$ProposedActionStatusEnumMap,
            json['status'],
            unknownValue: ProposedActionStatus.unknown,
          ) ??
          ProposedActionStatus.pending,
      preview: json['preview'] as String? ?? '',
      previewDetails:
          (json['previewDetails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      error: json['error'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProposedActionToJson(_ProposedAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': ?instance.conversationId,
      'messageId': ?instance.messageId,
      'type': instance.type,
      'status': _$ProposedActionStatusEnumMap[instance.status]!,
      'preview': instance.preview,
      'previewDetails': instance.previewDetails,
      'payload': instance.payload,
      'error': ?instance.error,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

const _$ProposedActionStatusEnumMap = {
  ProposedActionStatus.pending: 'pending',
  ProposedActionStatus.confirmed: 'confirmed',
  ProposedActionStatus.executed: 'executed',
  ProposedActionStatus.failed: 'failed',
  ProposedActionStatus.cancelled: 'cancelled',
  ProposedActionStatus.unknown: 'unknown',
};

_ConfirmActionResult _$ConfirmActionResultFromJson(Map<String, dynamic> json) =>
    _ConfirmActionResult(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      result:
          json['result'] as Map<String, dynamic>? ?? const <String, dynamic>{},
    );

Map<String, dynamic> _$ConfirmActionResultToJson(
  _ConfirmActionResult instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': ?instance.message,
  'result': instance.result,
};
