// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The project the user just picked (for the celebration screen).

@ProviderFor(PendingSelection)
final pendingSelectionProvider = PendingSelectionProvider._();

/// The project the user just picked (for the celebration screen).
final class PendingSelectionProvider
    extends $NotifierProvider<PendingSelection, SelectProjectResult?> {
  /// The project the user just picked (for the celebration screen).
  PendingSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingSelectionHash();

  @$internal
  @override
  PendingSelection create() => PendingSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectProjectResult? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectProjectResult?>(value),
    );
  }
}

String _$pendingSelectionHash() => r'c8a09a18f17e00b5e8d2a7ec51beceae6524c330';

/// The project the user just picked (for the celebration screen).

abstract class _$PendingSelection extends $Notifier<SelectProjectResult?> {
  SelectProjectResult? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SelectProjectResult?, SelectProjectResult?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SelectProjectResult?, SelectProjectResult?>,
              SelectProjectResult?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
