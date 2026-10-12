import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/theme/spark_colors.dart';
import '../../../core/utils/l10n.dart';
import '../../../core/widgets/spark_button.dart';
import '../../../data/models/schedule.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/session_providers.dart';
import '../../../data/repositories/schedule_repository.dart';
import '../onboarding_frame.dart';
import '../onboarding_screen.dart';
import 'availability_editor.dart';

/// Weekly availability, saved with `setAvailability`.
class AvailabilityStep extends ConsumerStatefulWidget {
  const AvailabilityStep({super.key});

  @override
  ConsumerState<AvailabilityStep> createState() => _AvailabilityStepState();
}

class _AvailabilityStepState extends ConsumerState<AvailabilityStep> with StepSubmitMixin {
  List<AvailabilitySlot>? _slots;

  @override
  void initState() {
    super.initState();
    // Restore anything already saved (resuming onboarding).
    final uid = ref.read(currentUidProvider);
    if (uid != null) {
      ref.read(scheduleRepositoryProvider).watchAvailability(uid).first.then((saved) {
        if (mounted && _slots == null) setState(() => _slots = saved);
      }).catchError((Object _) {
        if (mounted && _slots == null) setState(() => _slots = const <AvailabilitySlot>[]);
      });
    }
  }

  Future<void> _save() async {
    final slots = _slots ?? const <AvailabilitySlot>[];
    await ref.read(scheduleRepositoryProvider).setAvailability(slots);
    await advanceStep(ref, OnboardingStep.availability, <String, Object?>{
      'weeklyMinutes': weeklyMinutes(slots),
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final slots = _slots;
    return OnboardingFrame(
      step: OnboardingStep.availability,
      title: l10n.availabilityTitle,
      subtitle: l10n.availabilityBody,
      primary: SparkButton(
        label: l10n.commonContinue,
        loading: busy,
        expand: true,
        onPressed: slots == null || slots.isEmpty ? null : () => submit(_save),
      ),
      secondary: slots != null && slots.isEmpty
          ? Text(
              l10n.availabilityNone,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: context.spark.textSecondary),
            )
          : null,
      child: slots == null
          ? const Center(child: CircularProgressIndicator())
          : AvailabilityEditor(slots: slots, onChanged: (v) => setState(() => _slots = v)),
    );
  }
}
