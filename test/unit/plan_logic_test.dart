import 'package:flutter_test/flutter_test.dart';
import 'package:spark/core/utils/user_clock.dart';
import 'package:spark/data/models/project.dart';
import 'package:spark/data/models/schedule.dart';
import 'package:spark/data/repositories/project_repository.dart';
import 'package:spark/features/agenda/agenda_views.dart';
import 'package:spark/features/project/project_providers.dart';
import 'package:spark/features/project/spark_calendar.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  // Wed 14 Oct 2026, 10:00 in Chicago.
  final clock = UserClock(tz.getLocation('America/Chicago'), now: () => DateTime.utc(2026, 10, 14, 15));
  DateTime local(int month, int day, [int hour = 0, int minute = 0]) =>
      clock.toUtc(DateTime(2026, month, day, hour, minute));

  WorkSession session(String id, DateTime start, {SessionStatus status = SessionStatus.scheduled, List<String> taskIds = const <String>[]}) =>
      WorkSession(id: id, startsAt: start, endsAt: start.add(const Duration(hours: 1)), status: status, taskIds: taskIds);

  group('buildDayMarkers', () {
    final markers = buildDayMarkers(
      sessions: <WorkSession>[
        session('past-unfinished', local(10, 12, 16)),
        session('done', local(10, 13, 16), status: SessionStatus.completed),
        session('today', local(10, 14, 16)),
        session('late-evening', local(10, 14, 21, 30)), // 02:30 UTC on the 15th
        session('cancelled', local(10, 16, 16), status: SessionStatus.cancelled),
      ],
      milestones: <Milestone>[Milestone(id: 'm', targetDate: local(10, 23))],
      deadline: local(11, 30, 23, 59),
      clock: clock,
    );

    test('a scheduled session that already ended is shown as missed', () {
      expect(markers[const LocalDay(2026, 10, 12)]!.missed, isTrue);
    });

    test('completed days are marked complete, not missed', () {
      final d = markers[const LocalDay(2026, 10, 13)]!;
      expect(d.allCompleted, isTrue);
      expect(d.missed, isFalse);
    });

    test('sessions are grouped by the user\'s local day', () {
      expect(markers[const LocalDay(2026, 10, 14)]!.sessions, 2);
      expect(markers.containsKey(const LocalDay(2026, 10, 15)), isFalse);
    });

    test('cancelled sessions are not shown', () {
      expect(markers.containsKey(const LocalDay(2026, 10, 16)), isFalse);
    });

    test('milestones and the deadline get their own markers', () {
      expect(markers[const LocalDay(2026, 10, 23)]!.milestone, isTrue);
      expect(markers[const LocalDay(2026, 11, 30)]!.deadline, isTrue);
    });
  });

  group('buildAgendaDays', () {
    final tasks = <Task>[
      Task(id: 'a', title: 'A', sessionId: 's1', suggestedDate: local(10, 14, 16), order: 1),
      Task(id: 'b', title: 'B', sessionId: 's1', suggestedDate: local(10, 14, 16), order: 2),
      Task(id: 'loose', title: 'Loose', suggestedDate: local(10, 15, 9), order: 3),
      Task(id: 'old', title: 'Old', suggestedDate: local(10, 15, 9), status: TaskStatus.obsolete),
    ];
    final days = buildAgendaDays(
      from: const LocalDay(2026, 10, 12),
      to: const LocalDay(2026, 10, 18),
      sessions: <WorkSession>[
        session('s1', local(10, 14, 16), taskIds: <String>['a']),
        session('s0', local(10, 14, 8)),
      ],
      tasks: tasks,
      milestones: <Milestone>[Milestone(id: 'm', title: 'M', targetDate: local(10, 16))],
      deadline: local(10, 18, 23),
      clock: clock,
    );

    test('covers every day in range, in order', () {
      expect(days.map((d) => d.day.day), <int>[12, 13, 14, 15, 16, 17, 18]);
      expect(days.first.isEmpty, isTrue);
    });

    test('sessions are sorted by start and carry their tasks', () {
      final today = days[2];
      expect(today.sessions.map((s) => s.id), <String>['s0', 's1']);
      // `b` points at s1 via sessionId even though s1.taskIds misses it.
      expect(today.sessionTasks['s1']!.map((t) => t.id), <String>['a', 'b']);
      expect(today.plannedMinutes, 120);
    });

    test('tasks outside sessions land on their suggested day; obsolete tasks are hidden', () {
      expect(days[3].looseTasks.map((t) => t.id), <String>['loose']);
    });

    test('milestones and the deadline appear on their days', () {
      expect(days[4].milestones.single.id, 'm');
      expect(days[6].isDeadline, isTrue);
    });

    test('month summaries list only what applies', () {
      final l10n = AppLocalizationsEn();
      expect(monthDaySummary(l10n, days[2]), '2 sessions · 2 tasks');
      expect(monthDaySummary(l10n, days[3]), '1 task');
      expect(monthDaySummary(l10n, days[4]), 'Milestone: M');
      expect(monthDaySummary(l10n, days[6]), l10n.agendaDeadlineItem);
    });
  });

  group('sortCurrentTasks', () {
    test('orders by local day, then priority, then plan order', () {
      final sorted = sortCurrentTasks(<Task>[
        Task(id: 'tomorrow-high', suggestedDate: local(10, 15, 9), priority: TaskPriority.high),
        // 19:30 and 20:30 Chicago fall on different UTC days but the same local day.
        Task(id: 'today-low', suggestedDate: local(10, 14, 19, 30), priority: TaskPriority.low),
        Task(id: 'today-high-2', suggestedDate: local(10, 14, 20, 30), priority: TaskPriority.high, order: 2),
        Task(id: 'today-high-1', suggestedDate: local(10, 14, 8), priority: TaskPriority.high, order: 1),
        const Task(id: 'undated'),
      ], clock);
      expect(sorted.map((t) => t.id), <String>['today-high-1', 'today-high-2', 'today-low', 'tomorrow-high', 'undated']);
    });
  });

  group('availableMinutesOn', () {
    final slots = <AvailabilitySlot>[
      const AvailabilitySlot(weekday: 3, startTime: '16:00', durationMinutes: 60),
      const AvailabilitySlot(weekday: 3, startTime: '19:00', durationMinutes: 90, maxMinutesPerDay: 120),
    ];

    test('sums slots for the weekday and applies the daily cap', () {
      expect(availableMinutesOn(const LocalDay(2026, 10, 14), slots, const <AvailabilityException>[], clock), 120);
      expect(availableMinutesOn(const LocalDay(2026, 10, 15), slots, const <AvailabilityException>[], clock), 0);
    });

    test('exceptions block the whole day', () {
      final exams = <AvailabilityException>[
        AvailabilityException(id: 'e', startDate: local(10, 13), endDate: local(10, 14), reason: 'exams'),
      ];
      expect(availableMinutesOn(const LocalDay(2026, 10, 14), slots, exams, clock), 0);
    });
  });
}
