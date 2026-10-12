import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/utils/l10n.dart';
import '../../../core/widgets/celebration_overlay.dart';
import '../../../core/widgets/spark_logo.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/session_providers.dart';
import '../../discovery/selection.dart';
import '../onboarding_frame.dart';
import '../onboarding_screen.dart';

/// Full-screen celebration after selectProject: confetti, the earned badge
/// flying in, the logo smiling, "You picked your project!".
class ProjectSelectedStep extends ConsumerStatefulWidget {
  const ProjectSelectedStep({super.key});

  @override
  ConsumerState<ProjectSelectedStep> createState() => _ProjectSelectedStepState();
}

class _ProjectSelectedStepState extends ConsumerState<ProjectSelectedStep> with StepSubmitMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Haptics.celebrate());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selection = ref.watch(pendingSelectionProvider);
    final project = selection?.project ?? ref.watch(activeProjectProvider).value;
    final badge = selection?.newlyEarnedBadges.firstOrNull;
    final character = ref.watch(selectedCharacterProvider);

    return CelebrationOverlay(
      title: l10n.projectPickedTitle,
      message: project == null ? null : l10n.projectPickedBody(project.title),
      badgeName: badge?.name,
      character: character,
      continueLabel: busy ? l10n.commonSaving : l10n.commonContinue,
      onContinue: () => submit(() async {
        await advanceStep(ref, OnboardingStep.projectSelected);
        ref.read(pendingSelectionProvider.notifier).set(null);
      }),
    );
  }
}
