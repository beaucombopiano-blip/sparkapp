import 'package:cloud_firestore/cloud_firestore.dart';

/// Converts Firestore/Functions values into plain JSON that freezed models can
/// parse. Timestamps become ISO-8601 UTC strings, so model `DateTime` fields
/// need no custom converters.
///
/// Handles:
/// * `Timestamp` (Firestore reads)
/// * `{_seconds, _nanoseconds}` / `{seconds, nanoseconds}` maps (Timestamps
///   serialised by Cloud Functions)
/// * `DateTime`, `GeoPoint`, `DocumentReference`, `VectorValue`
Object? normalizeJson(Object? value) {
  if (value == null || value is String || value is num || value is bool) return value;
  if (value is Timestamp) return value.toDate().toUtc().toIso8601String();
  if (value is DateTime) return value.toUtc().toIso8601String();
  if (value is GeoPoint) {
    return <String, Object?>{'latitude': value.latitude, 'longitude': value.longitude};
  }
  if (value is DocumentReference) return value.path;
  if (value is VectorValue) return value.toArray();
  if (value is Map) {
    final ts = _timestampFromMap(value);
    if (ts != null) return ts;
    return <String, Object?>{
      for (final entry in value.entries) entry.key.toString(): normalizeJson(entry.value),
    };
  }
  if (value is Iterable) return value.map(normalizeJson).toList();
  return value.toString();
}

/// Normalises a map (e.g. a document's data) and returns a JSON map.
Map<String, Object?> normalizeMap(Map<Object?, Object?>? value) {
  if (value == null) return <String, Object?>{};
  return normalizeJson(value)! as Map<String, Object?>;
}

String? _timestampFromMap(Map<Object?, Object?> map) {
  if (map.length > 2) return null;
  final seconds = map['_seconds'] ?? map['seconds'];
  final nanos = map['_nanoseconds'] ?? map['nanoseconds'] ?? 0;
  if (seconds is num && nanos is num && map.length == 2) {
    final micros = seconds.toInt() * 1000000 + nanos.toInt() ~/ 1000;
    return DateTime.fromMicrosecondsSinceEpoch(micros, isUtc: true).toIso8601String();
  }
  return null;
}

/// A read-only converter: documents are parsed into models; writes go through
/// Cloud Functions or explicit field maps, never through typed models.
CollectionReference<T> typedCollection<T>(
  CollectionReference<Map<String, dynamic>> ref,
  T Function(Map<String, dynamic> json) fromJson,
) {
  return ref.withConverter<T>(
    fromFirestore: (snapshot, _) => fromJson(docJson(snapshot)),
    toFirestore: (_, _) => throw UnsupportedError(
      'Typed SPARK collections are read-only. Write through a repository method.',
    ),
  );
}

Query<T> typedQuery<T>(
  Query<Map<String, dynamic>> query,
  T Function(Map<String, dynamic> json) fromJson,
) {
  return query.withConverter<T>(
    fromFirestore: (snapshot, _) => fromJson(docJson(snapshot)),
    toFirestore: (_, _) => throw UnsupportedError('Typed SPARK queries are read-only.'),
  );
}

DocumentReference<T> typedDoc<T>(
  DocumentReference<Map<String, dynamic>> ref,
  T Function(Map<String, dynamic> json) fromJson,
) {
  return ref.withConverter<T>(
    fromFirestore: (snapshot, _) => fromJson(docJson(snapshot)),
    toFirestore: (_, _) => throw UnsupportedError('Typed SPARK documents are read-only.'),
  );
}

/// Document data as JSON with the document id under `id`.
Map<String, dynamic> docJson(DocumentSnapshot<Map<String, dynamic>> snapshot) {
  final data = normalizeMap(snapshot.data());
  return <String, dynamic>{...data, 'id': snapshot.id};
}
