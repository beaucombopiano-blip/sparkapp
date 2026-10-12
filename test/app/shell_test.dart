import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/routes.dart';
import 'package:spark/app/shell/app_shell.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';

import '../helpers/app.dart';
import '../helpers/pump.dart';

String? topBarTitle(WidgetTester tester) => tester.widget<Text>(find.byKey(const Key('topbar-title'))).data;

void main() {
  final l10n = AppLocalizationsEn();

  testWidgets('phone shell: logo upper left, tab title, gear upper right, four bottom tabs', (tester) async {
    setPhone(tester);
    reduceMotion(tester);
    final env = await seededEnv();
    await pumpApp(tester, env);

    final width = tester.view.physicalSize.width / tester.view.devicePixelRatio;
    final logo = tester.getRect(find.byKey(const Key('topbar-logo')));
    final gear = tester.getRect(find.byKey(const Key('topbar-settings')));
    expect(logo.left, lessThan(40));
    expect(logo.top, lessThan(120));
    expect(gear.right, greaterThan(width - 40));
    expect((gear.center.dy - logo.center.dy).abs(), lessThan(4), reason: 'logo and gear share the top bar row');

    expect(topBarTitle(tester), l10n.tabDashboard);

    final nav = find.byType(NavigationBar);
    expect(nav, findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    expect(tester.widget<NavigationBar>(nav).destinations, hasLength(4));
    for (final label in <String>[l10n.tabDashboard, l10n.tabProject, l10n.tabJournal, l10n.tabProfile]) {
      expect(find.descendant(of: nav, matching: find.text(label)), findsOneWidget);
    }
    expect(find.byType(CompanionButton), findsOneWidget);
  });

  testWidgets('switching tabs updates the title and the companion button', (tester) async {
    setPhone(tester);
    reduceMotion(tester);
    final env = await seededEnv();
    final router = await pumpApp(tester, env);

    await tester.tap(find.descendant(of: find.byType(NavigationBar), matching: find.text(l10n.tabProject)));
    await settleData(tester);
    expect(router.state.uri.path, Routes.project);
    expect(topBarTitle(tester), l10n.tabProject);
    expect(find.byType(CompanionButton), findsOneWidget);

    await tester.tap(find.descendant(of: find.byType(NavigationBar), matching: find.text(l10n.tabJournal)));
    await settleData(tester);
    expect(router.state.uri.path, Routes.journal);
    expect(topBarTitle(tester), l10n.tabJournal);
    expect(find.byType(CompanionButton), findsNothing);
  });

  testWidgets('gear opens Settings; back returns to the tab', (tester) async {
    setPhone(tester);
    reduceMotion(tester);
    final env = await seededEnv();
    final router = await pumpApp(tester, env);

    await tester.tap(find.byKey(const Key('topbar-settings')));
    await settleData(tester);
    expect(router.state.uri.path, Routes.settings);
    expect(find.text(l10n.settingsAppearance), findsOneWidget);

    await tester.pageBack();
    await settleData(tester);
    expect(router.state.uri.path, Routes.dashboard);
  });

  testWidgets('nested screens show a back button in place of the logo', (tester) async {
    setPhone(tester);
    reduceMotion(tester);
    final env = await seededEnv();
    final router = await pumpApp(tester, env);
    unawaited(router.push(Routes.task('t1')));
    await settleData(tester);
    expect(find.byKey(const Key('topbar-back')), findsOneWidget);
    expect(topBarTitle(tester), l10n.titleTask);
    await tester.tap(find.byKey(const Key('topbar-back')));
    await settleData(tester);
    expect(router.state.uri.path, Routes.dashboard);
    expect(find.byKey(const Key('topbar-logo')), findsOneWidget);
  });

  testWidgets('tablet shell uses a navigation rail', (tester) async {
    setTablet(tester);
    reduceMotion(tester);
    final env = await seededEnv();
    await pumpApp(tester, env);
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
    expect(tester.widget<NavigationRail>(find.byType(NavigationRail)).destinations, hasLength(4));
    expect(find.byKey(const Key('topbar-settings')), findsOneWidget);
  });

  testWidgets('offline banner appears when the device is offline', (tester) async {
    setPhone(tester);
    reduceMotion(tester);
    final env = await seededEnv();
    await pumpApp(tester, env, online: false);
    expect(find.text(l10n.offlineBanner), findsOneWidget);
  });
}
