import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../data/models/billing.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/integrations_repository.dart';

part 'billing_service.g.dart';

/// Thin wrapper around RevenueCat. appUserID is always the Firebase uid, so the
/// backend's webhook ties purchases to the right account. The app never marks
/// a plan as active itself: it waits for the entitlements document.
class BillingService {
  bool _configured = false;
  String? _appUserId;

  String? get _apiKey {
    if (kIsWeb) return AppConfig.revenueCatWebKey.isEmpty ? null : AppConfig.revenueCatWebKey;
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS || TargetPlatform.macOS => AppConfig.revenueCatAppleKey.isEmpty ? null : AppConfig.revenueCatAppleKey,
      TargetPlatform.android => AppConfig.revenueCatGoogleKey.isEmpty ? null : AppConfig.revenueCatGoogleKey,
      _ => null,
    };
  }

  bool get available => _apiKey != null;

  Future<void> ensureConfigured(String uid) async {
    final key = _apiKey;
    if (key == null) throw const AppException(kind: AppErrorKind.notConfigured, code: 'revenuecat-key-missing');
    try {
      if (!_configured) {
        await Purchases.configure(PurchasesConfiguration(key)..appUserID = uid);
        _configured = true;
        _appUserId = uid;
      } else if (_appUserId != uid) {
        await Purchases.logIn(uid);
        _appUserId = uid;
      }
    } on PlatformException catch (e) {
      throw _map(e);
    }
  }

  Future<Offerings> offerings(String uid) async {
    await ensureConfigured(uid);
    try {
      return await Purchases.getOfferings();
    } on PlatformException catch (e) {
      throw _map(e);
    }
  }

  /// Starts the store purchase sheet. Only called from a button that shows
  /// the price and billing terms.
  Future<void> purchase(String uid, Package package) async {
    await ensureConfigured(uid);
    try {
      await Purchases.purchase(PurchaseParams.package(package));
    } on PlatformException catch (e) {
      throw _map(e);
    }
  }

  Future<void> restore(String uid) async {
    await ensureConfigured(uid);
    try {
      await Purchases.restorePurchases();
    } on PlatformException catch (e) {
      throw _map(e);
    }
  }

  /// The store's subscription management page.
  Future<String?> managementUrl(String uid) async {
    await ensureConfigured(uid);
    try {
      return (await Purchases.getCustomerInfo()).managementURL;
    } on PlatformException catch (e) {
      throw _map(e);
    }
  }

  static AppException _map(PlatformException e) {
    final code = PurchasesErrorHelper.getErrorCode(e);
    if (code == PurchasesErrorCode.purchaseCancelledError) {
      return AppException(kind: AppErrorKind.cancelled, code: code.name, cause: e);
    }
    final network = code == PurchasesErrorCode.networkError || code == PurchasesErrorCode.offlineConnectionError;
    return AppException(
      kind: network ? AppErrorKind.network : AppErrorKind.unknown,
      message: e.message,
      code: code.name,
      retryable: true,
      cause: e,
    );
  }
}

@Riverpod(keepAlive: true)
BillingService billingService(Ref ref) => BillingService();

@riverpod
Future<PlanCatalog> planCatalog(Ref ref) => ref.read(integrationsRepositoryProvider).getPlanCatalog();

/// RevenueCat offerings (real prices from the store), or null when purchases
/// aren't available on this platform/build.
@riverpod
Future<Offerings?> storeOfferings(Ref ref) async {
  final uid = ref.watch(currentUidProvider);
  final billing = ref.read(billingServiceProvider);
  if (uid == null || !billing.available) return null;
  return billing.offerings(uid);
}

/// Finds the store package for a plan: its own offering when the catalog
/// names one, else a package in the current offering whose identifier
/// contains the plan key.
Package? packageForPlan(BillingPlan plan, Offerings? offerings) {
  if (offerings == null) return null;
  final offering = plan.offeringId != null ? offerings.all[plan.offeringId] : offerings.current;
  if (offering == null) return null;
  final packages = offering.availablePackages;
  if (plan.offeringId != null) return offering.monthly ?? packages.firstOrNull;
  return packages.where((p) => p.identifier.toLowerCase().contains(plan.key.toLowerCase())).firstOrNull ??
      packages.where((p) => p.storeProduct.identifier.toLowerCase().contains(plan.key.toLowerCase())).firstOrNull;
}
