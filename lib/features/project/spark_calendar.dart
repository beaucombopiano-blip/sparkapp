import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/formatters.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../core/widgets/legacy_material_bridge.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import 'project_providers.dart';

/// What a calendar day shows.
@immutable
class DayMarkers {
  const DayMarkers({
    this.sessions = 0,
    this.completedSessions = 0,
    this.missed = false,
    this.milestone = false,
    this.deadline = false,
  });

  final int sessions;
  final int completedSessions;
  final bool missed;
  final bool milestone;
  final bool deadline;

  bool get allCompleted => sessions > 0 && completedSessions == sessions;
  bool get isEmpty => sessions == 0 && !milestone && !deadline;
}

/// Builds per-day markers from live sessions, milestones and the deadline.
Map<LocalDay, DayMarkers> buildDayMarkers({
  required List<WorkSession> sessions,
  required List<Milestone> milestones,
  required DateTime? deadline,
  required UserClock clock,
  DateTime? now,
}) {
  final nowUtc = (now ?? clock.nowUtc()).toUtc();
  final sessionsByDay = <LocalDay, List<WorkSession>>{};
  for (final s in sessions) {
    if (s.status == SessionStatus.cancelled) continue;
    sessionsByDay.putIfAbsent(clock.dayOf(s.startsAt), () => <WorkSession>[]).add(s);
  }
  final milestoneDays = <LocalDay>{
    for (final m in milestones)
      if (m.targetDate != null) clock.dayOf(m.targetDate!),
  };
  final deadlineDay = deadline == null ? null : clock.dayOf(deadline);
  final days = <LocalDay>{...sessionsByDay.keys, ...milestoneDays, ?deadlineDay};
  return <LocalDay, DayMarkers>{
    for (final day in days)
      day: DayMarkers(
        sessions: sessionsByDay[day]?.length ?? 0,
        completedSessions: sessionsByDay[day]?.where((s) => s.status == SessionStatus.completed).length ?? 0,
        missed: sessionsByDay[day]?.any((s) =>
                s.status == SessionStatus.missed ||
                (s.status == SessionStatus.scheduled && s.end.isBefore(nowUtc))) ??
            false,
        milestone: milestoneDays.contains(day),
        deadline: day == deadlineDay,
      ),
  };
}

/// Monthly calendar pinned to the top of the Project tab. Swipe to change
/// month, "Today" button, arrows; collapses to a one-week strip.
class SparkCalendar extends ConsumerStatefulWidget {
  const SparkCalendar({
    super.key,
    required this.onDaySelected,
    this.selectedDay,
    this.collapsed = false,
    this.onExpand,
  });

  final void Function(LocalDay day) onDaySelected;
  final LocalDay? selectedDay;

  /// Week-strip mode (sticky header while scrolling).
  final bool collapsed;
  final VoidCallback? onExpand;

  @override
  ConsumerState<SparkCalendar> createState() => _SparkCalendarState();
}

class _SparkCalendarState extends ConsumerState<SparkCalendar> {
  late LocalDay _focused = widget.selectedDay ?? ref.read(userClockProvider).today();

  (LocalDay, LocalDay) get _visibleRange {
    if (widget.collapsed) {
      final start = _focused.startOfWeek;
      return (start, start.addDays(6));
    }
    final first = _focused.startOfMonth.startOfWeek;
    return (first, first.addDays(41));
  }

