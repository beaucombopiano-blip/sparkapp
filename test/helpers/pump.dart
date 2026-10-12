import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/theme/spark_colors.dart';
import 'package:spark/app/theme/spark_palette.dart';
import 'package:spark/app/theme/spark_theme.dart';
import 'package:spark/l10n/generated/app_localizations.dart';

ThemeData lightTheme() => buildSparkTheme(SparkColors.light(SparkPalette.spark));
ThemeData darkTheme() => buildSparkTheme(SparkColors.dark(SparkPalette.spark));

/// Pumps a single widget with the SPARK theme, localisation and providers.
Future<void> pumpSpark(
  WidgetTester tester,
  Widget child, {
  List<Override> overrides = const <Override>[],
  ThemeData? theme,
  bool scaffold = true,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      retry: (_, _) => null,
      child: MaterialApp(
        theme: theme ?? lightTheme(),
        localizationsDelegates: <LocalizationsDelegate<Object?>>[
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: scaffold ? Scaffold(body: child) : child,
      ),
    ),
  );
}

/// Reduced motion so looping animations (logo, shimmer) don't block settling.
void reduceMotion(WidgetTester tester) {
  tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(disableAnimations: true);
  addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
}

/// Pumps frames for [duration] in small steps (safe with indeterminate
/// spinners, unlike pumpAndSettle).
Future<void> pumpFor(WidgetTester tester, Duration duration, {Duration step = const Duration(milliseconds: 50)}) async {
  var elapsed = Duration.zero;
  while (elapsed < duration) {
    await tester.pump(step);
    elapsed += step;
  }
}

/// Lets Firestore fakes and futures resolve.
Future<void> settleData(WidgetTester tester, {int rounds = 12}) async {
  for (var i = 0; i < rounds; i++) {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 5)));
    await tester.pump(const Duration(milliseconds: 16));
  }
}

/// Phone and tablet viewports (logical size at 3x / 2x).
void setPhone(WidgetTester tester) {
  tester.view.devicePixelRatio = 3;
  tester.view.physicalSize = const Size(390 * 3, 844 * 3);
  addTearDown(tester.view.reset);
}

void setTablet(WidgetTester tester) {
  tester.view.devicePixelRatio = 2;
  tester.view.physicalSize = const Size(1180 * 2, 820 * 2);
  addTearDown(tester.view.reset);
}
