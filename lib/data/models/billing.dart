import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing.freezed.dart';
part 'billing.g.dart';

/// `getPlanCatalog` plan. Prices are never stored here: they come from the
/// store via RevenueCat offerings at runtime.
@freezed
abstract class BillingPlan with _$BillingPlan {
  const factory BillingPlan({
    required String key,
    @Default('') String name,
    @Default(0) int rank,
    @Default(0) int trialDays,
    @Default(<String>[]) List<String> features,
    @Default(false) bool adsEnabled,
    String? description,

    /// RevenueCat offering identifier for this plan (falls back to the
    /// current offering's package whose identifier contains [key]).
    String? offeringId,
  }) = _BillingPlan;

  factory BillingPlan.fromJson(Map<String, dynamic> json) => _$BillingPlanFromJson(json);
}

@freezed
abstract class BillingFeature with _$BillingFeature {
  const factory BillingFeature({
    required String key,
    @Default('') String name,
    String? description,
  }) = _BillingFeature;

  factory BillingFeature.fromJson(Map<String, dynamic> json) => _$BillingFeatureFromJson(json);
}

@freezed
abstract class PlanCatalog with _$PlanCatalog {
  const factory PlanCatalog({
    @Default(<BillingPlan>[]) List<BillingPlan> plans,
    @Default(<BillingFeature>[]) List<BillingFeature> features,
    String? cancellationTerms,
  }) = _PlanCatalog;

  factory PlanCatalog.fromJson(Map<String, dynamic> json) => _$PlanCatalogFromJson(json);
}
