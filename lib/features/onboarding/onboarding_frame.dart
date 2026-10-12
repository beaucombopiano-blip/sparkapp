import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/l10n.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';

/// Onboarding steps shown in the dot indicator for the user's path.
List<OnboardingStep> visibleSteps(OnboardingPath? path) => <OnboardingStep>[
      OnboardingStep.welcome,
      OnboardingStep.pathChoice,
      OnboardingStep.discovery,
      if (path != OnboardingPath.hasIdea) OnboardingStep.recommendations,
      OnboardingStep.projectSelected,
      OnboardingStep.deadline,
      OnboardingStep.availability,
      OnboardingStep.character,
      OnboardingStep.notifications,
      OnboardingStep.appearance,
    ];

/// Friend-mode layout: step dots at the top, a big friendly headline, one
/// main action at the bottom.
class OnboardingFrame extends ConsumerWidget {
  const OnboardingFrame({
    super.key,
    required this.step,
    required this.title,
    required this.child,
    this.subtitle,
    this.primary,
    this.secondary,
    this.topAction,
    this.scrollable = true,
  });

  final OnboardingStep step;
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? primary;
  final Widget? secondary;

  /// Replaces the default "Sign out" action in the top-right corner.
  final Widget? topAction;
  final bool scrollable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    final path = ref.watch(userProfileProvider.select((p) => p.value?.onboardingPath));
    final steps = visibleSteps(path);
    final index = steps.indexOf(step);

    final header = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Semantics(header: true, child: Text(title, style: text.headlineMedium)),
        if (subtitle != null) ...<Widget>[
          const SizedBox(height: Space.s),
          Text(subtitle!, style: text.bodyLarge),
        ],
        const SizedBox(height: Space.l),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.m, Space.s, Space.xs, 0),
                  child: Row(
                    children: <Widget>[
                      if (index >= 0) StepDots(current: index, total: steps.length),
                      const Spacer(),
                      topAction ??
                          TextButton(
                            onPressed: () => ref.read(authRepositoryProvider).signOut(),
                            child: Text(context.l10n.signOut),
                          ),
                    ],
                  ),
                ),
                Expanded(
                  child: scrollable
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.m),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[header, child],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[header, Expanded(child: child)],
                          ),
                        ),
                ),
                if (primary != null || secondary != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.gutter, Space.s, Space.gutter, Space.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[?primary, ?secondary],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Dots step indicator.
class StepDots extends StatelessWidget {
  const StepDots({super.key, required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return Semantics(
      label: context.l10n.onboardingStepSemantics(current + 1, total),
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (var i = 0; i < total; i++)
            AnimatedContainer(
              duration: Motion.medium,
              margin: const EdgeInsets.only(right: 6),
              width: i == current ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: i <= current ? c.primary : c.border,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
        ],
      ),
    );
  }
}

/// Calls `advanceOnboarding` for [step]. When the server already moved past
/// the step (e.g. a retried request), the precondition error is ignored: the
/// router follows the profile's real step.
Future<void> advanceStep(WidgetRef ref, OnboardingStep step, [Map<String, Object?> payload = const {}]) async {
  try {
    await ref.read(userRepositoryProvider).advanceOnboarding(step, payload);
  } on AppException catch (e) {
    final current = ref.read(userProfileProvider).value?.step;
    if (e.kind == AppErrorKind.invalidInput && current != null && current.index > step.index) return;
    rethrow;
  }
}
