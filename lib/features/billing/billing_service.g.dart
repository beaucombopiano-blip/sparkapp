// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(billingService)
final billingServiceProvider = BillingServiceProvider._();

final class BillingServiceProvider
    extends $FunctionalProvider<BillingService, BillingService, BillingService>
    with $Provider<BillingService> {
  BillingServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'billingServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$billingServiceHash();

  @$internal
  @override
  $ProviderElement<BillingService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BillingService create(Ref ref) {
    return billingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BillingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BillingService>(value),
    );
  }
}

String _$billingServiceHash() => r'c240b80fc38d4f7a1aac3602b0e33200951278d0';

@ProviderFor(planCatalog)
final planCatalogProvider = PlanCatalogProvider._();

final class PlanCatalogProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlanCatalog>,
          PlanCatalog,
          FutureOr<PlanCatalog>
        >
    with $FutureModifier<PlanCatalog>, $FutureProvider<PlanCatalog> {
  PlanCatalogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planCatalogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planCatalogHash();

  @$internal
  @override
  $FutureProviderElement<PlanCatalog> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlanCatalog> create(Ref ref) {
    return planCatalog(ref);
  }
}

String _$planCatalogHash() => r'658b675a883d6426a127e340162f0956907a51ce';

/// RevenueCat offerings (real prices from the store), or null when purchases
/// aren't available on this platform/build.

@ProviderFor(storeOfferings)
final storeOfferingsProvider = StoreOfferingsProvider._();

/// RevenueCat offerings (real prices from the store), or null when purchases
/// aren't available on this platform/build.

final class StoreOfferingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Offerings?>,
          Offerings?,
          FutureOr<Offerings?>
        >
    with $FutureModifier<Offerings?>, $FutureProvider<Offerings?> {
  /// RevenueCat offerings (real prices from the store), or null when purchases
  /// aren't available on this platform/build.
  StoreOfferingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeOfferingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeOfferingsHash();

  @$internal
  @override
  $FutureProviderElement<Offerings?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Offerings?> create(Ref ref) {
    return storeOfferings(ref);
  }
}

String _$storeOfferingsHash() => r'f4ada224493211249dc584a1cc846b7d344459dc';
