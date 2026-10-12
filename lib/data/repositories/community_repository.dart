import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/community.dart';

part 'community_repository.g.dart';

/// Community (Premium, behind COMMUNITY_ENABLED). All user-generated text is
/// written through callables that moderate it before publishing.
class CommunityRepository {
  CommunityRepository(this._db, this._functions);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;

  Stream<T> _guard<T>(Stream<T> s) => s.handleError((Object e) => throw mapError(e));

  Stream<CommunityProfile?> watchProfile(String uid) => _guard(
        watchDoc(_db.collection('communityProfiles').doc(uid), CommunityProfile.fromJson),
      );

  Future<void> saveProfile({
    required String pseudonym,
    String? characterId,
    required List<String> interests,
    String? bio,
    String visibility = 'private',
  }) =>
      _functions.call('saveCommunityProfile', <String, Object?>{
        'pseudonym': pseudonym.trim(),
        'characterId': ?characterId,
        'interests': interests,
        if (bio != null && bio.trim().isNotEmpty) 'bio': bio.trim(),
        'visibility': visibility,
      });

  Future<List<CommunityMatch>> findMatches() async {
    final result = await _functions.call('findCommunityMatches');
    final items = result['items'] as List<Object?>? ?? const <Object?>[];
    return items.whereType<Map<String, dynamic>>().map(CommunityMatch.fromJson).toList();
  }

  Stream<List<CommunityPost>> watchShowcase() => _guard(
        typedQuery(
          _db
              .collection('communityPosts')
              .where('status', isEqualTo: 'published')
              .where('groupId', isNull: true)
              .orderBy('createdAt', descending: true)
              .limit(50),
          CommunityPost.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Future<void> createShowcasePost({required String title, required String body}) => _functions.call(
        'createShowcasePost',
        <String, Object?>{'title': title.trim(), 'body': body.trim(), 'consent': true},
      );

  Stream<List<CommunityGroup>> watchGroups() => _guard(
        typedCollection(_db.collection('communityGroups'), CommunityGroup.fromJson)
            .snapshots()
            .map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Stream<CommunityGroup?> watchGroup(String groupId) => _guard(
        watchDoc(_db.collection('communityGroups').doc(groupId), CommunityGroup.fromJson),
      );

  Stream<List<CommunityPost>> watchGroupPosts(String groupId) => _guard(
        typedQuery(
          _db
              .collection('communityPosts')
              .where('groupId', isEqualTo: groupId)
              .where('status', isEqualTo: 'published')
              .orderBy('createdAt', descending: true)
              .limit(100),
          CommunityPost.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Future<void> joinGroup(String groupId) => _functions.call('joinGroup', <String, Object?>{'groupId': groupId});
  Future<void> leaveGroup(String groupId) => _functions.call('leaveGroup', <String, Object?>{'groupId': groupId});

  Future<void> postToGroup(String groupId, String body) =>
      _functions.call('createGroupPost', <String, Object?>{'groupId': groupId, 'body': body.trim()});

  Stream<List<CommunityConnection>> watchConnections(String uid) => _guard(
        typedQuery(
          _db.collection('communityConnections').where('members', arrayContains: uid),
          CommunityConnection.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Future<void> sendConnectionRequest(String toUid) =>
      _functions.call('sendConnectionRequest', <String, Object?>{'toUid': toUid});

  Future<void> respondToConnection(String connectionId, {required bool accept}) => _functions.call(
        'respondConnectionRequest',
        <String, Object?>{'connectionId': connectionId, 'accept': accept},
      );

  Stream<List<CommunityMessage>> watchMessages(String connectionId) => _guard(
        typedQuery(
          _db.collection('communityConnections').doc(connectionId).collection('messages').orderBy('createdAt'),
          CommunityMessage.fromJson,
        ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()),
      );

  Future<void> sendMessage(String connectionId, String text) => _functions.call(
        'sendCommunityMessage',
        <String, Object?>{'connectionId': connectionId, 'text': text.trim()},
      );

  /// targetType: profile | post | message
  Future<void> report({required String targetType, required String targetId, String? reason}) => _functions.call(
        'reportContent',
        <String, Object?>{'targetType': targetType, 'targetId': targetId, if (reason != null && reason.isNotEmpty) 'reason': reason},
      );

  Future<void> block(String uid) => _functions.call('blockUser', <String, Object?>{'uid': uid});

  Stream<Set<String>> watchBlocks(String uid) => _guard(
        _db.collection('users').doc(uid).collection('blocks').snapshots().map((s) => s.docs.map((d) => d.id).toSet()),
      );
}

@Riverpod(keepAlive: true)
CommunityRepository communityRepository(Ref ref) =>
    CommunityRepository(ref.watch(firestoreProvider), ref.watch(functionsClientProvider));
