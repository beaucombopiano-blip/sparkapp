import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../core/widgets/pickers.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/states.dart';
import '../../data/models/schedule.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/schedule_repository.dart';
import '../onboarding/steps/availability_editor.dart';
import 'project_providers.dart';
import 'proposal_sheet.dart';

enum PlanAction {
  adjust,
  availability,
  deadline,
  regenerate;

  static PlanAction parse(String? value) =>
      PlanAction.values.firstWhere((a) => a.name == value, orElse: () => PlanAction.adjust);
}

/// Plan actions: adjust plan, edit availability, change deadline, regenerate
/// future tasks. Each one previews the change (a proposal) and only applies
/// it after the user confirms.
class AdjustPlanScreen extends ConsumerStatefulWidget {
  const AdjustPlanScreen({super.key, this.initialAction = PlanAction.adjust});

  final PlanAction initialAction;

  @override
  ConsumerState<AdjustPlanScreen> createState() => _AdjustPlanScreenState();
}

class _AdjustPlanScreenState extends ConsumerState<AdjustPlanScreen> {
  late PlanAction _action = widget.initialAction;
  Proposal? _proposal;
  bool _loading = false;
  Object? _error;
  String? _info;

  final _description = TextEditingController();
  PlanChangeKind _changeKind = PlanChangeKind.scope;
  LocalDay? _newDeadline;
  List<AvailabilitySlot>? _slots;

  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  void _switch(PlanAction action) => setState(() {
        _action = action;
        _proposal = null;
        _error = null;
        _info = null;
      });

  Future<void> _run(Future<Proposal?> Function() request) async {
    setState(() {
      _loading = true;
      _error = null;
      _proposal = null;
      _info = null;
    });
    try {
      final p = await request();
      if (!mounted) return;
      setState(() {
        _proposal = p;
        if (p == null) _info = context.l10n.adjustAvailabilitySaved;
      });
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _preview() async {
    final pid = ref.read(activeProjectIdProvider);
    if (pid == null) return;
    final repo = ref.read(projectRepositoryProvider);
    final clock = ref.read(userClockProvider);
    switch (_action) {
      case PlanAction.adjust:
        if (_description.text.trim().isEmpty) return;
        await _run(() => repo.adjustPlan(pid, kind: _changeKind, description: _description.text.trim()));
      case PlanAction.deadline:
        final d = _newDeadline;
        if (d == null) return;
        await _run(() => repo.adjustPlan(
              pid,
              kind: PlanChangeKind.newDeadline,
              targetEndDate: clock.toUtc(DateTime(d.year, d.month, d.day, 23, 59)),
            ));
      case PlanAction.regenerate:
        await _run(() => repo.adjustPlan(pid, kind: PlanChangeKind.regenerateFuture));
      case PlanAction.availability:
        final slots = _slots ?? ref.read(availabilityProvider).value;
        if (slots == null || slots.isEmpty) return;
        await _run(() => ref.read(scheduleRepositoryProvider).setAvailability(slots));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final project = ref.watch(activeProjectProvider).value;
    final slots = _slots ?? ref.watch(availabilityProvider).value;

    final Widget form = switch (_action) {
      PlanAction.adjust => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SegmentedButton<PlanChangeKind>(
              segments: <ButtonSegment<PlanChangeKind>>[
                ButtonSegment<PlanChangeKind>(value: PlanChangeKind.scope, label: Text(l10n.adjustKindScope)),
                ButtonSegment<PlanChangeKind>(value: PlanChangeKind.goal, label: Text(l10n.adjustKindGoal)),
              ],
              selected: <PlanChangeKind>{_changeKind},
              onSelectionChanged: (s) => setState(() => _changeKind = s.first),
            ),
            const SizedBox(height: Space.m),
            TextField(
              controller: _description,
              minLines: 3,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: l10n.adjustWhatChange, hintText: l10n.adjustWhatChangeHint),
              onChanged: (_) => setState(() {}),
            ),
          ],
        ),
      PlanAction.deadline => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (project?.targetEndDate != null)
              Text(l10n.adjustCurrentDeadline(fmt.longDate(clock.toWallClock(project!.targetEndDate!))), style: text.bodyLarge),
            const SizedBox(height: Space.s),
            SparkCard(
              onTap: () async {
                final today = clock.today();
                final picked = await showSparkDatePicker(
                  context,
                  initial: (project?.targetEndDate == null ? today.addDays(30) : clock.dayOf(project!.targetEndDate!)).asDateTime,
                  first: today.addDays(1).asDateTime,
                  last: today.addDays(365 * 3).asDateTime,
                );
                if (picked != null) setState(() => _newDeadline = LocalDay.fromDateTime(picked));
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.flag_rounded, color: c.primary),
                  const SizedBox(width: Space.s),
                  Expanded(
                    child: Text(
                      _newDeadline == null ? l10n.adjustPickDeadline : '${l10n.adjustNewDeadline}: ${fmt.longDate(_newDeadline!.asDateTime)}',
                      style: text.titleMedium,
                    ),
                  ),
                  Icon(Icons.calendar_month_rounded, color: c.secondary),
                ],
              ),
            ),
          ],
        ),
      PlanAction.regenerate => Text(l10n.adjustRegenerateBody, style: text.bodyLarge),
      PlanAction.availability => slots == null
          ? const SkeletonList(itemCount: 3, shrinkWrap: true)
          : AvailabilityEditor(slots: slots, onChanged: (v) => setState(() => _slots = v)),
    };

    final canPreview = switch (_action) {
      PlanAction.adjust => _description.text.trim().isNotEmpty,
      PlanAction.deadline => _newDeadline != null,
      PlanAction.regenerate => true,
      PlanAction.availability => (slots ?? const <AvailabilitySlot>[]).isNotEmpty,
    };

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: <Widget>[
            for (final a in PlanAction.values)
              ChoiceChip(
                label: Text(switch (a) {
                  PlanAction.adjust => l10n.planActionAdjust,
                  PlanAction.availability => l10n.planActionAvailability,
                  PlanAction.deadline => l10n.planActionDeadline,
                  PlanAction.regenerate => l10n.planActionRegenerate,
                }),
                selected: _action == a,
                onSelected: (_) => _switch(a),
              ),
          ],
        ),
        const SizedBox(height: Space.m),
        Text(l10n.adjustIntro, style: text.bodyMedium),
        const SizedBox(height: Space.m),
        form,
        const SizedBox(height: Space.l),
        if (_proposal == null)
          SparkButton(
            key: const Key('adjust-preview'),
            label: _action == PlanAction.availability ? l10n.adjustSaveAvailability : l10n.adjustPreview,
            icon: Icons.preview_rounded,
            loading: _loading,
            expand: true,
            onPressed: canPreview ? _preview : null,
          ),
        if (_loading) ...<Widget>[
          const SizedBox(height: Space.m),
          Text(l10n.adjustLoadingPreview, textAlign: TextAlign.center, style: text.bodyMedium),
        ],
        if (_error != null) ErrorState(error: _error!, compact: true, onRetry: _preview),
        if (_info != null)
          Padding(
            padding: const EdgeInsets.only(top: Space.m),
            child: Row(
              children: <Widget>[
                Icon(Icons.check_circle_rounded, color: c.success),
                const SizedBox(width: Space.s),
                Expanded(child: Text(_info!, style: text.bodyMedium)),
              ],
            ),
          ),
        if (_proposal != null) ProposalReview(proposal: _proposal!, inline: true),
      ],
    );
  }
}
