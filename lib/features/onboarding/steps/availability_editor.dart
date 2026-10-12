import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/theme/spark_colors.dart';
import '../../../app/theme/tokens.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/l10n.dart';
import '../../../core/widgets/pickers.dart';
import '../../../core/widgets/spark_card.dart';
import '../../../core/widgets/spark_chip.dart';
import '../../../data/models/schedule.dart';

/// Weekdays in display order (Monday first), using the backend's JS numbering
/// (0 = Sunday … 6 = Saturday).
const List<int> displayWeekdays = <int>[1, 2, 3, 4, 5, 6, 0];

const List<int> sessionLengths = <int>[30, 45, 60, 90, 120, 180];

/// Total minutes per week for [slots].
int weeklyMinutes(List<AvailabilitySlot> slots) => slots.fold<int>(0, (sum, s) => sum + s.durationMinutes);

/// "About 5 hours a week" (rounded to the nearest half hour).
String weeklySummary(AppLocalizations l10n, List<AvailabilitySlot> slots) {
  final minutes = weeklyMinutes(slots);
  if (minutes == 0) return l10n.availabilitySummaryNone;
  final halfHours = (minutes / 30).round();
  final hours = halfHours / 2;
  return l10n.hoursPerWeek(hours == hours.roundToDouble() ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1));
}

/// Localised weekday name for a JS weekday.
String weekdayName(String locale, int jsWeekday, {bool short = false}) {
  // 2023-01-01 was a Sunday.
  final date = DateTime(2023, 1, 1 + jsWeekday);
  return short ? DateFormat.E(locale).format(date) : DateFormat.EEEE(locale).format(date);
}

/// Weekday chips, then one or more time ranges per selected day, with a
/// weekly summary. Never more than one screen deep.
class AvailabilityEditor extends StatelessWidget {
  const AvailabilityEditor({super.key, required this.slots, required this.onChanged});

  final List<AvailabilitySlot> slots;
  final ValueChanged<List<AvailabilitySlot>> onChanged;

  List<AvailabilitySlot> _forDay(int day) => slots.where((s) => s.weekday == day).toList();

  void _toggleDay(int day) {
    if (_forDay(day).isNotEmpty) {
      onChanged(slots.where((s) => s.weekday != day).toList());
    } else {
      onChanged(<AvailabilitySlot>[
        ...slots,
        AvailabilitySlot(weekday: day, startTime: day == 0 || day == 6 ? '10:00' : '16:00', durationMinutes: 60),
      ]);
    }
  }

  void _replace(AvailabilitySlot old, AvailabilitySlot updated) =>
      onChanged(<AvailabilitySlot>[for (final s in slots) identical(s, old) ? updated : s]);

  void _remove(AvailabilitySlot slot) => onChanged(<AvailabilitySlot>[for (final s in slots) if (!identical(s, slot)) s]);

  void _add(int day) {
    final existing = _forDay(day);
    final lastEnd = existing.isEmpty
        ? 16 * 60
        : existing.map((s) => (parseHhMm(s.startTime) ?? 0) + s.durationMinutes).reduce((a, b) => a > b ? a : b);
    final start = (lastEnd + 30).clamp(0, 22 * 60);
    onChanged(<AvailabilitySlot>[
      ...slots,
      AvailabilitySlot(weekday: day, startTime: formatHhMm(start), durationMinutes: 60),
    ]);
  }

  Future<void> _pickTime(BuildContext context, AvailabilitySlot slot) async {
    final minutes = parseHhMm(slot.startTime) ?? 16 * 60;
    final picked = await showSparkTimePicker(context, initial: TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60));
    if (picked != null) _replace(slot, slot.copyWith(startTime: formatHhMm(picked.hour * 60 + picked.minute)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final fmt = context.fmt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: <Widget>[
            for (final day in displayWeekdays)
              SparkChip(
                key: Key('weekday-$day'),
                label: weekdayName(locale, day, short: true),
                semanticLabel: weekdayName(locale, day),
                selected: _forDay(day).isNotEmpty,
                onTap: () => _toggleDay(day),
              ),
          ],
        ),
        const SizedBox(height: Space.m),
        for (final day in displayWeekdays)
          if (_forDay(day).isNotEmpty) ...<Widget>[
            SparkCard(
              padding: const EdgeInsets.fromLTRB(Space.m, Space.s, Space.xs, Space.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(weekdayName(locale, day), style: text.titleMedium),
                  for (final slot in _forDay(day))
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                            onPressed: () => _pickTime(context, slot),
                            icon: const Icon(Icons.schedule_rounded),
                            label: Text(
                              '${l10n.availabilityStart} ${fmt.time(DateTime(2000, 1, 1, (parseHhMm(slot.startTime) ?? 0) ~/ 60, (parseHhMm(slot.startTime) ?? 0) % 60))}',
                            ),
                          ),
                        ),
                        DropdownButton<int>(
                          value: sessionLengths.contains(slot.durationMinutes) ? slot.durationMinutes : null,
                          hint: Text(fmt.duration(slot.durationMinutes)),
                          underline: const SizedBox.shrink(),
                          items: <DropdownMenuItem<int>>[
                            for (final m in sessionLengths)
                              DropdownMenuItem<int>(value: m, child: Text(fmt.duration(m))),
                          ],
                          onChanged: (m) => m == null ? null : _replace(slot, slot.copyWith(durationMinutes: m)),
                        ),
                        IconButton(
                          tooltip: l10n.availabilityRemoveTime,
                          onPressed: () => _remove(slot),
                          icon: Icon(Icons.close_rounded, color: c.iconMuted),
                        ),
                      ],
                    ),
                  TextButton.icon(
                    onPressed: () => _add(day),
                    icon: const Icon(Icons.add_rounded),
                    label: Text(l10n.availabilityAddTime),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Space.s),
          ],
        const SizedBox(height: Space.s),
        Semantics(
          liveRegion: true,
          child: Row(
            children: <Widget>[
              Icon(Icons.timelapse_rounded, color: c.accent),
              const SizedBox(width: Space.s),
              Expanded(child: Text(weeklySummary(l10n, slots), style: text.titleMedium)),
            ],
          ),
        ),
      ],
    );
  }
}
