import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';

import 'helpers/driver.dart';
import 'helpers/emulator.dart';

/// Path A: the user has an idea; the AI interview builds the project profile.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final admin = EmulatorAdmin();

  setUp(admin.reset);

  testWidgets('idea interview → confirmed profile → plan', (tester) async {
    await launchApp(tester);
    await signUp(tester, admin, email: 'patha@example.com');
    await tapWhenReady(tester, find.text(l10n.onboardingWelcomeCta));
    await tapWhenReady(tester, find.byKey(const Key('path-has-idea')));

    const answers = <String>[
      'I want to start a free coding club for kids at my library.',
      'Kids aged 8 to 12 who have never coded.',
      'Ten kids finishing a small game by the end.',
      'I know Scratch and Python basics. The librarian said we can use the room.',
      'Saturdays only, and I have exams in December.',
      'Done in about three months.',
    ];
    final composer = find.byType(TextField);
    final send = find.byKey(const Key('chat-send'));
    final review = find.byKey(const Key('interview-review'));
    for (final answer in answers) {
      if (review.evaluate().isNotEmpty) break;
      await pumpUntil(tester, composer);
      await tester.enterText(composer.last, answer);
      await tapWhenReady(tester, send);
      // Wait for the streamed reply to finish (send re-enables).
      await pumpUntil(tester, send, timeout: const Duration(minutes: 2));
      await tester.pump(const Duration(seconds: 1));
    }

    await tapWhenReady(tester, review, timeout: const Duration(minutes: 2));
    await tapWhenReady(tester, find.byKey(const Key('interview-confirm')));
    await tapWhenReady(tester, find.text(l10n.commonContinue)); // project picked
    await completeSetupSteps(tester);
  });
}
