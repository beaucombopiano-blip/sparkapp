import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:spark/app/app.dart';
import 'package:spark/app/router.dart';

import 'pump.dart';
import 'test_env.dart';

/// Pumps the real app (router, shell, theme) on the fake backend and
/// optionally navigates to [location].
Future<GoRouter> pumpApp(WidgetTester tester, SparkTestEnv env, {String? location, bool online = true}) async {
  await tester.pumpWidget(
    ProviderScope(overrides: env.overrides(online: online), retry: (_, _) => null, child: const SparkApp()),
  );
  await settleData(tester);
  final router = ProviderScope.containerOf(tester.element(find.byType(SparkApp))).read(routerProvider);
  if (location != null) {
    router.go(location);
    await settleData(tester);
  }
  return router;
}

/// Starts a fully seeded environment (signed in, onboarded, active plan).
Future<SparkTestEnv> seededEnv({String appearanceMode = 'light', Map<String, Object?>? customPalette}) async {
  final env = SparkTestEnv();
  await env.init();
  await env.seed(appearanceMode: appearanceMode, customPalette: customPalette);
  return env;
}