  @override
  void didUpdateWidget(SparkCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDay != null && widget.selectedDay != oldWidget.selectedDay) {
      _focused = widget.selectedDay!;
    }
  }

  /// Days in the visible grid (whole weeks, Monday first), matching
  /// table_calendar's layout with six-week months not enforced.
  List<LocalDay> _gridDays() {
    final first = widget.collapsed ? _focused.startOfWeek : _focused.startOfMonth.startOfWeek;
    final last = widget.collapsed ? first.addDays(6) : _focused.endOfMonth.startOfWeek.addDays(6);
    return <LocalDay>[for (var d = first; !d.isAfter(last); d = d.addDays(1)) d];
  }

  void _select(LocalDay day) {
    setState(() => _focused = day);
    widget.onDaySelected(day);
  }

  void _shiftMonth(int delta) {
    setState(() {
      _focused = widget.collapsed
          ? _focused.addDays(7 * delta)
          : LocalDay.fromDateTime(DateTime(_focused.year, _focused.month + delta, 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final fmt = context.fmt;
    final text = Theme.of(context).textTheme;
    final clock = ref.watch(userClockProvider);
    final today = clock.today();
    final (from, to) = _visibleRange;
    final sessions = ref.watch(sessionsInRangeProvider(from, to)).value ?? const <WorkSession>[];
    final milestones = ref.watch(activeMilestonesProvider).value ?? const <Milestone>[];
    final deadline = ref.watch(activeProjectProvider.select((p) => p.value?.targetEndDate));
    final markers = buildDayMarkers(
      sessions: sessions,
      milestones: milestones,
      deadline: deadline,
      clock: clock,
      now: clock.nowUtc(),
    );
    final locale = Localizations.localeOf(context).toLanguageTag();
    final scale = MediaQuery.textScalerOf(context).scale(1).clamp(1.0, 1.8);

    final header = Row(
      children: <Widget>[
        IconButton(
          tooltip: l10n.calendarPrevious,
          onPressed: () => _shiftMonth(-1),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        Expanded(
          child: Semantics(
            header: true,
            child: Text(
              fmt.monthYear(_focused.asDateTime),
              style: text.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        IconButton(
          tooltip: l10n.calendarNext,
          onPressed: () => _shiftMonth(1),
          icon: const Icon(Icons.chevron_right_rounded),
        ),
        TextButton(
          key: const Key('calendar-today'),
          onPressed: () => setState(() => _focused = today),
          child: Text(l10n.commonToday),
        ),
        if (widget.collapsed && widget.onExpand != null)
          IconButton(
            tooltip: l10n.calendarExpand,
            onPressed: widget.onExpand,
            icon: const Icon(Icons.unfold_more_rounded),
          ),
      ],
    );

    Widget dayCell(DateTime day, {bool outside = false}) {
      final local = LocalDay.fromDateTime(day);
      final m = markers[local] ?? const DayMarkers();
      final isToday = local == today;
      final isSelected = widget.selectedDay == local;
      return Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isSelected ? c.surfaceAlt : (m.allCompleted ? c.success.withValues(alpha: 0.14) : null),
          borderRadius: Radii.smallAll,
          border: isToday
              ? Border.all(color: c.primary, width: 2)
              : (m.missed ? Border.all(color: c.danger, width: 1.5) : null),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: const Alignment(0, -0.35),
              child: FittedBox(
                child: Text(
                  '${day.day}',
                  style: text.bodyMedium?.copyWith(
                    color: outside ? c.iconMuted : c.textPrimary,
                    fontWeight: isToday || isSelected ? FontWeight.w800 : FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(alignment: const Alignment(0, 0.8), child: _MarkerRow(markers: m)),
            if (m.allCompleted)
              Positioned(
                right: 2,
                top: 2,
                child: Icon(Icons.check_rounded, size: 11, color: c.success),
              ),
          ],
        ),
      );
    }

    final table = LegacyMaterialBridge(
      child: TableCalendar<Object>(
        locale: locale,
        firstDay: DateTime(today.year - 2, 1, 1),
        lastDay: DateTime(today.year + 3, 12, 31),
        focusedDay: _focused.asDateTime,
        currentDay: today.asDateTime,
        calendarFormat: widget.collapsed ? CalendarFormat.week : CalendarFormat.month,
        availableCalendarFormats: const <CalendarFormat, String>{
          CalendarFormat.month: 'month',
          CalendarFormat.week: 'week',
        },
        headerVisible: false,
        startingDayOfWeek: StartingDayOfWeek.monday,
        rowHeight: 48 * scale,
        daysOfWeekHeight: 22 * scale,
        sixWeekMonthsEnforced: false,
        availableGestures: AvailableGestures.horizontalSwipe,
        selectedDayPredicate: (d) => widget.selectedDay == LocalDay.fromDateTime(d),
        onDaySelected: (selected, focused) {
          setState(() => _focused = LocalDay.fromDateTime(focused));
          widget.onDaySelected(LocalDay.fromDateTime(selected));
        },
        onPageChanged: (focused) => setState(() => _focused = LocalDay.fromDateTime(focused)),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: text.labelSmall ?? const TextStyle(),
          weekendStyle: text.labelSmall ?? const TextStyle(),
        ),
        calendarBuilders: CalendarBuilders<Object>(
          defaultBuilder: (context, day, _) => dayCell(day),
          todayBuilder: (context, day, _) => dayCell(day),
          selectedBuilder: (context, day, _) => dayCell(day),
          outsideBuilder: (context, day, _) => dayCell(day, outside: true),
          markerBuilder: (context, day, events) => const SizedBox.shrink(),
        ),
      ),
    );

    // table_calendar replaces each cell's semantics with a bare date, so its
    // grid is excluded and an invisible grid of day nodes (same geometry)
    // carries the markers and the select action for screen readers. It does
    // not hit-test, so touches still reach the calendar.
    final gridDays = _gridDays();
    final semanticsGrid = Column(
      children: <Widget>[
        SizedBox(height: 22 * scale),
        for (var week = 0; week < gridDays.length ~/ 7; week++)
          Row(
            children: <Widget>[
              for (final day in gridDays.skip(week * 7).take(7))
                Expanded(
                  child: Semantics(
                    label: _semanticsFor(l10n, fmt, day, markers[day] ?? const DayMarkers(), day == today),
                    button: true,
                    selected: widget.selectedDay == day,
                    onTap: () => _select(day),
                    child: SizedBox(height: 48 * scale),
                  ),
                ),
            ],
          ),
      ],
    );
    final calendar = Stack(
      children: <Widget>[
        ExcludeSemantics(child: table),
        Positioned(left: 0, right: 0, top: 0, child: semanticsGrid),
      ],
    );

    return Material(
      color: c.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header,
          GestureDetector(
            // Tapping the collapsed strip's empty area expands it again.
            onVerticalDragEnd: widget.collapsed && widget.onExpand != null
                ? (d) {
                    if ((d.primaryVelocity ?? 0) > 0) widget.onExpand!();
                  }
                : null,
            child: AnimatedSize(duration: Motion.medium, curve: Motion.curve, child: calendar),
          ),
          if (!widget.collapsed) const _Legend(),
        ],
      ),
    );
  }

  String _semanticsFor(AppLocalizations l10n, SparkFormat fmt, LocalDay day, DayMarkers m, bool isToday) {
    final parts = <String>[
      fmt.fullDay(day.asDateTime),
      if (isToday) l10n.commonToday,
      if (m.sessions > 0) l10n.calendarSessions(m.sessions),
      if (m.allCompleted) l10n.calendarAllDone,
      if (m.missed) l10n.calendarMissed,
      if (m.milestone) l10n.calendarMilestone,
      if (m.deadline) l10n.calendarDeadline,
    ];
    return parts.join(', ');
  }
}

/// Dot = session, diamond = milestone, flag = deadline.
class _MarkerRow extends StatelessWidget {
  const _MarkerRow({required this.markers});
  final DayMarkers markers;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    if (markers.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (markers.sessions > 0)
          Container(
            key: const Key('marker-session'),
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(color: c.secondary, shape: BoxShape.circle),
          ),
        if (markers.milestone)
          Transform.rotate(
            key: const Key('marker-milestone'),
            angle: 0.785398,
            child: Container(width: 6, height: 6, margin: const EdgeInsets.symmetric(horizontal: 2), color: c.accent),
          ),
        if (markers.deadline) Icon(Icons.flag_rounded, key: const Key('marker-deadline'), size: 10, color: c.danger),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final style = Theme.of(context).textTheme.labelSmall;
    Widget item(Widget icon, String label) => Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[icon, const SizedBox(width: 4), Text(label, style: style)],
        );
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.s),
      child: Wrap(
        spacing: Space.m,
        runSpacing: Space.xs,
        children: <Widget>[
          item(Container(width: 6, height: 6, decoration: BoxDecoration(color: c.secondary, shape: BoxShape.circle)),
              l10n.calendarLegendSession),
          item(Transform.rotate(angle: 0.785398, child: Container(width: 6, height: 6, color: c.accent)),
              l10n.calendarLegendMilestone),
          item(Icon(Icons.flag_rounded, size: 10, color: c.danger), l10n.calendarLegendDeadline),
          item(Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(border: Border.all(color: c.danger), borderRadius: BorderRadius.circular(2)),
              ), l10n.calendarLegendMissed),
        ],
      ),
    );
  }
}
