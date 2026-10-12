// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Saved resources for the active project (live).

@ProviderFor(savedResources)
final savedResourcesProvider = SavedResourcesProvider._();

/// Saved resources for the active project (live).

final class SavedResourcesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SavedResource>>,
          List<SavedResource>,
          Stream<List<SavedResource>>
        >
    with
        $FutureModifier<List<SavedResource>>,
        $StreamProvider<List<SavedResource>> {
  /// Saved resources for the active project (live).
  SavedResourcesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedResourcesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedResourcesHash();

  @$internal
  @override
  $StreamProviderElement<List<SavedResource>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SavedResource>> create(Ref ref) {
    return savedResources(ref);
  }
}

String _$savedResourcesHash() => r'0b8361c922ed954184488c4cb9477509a56925f2';

/// URLs already saved (so cards show "Saved").

@ProviderFor(savedResourceUrls)
final savedResourceUrlsProvider = SavedResourceUrlsProvider._();

/// URLs already saved (so cards show "Saved").

final class SavedResourceUrlsProvider
    extends $FunctionalProvider<Set<String>, Set<String>, Set<String>>
    with $Provider<Set<String>> {
  /// URLs already saved (so cards show "Saved").
  SavedResourceUrlsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedResourceUrlsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedResourceUrlsHash();

  @$internal
  @override
  $ProviderElement<Set<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<String> create(Ref ref) {
    return savedResourceUrls(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$savedResourceUrlsHash() => r'29c55234c954b3f42d6d3190caf783f2c97fa889';

/// Resource URLs being saved right now.

@ProviderFor(SavingResources)
final savingResourcesProvider = SavingResourcesProvider._();

/// Resource URLs being saved right now.
final class SavingResourcesProvider
    extends $NotifierProvider<SavingResources, Set<String>> {
  /// Resource URLs being saved right now.
  SavingResourcesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savingResourcesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savingResourcesHash();

  @$internal
  @override
  SavingResources create() => SavingResources();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$savingResourcesHash() => r'05b2b7ebec630f2115cec62c3ff7e37bab40bcb1';

/// Resource URLs being saved right now.

abstract class _$SavingResources extends $Notifier<Set<String>> {
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
