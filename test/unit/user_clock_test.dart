import 'package:flutter_test/flutter_test.dart';
import 'package:spark/core/utils/user_clock.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  UserClock clockAt(String zone, DateTime utcNow) => UserClock(tz.getLocation(zone), now: () => utcNow);

  group('LocalDay', () {
    test('parses and formats ISO dates', () {
      expect(LocalDay.tryParse('2026-03-08'), const LocalDay(2026, 3, 8));
      expect(LocalDay.tryParse('2026-03-08T10:00:00Z'), const LocalDay(2026, 3, 8));
      expect(LocalDay.tryParse('March 8'), isNull);
      expect(LocalDay.tryParse(null), isNull);
      expect(const LocalDay(2026, 3, 8).toIso(), '2026-03-08');
    });

    test('uses the backend weekday convention (0 = Sunday)', () {
      expect(const LocalDay(2026, 10, 11).jsWeekday, 0);
      expect(const LocalDay(2026, 10, 14).jsWeekday, 3);
      expect(const LocalDay(2026, 10, 17).jsWeekday, 6);
    });

    test('week starts on Monday and month helpers', () {
      expect(const LocalDay(2026, 10, 14).startOfWeek, const LocalDay(2026, 10, 12));
      expect(const LocalDay(2026, 10, 11).startOfWeek, const LocalDay(2026, 10, 5));
      expect(const LocalDay(2026, 2, 14).endOfMonth, const LocalDay(2026, 2, 28));
      expect(const LocalDay(2026, 12, 31).addDays(1), const LocalDay(2027, 1, 1));
    });

    test('day arithmetic survives DST changes', () {
      expect(const LocalDay(2026, 3, 9).differenceInDays(const LocalDay(2026, 3, 7)), 2);
      expect(const LocalDay(2026, 11, 2).differenceInDays(const LocalDay(2026, 10, 31)), 2);
    });
  });

  group('UserClock', () {
    test('today is computed in the user zone, not UTC', () {
      // 03:00 UTC on the 15th is still the 14th in Chicago.
      final clock = clockAt('America/Chicago', DateTime.utc(2026, 10, 15, 3));
      expect(clock.today(), const LocalDay(2026, 10, 14));
      expect(clock.now().hour, 22);
      // And already the 15th in Tokyo.
      expect(clockAt('Asia/Tokyo', DateTime.utc(2026, 10, 15, 3)).today(), const LocalDay(2026, 10, 15));
    });

    test('wall clock ↔ UTC round-trips across the spring-forward gap', () {
      final clock = clockAt('America/New_York', DateTime.utc(2026, 3, 1));
      final before = clock.toUtc(DateTime(2026, 3, 7, 16));
      final after = clock.toUtc(DateTime(2026, 3, 9, 16));
      expect(before, DateTime.utc(2026, 3, 7, 21));
      expect(after, DateTime.utc(2026, 3, 9, 20));
      expect(clock.toWallClock(after), DateTime(2026, 3, 9, 16));
    });

    test('range for a DST day is 23 hours long', () {
      final clock = clockAt('America/Chicago', DateTime.utc(2026, 3, 1));
      final range = clock.rangeForDay(const LocalDay(2026, 3, 8));
      expect(range.end.difference(range.start), const Duration(hours: 23));
      expect(range.contains(DateTime.utc(2026, 3, 8, 6)), isTrue);
      expect(range.contains(range.end), isFalse);
    });

    test('unknown zone falls back to UTC', () {
      final clock = UserClock.forZone('Not/AZone', now: () => DateTime.utc(2026, 1, 1, 23));
      expect(clock.location, tz.UTC);
      expect(clock.today(), const LocalDay(2026, 1, 1));
    });
  });
}
