// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_completion.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Task ids with a completeTask call in flight. Every TaskTile (dashboard,
/// project tab, agenda, task detail, focus mode) reads this same provider.

@ProviderFor(TaskCompletion)
final taskCompletionProvider = TaskCompletionProvider._();

/// Task ids with a completeTask call in flight. Every TaskTile (dashboard,
/// project tab, agenda, task detail, focus mode) reads this same provider.
final class TaskCompletionProvider
    extends $NotifierProvider<TaskCompletion, Set<String>> {
  /// Task ids with a completeTask call in flight. Every TaskTile (dashboard,
  /// project tab, agenda, task detail, focus mode) reads this same provider.
  TaskCompletionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskCompletionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskCompletionHash();

  @$internal
  @override
  TaskCompletion create() => TaskCompletion();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$taskCompletionHash() => r'f0717ca8d3d305d65dccf9d3dee999bef470cfd3';

/// Task ids with a completeTask call in flight. Every TaskTile (dashboard,
/// project tab, agenda, task detail, focus mode) reads this same provider.

abstract class _$TaskCompletion extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
