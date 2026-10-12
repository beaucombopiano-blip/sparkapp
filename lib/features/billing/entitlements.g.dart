// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlements.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Streams `users/{uid}/private/entitlements`. Whenever it changes the ID
/// token is refreshed so Firestore/Storage rules see the new plan claim.

@ProviderFor(entitlements)
final entitlementsProvider = EntitlementsProvider._();

/// Streams `users/{uid}/private/entitlements`. Whenever it changes the ID
/// token is refreshed so Firestore/Storage rules see the new plan claim.

final class EntitlementsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Entitlements?>,
          Entitlements?,
          Stream<Entitlements?>
        >
    with $FutureModifier<Entitlements?>, $StreamProvider<Entitlements?> {
  /// Streams `users/{uid}/private/entitlements`. Whenever it changes the ID
  /// token is refreshed so Firestore/Storage rules see the new plan claim.
  EntitlementsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'entitlementsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$entitlementsHash();

  @$internal
  @override
  $StreamProviderElement<Entitlements?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Entitlements?> create(Ref ref) {
    return entitlements(ref);
  }
}

String _$entitlementsHash() => r'293c107dca0508828f4a244718e6ffcc918124e2';

/// True while every feature is unlocked (launch default `all_premium`).

@ProviderFor(allPremiumMode)
final allPremiumModeProvider = AllPremiumModeProvider._();

/// True while every feature is unlocked (launch default `all_premium`).

final class AllPremiumModeProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// True while every feature is unlocked (launch default `all_premium`).
  AllPremiumModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allPremiumModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allPremiumModeHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return allPremiumMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$allPremiumModeHash() => r'd58f65eb027306008cecb3339404fb67671120af';

/// The one entry point for plan checks in the UI.

@ProviderFor(hasFeature)
final hasFeatureProvider = HasFeatureFamily._();

/// The one entry point for plan checks in the UI.

final class HasFeatureProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// The one entry point for plan checks in the UI.
  HasFeatureProvider._({
    required HasFeatureFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'hasFeatureProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$hasFeatureHash();

  @override
  String toString() {
    return r'hasFeatureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return hasFeature(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HasFeatureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hasFeatureHash() => r'8d0c5a7c2831ecb53fdeb2b3659cfff568dbe89d';

/// The one entry point for plan checks in the UI.

final class HasFeatureFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  HasFeatureFamily._()
    : super(
        retry: null,
        name: r'hasFeatureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The one entry point for plan checks in the UI.

  HasFeatureProvider call(String feature) =>
      HasFeatureProvider._(argument: feature, from: this);

  @override
  String toString() => r'hasFeatureProvider';
}

/// Ads only for plans with adsEnabled, never in all_premium mode.

@ProviderFor(adsEnabled)
final adsEnabledProvider = AdsEnabledProvider._();

/// Ads only for plans with adsEnabled, never in all_premium mode.

final class AdsEnabledProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Ads only for plans with adsEnabled, never in all_premium mode.
  AdsEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adsEnabledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adsEnabledHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return adsEnabled(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$adsEnabledHash() => r'134b2c0418f3e09d8f0ca620addf2ac0a38c7d32';
