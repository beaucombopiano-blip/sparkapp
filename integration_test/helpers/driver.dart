import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/app.dart';
import 'package:spark/app/router.dart';
import 'package:spark/app/routes.dart';
import 'package:spark/core/widgets/character_avatar.dart';
import 'package:spark/features/onboarding/steps/character_step.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';
import 'package:spark/main.dart' as app;

import 'emulator.dart';

final AppLocalizationsEn l10n = AppLocalizationsEn();

/// Pumps frames until [finder] matches, failing with [description] after
/// [timeout]. Backend calls (AI included) run for real, so waits are generous.
Future<void> pumpUntil(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 90),
  String? description,
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 200));
    if (finder.evaluate().isNotEmpty) return;
  }
  fail('Timed out waiting for ${description ?? finder}');
}

Future<void> tapWhenReady(WidgetTester tester, Finder finder, {Duration timeout = const Duration(seconds: 90)}) async {
  await pumpUntil(tester, finder, timeout: timeout);
  await tester.ensureVisible(finder.first);
  await tester.pump();
  await tester.tap(finder.first);
  await tester.pump(const Duration(milliseconds: 300));
}

GoRouter routerOf(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(SparkApp))).read(routerProvider);

/// Starts the real app (emulators via --dart-define=SPARK_USE_EMULATORS=true).
Future<void> launchApp(WidgetTester tester) async {
  await tester.pumpWidget(await app.bootstrap(forTesting: true));
  await tester.pump(const Duration(seconds: 1));
}

/// Signs up through the real email-link UI, reading the link from the Auth
/// emulator, then completes the signup form.
Future<void> signUp(WidgetTester tester, EmulatorAdmin admin, {required String email, String name = 'Maya Tester'}) async {
  await tapWhenReady(tester, find.byKey(const Key('auth-email')));
  await pumpUntil(tester, find.widgetWithText(TextFormField, l10n.authEmailLabel));
  await tester.enterText(find.widgetWithText(TextFormField, l10n.authEmailLabel), email);
  await tapWhenReady(tester, find.text(l10n.authEmailSend));
  await pumpUntil(tester, find.text(l10n.authUseDifferentEmail), description: 'check-your-inbox stage');

  String? link;
  for (var i = 0; i < 20 && link == null; i++) {
    link = await admin.emailSignInLink(email);
    if (link == null) await tester.pump(const Duration(milliseconds: 500));
  }
  expect(link, isNotNull, reason: 'the Auth emulator should have an email sign-in link');
  // Same route the deep-link listener opens for an incoming link.
  routerOf(tester).go(Uri(path: Routes.authEmailLink, queryParameters: <String, String>{'link': link!}).toString());

  await pumpUntil(tester, find.widgetWithText(TextFormField, l10n.signupNameLabel), description: 'complete signup form');
  await tester.enterText(find.widgetWithText(TextFormField, l10n.signupNameLabel), name);
  await tapWhenReady(tester, find.text(l10n.signupSubmit));
}

/// Path B ("help me find an idea") through to the generated plan and the
/// end of the tutorial.
Future<void> onboardPathB(WidgetTester tester) async {
  await tapWhenReady(tester, find.text(l10n.onboardingWelcomeCta));
  await tapWhenReady(tester, find.byKey(const Key('path-find-idea')));

  // Assessment: answer every question until recommendations arrive.
  final choose = find.byKey(const Key('choose-project'));
  final agree = find.byKey(const Key('likert-4'));
  final end = DateTime.now().add(const Duration(minutes: 5));
  while (choose.evaluate().isEmpty) {
    if (DateTime.now().isAfter(end)) fail('Assessment never produced recommendations');
    if (agree.evaluate().isNotEmpty) {
      await tester.tap(agree.first);
      await tester.pump(const Duration(milliseconds: 600));
    } else {
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  await tapWhenReady(tester, choose);
  await tapWhenReady(tester, find.text(l10n.commonContinue)); // project picked
  await completeSetupSteps(tester);
}

/// Deadline → availability → character → notifications → appearance → plan
/// → tutorial (shared by both paths).
Future<void> completeSetupSteps(WidgetTester tester) async {
  await tapWhenReady(tester, find.text(l10n.deadlineThreeMonths));
  await tapWhenReady(tester, find.text(l10n.commonContinue));

  for (final day in <int>[1, 3, 6]) {
    await tapWhenReady(tester, find.byKey(Key('weekday-$day')));
  }
  await tapWhenReady(tester, find.text(l10n.commonContinue));

  await pumpUntil(tester, find.byType(CharacterStep));
  await tapWhenReady(tester, find.descendant(of: find.byType(CharacterStep), matching: find.byType(CharacterAvatar)));
  await tapWhenReady(tester, find.text(l10n.commonContinue));

  await tapWhenReady(tester, find.text(l10n.notifNotNow));
  await tapWhenReady(tester, find.text(l10n.commonContinue)); // appearance

  // Plan generation runs on the backend; wait for the preview.
  await tapWhenReady(tester, find.byKey(const Key('plan-lets-go')), timeout: const Duration(minutes: 3));

  final next = find.byKey(const Key('tutorial-next'));
  await pumpUntil(tester, next);
  while (next.evaluate().isNotEmpty) {
    await tester.tap(next.first);
    await tester.pump(const Duration(milliseconds: 600));
  }
  expect(routerOf(tester).state.uri.path, Routes.dashboard);
}
