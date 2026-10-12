import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/resources.dart';

part 'resource_repository.g.dart';

/// Resource Center and Opportunities.
class ResourceRepository {
  ResourceRepository(this._db, this._functions);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;

  CollectionReference<Map<String, dynamic>> _saved(String uid, String pid) =>
      _db.collection('users').doc(uid).collection('projects').doc(pid).collection('savedResources');

  Future<ResourceResults> recommendResources({String? categoryId, String? query, String? taskId}) async {
    final result = await _functions.call(
      'recommendResources',
      <String, Object?>{'categoryId': ?categoryId, 'query': ?query, 'taskId': ?taskId},
      const Duration(minutes: 2),
    );
    return ResourceResults.fromJson(result);
  }

  Stream<List<SavedResource>> watchSaved(String uid, String pid) => _saved(uid, pid)
      .orderBy('savedAt', descending: true)
      .snapshots()
      .map((s) => s.docs.map((d) => SavedResource.fromJson(docJson(d))).toList())
      .handleError((Object e) => throw mapError(e));

  Future<void> saveResource(String pid, ResourceItem resource, {String? note}) => _functions.call(
        'saveResource',
        <String, Object?>{'projectId': pid, 'resource': resource.toJson(), 'note': ?note},
      );

  Future<void> unsaveResource(String pid, String savedResourceId) => _functions.call(
        'unsaveResource',
        <String, Object?>{'projectId': pid, 'savedResourceId': savedResourceId},
      );

  /// Notes are a client-writable preference field (like journal captions).
  Future<void> updateNote(String uid, String pid, String savedResourceId, String? note) async {
    try {
      await _saved(uid, pid).doc(savedResourceId).update(<String, Object?>{'note': note});
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  Future<OpportunityResults> findOpportunities(
    String pid, {
    String? locationQuery,
    List<String> types = const <String>[],
    bool? remoteOnly,
  }) async {
    final result = await _functions.call(
      'findOpportunities',
      <String, Object?>{
        'projectId': pid,
        if (locationQuery != null && locationQuery.trim().isNotEmpty) 'locationQuery': locationQuery.trim(),
        if (types.isNotEmpty) 'types': types,
        'remoteOnly': ?remoteOnly,
      },
      const Duration(minutes: 2),
    );
    return OpportunityResults.fromJson(result);
  }
}

@Riverpod(keepAlive: true)
ResourceRepository resourceRepository(Ref ref) =>
    ResourceRepository(ref.watch(firestoreProvider), ref.watch(functionsClientProvider));
