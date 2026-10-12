import 'dart:ui' show ImageFilter;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/models/project.dart';
import '../../data/models/schedule.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/schedule_repository.dart';
import '../billing/entitlements.dart';
import '../discovery/recommendations_step.dart' show ThinkingLoader;
import 'steps/availability_editor.dart';

enum _Phase { generating, infeasible, ready, error }

enum _Fix { moveDeadline, addTime, trimScope }

/// Calls generatePlan with an encouraging loader. When the work doesn't fit,
/// offers: move the deadline, add time per week, or trim scope, then
/// regenerates. Ends with "Let's get started".
class PlanGenerationScreen extends ConsumerStatefulWidget {
  const PlanGenerationScreen({super.key});

  @override
  ConsumerState<PlanGenerationScreen> createState() => _PlanGenerationScreenState();
}

class _PlanGenerationScreenState extends ConsumerState<PlanGenerationScreen> {
  _Phase _phase = _Phase.generating;
  GeneratePlanResult? _result;
  Object? _error;
  _Fix? _fix;
  final Set<int> _acceptedCuts = <int>{};
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    final project = ref.read(activeProjectProvider).value;
    if (project?.hasPlan ?? false) {
      _phase = _Phase.ready;
      _started = true;
    } else if (project != null) {
      _started = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _generate());
    }
  }

  Future<void> _generate({DateTime? targetEndDate, List<String> scopeCuts = const <String>[]}) async {
    final projectId = ref.read(activeProjectIdProvider);
    if (projectId == null) return;
    setState(() {
      _phase = _Phase.generating;
      _error = null;
    });
    try {
      final full = ref.read(hasFeatureProvider(Features.fullPlan));
      final result = await ref.read(projectRepositoryProvider).generatePlan(
            projectId,
            preview: !full,
            targetEndDate: targetEndDate,
            acceptedScopeCuts: scopeCuts,
          );
      if (!mounted) return;
      setState(() {
        _result = result;
        _phase = result.feasible ? _Phase.ready : _Phase.infeasible;
        _fix = null;
        _acceptedCuts
          ..clear()
          ..addAll(List<int>.generate(result.scopeCuts.length, (i) => i));
      });
    } on Object catch (e) {
      if (mounted) {
        setState(() {
          _phase = _Phase.error;
          _error = e;
        });
      }
    }
  }

  Future<void> _applyFix() async {
    final result = _result;
    if (result == null || _fix == null) return;
    switch (_fix!) {
      case _Fix.moveDeadline:
        await _generate(targetEndDate: result.suggestedEndDate);
      case _Fix.addTime:
        final saved = await _editAvailability();
        if (saved) await _generate();
      case _Fix.trimScope:
        final cuts = <String>[
          for (final i in _acceptedCuts) result.scopeCuts[i].id ?? result.scopeCuts[i].title,
        ];
        await _generate(scopeCuts: cuts);
    }
  }

  Future<bool> _editAvailability() async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return false;
    final current = await ref.read(scheduleRepositoryProvider).watchAvailability(uid).first;
    if (!mounted) return false;
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _AvailabilitySheet(initial: current),
    );
    return saved ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final project = ref.watch(activeProjectProvider).value;

    if (!_started && project != null) {
      _started = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _generate());
    }

    final Widget body = switch (_phase) {
      _Phase.generating => Center(
          child: ThinkingLoader(
            lines: <String>[l10n.planBuilding, l10n.planBuilding2, l10n.planBuilding3, l10n.planBuilding4],
          ),
        ),
      _Phase.error => ErrorState(error: _error!, onRetry: _generate),
      _Phase.infeasible => _buildInfeasible(context),
      _Phase.ready => _ReadyView(project: project),
    };

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: _phase == _Phase.infeasible || _phase == _Phase.ready
                ? body
                : Padding(
                    padding: const EdgeInsets.all(Space.l),
                    child: Column(
                      children: <Widget>[
                        Expanded(child: body),
                        if (_phase == _Phase.generating)
                          Text(project?.title ?? '', style: text.titleMedium, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfeasible(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final fmt = context.fmt;
    final clock = ref.read(userClockProvider);
    final r = _result!;

    Widget option(_Fix fix, String title, String body, {Widget? extra}) => Padding(
          padding: const EdgeInsets.only(bottom: Space.s),
          child: SparkCard(
            onTap: () => setState(() => _fix = fix),
            tone: _fix == fix ? SparkCardTone.tinted : SparkCardTone.normal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  _fix == fix ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                  color: _fix == fix ? c.primary : c.iconMuted,
                ),
                const SizedBox(width: Space.s),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: text.titleMedium),
                      Text(body, style: text.bodyMedium),
                      ?extra,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

    return ListView(
      padding: const EdgeInsets.all(Space.l),
      children: <Widget>[
        const Center(child: SparkLogoFace(size: 72)),
        const SizedBox(height: Space.m),
        Text(l10n.planNotFeasibleTitle, style: text.headlineSmall),
        const SizedBox(height: Space.s),
        Text(l10n.planNotFeasibleBody, style: text.bodyLarge),
        const SizedBox(height: Space.l),
        if (r.suggestedEndDate != null)
          option(
            _Fix.moveDeadline,
            l10n.planOptionMoveDeadline(fmt.longDate(clock.toWallClock(r.suggestedEndDate!))),
            l10n.planOptionMoveDeadlineBody,
          ),
        if (r.extraMinutesPerWeekNeeded != null && r.extraMinutesPerWeekNeeded! > 0)
          option(_Fix.addTime, l10n.planOptionAddTime(r.extraMinutesPerWeekNeeded!), l10n.planOptionAddTimeBody),
        if (r.scopeCuts.isNotEmpty)
          option(
            _Fix.trimScope,
            l10n.planOptionTrimScope,
            l10n.planOptionTrimScopeBody,
            extra: Column(
              children: <Widget>[
                for (var i = 0; i < r.scopeCuts.length; i++)
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _acceptedCuts.contains(i),
                    onChanged: (v) => setState(() {
                      _fix = _Fix.trimScope;
                      v == true ? _acceptedCuts.add(i) : _acceptedCuts.remove(i);
                    }),
                    title: Text(r.scopeCuts[i].title),
                    subtitle: r.scopeCuts[i].minutesSaved == null
                        ? null
                        : Text(fmt.duration(r.scopeCuts[i].minutesSaved!)),
                  ),
              ],
            ),
          ),
        const SizedBox(height: Space.m),
        SparkButton(
          label: l10n.planRegenerate,
          icon: Icons.auto_awesome_rounded,
          expand: true,
          onPressed: _fix == null || (_fix == _Fix.trimScope && _acceptedCuts.isEmpty) ? null : _applyFix,
        ),
      ],
    );
  }
}

class _ReadyView extends ConsumerWidget {
  const _ReadyView({required this.project});

  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final allPremium = ref.watch(allPremiumModeProvider);
    final fullPlan = ref.watch(hasFeatureProvider(Features.fullPlan));
    final p = project;
    final phases = p?.preview?.phases.length ?? 0;
    final tasks = (p?.totalTaskCount ?? 0) > 0 ? p!.totalTaskCount : (p?.preview?.taskCount ?? 0);

    return ListView(
      padding: const EdgeInsets.all(Space.l),
      children: <Widget>[
        const Center(child: AnimatedSparkLogo(size: 120)),
        const SizedBox(height: Space.l),
        Text(l10n.planReadyTitle, style: text.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: Space.s),
        if (tasks > 0)
          Text(
            phases > 0 ? l10n.planReadyBody(tasks, phases) : l10n.planReadyBodyTasks(tasks),
            style: text.bodyLarge,
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: Space.l),
        if (!allPremium && !fullPlan && p?.preview != null) ...<Widget>[
          PlanPreviewCard(preview: p!.preview!),
          const SizedBox(height: Space.l),
          SparkButton(
            label: l10n.lockedSeePlans,
            icon: Icons.star_rounded,
            expand: true,
            onPressed: () => context.push(Routes.plans),
          ),
          const SizedBox(height: Space.s),
          SparkButton.text(
            label: l10n.planContinueBasic,
            expand: true,
            onPressed: () => context.go(Routes.dashboard),
          ),
        ] else
          SparkButton(
            key: const Key('plan-lets-go'),
            label: l10n.planLetsGo,
            icon: Icons.rocket_launch_rounded,
            expand: true,
            onPressed: () => context.go(Routes.dashboard),
          ),
      ],
    );
  }
}

/// Basic plan preview: phases, milestone titles, task count and the first 3
/// tasks, with the rest blurred.
class PlanPreviewCard extends StatelessWidget {
  const PlanPreviewCard({super.key, required this.preview});

  final PlanPreview preview;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final hidden = (preview.taskCount - preview.firstTasks.length).clamp(0, 1 << 20);
    return SparkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.planPreviewTitle, style: text.titleLarge),
          const SizedBox(height: Space.s),
          for (final phase in preview.phases) ...<Widget>[
            Text(phase.title, style: text.titleMedium),
            for (final m in phase.milestoneTitles)
              Padding(
                padding: const EdgeInsets.only(left: Space.m, top: 2),
                child: Text('◆ $m', style: text.bodyMedium),
              ),
            const SizedBox(height: Space.s),
          ],
          const Divider(),
          Text(l10n.planPreviewFirstTasks, style: text.labelLarge),
          for (final t in preview.firstTasks)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.radio_button_unchecked_rounded, color: c.iconMuted),
              title: Text(t.title),
            ),
          if (hidden > 0)
            ClipRect(
              child: Stack(
                children: <Widget>[
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Column(
                      children: List<Widget>.generate(
                        3,
                        (_) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.radio_button_unchecked_rounded, color: c.iconMuted),
                          title: Container(height: 12, color: c.surfaceAlt),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(child: Text(l10n.planPreviewMore(hidden), style: text.labelLarge)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _AvailabilitySheet extends ConsumerStatefulWidget {
  const _AvailabilitySheet({required this.initial});
  final List<AvailabilitySlot> initial;

  @override
  ConsumerState<_AvailabilitySheet> createState() => _AvailabilitySheetState();
}

class _AvailabilitySheetState extends ConsumerState<_AvailabilitySheet> {
  late List<AvailabilitySlot> _slots = List<AvailabilitySlot>.of(widget.initial);
  bool _busy = false;

  Future<void> _save() async {
    setState(() => _busy = true);
    try {
      await ref.read(scheduleRepositoryProvider).setAvailability(_slots);
      if (mounted) Navigator.of(context).pop(true);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _save);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      builder: (context, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.l),
        children: <Widget>[
          Text(l10n.availabilityTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: Space.m),
          AvailabilityEditor(slots: _slots, onChanged: (v) => setState(() => _slots = v)),
          const SizedBox(height: Space.l),
          SparkButton(label: l10n.commonSave, loading: _busy, expand: true, onPressed: _slots.isEmpty ? null : _save),
        ],
      ),
    );
  }
}
