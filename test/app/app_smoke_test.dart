import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/app.dart';

import '../helpers/pump.dart';
import '../helpers/test_env.dart';

void main() {
  testWidgets('app boots to the dashboard for a signed-in user', (tester) async {
    setPhone(tester);
    reduceMotion(tester);
    final env = SparkTestEnv();
    await env.init();
    await env.seed();
    await tester.pumpWidget(ProviderScope(overrides: env.overrides(), retry: (_, _) => null, child: const SparkApp()));
    await settleData(tester);
    // ignore: avoid_print
    print(find.byType(Text).evaluate().map((e) => (e.widget as Text).data).where((t) => t != null).join(' | '));
    expect(tester.takeException(), isNull);
  });
}
