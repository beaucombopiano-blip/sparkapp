import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/json.dart';
import '../models/catalog.dart';
import '../models/gamification.dart';
import '../models/resources.dart';

part 'catalog_repository.g.dart';

/// Read-only reference data seeded by the backend.
class CatalogRepository {
  CatalogRepository(this._db);

  final FirebaseFirestore _db;

  Stream<List<T>> _watchAll<T>(String collection, T Function(Map<String, dynamic>) fromJson) =>
      typedCollection(_db.collection(collection), fromJson)
          .snapshots()
          .map((s) => s.docs.map((d) => d.data()).toList())
          .handleError((Object e) => throw mapError(e));

  Stream<List<CharacterDef>> watchCharacters() =>
      _watchAll('characters', CharacterDef.fromJson).map((l) => l..sort((a, b) => a.order.compareTo(b.order)));

  Stream<List<ThemeDef>> watchThemes() =>
      _watchAll('themes', ThemeDef.fromJson).map((l) => l..sort((a, b) => a.order.compareTo(b.order)));

  Stream<List<BadgeDef>> watchBadges() =>
      _watchAll('badges', BadgeDef.fromJson).map((l) => l..sort((a, b) => a.order.compareTo(b.order)));

  Stream<List<ResourceCategory>> watchResourceCategories() => _watchAll('resourceCategories', ResourceCategory.fromJson)
      .map((l) => l..sort((a, b) => a.order.compareTo(b.order)));

  Stream<List<Challenge>> watchChallenges() => typedQuery(
        _db.collection('challenges').where('active', isEqualTo: true),
        Challenge.fromJson,
      ).snapshots().map((s) => s.docs.map((d) => d.data()).toList()).handleError((Object e) => throw mapError(e));
}

@Riverpod(keepAlive: true)
CatalogRepository catalogRepository(Ref ref) => CatalogRepository(ref.watch(firestoreProvider));
