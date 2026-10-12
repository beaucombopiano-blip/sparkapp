import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import 'agenda_views.dart';

export 'agenda_views.dart' show AgendaView;

/// Dedicated Agenda screen (daily, weekly and monthly checklists) opened on
/// the date tapped in the calendar.
class AgendaScreen extends ConsumerStatefulWidget {
  const AgendaScreen({super.key, this.initialDay, this.initialView = AgendaView.day});

  final LocalDay? initialDay;
  final AgendaView initialView;

  @override
  ConsumerState<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends ConsumerState<AgendaScreen> {
  late AgendaView _view = widget.initialView;
  late LocalDay _anchor = widget.initialDay ?? ref.read(userClockProvider).today();

  @override
  void didUpdateWidget(AgendaScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDay != oldWidget.initialDay && widget.initialDay != null) _anchor = widget.initialDay!;
    if (widget.initialView != oldWidget.initialView) _view = widget.initialView;
  }

  void _shift(int delta) {
    setState(() {
      _anchor = switch (_view) {
        AgendaView.day => _anchor.addDays(delta),
        AgendaView.week => _anchor.addDays(7 * delta),
        AgendaView.month => LocalDay.fromDateTime(DateTime(_anchor.year, _anchor.month + delta, 1)),
      };
    });
  }

  String _title(BuildContext context) {
    final fmt = context.fmt;
    final today = ref.read(userClockProvider).today();
    return switch (_view) {
      AgendaView.day => fmt.dayLabel(_anchor, today) == fmt.shortDate(_anchor.asDateTime)
          ? fmt.fullDay(_anchor.asDateTime)
          : '${fmt.dayLabel(_anchor, today)} · ${fmt.shortDate(_anchor.asDateTime)}',
      AgendaView.week => context.l10n.agendaWeekRange(
          fmt.monthDay(_anchor.startOfWeek.asDateTime),
          fmt.monthDay(_anchor.startOfWeek.addDays(6).asDateTime),
        ),
      AgendaView.month => fmt.monthYear(_anchor.asDateTime),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;

    final controls = Padding(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.s, Space.gutter, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SegmentedButton<AgendaView>(
            key: const Key('agenda-view-toggle'),
            segments: <ButtonSegment<AgendaView>>[
              ButtonSegment<AgendaView>(value: AgendaView.day, label: Text(l10n.agendaDay), icon: const Icon(Icons.view_day_rounded)),
              ButtonSegment<AgendaView>(value: AgendaView.week, label: Text(l10n.agendaWeek), icon: const Icon(Icons.view_week_rounded)),
              ButtonSegment<AgendaView>(
                value: AgendaView.month,
                label: Text(l10n.agendaMonth),
                icon: const Icon(Icons.calendar_view_month_rounded),
              ),
            ],
            selected: <AgendaView>{_view},
            showSelectedIcon: false,
            onSelectionChanged: (s) => setState(() => _view = s.first),
          ),
          const SizedBox(height: Space.s),
          Row(
            children: <Widget>[
              IconButton(tooltip: l10n.agendaPrevious, onPressed: () => _shift(-1), icon: const Icon(Icons.chevron_left_rounded)),
              Expanded(
                child: Semantics(
                  header: true,
                  liveRegion: true,
                  child: Text(_title(context), style: text.titleMedium, textAlign: TextAlign.center),
                ),
              ),
              IconButton(tooltip: l10n.agendaNext, onPressed: () => _shift(1), icon: const Icon(Icons.chevron_right_rounded)),
              TextButton(
                key: const Key('agenda-today'),
                onPressed: () => setState(() => _anchor = ref.read(userClockProvider).today()),
                child: Text(l10n.commonToday),
              ),
            ],
          ),
          const _CalendarSyncStatus(),
        ],
      ),
    );

    final Widget body = switch (_view) {
      AgendaView.day => AgendaDayList(key: ValueKey<String>('day-$_anchor'), day: _anchor),
      AgendaView.week => AgendaWeekList(key: ValueKey<String>('week-${_anchor.startOfWeek}'), weekStart: _anchor.startOfWeek),
      AgendaView.month => AgendaMonthList(
          key: ValueKey<String>('month-${_anchor.year}-${_anchor.month}'),
          month: _anchor,
          onDayTap: (d) => setState(() {
            _anchor = d;
            _view = AgendaView.day;
          }),
        ),
    };

    return Column(
      children: <Widget>[
        controls,
        Expanded(child: body),
      ],
    );
  }
}

/// "Synced to Google Calendar" with last-sync time and any sync error.
class _CalendarSyncStatus extends ConsumerWidget {
  const _CalendarSyncStatus();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendar = ref.watch(userSettingsProvider.select((s) => s.value?.calendar));
    if (calendar == null || !calendar.connected || !calendar.syncSessionsToGoogle) return const SizedBox.shrink();
    final l10n = context.l10n;
    final c = context.spark;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final (IconData icon, Color color, String label) = switch (calendar.syncState) {
      CalendarSyncState.error => (
          Icons.sync_problem_rounded,
          c.danger,
          l10n.agendaGcalError(calendar.lastError ?? l10n.errorUnknown),
        ),
      CalendarSyncState.syncing => (Icons.sync_rounded, c.secondary, l10n.agendaGcalSyncing),
      _ => (
          Icons.event_available_rounded,
          c.success,
          calendar.lastSyncAt == null
              ? l10n.agendaGcalNever
              : l10n.agendaGcalSynced(fmt.time(clock.toWallClock(calendar.lastSyncAt!))),
        ),
    };
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.xs),
      child: Semantics(
        liveRegion: true,
        child: Row(
          children: <Widget>[
            Icon(icon, size: 16, color: color),
            const SizedBox(width: Space.xs),
            Expanded(child: Text(label, style: Theme.of(context).textTheme.bodySmall)),
          ],
        ),
      ),
    );
  }
}
