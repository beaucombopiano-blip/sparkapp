// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_overlay.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tutorialKeys)
final tutorialKeysProvider = TutorialKeysProvider._();

final class TutorialKeysProvider
    extends $FunctionalProvider<TutorialKeys, TutorialKeys, TutorialKeys>
    with $Provider<TutorialKeys> {
  TutorialKeysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tutorialKeysProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tutorialKeysHash();

  @$internal
  @override
  $ProviderElement<TutorialKeys> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TutorialKeys create(Ref ref) {
    return tutorialKeys(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TutorialKeys value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TutorialKeys>(value),
    );
  }
}

String _$tutorialKeysHash() => r'679851186c14153971220fd4515a750b4bead493';

/// Replay requested from Settings → Help.

@ProviderFor(TutorialReplay)
final tutorialReplayProvider = TutorialReplayProvider._();

/// Replay requested from Settings → Help.
final class TutorialReplayProvider
    extends $NotifierProvider<TutorialReplay, bool> {
  /// Replay requested from Settings → Help.
  TutorialReplayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tutorialReplayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tutorialReplayHash();

  @$internal
  @override
  TutorialReplay create() => TutorialReplay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$tutorialReplayHash() => r'6d18b7bd4de2da5fbf7cd3afb0c47bd3bbd3d1aa';

/// Replay requested from Settings → Help.

abstract class _$TutorialReplay extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
