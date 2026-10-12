import 'dart:async';
import 'dart:ui' show CheckedState;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/core/errors/app_exception.dart';
import 'package:spark/core/widgets/widgets.dart';
import 'package:spark/data/models/catalog.dart';
import 'package:spark/data/models/project.dart';
import 'package:spark/data/models/resources.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';

import '../helpers/pump.dart';

void main() {
  final l10n = AppLocalizationsEn();

  group('SparkButton', () {
    testWidgets('calls onPressed, and is disabled while loading', (tester) async {
      var taps = 0;
      await pumpSpark(tester, SparkButton(label: 'Save', onPressed: () => taps++));
      await tester.tap(find.text('Save'));
      expect(taps, 1);

      await pumpSpark(tester, SparkButton(label: 'Save', loading: true, onPressed: () => taps++));
      expect(find.text('Save'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.byType(FilledButton));
      expect(taps, 1);
    });

    testWidgets('variants render the right Material button', (tester) async {
      await pumpSpark(
        tester,
        Column(children: <Widget>[
          SparkButton.secondary(label: 'A', onPressed: () {}),
          SparkButton.text(label: 'B', onPressed: () {}),
          SparkButton.destructive(label: 'C', onPressed: () {}),
        ]),
      );
      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('meets the 48dp touch target', (tester) async {
      await pumpSpark(tester, Center(child: SparkButton(label: 'Go', onPressed: () {})));
      expect(tester.getSize(find.byType(FilledButton)).height, greaterThanOrEqualTo(48));
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    });
  });

  group('SparkCard', () {
    testWidgets('is tappable when onTap is set', (tester) async {
      var tapped = false;
      await pumpSpark(tester, SparkCard(onTap: () => tapped = true, child: const Text('Card')));
      await tester.tap(find.text('Card'));
      expect(tapped, isTrue);
    });

    testWidgets('renders every tone and the dashed style', (tester) async {
      await pumpSpark(
        tester,
        Column(children: <Widget>[
          for (final tone in SparkCardTone.values) SparkCard(tone: tone, child: Text(tone.name)),
          const SparkCard(dashed: true, child: Text('dashed')),
        ]),
      );
      for (final tone in SparkCardTone.values) {
        expect(find.text(tone.name), findsOneWidget);
      }
      expect(find.text('dashed'), findsOneWidget);
    });
  });

  group('SparkChip', () {
    testWidgets('shows label and icon, reports selection, handles taps', (tester) async {
      var tapped = false;
      await pumpSpark(
        tester,
        SparkChip(label: '4-day streak', icon: Icons.local_fire_department_rounded, selected: true, onTap: () => tapped = true),
      );
      expect(find.text('4-day streak'), findsOneWidget);
      expect(find.byIcon(Icons.local_fire_department_rounded), findsOneWidget);
      await tester.tap(find.text('4-day streak'));
      expect(tapped, isTrue);
      expect(tester.getSemantics(find.text('4-day streak')), matchesSemantics(isSelected: true, hasSelectedState: true, isButton: true, hasTapAction: true, label: '4-day streak', isFocusable: true, hasFocusAction: true));
    });
  });

  group('SparkProgressBar', () {
    testWidgets('labels done and projected progress for screen readers', (tester) async {
        await pumpSpark(tester, const SparkProgressBar(done: 0.42, projected: 0.55));
      expect(find.text(l10n.progressLabel('42%', '55%')), findsOneWidget);
      expect(find.bySemanticsLabel(l10n.progressSemantics('42%', '55%')), findsOneWidget);
      });

    testWidgets('clamps values and omits the projection when absent', (tester) async {
      await pumpSpark(tester, const SparkProgressBar(done: 1.4));
      expect(find.text(l10n.progressLabelSimple('100%')), findsOneWidget);
    });
  });

  group('TaskTile', () {
    const open = Task(id: 't1', title: 'Call the bakery', estimatedMinutes: 30, priority: TaskPriority.high, actionable: true);

    testWidgets('open task can be completed via the checkbox', (tester) async {
      var toggled = 0;
      await pumpSpark(tester, TaskTile(task: open, dueLabel: 'Today', onToggle: () => toggled++));
      expect(find.text('Call the bakery'), findsOneWidget);
      expect(find.text(l10n.taskDueOn('Today')), findsOneWidget);
      await tester.tap(find.bySemanticsLabel(l10n.taskCompleteSemantics('Call the bakery')));
      expect(toggled, 1);
    });

    testWidgets('locked task cannot be toggled and says why', (tester) async {
      var toggled = 0;
      const locked = Task(id: 't5', title: 'Edit audio', dependsOn: <String>['t4']);
      await pumpSpark(tester, TaskTile(task: locked, onToggle: () => toggled++));
      expect(find.text(l10n.taskLocked), findsOneWidget);
      await tester.tap(find.bySemanticsLabel(l10n.taskCompleteSemantics('Edit audio')));
      expect(toggled, 0);
    });

    testWidgets('done task is struck through and marked checked', (tester) async {
      await pumpSpark(tester, TaskTile(task: open.copyWith(status: TaskStatus.done), onToggle: () {}));
      expect(
        tester.getSemantics(find.bySemanticsLabel(l10n.taskDoneSemantics('Call the bakery'))).flagsCollection.isChecked,
        CheckedState.isTrue,
      );
      final style = tester
          .widget<AnimatedDefaultTextStyle>(find.ancestor(of: find.text('Call the bakery'), matching: find.byType(AnimatedDefaultTextStyle)).first)
          .style;
      expect(style.decoration, TextDecoration.lineThrough);
    });

    testWidgets('shows a spinner while completing and ignores taps', (tester) async {
      var toggled = 0;
      await pumpSpark(tester, TaskTile(task: open, completing: true, onToggle: () => toggled++));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.bySemanticsLabel(l10n.taskCompleteSemantics('Call the bakery')));
      expect(toggled, 0);
    });
  });

  group('SessionCard', () {
    final session = WorkSession(id: 's1', startsAt: DateTime.utc(2026, 10, 14, 21), durationMinutes: 60, taskIds: const <String>['t1']);

    testWidgets('shows time, start action and children', (tester) async {
      var started = false;
      await pumpSpark(
        tester,
        SessionCard(session: session, timeLabel: '4:00 PM – 5:00 PM', onStart: () => started = true, children: const <Widget>[Text('child task')]),
      );
      expect(find.text('4:00 PM – 5:00 PM'), findsOneWidget);
      expect(find.text('child task'), findsOneWidget);
      await tester.tap(find.text(l10n.sessionStart));
      expect(started, isTrue);
    });

    testWidgets('missed sessions offer rescheduling', (tester) async {
      var rescheduled = false;
      await pumpSpark(
        tester,
        SessionCard(session: session, timeLabel: '4:00 PM', missed: true, onRescheduleMissed: () => rescheduled = true),
      );
      expect(find.text(l10n.sessionStatusMissed), findsOneWidget);
      await tester.tap(find.text(l10n.agendaRescheduleUnfinished));
      expect(rescheduled, isTrue);
    });
  });

  testWidgets('MilestoneMarker labels each status', (tester) async {
    await pumpSpark(
      tester,
      const Row(children: <Widget>[
        MilestoneMarker(status: MilestoneStatus.done),
        MilestoneMarker(status: MilestoneStatus.inProgress),
        MilestoneMarker(status: MilestoneStatus.upcoming),
      ]),
    );
    expect(find.bySemanticsLabel(l10n.milestoneDone), findsOneWidget);
    expect(find.bySemanticsLabel(l10n.milestoneInProgress), findsOneWidget);
    expect(find.bySemanticsLabel(l10n.milestoneUpcoming), findsOneWidget);
  });

  group('states', () {
    testWidgets('EmptyState shows its action only with a callback', (tester) async {
      var acted = false;
      await pumpSpark(tester, EmptyState(title: 'Nothing yet', body: 'Add one', actionLabel: 'Add', onAction: () => acted = true));
      await tester.tap(find.text('Add'));
      expect(acted, isTrue);
      await pumpSpark(tester, const EmptyState(title: 'Nothing yet', actionLabel: 'Add'));
      expect(find.text('Add'), findsNothing);
    });

    testWidgets('ErrorState shows the real message and retries', (tester) async {
      var retried = 0;
      await pumpSpark(
        tester,
        ErrorState(error: const AppException(kind: AppErrorKind.server, message: 'The planner is busy.'), onRetry: () => retried++),
      );
      expect(find.text('The planner is busy.'), findsOneWidget);
      await tester.tap(find.text(l10n.commonRetry));
      expect(retried, 1);
    });

    testWidgets('ErrorState falls back to a friendly localised message', (tester) async {
      await pumpSpark(tester, const ErrorState(error: AppException(kind: AppErrorKind.network)));
      expect(find.text(l10n.errorNetwork), findsOneWidget);
    });

    testWidgets('SkeletonList renders placeholder rows', (tester) async {
      reduceMotion(tester);
      await pumpSpark(tester, const SkeletonList(itemCount: 3));
      expect(find.byType(SkeletonList), findsOneWidget);
    });

    testWidgets('AsyncValueView covers loading, error and data', (tester) async {
      reduceMotion(tester);
      Widget view(AsyncValue<int> v) => AsyncValueView<int>(value: v, onRetry: () {}, data: (n) => Text('value $n'));
      await pumpSpark(tester, view(const AsyncValue<int>.loading()));
      expect(find.byType(SkeletonList), findsOneWidget);
      await pumpSpark(tester, view(const AsyncValue<int>.error(AppException(kind: AppErrorKind.timeout), StackTrace.empty)));
      expect(find.text(l10n.errorTimeout), findsOneWidget);
      expect(find.text(l10n.commonRetry), findsOneWidget);
      await pumpSpark(tester, view(const AsyncValue<int>.data(3)));
      expect(find.text('value 3'), findsOneWidget);
    });
  });

  testWidgets('SectionHeader is a heading with an optional action', (tester) async {
    var acted = false;
    await pumpSpark(tester, SectionHeader(title: "Today's tasks", actionLabel: 'See all', onAction: () => acted = true));
    expect(tester.getSemantics(find.text("Today's tasks")).flagsCollection.isHeader, isTrue);
    await tester.tap(find.text('See all'));
    expect(acted, isTrue);
  });

  testWidgets('SourceBadge distinguishes verified, found online and AI suggestions', (tester) async {
    await pumpSpark(
      tester,
      const Column(children: <Widget>[
        SourceBadge(label: OpportunityLabel.verified),
        SourceBadge(label: OpportunityLabel.foundOnline),
        SourceBadge(label: OpportunityLabel.aiSuggestion),
      ]),
    );
    expect(find.text(l10n.sourceVerified), findsOneWidget);
    expect(find.text(l10n.sourceFoundOnline), findsOneWidget);
    expect(find.text(l10n.sourceAiSuggestion), findsOneWidget);
  });

  testWidgets('ResourceCard shows the source and toggles save', (tester) async {
    var saves = 0;
    const resource = ResourceItem(id: 'r1', type: ResourceType.video, title: 'How to record interviews', channel: 'StoryCorps', url: 'https://example.com/v');
    await pumpSpark(tester, SingleChildScrollView(child: ResourceCard(resource: resource, onSave: () => saves++)));
    expect(find.text('How to record interviews'), findsOneWidget);
    expect(find.text('StoryCorps'), findsOneWidget);
    expect(find.text(l10n.resourceOpenYoutube), findsOneWidget);
    await tester.tap(find.text(l10n.resourceSave));
    expect(saves, 1);
    await pumpSpark(tester, SingleChildScrollView(child: ResourceCard(resource: resource, saved: true, onSave: () => saves++)));
    await tester.tap(find.text(l10n.resourceSaved));
    expect(saves, 1);
  });

  testWidgets('LockedFeatureCard explains the benefit and links to plans', (tester) async {
    var opened = false;
    await pumpSpark(tester, LockedFeatureCard(title: 'Journal', benefit: 'Keep photos of your progress', onSeePlans: () => opened = true));
    expect(find.text('Keep photos of your progress'), findsOneWidget);
    await tester.tap(find.text(l10n.lockedSeePlans));
    expect(opened, isTrue);
  });

  testWidgets('CharacterAvatar paints a placeholder when no art is bundled', (tester) async {
    await pumpSpark(tester, const CharacterAvatar(character: CharacterDef(id: 'nova', name: 'Nova'), size: 64, semanticLabel: 'Nova'));
    expect(tester.getSize(find.byType(CharacterAvatar)), const Size(64, 64));
    expect(find.bySemanticsLabel('Nova'), findsOneWidget);
  });

  testWidgets('CelebrationOverlay shows the badge and continues', (tester) async {
    reduceMotion(tester);
    var continued = false;
    await pumpSpark(tester, CelebrationOverlay(title: 'Milestone reached!', badgeName: 'First task', onContinue: () => continued = true));
    expect(find.text('Milestone reached!'), findsOneWidget);
    expect(find.text('First task'), findsOneWidget);
    await tester.tap(find.text(l10n.celebrationContinue));
    expect(continued, isTrue);
  });

  group('ConfirmSheet', () {
    Future<Future<bool>> open(WidgetTester tester, Future<void> Function()? onConfirm) async {
      late Future<bool> result;
      await pumpSpark(
        tester,
        Builder(
          builder: (context) => TextButton(
            onPressed: () => result = showConfirmSheet(context, title: 'Delete entry?', confirmLabel: 'Delete', destructive: true, onConfirm: onConfirm),
            child: const Text('open'),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      return result;
    }

    testWidgets('resolves true only after the action succeeds', (tester) async {
      final completer = Completer<void>();
      final result = await open(tester, () => completer.future);
      await tester.tap(find.text('Delete'));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Delete entry?'), findsOneWidget);
      completer.complete();
      await tester.pumpAndSettle();
      expect(await result, isTrue);
      expect(find.text('Delete entry?'), findsNothing);
    });

    testWidgets('stays open with the real error and a retry on failure', (tester) async {
      var attempts = 0;
      final result = await open(tester, () async {
        attempts++;
        if (attempts == 1) throw const AppException(kind: AppErrorKind.server, message: 'Could not delete right now.');
      });
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(find.text('Could not delete right now.'), findsOneWidget);
      await tester.tap(find.text(l10n.commonRetry));
      await tester.pumpAndSettle();
      expect(await result, isTrue);
      expect(attempts, 2);
    });

    testWidgets('cancel resolves false without running the action', (tester) async {
      var ran = false;
      final result = await open(tester, () async => ran = true);
      await tester.tap(find.text(l10n.commonCancel));
      await tester.pumpAndSettle();
      expect(await result, isFalse);
      expect(ran, isFalse);
    });
  });
}
