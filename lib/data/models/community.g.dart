// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityProfile _$CommunityProfileFromJson(Map<String, dynamic> json) =>
    _CommunityProfile(
      id: json['id'] as String,
      pseudonym: json['pseudonym'] as String? ?? '',
      characterId: json['characterId'] as String?,
      interests:
          (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      projectType: json['projectType'] as String?,
      bio: json['bio'] as String?,
      visibility: json['visibility'] as String? ?? 'private',
      ageBracket: json['ageBracket'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommunityProfileToJson(_CommunityProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pseudonym': instance.pseudonym,
      'characterId': ?instance.characterId,
      'interests': instance.interests,
      'projectType': ?instance.projectType,
      'bio': ?instance.bio,
      'visibility': instance.visibility,
      'ageBracket': ?instance.ageBracket,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_CommunityPost _$CommunityPostFromJson(Map<String, dynamic> json) =>
    _CommunityPost(
      id: json['id'] as String,
      authorId: json['authorId'] as String? ?? '',
      authorPseudonym: json['authorPseudonym'] as String? ?? '',
      authorCharacterId: json['authorCharacterId'] as String?,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      groupId: json['groupId'] as String?,
      status: json['status'] as String? ?? 'published',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommunityPostToJson(_CommunityPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorPseudonym': instance.authorPseudonym,
      'authorCharacterId': ?instance.authorCharacterId,
      'title': instance.title,
      'body': instance.body,
      'groupId': ?instance.groupId,
      'status': instance.status,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_CommunityGroup _$CommunityGroupFromJson(Map<String, dynamic> json) =>
    _CommunityGroup(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
      moderated: json['moderated'] as bool? ?? false,
      isMember: json['isMember'] as bool? ?? false,
    );

Map<String, dynamic> _$CommunityGroupToJson(_CommunityGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'memberCount': instance.memberCount,
      'moderated': instance.moderated,
      'isMember': instance.isMember,
    };

_CommunityConnection _$CommunityConnectionFromJson(Map<String, dynamic> json) =>
    _CommunityConnection(
      id: json['id'] as String,
      members:
          (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      requesterId: json['requesterId'] as String? ?? '',
      status: json['status'] as String? ?? 'pending',
      pseudonyms:
          (json['pseudonyms'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const <String, String>{},
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommunityConnectionToJson(
  _CommunityConnection instance,
) => <String, dynamic>{
  'id': instance.id,
  'members': instance.members,
  'requesterId': instance.requesterId,
  'status': instance.status,
  'pseudonyms': instance.pseudonyms,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

_CommunityMessage _$CommunityMessageFromJson(Map<String, dynamic> json) =>
    _CommunityMessage(
      id: json['id'] as String,
      senderId: json['senderId'] as String? ?? '',
      text: json['text'] as String? ?? '',
      status: json['status'] as String? ?? 'published',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommunityMessageToJson(_CommunityMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'text': instance.text,
      'status': instance.status,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_CommunityMatch _$CommunityMatchFromJson(Map<String, dynamic> json) =>
    _CommunityMatch(
      profile: CommunityProfile.fromJson(
        json['profile'] as Map<String, dynamic>,
      ),
      similarity: (json['similarity'] as num?)?.toDouble(),
      sharedInterests:
          (json['sharedInterests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$CommunityMatchToJson(_CommunityMatch instance) =>
    <String, dynamic>{
      'profile': instance.profile.toJson(),
      'similarity': ?instance.similarity,
      'sharedInterests': instance.sharedInterests,
    };
