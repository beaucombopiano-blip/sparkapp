import 'package:flutter/foundation.dart';
import 'package:timezone/timezone.dart' as tz;

/// A calendar day (no time, no zone) in the user's time zone.
@immutable
class LocalDay implements Comparable<LocalDay> {
  const LocalDay(this.year, this.month, this.day);

  factory LocalDay.fromDateTime(DateTime wallClock) =>
      LocalDay(wallClock.year, wallClock.month, wallClock.day);

  /// Parses `YYYY-MM-DD`; returns null when malformed.
  static LocalDay? tryParse(String? value) {
    if (value == null) return null;
    final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})').firstMatch(value);
    if (match == null) return null;
    return LocalDay(int.parse(match[1]!), int.parse(match[2]!), int.parse(match[3]!));
  }

  final int year;
  final int month;
  final int day;

  /// A wall-clock DateTime at midnight (used for display and table_calendar).
  DateTime get asDateTime => DateTime(year, month, day);

  /// 0 = Sunday … 6 = Saturday (the backend's availability convention).
  int get jsWeekday => asDateTime.weekday % 7;

  LocalDay addDays(int days) => LocalDay.fromDateTime(DateTime(year, month, day + days));

  /// Monday of this day's week.
  LocalDay get startOfWeek => addDays(-(asDateTime.weekday - DateTime.monday));

  LocalDay get startOfMonth => LocalDay(year, month, 1);
  LocalDay get endOfMonth => LocalDay.fromDateTime(DateTime(year, month + 1, 0));

  bool isBefore(LocalDay other) => compareTo(other) < 0;
  bool isAfter(LocalDay other) => compareTo(other) > 0;

  int differenceInDays(LocalDay other) =>
      DateTime.utc(year, month, day).difference(DateTime.utc(other.year, other.month, other.day)).inDays;

  String toIso() =>
      '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

  @override
  int compareTo(LocalDay other) {
    if (year != other.year) return year.compareTo(other.year);
    if (month != other.month) return month.compareTo(other.month);
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      other is LocalDay && other.year == year && other.month == month && other.day == day;

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  String toString() => toIso();
}

/// A UTC half-open interval [start, end).
@immutable
class UtcRange {
  const UtcRange(this.start, this.end);
  final DateTime start;
  final DateTime end;

  bool contains(DateTime utc) => !utc.isBefore(start) && utc.isBefore(end);

  @override
  bool operator ==(Object other) => other is UtcRange && other.start == start && other.end == end;

  @override
  int get hashCode => Object.hash(start, end);
}

/// Converts between UTC instants (what Firestore stores) and wall-clock time
/// in the user's IANA time zone (what the UI shows), handling DST.
class UserClock {
  UserClock(this.location, {DateTime Function()? now}) : _now = now ?? DateTime.now;

  /// Builds a clock for [timeZoneId], falling back to UTC when unknown.
  factory UserClock.forZone(String? timeZoneId, {DateTime Function()? now}) {
    tz.Location location;
    try {
      location = timeZoneId == null || timeZoneId.isEmpty ? tz.local : tz.getLocation(timeZoneId);
    } on Object {
      location = tz.UTC;
    }
    return UserClock(location, now: now);
  }

  final tz.Location location;
  final DateTime Function() _now;

  String get zoneName => location.name;

  /// Current instant (UTC). Use instead of `DateTime.now()` so tests can pin time.
  DateTime nowUtc() => _now().toUtc();

  /// Current wall-clock time in the user's zone.
  DateTime now() => toWallClock(_now().toUtc());

  LocalDay today() => LocalDay.fromDateTime(now());

  /// UTC instant → wall-clock DateTime (fields are the user's local time).
  DateTime toWallClock(DateTime instant) {
    final t = tz.TZDateTime.from(instant.toUtc(), location);
    return DateTime(t.year, t.month, t.day, t.hour, t.minute, t.second, t.millisecond);
  }

  LocalDay dayOf(DateTime instant) => LocalDay.fromDateTime(toWallClock(instant));

  /// Wall-clock fields in the user's zone → UTC instant.
  DateTime toUtc(DateTime wallClock) => tz.TZDateTime(
        location,
        wallClock.year,
        wallClock.month,
        wallClock.day,
        wallClock.hour,
        wallClock.minute,
        wallClock.second,
      ).toUtc();

  /// UTC range covering whole local days [from, to] inclusive.
  UtcRange rangeForDays(LocalDay from, LocalDay to) {
    final start = toUtc(from.asDateTime);
    final next = to.addDays(1);
    return UtcRange(start, toUtc(next.asDateTime));
  }

  UtcRange rangeForDay(LocalDay day) => rangeForDays(day, day);
}
