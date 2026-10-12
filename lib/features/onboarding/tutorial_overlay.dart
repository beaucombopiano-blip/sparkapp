import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../billing/entitlements.dart';
import 'onboarding_frame.dart';

part 'tutorial_overlay.g.dart';

/// Global keys on the real UI that the coach marks point at.
class TutorialKeys {
  final GlobalKey navigation = GlobalKey(debugLabel: 'tutorial-navigation');
  final GlobalKey tabDashboard = GlobalKey(debugLabel: 'tutorial-tab-dashboard');
  final GlobalKey tabProject = GlobalKey(debugLabel: 'tutorial-tab-project');
  final GlobalKey tabJournal = GlobalKey(debugLabel: 'tutorial-tab-journal');
  final GlobalKey tabProfile = GlobalKey(debugLabel: 'tutorial-tab-profile');
  final GlobalKey progressBar = GlobalKey(debugLabel: 'tutorial-progress');
  final GlobalKey checklist = GlobalKey(debugLabel: 'tutorial-checklist');
  final GlobalKey calendar = GlobalKey(debugLabel: 'tutorial-calendar');
  final GlobalKey companionButton = GlobalKey(debugLabel: 'tutorial-companion');
  final GlobalKey settingsGear = GlobalKey(debugLabel: 'tutorial-settings');
}

@Riverpod(keepAlive: true)
TutorialKeys tutorialKeys(Ref ref) => TutorialKeys();

/// Replay requested from Settings → Help.
@Riverpod(keepAlive: true)
class TutorialReplay extends _$TutorialReplay {
  @override
  bool build() => false;

  void start() => state = true;
  void stop() => state = false;
}

class _CoachStep {
  const _CoachStep(this.target, this.title, this.body, {this.branch, this.requiresCompanion = false});

  final GlobalKey Function(TutorialKeys keys) target;
  final String Function(AppLocalizations l10n) title;
  final String Function(AppLocalizations l10n) body;

  /// Tab to show before pointing at the target.
  final int? branch;
  final bool requiresCompanion;
}

final List<_CoachStep> _steps = <_CoachStep>[
  _CoachStep((k) => k.navigation, (l) => l.tutorialTabsTitle, (l) => l.tutorialTabsBody, branch: 0),
  _CoachStep((k) => k.progressBar, (l) => l.tutorialProgressTitle, (l) => l.tutorialProgressBody, branch: 0),
  _CoachStep((k) => k.checklist, (l) => l.tutorialChecklistTitle, (l) => l.tutorialChecklistBody, branch: 0),
  _CoachStep((k) => k.calendar, (l) => l.tutorialCalendarTitle, (l) => l.tutorialCalendarBody, branch: 1),
  _CoachStep(
    (k) => k.companionButton,
    (l) => l.tutorialCompanionTitle,
    (l) => l.tutorialCompanionBody,
    branch: 0,
    requiresCompanion: true,
  ),
  _CoachStep((k) => k.tabJournal, (l) => l.tutorialJournalTitle, (l) => l.tutorialJournalBody),
  _CoachStep((k) => k.settingsGear, (l) => l.tutorialSettingsTitle, (l) => l.tutorialSettingsBody),
];

/// Runs coach marks over the real shell during the onboarding `tutorial`
/// step, or when replayed from Settings. Skippable at any point.
class TutorialHost extends ConsumerStatefulWidget {
  const TutorialHost({super.key, required this.navigationShell, required this.child});

  final StatefulNavigationShell navigationShell;
  final Widget child;

  @override
  ConsumerState<TutorialHost> createState() => _TutorialHostState();
}

class _TutorialHostState extends ConsumerState<TutorialHost> with WidgetsBindingObserver {
  final GlobalKey _stackKey = GlobalKey();
  int _index = 0;
  Rect? _target;
  bool _finishing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() => _measureSoon();

  List<_CoachStep> _activeSteps() {
    final companion = ref.read(hasFeatureProvider(Features.aiCompanion));
    return _steps.where((s) => companion || !s.requiresCompanion).toList();
  }

