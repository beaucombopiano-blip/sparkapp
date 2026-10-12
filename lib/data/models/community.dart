import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

/// `communityProfiles/{uid}` — pseudonymous, opt-in. Never a real name,
/// school, contact info or location.
@freezed
abstract class CommunityProfile with _$CommunityProfile {
  const factory CommunityProfile({
    required String id,
    @Default('') String pseudonym,
    String? characterId,
    @Default(<String>[]) List<String> interests,
    String? projectType,
    String? bio,
    @Default('private') String visibility,
    String? ageBracket,
    DateTime? createdAt,
  }) = _CommunityProfile;

  factory CommunityProfile.fromJson(Map<String, dynamic> json) => _$CommunityProfileFromJson(json);
}

/// `communityPosts/{id}` — showcase posts (published after moderation).
@freezed
abstract class CommunityPost with _$CommunityPost {
  const factory CommunityPost({
    required String id,
    @Default('') String authorId,
    @Default('') String authorPseudonym,
    String? authorCharacterId,
    @Default('') String title,
    @Default('') String body,
    String? groupId,
    @Default('published') String status,
    DateTime? createdAt,
  }) = _CommunityPost;

  factory CommunityPost.fromJson(Map<String, dynamic> json) => _$CommunityPostFromJson(json);
}

@freezed
abstract class CommunityGroup with _$CommunityGroup {
  const factory CommunityGroup({
    required String id,
    @Default('') String name,
    String? description,
    @Default(0) int memberCount,
    @Default(false) bool moderated,
    @Default(false) bool isMember,
  }) = _CommunityGroup;

  factory CommunityGroup.fromJson(Map<String, dynamic> json) => _$CommunityGroupFromJson(json);
}

/// `communityConnections/{id}`.
@freezed
abstract class CommunityConnection with _$CommunityConnection {
  const factory CommunityConnection({
    required String id,
    @Default(<String>[]) List<String> members,
    @Default('') String requesterId,
    @Default('pending') String status,
    @Default(<String, String>{}) Map<String, String> pseudonyms,
    DateTime? createdAt,
  }) = _CommunityConnection;

  factory CommunityConnection.fromJson(Map<String, dynamic> json) => _$CommunityConnectionFromJson(json);
}

/// `communityConnections/{id}/messages/{mid}`.
@freezed
abstract class CommunityMessage with _$CommunityMessage {
  const factory CommunityMessage({
    required String id,
    @Default('') String senderId,
    @Default('') String text,
    @Default('published') String status,
    DateTime? createdAt,
  }) = _CommunityMessage;

  factory CommunityMessage.fromJson(Map<String, dynamic> json) => _$CommunityMessageFromJson(json);
}

/// `findCommunityMatches` result row.
@freezed
abstract class CommunityMatch with _$CommunityMatch {
  const factory CommunityMatch({
    required CommunityProfile profile,
    double? similarity,
    @Default(<String>[]) List<String> sharedInterests,
  }) = _CommunityMatch;

  factory CommunityMatch.fromJson(Map<String, dynamic> json) => _$CommunityMatchFromJson(json);
}
