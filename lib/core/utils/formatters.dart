import 'package:intl/intl.dart';

import '../../l10n/generated/app_localizations.dart';
import 'user_clock.dart';

/// Locale-aware formatting helpers. All inputs are wall-clock DateTimes
/// already converted with [UserClock].
class SparkFormat {
  SparkFormat(this.locale, this.l10n);

  final String locale;
  final AppLocalizations l10n;

  String time(DateTime wallClock) => DateFormat.jm(locale).format(wallClock);

  String timeRange(DateTime start, DateTime end) => '${time(start)} – ${time(end)}';

  /// "Tue, Oct 14"
  String shortDate(DateTime wallClock) => DateFormat.MMMEd(locale).format(wallClock);

  /// "October 14, 2026"
  String longDate(DateTime wallClock) => DateFormat.yMMMMd(locale).format(wallClock);

  /// "Oct 14"
  String monthDay(DateTime wallClock) => DateFormat.MMMd(locale).format(wallClock);

  /// "Tuesday"
  String weekday(DateTime wallClock) => DateFormat.EEEE(locale).format(wallClock);

  /// "Tue"
  String weekdayShort(DateTime wallClock) => DateFormat.E(locale).format(wallClock);

  /// "October 2026"
  String monthYear(DateTime wallClock) => DateFormat.yMMMM(locale).format(wallClock);

  /// "Tuesday, October 14"
  String fullDay(DateTime wallClock) => DateFormat.MMMMEEEEd(locale).format(wallClock);

  String dayLabel(LocalDay day, LocalDay today) {
    final diff = day.differenceInDays(today);
    if (diff == 0) return l10n.commonToday;
    if (diff == 1) return l10n.commonTomorrow;
    if (diff == -1) return l10n.commonYesterday;
    return shortDate(day.asDateTime);
  }

  /// "1h 20m", "45m", "2h"
  String duration(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h == 0) return l10n.durationMinutes(m);
    if (m == 0) return l10n.durationHours(h);
    return l10n.durationHoursMinutes(h, m);
  }

  /// "4:05" style video duration.
  String clock(int totalSeconds) {
    final h = totalSeconds ~/ 3600;
    final m = (totalSeconds % 3600) ~/ 60;
    final s = totalSeconds % 60;
    final mm = h > 0 ? m.toString().padLeft(2, '0') : '$m';
    final base = '$mm:${s.toString().padLeft(2, '0')}';
    return h > 0 ? '$h:$base' : base;
  }

  String compactNumber(num value) => NumberFormat.compact(locale: locale).format(value);

  String percent(double fraction) => NumberFormat.percentPattern(locale).format(fraction);
}

/// Parses a "HH:mm" string into minutes after midnight.
int? parseHhMm(String? value) {
  if (value == null) return null;
  final match = RegExp(r'^(\d{1,2}):(\d{2})$').firstMatch(value.trim());
  if (match == null) return null;
  final h = int.parse(match[1]!);
  final m = int.parse(match[2]!);
  if (h > 23 || m > 59) return null;
  return h * 60 + m;
}

String formatHhMm(int minutesAfterMidnight) {
  final h = (minutesAfterMidnight ~/ 60) % 24;
  final m = minutesAfterMidnight % 60;
  return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
}