  void _measureSoon() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  Future<void> _measure({bool ensureVisible = true}) async {
    if (!mounted) return;
    final steps = _activeSteps();
    if (_index >= steps.length) return;
    final key = steps[_index].target(ref.read(tutorialKeysProvider));
    final ctx = key.currentContext;
    if (ctx != null && ensureVisible) {
      final scrollable = Scrollable.maybeOf(ctx);
      if (scrollable != null) {
        await Scrollable.ensureVisible(ctx, duration: Motion.medium, alignment: 0.3);
        if (!mounted) return;
      }
    }
    final targetBox = key.currentContext?.findRenderObject();
    final stackBox = _stackKey.currentContext?.findRenderObject();
    Rect? rect;
    if (targetBox is RenderBox && stackBox is RenderBox && targetBox.attached && targetBox.hasSize) {
      final offset = targetBox.localToGlobal(Offset.zero, ancestor: stackBox);
      rect = offset & targetBox.size;
    }
    if (rect != _target) setState(() => _target = rect);
  }

  void _goTo(int index) {
    final steps = _activeSteps();
    if (index >= steps.length) {
      _finish();
      return;
    }
    setState(() {
      _index = index;
      _target = null;
    });
    final branch = steps[index].branch;
    if (branch != null && widget.navigationShell.currentIndex != branch) {
      widget.navigationShell.goBranch(branch, initialLocation: true);
    }
    // Give the tab a moment to lay out before measuring.
    Future<void>.delayed(const Duration(milliseconds: 120), _measure);
  }

  Future<void> _finish() async {
    if (_finishing) return;
    setState(() => _finishing = true);
    try {
      final step = ref.read(userProfileProvider).value?.step;
      if (step == OnboardingStep.tutorial) {
        await advanceStep(ref, OnboardingStep.tutorial);
      }
      ref.read(tutorialReplayProvider.notifier).stop();
      if (widget.navigationShell.currentIndex != 0) widget.navigationShell.goBranch(0, initialLocation: true);
      if (mounted) setState(() => _index = 0);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _finish);
    } finally {
      if (mounted) setState(() => _finishing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingTutorial = ref.watch(userProfileProvider.select((p) => p.value?.step == OnboardingStep.tutorial));
    final replay = ref.watch(tutorialReplayProvider);
    final active = onboardingTutorial || replay;

    if (active && _target == null) _measureSoon();

    return Stack(
      key: _stackKey,
      children: <Widget>[
        widget.child,
        if (active) Positioned.fill(child: _buildOverlay(context)),
      ],
    );
  }

  Widget _buildOverlay(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final steps = _activeSteps();
    final step = steps[_index.clamp(0, steps.length - 1)];
    final isLast = _index >= steps.length - 1;
    final size = MediaQuery.sizeOf(context);
    final hole = _target?.inflate(8);

    // Card goes below the target when it's in the top half, above otherwise.
    final targetCenterY = hole?.center.dy ?? size.height / 2;
    final cardBelow = targetCenterY < size.height / 2;

    final card = Material(
      color: c.surface,
      elevation: 6,
      borderRadius: Radii.cardAll,
      child: Padding(
        padding: const EdgeInsets.all(Space.m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${_index + 1}/${steps.length}', style: text.labelSmall),
            const SizedBox(height: Space.xs),
            Semantics(header: true, liveRegion: true, child: Text(step.title(l10n), style: text.titleLarge)),
            const SizedBox(height: Space.xs),
            Text(step.body(l10n), style: text.bodyMedium),
            const SizedBox(height: Space.m),
            Row(
              children: <Widget>[
                SparkButton.text(label: l10n.tutorialSkip, onPressed: _finishing ? null : _finish),
                const Spacer(),
                SparkButton(
                  key: const Key('tutorial-next'),
                  label: isLast ? l10n.tutorialDone : l10n.tutorialNext,
                  loading: _finishing,
                  onPressed: () => _goTo(_index + 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return BlockSemantics(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: CustomPaint(painter: _ScrimPainter(hole: hole, color: c.shadow.withValues(alpha: 0.75))),
            ),
          ),
          if (hole == null)
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(Space.m),
                  child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 420), child: card),
                ),
              ),
            )
          else
            Positioned(
              left: Space.m,
              right: Space.m,
              top: cardBelow ? hole.bottom + Space.m : null,
              bottom: cardBelow ? null : size.height - hole.top + Space.m,
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 420), child: card),
              ),
            ),
        ],
      ),
    );
  }
}

class _ScrimPainter extends CustomPainter {
  _ScrimPainter({required this.hole, required this.color});
  final Rect? hole;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final full = Path()..addRect(Offset.zero & size);
    final path = hole == null
        ? full
        : Path.combine(
            PathOperation.difference,
            full,
            Path()..addRRect(RRect.fromRectAndRadius(hole!, const Radius.circular(Radii.card))),
          );
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_ScrimPainter old) => old.hole != hole || old.color != color;
}
