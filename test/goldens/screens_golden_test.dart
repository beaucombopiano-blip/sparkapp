@Tags(<String>['golden'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/routes.dart';

import '../helpers/app.dart';
import '../helpers/pump.dart';

/// Golden images of the main screens on the fake backend.
///
/// Generated on Linux (fonts are bundled, so text is real). Regenerate with
/// `flutter test --tags golden --update-goldens` after intentional UI changes.
void main() {
  const screens = <String, String>{
    'dashboard': Routes.dashboard,
    'project': Routes.project,
    'agenda_day': '/project/agenda?date=2026-10-14&view=day',
    'agenda_week': '/project/agenda?date=2026-10-14&view=week',
    'agenda_month': '/project/agenda?date=2026-10-14&view=month',
    'journal': Routes.journal,
    'profile': Routes.profile,
    'settings': Routes.settings,
  };

  /// A user palette (Settings → Custom colors) that passes contrast checks.
  const customPalette = <String, Object?>{
    'light': <String, Object?>{
      'background': '#FBF4EC',
      'primary': '#7A3E9D',
      'accent': '#E9A23B',
      'progressDone': '#7A3E9D',
      'progressProjected': '#E9A23B',
      'textPrimary': '#3A1F4D',
    },
    'dark': <String, Object?>{
      'primary': '#D3A8F0',
      'accent': '#F2C46D',
    },
  };

  const themes = <String, (String, Map<String, Object?>?)>{
    'light': ('light', null),
    'dark': ('dark', null),
    'custom': ('light', customPalette),
  };

  void viewport(WidgetTester tester, Size size) {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = size;
    addTearDown(tester.view.reset);
  }

  Future<void> capture(
    WidgetTester tester, {
    required String name,
    required String route,
    required String mode,
    Map<String, Object?>? palette,
    required Size size,
    double textScale = 1,
  }) async {
    viewport(tester, size);
    reduceMotion(tester);
    if (textScale != 1) {
      tester.platformDispatcher.textScaleFactorTestValue = textScale;
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    }
    // flutter_test paints shadows as solid outlines by default; render real
    // ones. Restored before the test ends (the binding checks it).
    debugDisableShadows = false;
    try {
      final env = await seededEnv(appearanceMode: mode, customPalette: palette);
      await pumpApp(tester, env, location: route);
      await settleData(tester, rounds: 6);
      await expectLater(find.byType(MaterialApp), matchesGoldenFile('images/$name.png'));
    } finally {
      debugDisableShadows = true;
    }
  }

  for (final screen in screens.entries) {
    for (final theme in themes.entries) {
      testWidgets('${screen.key} · ${theme.key} · phone', (tester) async {
        await capture(
          tester,
          name: '${screen.key}_${theme.key}_phone',
          route: screen.value,
          mode: theme.value.$1,
          palette: theme.value.$2,
          size: const Size(390, 844),
        );
      });
      testWidgets('${screen.key} · ${theme.key} · tablet', (tester) async {
        await capture(
          tester,
          name: '${screen.key}_${theme.key}_tablet',
          route: screen.value,
          mode: theme.value.$1,
          palette: theme.value.$2,
          size: const Size(1180, 820),
        );
      });
    }
    testWidgets('${screen.key} · light · phone · 200% text', (tester) async {
      await capture(
        tester,
        name: '${screen.key}_light_phone_text200',
        route: screen.value,
        mode: 'light',
        size: const Size(390, 844),
        textScale: 2,
      );
    });
  }
}
