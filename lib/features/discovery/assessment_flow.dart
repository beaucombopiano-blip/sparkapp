import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/models/discovery.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/discovery_repository.dart';
import '../onboarding/onboarding_frame.dart';

/// Path B: adaptive 30-question assessment, one statement per screen with five
/// labelled Likert options. Every answer is saved by `assessmentNext`, so the
/// flow resumes exactly where the user left off.
class AssessmentFlow extends ConsumerStatefulWidget {
  const AssessmentFlow({super.key, this.paused = false});

  final bool paused;

  @override
  ConsumerState<AssessmentFlow> createState() => _AssessmentFlowState();
}

class _AssessmentFlowState extends ConsumerState<AssessmentFlow> {
  AssessmentStep? _step;
  Object? _error;
  bool _loading = false;
  int? _selected;
  bool _finishing = false;

  String? get _savedSessionId =>
      ref.read(userProfileProvider).value?.onboardingAnswers['assessmentSessionId'] as String?;

  @override
  void initState() {
    super.initState();
    if (!widget.paused) _load();
  }

  @override
  void didUpdateWidget(AssessmentFlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.paused && !widget.paused && _step == null) _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final step = await ref.read(discoveryRepositoryProvider).assessmentNext(sessionId: _step?.sessionId ?? _savedSessionId);
      if (!mounted) return;
      setState(() {
        _step = step;
        _selected = step.previousAnswer;
      });
      if (step.done) await _finish(step.sessionId);
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _answer(int value) async {
    final step = _step;
    final question = step?.question;
    if (step == null || question == null || _loading) return;
    setState(() {
      _selected = value;
      _loading = true;
      _error = null;
    });
    // Brief highlight before auto-advancing.
    final highlight = Future<void>.delayed(const Duration(milliseconds: 280));
    try {
      final next = await ref.read(discoveryRepositoryProvider).assessmentNext(
            sessionId: step.sessionId,
            questionId: question.id,
            answer: value,
          );
      await highlight;
      if (!mounted) return;
      setState(() {
        _step = next;
        _selected = next.previousAnswer;
      });
      if (next.done) await _finish(next.sessionId);
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _finish(String sessionId) async {
    setState(() => _finishing = true);
    try {
      await advanceStep(ref, OnboardingStep.discovery, <String, Object?>{'assessmentSessionId': sessionId});
      // The router moves to recommendations when the profile updates.
    } on Object catch (e) {
      if (mounted) {
        setState(() {
          _finishing = false;
          _error = e;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (widget.paused) return const _PausedView();

    final step = _step;
    final text = Theme.of(context).textTheme;
    final c = context.spark;

    Widget body;
    if (_finishing) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AnimatedSparkLogo(size: 96, loop: true, thinking: true),
          const SizedBox(height: Space.m),
          Text(l10n.assessmentFinishing, style: text.titleLarge, textAlign: TextAlign.center),
        ],
      );
    } else if (step == null || step.question == null) {
      body = _error != null ? ErrorState(error: _error!, onRetry: _load) : const SkeletonList(itemCount: 5);
    } else {
      final q = step.question!;
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(l10n.assessmentProgress(step.index, step.total), style: text.labelLarge),
          const SizedBox(height: Space.s),
          Semantics(
            label: l10n.assessmentProgress(step.index, step.total),
            excludeSemantics: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: step.total == 0 ? 0 : (step.index - 1) / step.total,
                color: c.primary,
                backgroundColor: c.progressTrack,
              ),
            ),
          ),
          const SizedBox(height: Space.l),
          Expanded(
            child: AnimatedSwitcher(
              duration: MediaQuery.disableAnimationsOf(context) ? Duration.zero : Motion.slow,
              transitionBuilder: (child, animation) => SlideTransition(
                position: Tween<Offset>(begin: const Offset(0.25, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Motion.curve))
                    .animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              ),
              child: SingleChildScrollView(
                key: ValueKey<String>(q.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Semantics(
                      header: true,
                      liveRegion: true,
                      child: Text(q.text, style: text.headlineSmall),
                    ),
                    const SizedBox(height: Space.l),
                    LikertOptions(
                      selected: _selected,
                      enabled: !_loading,
                      onSelected: _answer,
                    ),
                    if (_error != null) ErrorState(error: _error!, compact: true, onRetry: () => _answer(_selected ?? 3)),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return OnboardingFrame(
      step: OnboardingStep.discovery,
      title: l10n.pathFindIdeaTitle,
      scrollable: false,
      topAction: TextButton(
        onPressed: () => context.go('${Routes.onboarding(OnboardingStep.discovery.name)}?paused=1'),
        child: Text(l10n.assessmentSaveExit),
      ),
      child: Padding(padding: const EdgeInsets.only(bottom: Space.m), child: body),
    );
  }
}

/// Five large, labelled Likert options (1 = strongly disagree … 5 = strongly agree).
class LikertOptions extends StatelessWidget {
  const LikertOptions({super.key, required this.selected, required this.onSelected, this.enabled = true});

  final int? selected;
  final ValueChanged<int> onSelected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final labels = <String>[
      l10n.likertStronglyDisagree,
      l10n.likertDisagree,
      l10n.likertNeutral,
      l10n.likertAgree,
      l10n.likertStronglyAgree,
    ];
    final icons = <IconData>[
      Icons.sentiment_very_dissatisfied_rounded,
      Icons.sentiment_dissatisfied_rounded,
      Icons.sentiment_neutral_rounded,
      Icons.sentiment_satisfied_rounded,
      Icons.sentiment_very_satisfied_rounded,
    ];
    return Column(
      children: <Widget>[
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.s),
            child: Semantics(
              button: true,
              selected: selected == i + 1,
              child: Material(
                color: selected == i + 1 ? c.primary : c.card,
                borderRadius: Radii.buttonAll,
                child: InkWell(
                  key: Key('likert-${i + 1}'),
                  borderRadius: Radii.buttonAll,
                  onTap: enabled ? () => onSelected(i + 1) : null,
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 56),
                    padding: const EdgeInsets.symmetric(horizontal: Space.m, vertical: Space.s),
                    decoration: BoxDecoration(
                      borderRadius: Radii.buttonAll,
                      border: Border.all(color: selected == i + 1 ? c.primary : c.border),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(icons[i], color: selected == i + 1 ? c.onPrimary : c.secondary),
                        const SizedBox(width: Space.m),
                        Expanded(
                          child: Text(
                            labels[i],
                            style: text.titleMedium?.copyWith(color: selected == i + 1 ? c.onPrimary : c.textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _PausedView extends StatelessWidget {
  const _PausedView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OnboardingFrame(
      step: OnboardingStep.discovery,
      title: l10n.assessmentPausedTitle,
      subtitle: l10n.assessmentPausedBody,
      primary: SparkButton(
        label: l10n.assessmentResume,
        expand: true,
        onPressed: () => context.go(Routes.onboarding(OnboardingStep.discovery.name)),
      ),
      child: const Center(child: SparkLogoFace(size: 120)),
    );
  }
}
