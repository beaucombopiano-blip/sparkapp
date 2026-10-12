// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shell_support.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One scroll controller per tab root, so re-tapping the active tab scrolls
/// to the top.

@ProviderFor(tabScrollController)
final tabScrollControllerProvider = TabScrollControllerFamily._();

/// One scroll controller per tab root, so re-tapping the active tab scrolls
/// to the top.

final class TabScrollControllerProvider
    extends
        $FunctionalProvider<
          ScrollController,
          ScrollController,
          ScrollController
        >
    with $Provider<ScrollController> {
  /// One scroll controller per tab root, so re-tapping the active tab scrolls
  /// to the top.
  TabScrollControllerProvider._({
    required TabScrollControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'tabScrollControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tabScrollControllerHash();

  @override
  String toString() {
    return r'tabScrollControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ScrollController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScrollController create(Ref ref) {
    final argument = this.argument as int;
    return tabScrollController(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScrollController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScrollController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TabScrollControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tabScrollControllerHash() =>
    r'88372409d06bde18f9681049014ff7f681d97823';

/// One scroll controller per tab root, so re-tapping the active tab scrolls
/// to the top.

final class TabScrollControllerFamily extends $Family
    with $FunctionalFamilyOverride<ScrollController, int> {
  TabScrollControllerFamily._()
    : super(
        retry: null,
        name: r'tabScrollControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// One scroll controller per tab root, so re-tapping the active tab scrolls
  /// to the top.

  TabScrollControllerProvider call(int tabIndex) =>
      TabScrollControllerProvider._(argument: tabIndex, from: this);

  @override
  String toString() => r'tabScrollControllerProvider';
}

/// Live connectivity (true when any network is available).

@ProviderFor(isOnline)
final isOnlineProvider = IsOnlineProvider._();

/// Live connectivity (true when any network is available).

final class IsOnlineProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Live connectivity (true when any network is available).
  IsOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOnlineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOnlineHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isOnline(ref);
  }
}

String _$isOnlineHash() => r'47ca53d94fd362605b2aa099ef67a679fb9dc01f';
