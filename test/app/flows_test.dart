import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/routes.dart';
import 'package:spark/core/errors/app_exception.dart';
import 'package:spark/features/agenda/agenda_views.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';

import '../helpers/app.dart';
import '../helpers/pump.dart';
import '../helpers/test_env.dart';

/// "4:00 PM – 5:00 PM" exactly as intl formats it (narrow no-break spaces).
String timeRange(int fromHour, int toHour) =>
    '${DateFormat.jm('en').format(DateTime(2026, 1, 1, fromHour))} – ${DateFormat.jm('en').format(DateTime(2026, 1, 1, toHour))}';

void main() {
  final l10n = AppLocalizationsEn();

  Future<SparkTestEnv> start(WidgetTester tester) async {
    setPhone(tester);
    reduceMotion(tester);
    return seededEnv();
  }

  group('project calendar', () {
    testWidgets('marks missed, completed, today and milestone days', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env, location: Routes.project);

      expect(find.bySemanticsLabel(RegExp('^Monday, October 12.*${l10n.calendarMissed}')), findsOneWidget);
      expect(find.bySemanticsLabel(RegExp('^Tuesday, October 13.*${l10n.calendarAllDone}')), findsOneWidget);
      expect(
        find.bySemanticsLabel(RegExp('^Wednesday, October 14, ${l10n.commonToday}, ${RegExp.escape(l10n.calendarSessions(1))}')),
        findsOneWidget,
      );
      expect(find.bySemanticsLabel(RegExp('^Friday, October 23.*${l10n.calendarMilestone}')), findsOneWidget);
      // A day without plans carries no markers.
      expect(find.bySemanticsLabel('Thursday, October 8'), findsOneWidget);
    });

    testWidgets('tapping a day opens the agenda for that day', (tester) async {
      final env = await start(tester);
      final router = await pumpApp(tester, env, location: Routes.project);
      // The semantics node doesn't hit-test; the tap lands on the calendar cell beneath it.
      await tester.tap(find.bySemanticsLabel(RegExp('^Thursday, October 15')), warnIfMissed: false);
      await settleData(tester);
      expect(router.state.uri.path, Routes.agenda);
      expect(router.state.uri.queryParameters['date'], '2026-10-15');
      expect(find.text('Interview the hardware store'), findsOneWidget);
    });
  });

  testWidgets('screen readers can select a calendar day', (tester) async {
    final env = await start(tester);
    final router = await pumpApp(tester, env, location: Routes.project);
    tester.semantics.tap(find.semantics.byLabel(RegExp('^Saturday, October 17')));
    await settleData(tester);
    expect(router.state.uri.queryParameters['date'], '2026-10-17');
  });

  group('agenda', () {
    testWidgets('day view lists sessions with their tasks', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env, location: Routes.agendaFor(date: '2026-10-14', view: 'day'));
      expect(find.text(timeRange(16, 17)), findsOneWidget);
      expect(find.text('Call the bakery to book a time'), findsOneWidget);
      expect(find.text('Test the recording app'), findsOneWidget);
    });

    testWidgets('week view shows every day of the week with totals', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env, location: Routes.agendaFor(date: '2026-10-14', view: 'week'));
      expect(find.text(l10n.agendaWeekTotals(1, 6, '5h')), findsOneWidget);
      expect(find.text('Monday, October 12'), findsOneWidget);
      expect(find.text('Call the bakery to book a time'), findsOneWidget);
      final list = find.descendant(of: find.byType(AgendaWeekList), matching: find.byType(Scrollable)).first;
      await tester.scrollUntilVisible(find.text('Interview the hardware store'), 300, scrollable: list);
      await tester.scrollUntilVisible(find.text('Transcribe the bakery interview'), 300, scrollable: list);
      await tester.scrollUntilVisible(find.text('Sunday, October 18'), 300, scrollable: list);
      expect(find.text(l10n.agendaEmptyDay), findsWidgets); // Sunday has nothing planned.
    });

    testWidgets('month view summarises busy days', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env, location: Routes.agendaFor(date: '2026-10-14', view: 'month'));
      expect(find.text('${l10n.agendaSessionCount(1)} · ${l10n.agendaTaskCount(2)}'), findsWidgets);
    });

    testWidgets('the view toggle switches between day, week and month', (tester) async {
      final env = await start(tester);
      final router = await pumpApp(tester, env, location: Routes.agendaFor(date: '2026-10-14', view: 'day'));
      await tester.tap(find.text(l10n.agendaWeek));
      await settleData(tester);
      expect(find.text(l10n.agendaWeekTotals(1, 6, '5h')), findsOneWidget);
      await tester.tap(find.text(l10n.agendaMonth));
      await settleData(tester);
      expect(find.text('${l10n.agendaSessionCount(1)} · ${l10n.agendaTaskCount(2)}'), findsWidgets);
      expect(router.state.uri.path, Routes.agenda);
    });
  });

  group('task completion', () {
    testWidgets('checking a task calls the backend, prompts for the journal and updates progress', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env);
      final progressCalls = env.functions.callCount('getProgress');

      await tester.tap(find.bySemanticsLabel(l10n.taskCompleteSemantics('Call the bakery to book a time')));
      await settleData(tester);

      expect(env.functions.callCount('completeTask'), 1);
      final call = env.functions.calls.firstWhere((c) => c.$1 == 'completeTask').$2;
      expect(call, <String, Object?>{'projectId': SparkTestEnv.projectId, 'taskId': 't1'});

      // The backend asked for the journal prompt.
      expect(find.text(l10n.journalPromptTitle), findsOneWidget);
      await tester.tap(find.text(l10n.commonNotNow));
      await settleData(tester);

      // Firestore now says done, so the task leaves "Today's tasks" and progress is refetched.
      final doc = await env.projectDoc.collection('tasks').doc('t1').get();
      expect(doc.data()!['status'], 'done');
      expect(find.text('Call the bakery to book a time'), findsNothing);
      expect(env.functions.callCount('getProgress'), greaterThan(progressCalls));
    });

    testWidgets('a failed completion shows the real error and leaves the task open', (tester) async {
      final env = await start(tester);
      env.functions.on('completeTask', (_) => throw const AppException(kind: AppErrorKind.server, message: 'Could not save. Try again.'));
      await pumpApp(tester, env);

      await tester.tap(find.bySemanticsLabel(l10n.taskCompleteSemantics('Call the bakery to book a time')));
      await settleData(tester);

      expect(find.text('Could not save. Try again.'), findsOneWidget);
      expect(find.text(l10n.commonRetry), findsOneWidget);
      expect(find.text(l10n.journalPromptTitle), findsNothing);
      expect(find.bySemanticsLabel(l10n.taskCompleteSemantics('Call the bakery to book a time')), findsOneWidget);
      final doc = await env.projectDoc.collection('tasks').doc('t1').get();
      expect(doc.data()!['status'], 'pending');
    });

    testWidgets('task detail completes through the same flow', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env, location: Routes.task('t2'));
      expect(find.text('Test the recording app'), findsOneWidget);
      await tester.tap(find.byKey(const Key('task-complete')));
      await settleData(tester);
      expect(env.functions.callCount('completeTask'), 1);
      await tester.tap(find.text(l10n.commonNotNow));
      await settleData(tester);
      expect(find.text(l10n.taskStatusDone), findsOneWidget);
      expect(find.text(l10n.taskUndo), findsOneWidget);
    });

    testWidgets('locked tasks explain their prerequisites and cannot be completed', (tester) async {
      final env = await start(tester);
      await pumpApp(tester, env, location: Routes.task('t5'));
      expect(find.text(l10n.taskLocked), findsWidgets);
      expect(find.text('Transcribe the bakery interview'), findsOneWidget);
      final button = tester.widget<FilledButton>(find.descendant(of: find.byKey(const Key('task-complete')), matching: find.byType(FilledButton)));
      expect(button.onPressed, isNull);
    });
  });

  group('reschedule proposals', () {
    Map<String, dynamic> proposal() => <String, dynamic>{
          'proposal': <String, dynamic>{
            'id': 'p1',
            'type': 'reschedule',
            'status': 'pending',
            'summary': 'Move "Draft the project intro" to Thursday at 4 PM.',
            'changes': <Object>[
              <String, dynamic>{'kind': 'move', 'title': 'Draft the project intro', 'toDate': '2026-10-15T21:00:00.000Z'},
            ],
          },
        };

    testWidgets('missed session → preview → confirm → Done only after applyProposal succeeds', (tester) async {
      final env = await start(tester);
      env.functions
        ..on('reschedule', (_) => proposal())
        ..on('applyProposal', (_) => <String, dynamic>{'status': 'applied'});
      await pumpApp(tester, env, location: Routes.agendaFor(date: '2026-10-12', view: 'day'));

      await tester.tap(find.text(l10n.agendaRescheduleUnfinished));
      await settleData(tester);
      expect(env.functions.calls.firstWhere((c) => c.$1 == 'reschedule').$2['scope'], <String, Object?>{
        'kind': 'missed',
        'sessionIds': <String>['s-missed'],
      });
      expect(find.text('Move "Draft the project intro" to Thursday at 4 PM.'), findsOneWidget);
      expect(env.functions.callCount('applyProposal'), 0, reason: 'nothing changes before the user confirms');

      await tester.tap(find.text(l10n.proposalConfirm));
      await settleData(tester);
      expect(env.functions.callCount('applyProposal'), 1);
      expect(find.text(l10n.proposalDone), findsOneWidget);
    });

    testWidgets('a failed apply never shows Done', (tester) async {
      final env = await start(tester);
      env.functions
        ..on('reschedule', (_) => proposal())
        ..on('applyProposal', (_) => throw const AppException(kind: AppErrorKind.conflict, message: 'Your plan changed. Ask again.'));
      await pumpApp(tester, env, location: Routes.agendaFor(date: '2026-10-12', view: 'day'));

      await tester.tap(find.text(l10n.agendaRescheduleUnfinished));
      await settleData(tester);
      await tester.tap(find.text(l10n.proposalConfirm));
      await settleData(tester);
      expect(find.text(l10n.proposalDone), findsNothing);
      expect(find.text(l10n.proposalFailed('Your plan changed. Ask again.')), findsOneWidget);
    });
  });

  testWidgets('dashboard shows live data from the backend', (tester) async {
    final env = await start(tester);
    await pumpApp(tester, env);
    expect(find.text('Main Street Oral History'), findsOneWidget);
    expect(find.text('Call the bakery to book a time'), findsWidgets);
    // Live update: a new task appears without any refresh.
    await env.projectDoc.collection('tasks').doc('t-new').set(<String, Object?>{
      'planVersion': 1,
      'title': 'Thank the bakery owner',
      'status': 'pending',
      'actionable': true,
      'priority': 'high',
      'order': 0,
      'estimatedMinutes': 10,
      'suggestedDate': Timestamp.fromDate(DateTime.utc(2026, 10, 14, 13)),
    });
    await settleData(tester);
    expect(find.text('Thank the bakery owner'), findsOneWidget);
  });
}
