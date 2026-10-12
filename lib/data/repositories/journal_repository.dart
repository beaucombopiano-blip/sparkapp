import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/journal.dart';

part 'journal_repository.g.dart';

/// Progress journal and scrapbooks. Files are uploaded to
/// `journal/{uid}/{projectId}/{fileId}`; there is no client read access, so
/// media is always displayed from short-lived signed URLs.
class JournalRepository {
  JournalRepository(this._db, this._functions, this._storage);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;
  final FirebaseStorage _storage;

  CollectionReference<Map<String, dynamic>> _entries(String uid, String pid) =>
      _db.collection('users').doc(uid).collection('projects').doc(pid).collection('journal');

  Future<JournalTimeline> getTimeline(String pid) async =>
      JournalTimeline.fromJson(await _functions.call('getJournalTimeline', <String, Object?>{'projectId': pid}));

  /// Live entries (used to refresh the signed-URL timeline when something
  /// changes, e.g. an upload finishes processing).
  Stream<List<JournalEntry>> watchEntries(String uid, String pid) => typedQuery(
        _entries(uid, pid).orderBy('createdAt', descending: true),
        JournalEntry.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));

  /// Creates the entry document and returns where to upload.
  Future<JournalUploadTarget> createEntry({
    required String projectId,
    required JournalMediaType mediaType,
    required String contentType,
    required int sizeBytes,
    String? caption,
    String? taskId,
    String? milestoneId,
  }) async {
    final result = await _functions.call('createJournalEntry', <String, Object?>{
      'projectId': projectId,
      'mediaType': mediaType.name,
      'contentType': contentType,
      'sizeBytes': sizeBytes,
      'caption': ?caption,
      'taskId': ?taskId,
      'milestoneId': ?milestoneId,
    });
    return JournalUploadTarget.fromJson(result);
  }

  /// Uploads bytes and reports progress (0–1). Completes only after Storage
  /// confirms the upload.
  Future<void> upload({
    required String path,
    required Uint8List bytes,
    required String contentType,
    void Function(double progress)? onProgress,
  }) async {
    final task = _storage.ref(path).putData(bytes, SettableMetadata(contentType: contentType));
    final sub = task.snapshotEvents.listen((snap) {
      if (snap.totalBytes > 0) onProgress?.call(snap.bytesTransferred / snap.totalBytes);
    });
    try {
      await task;
    } on Object catch (e) {
      throw mapError(e);
    } finally {
      await sub.cancel();
    }
  }

  /// Captions are a client-writable field.
  Future<void> updateCaption(String uid, String pid, String entryId, String caption) async {
    try {
      await _entries(uid, pid).doc(entryId).update(<String, Object?>{'caption': caption.trim()});
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  /// Deletes the entry and its files.
  Future<void> deleteEntry(String pid, String entryId) =>
      _functions.call('deleteJournalEntry', <String, Object?>{'projectId': pid, 'entryId': entryId});

  // ---------------------------------------------------------- Scrapbooks

  Stream<List<Scrapbook>> watchScrapbooks(String uid) => typedQuery(
        _db.collection('users').doc(uid).collection('scrapbooks').orderBy('createdAt', descending: true),
        Scrapbook.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));

  Future<ScrapbookView> getScrapbook(String scrapbookId) async => ScrapbookView.fromJson(
        await _functions.call('getScrapbook', <String, Object?>{'scrapbookId': scrapbookId}),
      );

  Future<void> compileScrapbook({String? projectId, int? year}) => _functions.call(
        'compileScrapbook',
        <String, Object?>{'projectId': ?projectId, 'year': ?year},
        const Duration(minutes: 5),
      );
}

@Riverpod(keepAlive: true)
JournalRepository journalRepository(Ref ref) => JournalRepository(
      ref.watch(firestoreProvider),
      ref.watch(functionsClientProvider),
      ref.watch(firebaseStorageProvider),
    );
