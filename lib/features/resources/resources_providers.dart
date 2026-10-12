import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/resources.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/resource_repository.dart';

part 'resources_providers.g.dart';

/// Saved resources for the active project (live).
@Riverpod(keepAlive: true)
Stream<List<SavedResource>> savedResources(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<List<SavedResource>>.value(const <SavedResource>[]);
  return ref.watch(resourceRepositoryProvider).watchSaved(uid, pid);
}

/// URLs already saved (so cards show "Saved").
@Riverpod(keepAlive: true)
Set<String> savedResourceUrls(Ref ref) =>
    (ref.watch(savedResourcesProvider).value ?? const <SavedResource>[]).map((s) => s.resource.url).toSet();

/// Resource URLs being saved right now.
@Riverpod(keepAlive: true)
class SavingResources extends _$SavingResources {
  @override
  Set<String> build() => const <String>{};

  /// Saves [resource] to the active project. Throws on failure.
  Future<void> save(ResourceItem resource) async {
    final pid = ref.read(activeProjectIdProvider);
    if (pid == null) return;
    state = <String>{...state, resource.url};
    try {
      await ref.read(resourceRepositoryProvider).saveResource(pid, resource);
    } finally {
      state = <String>{...state}..remove(resource.url);
    }
  }
}
