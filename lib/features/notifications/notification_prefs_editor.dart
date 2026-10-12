import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/pickers.dart';
import '../../core/widgets/spark_card.dart';
import '../../data/models/user.dart';

/// Per-type toggles plus quiet hours. Settings adds lead time and a daily cap.
class NotificationPrefsEditor extends StatelessWidget {
  const NotificationPrefsEditor({
    super.key,
    required this.prefs,
    required this.onChanged,
    this.showAdvanced = false,
    this.enabled = true,
  });

  final NotificationPrefs prefs;
  final ValueChanged<NotificationPrefs> onChanged;
  final bool showAdvanced;
  final bool enabled;

  Future<void> _pickQuiet(BuildContext context, {required bool start}) async {
    final current = parseHhMm(start ? prefs.quietHoursStart : prefs.quietHoursEnd) ?? (start ? 22 * 60 : 7 * 60);
    final picked = await showSparkTimePicker(context, initial: TimeOfDay(hour: current ~/ 60, minute: current % 60));
    if (picked == null) return;
    final value = formatHhMm(picked.hour * 60 + picked.minute);
    onChanged(start ? prefs.copyWith(quietHoursStart: value) : prefs.copyWith(quietHoursEnd: value));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;

    Widget toggle(IconData icon, String title, String body, bool value, NotificationPrefs Function(bool) update) =>
        SwitchListTile(
          secondary: Icon(icon, color: c.secondary),
          title: Text(title),
          subtitle: Text(body),
          value: value,
          onChanged: enabled ? (v) => onChanged(update(v)) : null,
        );

    String timeLabel(String? hhmm, int fallback) {
      final m = parseHhMm(hhmm) ?? fallback;
      return fmt.time(DateTime(2000, 1, 1, m ~/ 60, m % 60));
    }

    final quietOn = prefs.quietHoursStart != null && prefs.quietHoursEnd != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SparkCard(
          padding: const EdgeInsets.symmetric(vertical: Space.xs),
          child: Column(
            children: <Widget>[
              toggle(Icons.format_quote_rounded, l10n.notifDailyQuote, l10n.notifDailyQuoteBody, prefs.dailyQuote,
                  (v) => prefs.copyWith(dailyQuote: v)),
              toggle(
                Icons.alarm_rounded,
                l10n.notifSessionReminder,
                l10n.notifSessionReminderBody(prefs.sessionReminderLeadMinutes),
                prefs.sessionReminder,
                (v) => prefs.copyWith(sessionReminder: v),
              ),
              toggle(Icons.task_alt_rounded, l10n.notifTaskReminders, l10n.notifTaskRemindersBody,
                  prefs.taskDeadlineReminders, (v) => prefs.copyWith(taskDeadlineReminders: v)),
              toggle(Icons.forum_rounded, l10n.notifWeeklyCheckin, l10n.notifWeeklyCheckinBody, prefs.weeklyCheckin,
                  (v) => prefs.copyWith(weeklyCheckin: v)),
              toggle(Icons.auto_stories_rounded, l10n.notifMonthlyReflection, l10n.notifMonthlyReflectionBody,
                  prefs.monthlyReflection, (v) => prefs.copyWith(monthlyReflection: v)),
              toggle(Icons.celebration_rounded, l10n.notifCelebrations, l10n.notifCelebrationsBody, prefs.celebrations,
                  (v) => prefs.copyWith(celebrations: v)),
            ],
          ),
        ),
        if (showAdvanced) ...<Widget>[
          const SizedBox(height: Space.m),
          SparkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.settingsReminderLead, style: text.titleMedium),
                const SizedBox(height: Space.s),
                SegmentedButton<int>(
                  segments: <ButtonSegment<int>>[
                    for (final m in <int>[5, 10, 15, 30])
                      ButtonSegment<int>(value: m, label: Text(fmt.duration(m))),
                  ],
                  selected: <int>{prefs.sessionReminderLeadMinutes},
                  onSelectionChanged: enabled
                      ? (s) => onChanged(prefs.copyWith(sessionReminderLeadMinutes: s.first))
                      : null,
                ),
                const SizedBox(height: Space.m),
                Text(l10n.settingsMaxPerDay, style: text.titleMedium),
                Slider(
                  value: prefs.maxPerDay.clamp(1, 10).toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: '${prefs.maxPerDay}',
                  onChanged: enabled ? (v) => onChanged(prefs.copyWith(maxPerDay: v.round())) : null,
                ),
                Text(l10n.settingsMaxPerDayValue(prefs.maxPerDay), style: text.bodySmall),
              ],
            ),
          ),
        ],
        const SizedBox(height: Space.m),
        SparkCard(
          padding: const EdgeInsets.symmetric(vertical: Space.xs),
          child: Column(
            children: <Widget>[
              SwitchListTile(
                secondary: Icon(Icons.bedtime_rounded, color: c.secondary),
                title: Text(l10n.notifQuietHours),
                subtitle: Text(l10n.notifQuietHoursBody),
                value: quietOn,
                onChanged: !enabled
                    ? null
                    : (v) => onChanged(
                          v
                              ? prefs.copyWith(quietHoursStart: '22:00', quietHoursEnd: '07:00')
                              : prefs.copyWith(quietHoursStart: null, quietHoursEnd: null),
                        ),
              ),
              if (quietOn)
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.s),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton(
                          onPressed: enabled ? () => _pickQuiet(context, start: true) : null,
                          child: Text('${l10n.notifQuietFrom} ${timeLabel(prefs.quietHoursStart, 22 * 60)}'),
                        ),
                      ),
                      const SizedBox(width: Space.s),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: enabled ? () => _pickQuiet(context, start: false) : null,
                          child: Text('${l10n.notifQuietTo} ${timeLabel(prefs.quietHoursEnd, 7 * 60)}'),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
