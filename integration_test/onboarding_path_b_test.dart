import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spark/app/routes.dart';
import 'package:spark/core/widgets/spark_progress_bar.dart';

import 'helpers/driver.dart';
import 'helpers/emulator.dart';

/// signup → Path B → pick a project → availability → plan → complete a task
/// → progress updates. Runs against the Firebase Emulator Suite with the
/// SPARK backend deployed to it (see docs/FRONTEND_PLAN.md, "Integration tests").
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final admin = EmulatorAdmin();

  setUp(admin.reset);

  testWidgets('new user finds an idea, gets a plan and completes a task', (tester) async {
    await launchApp(tester);
    await signUp(tester, admin, email: 'pathb@example.com');
    await onboardPathB(tester);

    // Dashboard with a real plan.
    await pumpUntil(tester, find.byType(SparkProgressBar), description: 'progress on the dashboard');
    final before = tester.widget<SparkProgressBar>(find.byType(SparkProgressBar).first).done;

    // Complete the first actionable task through the checkbox.
    final parts = l10n.taskCompleteSemantics('\u0000').split('\u0000');
    final checkbox = find.bySemanticsLabel(RegExp('^${RegExp.escape(parts.first)}.+${RegExp.escape(parts.last)}\$'));
    await tapWhenReady(tester, checkbox);
    await pumpUntil(tester, find.text(l10n.journalPromptTitle), description: 'journal prompt after completing');
    await tester.tap(find.text(l10n.commonNotNow));

    // Progress comes from the backend (getProgress) once Firestore updates.
    final end = DateTime.now().add(const Duration(seconds: 60));
    double after = before;
    while (after <= before && DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 300));
      after = tester.widget<SparkProgressBar>(find.byType(SparkProgressBar).first).done;
    }
    expect(after, greaterThan(before), reason: 'completing a task should move progress');
    expect(routerOf(tester).state.uri.path, Routes.dashboard);
  });
}
