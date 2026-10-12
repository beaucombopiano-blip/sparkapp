import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spark/core/errors/app_exception.dart';
import 'package:spark/data/firestore/error_mapping.dart';
import 'package:spark/data/firestore/json.dart';
import 'package:spark/data/models/project.dart';

void main() {
  group('normalizeJson', () {
    test('converts Firestore and callable timestamps to ISO strings', () {
      final ts = Timestamp.fromDate(DateTime.utc(2026, 10, 14, 15));
      final json = normalizeMap(<String, Object?>{
        'a': ts,
        'b': <String, Object?>{'_seconds': 1792000000, '_nanoseconds': 500000000},
        'c': <Object?>[ts, 3, 'x', null],
        'd': <String, Object?>{'nested': <String, Object?>{'seconds': 0, 'nanoseconds': 0}},
        'e': const GeoPoint(1, 2),
      });
      expect(json['a'], '2026-10-14T15:00:00.000Z');
      expect(json['b'], DateTime.fromMillisecondsSinceEpoch(1792000000500, isUtc: true).toIso8601String());
      expect(json['c'], <Object?>['2026-10-14T15:00:00.000Z', 3, 'x', null]);
      expect((json['d']! as Map<String, Object?>)['nested'], '1970-01-01T00:00:00.000Z');
      expect(json['e'], <String, Object?>{'latitude': 1.0, 'longitude': 2.0});
    });

    test('ordinary maps with a seconds field are not mistaken for timestamps', () {
      final json = normalizeMap(<String, Object?>{
        'timer': <String, Object?>{'seconds': 30, 'label': 'x', 'extra': true},
      });
      expect(json['timer'], <String, Object?>{'seconds': 30, 'label': 'x', 'extra': true});
    });

    test('models parse normalised documents, tolerating unknown enum values', () {
      final task = Task.fromJson(normalizeMap(<String, Object?>{
        'id': 't1',
        'title': 'Call',
        'priority': 'urgent',
        'status': 'archived',
        'suggestedDate': Timestamp.fromDate(DateTime.utc(2026, 10, 14)),
      }).cast<String, dynamic>());
      expect(task.priority, TaskPriority.medium);
      expect(task.status, TaskStatus.unknown);
      expect(task.suggestedDate, DateTime.utc(2026, 10, 14));
    });
  });

  group('mapError', () {
    test('uses the backend code, message and retryable flag', () {
      final e = mapError(FirebaseFunctionsException(
        code: 'resource-exhausted',
        message: 'Daily AI limit reached.',
        details: <String, Object?>{'code': 'rate-limited', 'retryable': false},
      ));
      expect(e.kind, AppErrorKind.rateLimited);
      expect(e.message, 'Daily AI limit reached.');
      expect(e.code, 'rate-limited');
      expect(e.retryable, isFalse);
    });

    test('hides SDK placeholder messages so a localised one is shown', () {
      final e = mapError(FirebaseFunctionsException(code: 'internal', message: 'INTERNAL'));
      expect(e.kind, AppErrorKind.server);
      expect(e.message, isNull);
      expect(e.retryable, isTrue);
    });

    test('feature-locked errors are recognised', () {
      final e = mapError(FirebaseFunctionsException(
        code: 'permission-denied',
        message: 'Premium feature',
        details: <String, Object?>{'code': 'feature-locked'},
      ));
      expect(e.kind, AppErrorKind.featureLocked);
    });

    test('Firestore errors map by code', () {
      final e = mapError(FirebaseException(plugin: 'cloud_firestore', code: 'unavailable'));
      expect(e.kind, AppErrorKind.network);
      expect(e.retryable, isTrue);
    });
  });
}
