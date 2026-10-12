import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/utils/l10n.dart';
import '../../../core/widgets/spark_button.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/session_providers.dart';
import '../../../data/repositories/user_repository.dart';
import '../../settings/appearance_picker.dart';
import '../onboarding_frame.dart';
import '../onboarding_screen.dart';

/// Light / Dark / Match my phone; applied instantly (saved to the profile).
class AppearanceStep extends ConsumerStatefulWidget {
  const AppearanceStep({super.key});

  @override
  ConsumerState<AppearanceStep> createState() => _AppearanceStepState();
}

class _AppearanceStepState extends ConsumerState<AppearanceStep> with StepSubmitMixin {
  Future<void> _select(AppearanceMode mode) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    await ref.read(userRepositoryProvider).setAppearanceMode(uid, mode);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mode = ref.watch(userProfileProvider.select((p) => p.value?.appearanceMode)) ?? AppearanceMode.system;
    return OnboardingFrame(
      step: OnboardingStep.appearance,
      title: l10n.appearanceTitle,
      subtitle: l10n.appearanceBody,
      primary: SparkButton(
        label: l10n.commonContinue,
        loading: busy,
        expand: true,
        onPressed: () => submit(() => advanceStep(ref, OnboardingStep.appearance, <String, Object?>{
              'appearanceMode': mode.name,
            })),
      ),
      child: AppearancePicker(
        selected: mode,
        onSelected: (m) => submit(() => _select(m)),
      ),
    );
  }
}
