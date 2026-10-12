import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/routes.dart';
import '../../../core/utils/l10n.dart';
import '../../../core/widgets/spark_button.dart';
import '../../../data/models/user.dart';
import '../../../data/providers/session_providers.dart';
import '../../../data/repositories/user_repository.dart';
import '../../characters/character_picker.dart';
import '../onboarding_frame.dart';
import '../onboarding_screen.dart';

class CharacterStep extends ConsumerStatefulWidget {
  const CharacterStep({super.key});

  @override
  ConsumerState<CharacterStep> createState() => _CharacterStepState();
}

class _CharacterStepState extends ConsumerState<CharacterStep> with StepSubmitMixin {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(userProfileProvider).value?.characterId;
  }

  Future<void> _save() async {
    final id = _selected;
    if (id == null) return;
    await ref.read(userRepositoryProvider).setCharacter(id);
    await advanceStep(ref, OnboardingStep.character, <String, Object?>{'characterId': id});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OnboardingFrame(
      step: OnboardingStep.character,
      title: l10n.characterTitle,
      subtitle: l10n.characterBody,
      primary: SparkButton(
        label: l10n.commonContinue,
        loading: busy,
        expand: true,
        onPressed: _selected == null ? null : () => submit(_save),
      ),
      child: CharacterPicker(
        selectedId: _selected,
        onSelected: (c) => setState(() => _selected = c.id),
        onLockedTap: () => context.push(Routes.plans),
      ),
    );
  }
}
