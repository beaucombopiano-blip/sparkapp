import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/theme/spark_colors.dart';
import '../../../app/theme/tokens.dart';
import '../../../core/utils/l10n.dart';
import '../../../core/widgets/spark_button.dart';
import '../../../core/widgets/spark_card.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/session_providers.dart';
import '../../../data/repositories/user_repository.dart';
import '../../notifications/notification_prefs_editor.dart';
import '../../notifications/notification_service.dart';
import '../onboarding_frame.dart';
import '../onboarding_screen.dart';

/// Explains each notification type (all pre-checked), quiet hours, then
/// "Turn on notifications" shows the OS prompt. Denial gets one gentle note.
class NotificationsStep extends ConsumerStatefulWidget {
  const NotificationsStep({super.key});

  @override
  ConsumerState<NotificationsStep> createState() => _NotificationsStepState();
}

class _NotificationsStepState extends ConsumerState<NotificationsStep> with StepSubmitMixin {
  NotificationPrefs _prefs = const NotificationPrefs(quietHoursStart: '22:00', quietHoursEnd: '07:00');
  bool _denied = false;

  Future<void> _savePrefs(PushPermission permission) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    final prefs = _prefs.copyWith(osPermission: permission.name);
    await ref.read(userRepositoryProvider).updateNotificationPrefs(uid, prefs);
  }

  Future<void> _turnOn() async {
    final permission = await ref.read(notificationServiceProvider).requestPermission();
    await _savePrefs(permission);
    if (permission == PushPermission.denied) {
      if (mounted) setState(() => _denied = true);
      return;
    }
    await advanceStep(ref, OnboardingStep.notifications, _prefs.toJson());
  }

  Future<void> _skip() async {
    final permission = await ref.read(notificationServiceProvider).permission();
    await _savePrefs(permission);
    await advanceStep(ref, OnboardingStep.notifications, _prefs.toJson());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    return OnboardingFrame(
      step: OnboardingStep.notifications,
      title: l10n.notificationsTitle,
      subtitle: l10n.notificationsBody,
      primary: _denied
          ? SparkButton(label: l10n.commonContinue, loading: busy, expand: true, onPressed: () => submit(_skip))
          : SparkButton(
              key: const Key('notif-turn-on'),
              label: l10n.notifTurnOn,
              icon: Icons.notifications_active_rounded,
              loading: busy,
              expand: true,
              onPressed: () => submit(_turnOn),
            ),
      secondary: _denied
          ? null
          : SparkButton.text(label: l10n.notifNotNow, expand: true, onPressed: busy ? null : () => submit(_skip)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_denied) ...<Widget>[
            SparkCard(
              tone: SparkCardTone.tinted,
              child: Row(
                children: <Widget>[
                  Icon(Icons.info_outline_rounded, color: c.secondary),
                  const SizedBox(width: Space.s),
                  Expanded(child: Text(l10n.notifDeniedNote)),
                ],
              ),
            ),
            const SizedBox(height: Space.m),
          ],
          NotificationPrefsEditor(prefs: _prefs, onChanged: (p) => setState(() => _prefs = p), enabled: !busy),
        ],
      ),
    );
  }
}
