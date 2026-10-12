import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/shell/app_shell.dart';
import 'package:spark/core/widgets/proposal_card.dart';

import 'helpers/driver.dart';
import 'helpers/emulator.dart';

/// The companion proposes a schedule change; nothing changes until the user
/// confirms, and "Done" appears only after the backend applied it.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final admin = EmulatorAdmin();

  setUp(admin.reset);

  testWidgets('companion reschedule proposal → confirm → applied', (tester) async {
    await launchApp(tester);
    await signUp(tester, admin, email: 'companion@example.com');
    await onboardPathB(tester);

    await tapWhenReady(tester, find.byType(CompanionButton));
    final composer = find.byType(TextField);
    await pumpUntil(tester, composer);
    await tester.enterText(composer.last, 'Can you move my next work session to the day after?');
    await tapWhenReady(tester, find.byKey(const Key('chat-send')));

    await pumpUntil(tester, find.byType(ProposalCard), timeout: const Duration(minutes: 2), description: 'a proposal card');
    expect(find.text(l10n.proposalDone), findsNothing);
    await tapWhenReady(tester, find.descendant(of: find.byType(ProposalCard), matching: find.text(l10n.proposalConfirm)));
    await pumpUntil(tester, find.text(l10n.proposalDone), timeout: const Duration(minutes: 2), description: 'Done after applyProposal');
  });
}
