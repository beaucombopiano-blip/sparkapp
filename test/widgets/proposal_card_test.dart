import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/core/errors/app_exception.dart';
import 'package:spark/core/widgets/proposal_card.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';

import '../helpers/pump.dart';

void main() {
  final l10n = AppLocalizationsEn();

  Future<void> pumpCard(
    WidgetTester tester, {
    required Future<bool> Function() onConfirm,
    Future<void> Function()? onNotNow,
    ProposalPhase? serverPhase,
    String? serverError,
  }) =>
      pumpSpark(
        tester,
        SingleChildScrollView(
          child: ProposalCard(
            preview: 'Move Saturday\'s session to Sunday 2 PM',
            details: const <String>['Saturday 10:00 → Sunday 14:00'],
            onConfirm: onConfirm,
            onNotNow: onNotNow,
            serverPhase: serverPhase,
            serverError: serverError,
          ),
        ),
      );

  testWidgets('shows the preview and what would change before confirming', (tester) async {
    await pumpCard(tester, onConfirm: () async => true);
    expect(find.text("Move Saturday's session to Sunday 2 PM"), findsOneWidget);
    expect(find.text(l10n.proposalWouldChange), findsOneWidget);
    expect(find.text('Saturday 10:00 → Sunday 14:00'), findsOneWidget);
    expect(find.text(l10n.proposalDone), findsNothing);
  });

  testWidgets('shows a working state while the backend applies, then Done only on success', (tester) async {
    final completer = Completer<bool>();
    await pumpCard(tester, onConfirm: () => completer.future);
    await tester.tap(find.text(l10n.proposalConfirm));
    await tester.pump();
    expect(find.text(l10n.proposalWorking), findsOneWidget);
    expect(find.text(l10n.proposalDone), findsNothing);

    completer.complete(true);
    await tester.pumpAndSettle();
    expect(find.text(l10n.proposalDone), findsOneWidget);
    expect(find.text(l10n.proposalConfirm), findsNothing);
  });

  testWidgets('never shows Done when the backend says no', (tester) async {
    await pumpCard(tester, onConfirm: () async => false, serverError: 'The session overlaps your exam.');
    await tester.tap(find.text(l10n.proposalConfirm));
    await tester.pumpAndSettle();
    expect(find.text(l10n.proposalDone), findsNothing);
    expect(find.text(l10n.proposalFailed('The session overlaps your exam.')), findsOneWidget);
    expect(find.text(l10n.commonRetry), findsOneWidget);
  });

  testWidgets('never shows Done when the call throws; shows the real error and retries', (tester) async {
    var attempts = 0;
    await pumpCard(tester, onConfirm: () async {
      attempts++;
      if (attempts == 1) throw const AppException(kind: AppErrorKind.conflict, message: 'The plan changed. Refresh and try again.');
      return true;
    });
    await tester.tap(find.text(l10n.proposalConfirm));
    await tester.pumpAndSettle();
    expect(find.text(l10n.proposalDone), findsNothing);
    expect(find.text(l10n.proposalFailed('The plan changed. Refresh and try again.')), findsOneWidget);

    await tester.tap(find.text(l10n.commonRetry));
    await tester.pumpAndSettle();
    expect(attempts, 2);
    expect(find.text(l10n.proposalDone), findsOneWidget);
  });

  testWidgets('a network failure maps to a friendly message, not Done', (tester) async {
    await pumpCard(tester, onConfirm: () async => throw const AppException(kind: AppErrorKind.network));
    await tester.tap(find.text(l10n.proposalConfirm));
    await tester.pumpAndSettle();
    expect(find.text(l10n.proposalDone), findsNothing);
    expect(find.text(l10n.proposalFailed(l10n.errorNetwork)), findsOneWidget);
  });

  testWidgets('Not now records the dismissal and changes nothing', (tester) async {
    var confirmed = false;
    var dismissed = false;
    await pumpCard(tester, onConfirm: () async => confirmed = true, onNotNow: () async => dismissed = true);
    await tester.tap(find.text(l10n.proposalNotNow));
    await tester.pumpAndSettle();
    expect(dismissed, isTrue);
    expect(confirmed, isFalse);
    expect(find.text(l10n.proposalCancelled), findsOneWidget);
    expect(find.text(l10n.proposalDone), findsNothing);
  });

  testWidgets('reflects the server state of a proposal applied elsewhere', (tester) async {
    await pumpCard(tester, onConfirm: () async => true, serverPhase: ProposalPhase.done);
    expect(find.text(l10n.proposalDone), findsOneWidget);
    expect(find.text(l10n.proposalConfirm), findsNothing);
  });

  testWidgets('a server failure is shown with the backend reason', (tester) async {
    await pumpCard(tester, onConfirm: () async => true, serverPhase: ProposalPhase.failed, serverError: 'Plan version is out of date.');
    expect(find.text(l10n.proposalFailed('Plan version is out of date.')), findsOneWidget);
    expect(find.text(l10n.proposalDone), findsNothing);
  });

  testWidgets('switches to Done when the backend confirms after a local timeout', (tester) async {
    await pumpCard(tester, onConfirm: () async => throw const AppException(kind: AppErrorKind.timeout));
    await tester.tap(find.text(l10n.proposalConfirm));
    await tester.pumpAndSettle();
    expect(find.text(l10n.proposalDone), findsNothing);

    // The live proposal document later reports `executed`.
    await pumpCard(tester, onConfirm: () async => true, serverPhase: ProposalPhase.done);
    await tester.pumpAndSettle();
    expect(find.text(l10n.proposalDone), findsOneWidget);
  });
}
