import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/theme/spark_colors.dart';
import '../../../app/theme/tokens.dart';
import '../../../core/utils/l10n.dart';
import '../../../core/widgets/pickers.dart';
import '../../../core/widgets/spark_button.dart';
import '../../../core/widgets/spark_card.dart';
import '../../../core/widgets/spark_chip.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/session_providers.dart';
import '../onboarding_frame.dart';
import '../onboarding_screen.dart';

/// Next end of school year (June 15) after [today].
DateTime endOfSchoolYear(DateTime today) {
  final thisYear = DateTime(today.year, 6, 15);
  return today.isBefore(thisYear.subtract(const Duration(days: 7))) ? thisYear : DateTime(today.year + 1, 6, 15);
}

/// Deadline picker: calendar (min 7 days out) plus quick picks.
class DeadlineStep extends ConsumerStatefulWidget {
  const DeadlineStep({super.key});

  @override
  ConsumerState<DeadlineStep> createState() => _DeadlineStepState();
}

class _DeadlineStepState extends ConsumerState<DeadlineStep> with StepSubmitMixin {
  DateTime? _date;

  DateTime get _today => ref.read(userClockProvider).today().asDateTime;
  DateTime get _minDate => _today.add(const Duration(days: 7));

  void _quick(int months) {
    final t = _today;
    setState(() => _date = DateTime(t.year, t.month + months, t.day));
  }

  Future<void> _pick() async {
    final picked = await showSparkDatePicker(
      context,
      initial: _date ?? DateTime(_today.year, _today.month + 3, _today.day),
      first: _minDate,
      last: DateTime(_today.year + 3, _today.month, _today.day),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _save() async {
    final date = _date;
    if (date == null) return;
    final clock = ref.read(userClockProvider);
    final projectId = ref.read(activeProjectIdProvider);
    // End of the chosen local day, as a UTC instant.
    final endOfDay = clock.toUtc(DateTime(date.year, date.month, date.day, 23, 59));
    await advanceStep(ref, OnboardingStep.deadline, <String, Object?>{
      'projectId': ?projectId,
      'targetEndDate': endOfDay.toIso8601String(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final school = endOfSchoolYear(_today);
    final tooSoon = _date != null && _date!.isBefore(_minDate);

    bool isSelected(DateTime d) =>
        _date != null && _date!.year == d.year && _date!.month == d.month && _date!.day == d.day;
    DateTime months(int m) => DateTime(_today.year, _today.month + m, _today.day);

    return OnboardingFrame(
      step: OnboardingStep.deadline,
      title: l10n.deadlineTitle,
      subtitle: l10n.deadlineBody,
      primary: SparkButton(
        label: l10n.commonContinue,
        loading: busy,
        expand: true,
        onPressed: _date == null || tooSoon ? null : () => submit(_save),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Wrap(
            spacing: Space.s,
            runSpacing: Space.s,
            children: <Widget>[
              SparkChip(label: l10n.deadlineOneMonth, selected: isSelected(months(1)), onTap: () => _quick(1)),
              SparkChip(label: l10n.deadlineThreeMonths, selected: isSelected(months(3)), onTap: () => _quick(3)),
              SparkChip(label: l10n.deadlineSixMonths, selected: isSelected(months(6)), onTap: () => _quick(6)),
              SparkChip(
                label: l10n.deadlineSchoolYear,
                selected: isSelected(school),
                onTap: () => setState(() => _date = school),
              ),
            ],
          ),
          const SizedBox(height: Space.l),
          SparkCard(
            onTap: _pick,
            semanticLabel: l10n.deadlinePick,
            child: Row(
              children: <Widget>[
                Icon(Icons.flag_rounded, color: c.primary, size: 32),
                const SizedBox(width: Space.m),
                Expanded(
                  child: Text(
                    _date == null ? l10n.deadlinePick : l10n.deadlineSelected(fmt.longDate(_date!)),
                    style: text.titleMedium,
                  ),
                ),
                Icon(Icons.calendar_month_rounded, color: c.secondary),
              ],
            ),
          ),
          if (tooSoon) ...<Widget>[
            const SizedBox(height: Space.s),
            Text(l10n.deadlineTooSoon, style: text.bodyMedium?.copyWith(color: c.danger)),
          ],
        ],
      ),
    );
  }
}
