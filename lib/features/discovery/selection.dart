import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/discovery.dart';
import '../../data/models/user.dart';
import '../../data/repositories/discovery_repository.dart';
import '../onboarding/onboarding_frame.dart';

part 'selection.g.dart';

/// The project the user just picked (for the celebration screen).
@Riverpod(keepAlive: true)
class PendingSelection extends _$PendingSelection {
  @override
  SelectProjectResult? build() => null;

  void set(SelectProjectResult? result) => state = result;
}

/// Creates the project (selectProject), remembers it for the celebration and
/// moves onboarding forward. The router follows the server step.
Future<void> confirmSelection(
  WidgetRef ref, {
  required OnboardingStep fromStep,
  required Future<SelectProjectResult> Function(DiscoveryRepository repo) select,
}) async {
  final result = await select(ref.read(discoveryRepositoryProvider));
  ref.read(pendingSelectionProvider.notifier).set(result);
  await advanceStep(ref, fromStep, <String, Object?>{'projectId': result.project.id});
}
