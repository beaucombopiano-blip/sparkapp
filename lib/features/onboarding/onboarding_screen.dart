import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../discovery/assessment_flow.dart';
import '../discovery/idea_interview_flow.dart';
import '../discovery/recommendations_step.dart';
import 'onboarding_frame.dart';
import 'steps/appearance_step.dart';
import 'steps/availability_step.dart';
import 'steps/character_step.dart';
import 'steps/deadline_step.dart';
import 'steps/notifications_step.dart';
import 'steps/project_selected_step.dart';

/// `/onboarding/:step` — shows the screen for the user's current server step.
/// The router keeps users on their real step, so this only dispatches.
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key, required this.step, this.paused = false});

  final String step;
  final bool paused;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = OnboardingStep.parse(step);
    switch (s) {
      case OnboardingStep.welcome:
        return const WelcomeStep();
      case OnboardingStep.pathChoice:
        return const PathChoiceStep();
      case OnboardingStep.discovery:
        final path = ref.watch(userProfileProvider.select((p) => p.value?.onboardingPath));
        if (path == OnboardingPath.hasIdea) return const IdeaInterviewFlow();
        return AssessmentFlow(paused: paused);
      case OnboardingStep.recommendations:
        return const RecommendationsStep();
      case OnboardingStep.projectSelected:
        return const ProjectSelectedStep();
      case OnboardingStep.deadline:
        return const DeadlineStep();
      case OnboardingStep.availability:
        return const AvailabilityStep();
      case OnboardingStep.character:
        return const CharacterStep();
      case OnboardingStep.notifications:
        return const NotificationsStep();
      case OnboardingStep.appearance:
        return const AppearanceStep();
      case OnboardingStep.tutorial:
      case OnboardingStep.complete:
        // The router never leaves users here; render the loader defensively.
        return const Scaffold(body: Center(child: AnimatedSparkLogo(size: 96, loop: true)));
    }
  }
}

/// Mixin for step widgets: tracks a busy flag and shows the real error.
mixin StepSubmitMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  bool busy = false;

  Future<void> submit(Future<void> Function() action) async {
    if (busy) return;
    setState(() => busy = true);
    try {
      await action();
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: () => submit(action));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }
}

class WelcomeStep extends ConsumerStatefulWidget {
  const WelcomeStep({super.key});

  @override
  ConsumerState<WelcomeStep> createState() => _WelcomeStepState();
}

class _WelcomeStepState extends ConsumerState<WelcomeStep> with StepSubmitMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final name = ref.watch(userProfileProvider.select((p) => p.value?.firstName)) ?? '';
    return OnboardingFrame(
      step: OnboardingStep.welcome,
      title: l10n.onboardingWelcomeTitle(name),
      subtitle: l10n.onboardingWelcomeBody,
      primary: SparkButton(
        label: l10n.onboardingWelcomeCta,
        loading: busy,
        expand: true,
        onPressed: () => submit(() => advanceStep(ref, OnboardingStep.welcome)),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Space.xl),
          child: AnimatedSparkLogo(size: 160),
        ),
      ),
    );
  }
}

class PathChoiceStep extends ConsumerStatefulWidget {
  const PathChoiceStep({super.key});

  @override
  ConsumerState<PathChoiceStep> createState() => _PathChoiceStepState();
}

class _PathChoiceStepState extends ConsumerState<PathChoiceStep> with StepSubmitMixin {
  OnboardingPath? _choosing;

  void _choose(OnboardingPath path) {
    setState(() => _choosing = path);
    submit(() => advanceStep(ref, OnboardingStep.pathChoice, <String, Object?>{'onboardingPath': path.name}));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OnboardingFrame(
      step: OnboardingStep.pathChoice,
      title: l10n.pathChoiceTitle,
      subtitle: l10n.pathChoiceBody,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _PathCard(
            key: const Key('path-has-idea'),
            icon: Icons.lightbulb_rounded,
            secondaryIcon: Icons.edit_note_rounded,
            title: l10n.pathHasIdeaTitle,
            body: l10n.pathHasIdeaBody,
            loading: busy && _choosing == OnboardingPath.hasIdea,
            onTap: busy ? null : () => _choose(OnboardingPath.hasIdea),
          ),
          const SizedBox(height: Space.m),
          _PathCard(
            key: const Key('path-find-idea'),
            icon: Icons.explore_rounded,
            secondaryIcon: Icons.auto_awesome_rounded,
            title: l10n.pathFindIdeaTitle,
            body: l10n.pathFindIdeaBody,
            loading: busy && _choosing == OnboardingPath.findIdea,
            onTap: busy ? null : () => _choose(OnboardingPath.findIdea),
          ),
        ],
      ),
    );
  }
}

class _PathCard extends StatelessWidget {
  const _PathCard({
    super.key,
    required this.icon,
    required this.secondaryIcon,
    required this.title,
    required this.body,
    required this.onTap,
    this.loading = false,
  });

  final IconData icon;
  final IconData secondaryIcon;
  final String title;
  final String body;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    return SparkCard(
      onTap: onTap,
      semanticLabel: '$title. $body',
      padding: const EdgeInsets.all(Space.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Simple illustration: a big icon on a tinted blob with an accent.
          SizedBox(
            height: 96,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(color: c.surfaceAlt, borderRadius: BorderRadius.circular(32)),
                  child: Icon(icon, size: 52, color: c.primary),
                ),
                Positioned(
                  left: 72,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: c.accent, shape: BoxShape.circle),
                    child: Icon(secondaryIcon, size: 20, color: c.onAccent),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Space.m),
          Text(title, style: text.titleLarge),
          const SizedBox(height: Space.xs),
          Text(body, style: text.bodyMedium),
          if (loading) ...<Widget>[
            const SizedBox(height: Space.m),
            LinearProgressIndicator(color: c.primary, backgroundColor: c.progressTrack),
          ],
        ],
      ),
    );
  }
}
