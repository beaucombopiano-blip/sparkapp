// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillingPlan _$BillingPlanFromJson(Map<String, dynamic> json) => _BillingPlan(
  key: json['key'] as String,
  name: json['name'] as String? ?? '',
  rank: (json['rank'] as num?)?.toInt() ?? 0,
  trialDays: (json['trialDays'] as num?)?.toInt() ?? 0,
  features:
      (json['features'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  adsEnabled: json['adsEnabled'] as bool? ?? false,
  description: json['description'] as String?,
  offeringId: json['offeringId'] as String?,
);

Map<String, dynamic> _$BillingPlanToJson(_BillingPlan instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'rank': instance.rank,
      'trialDays': instance.trialDays,
      'features': instance.features,
      'adsEnabled': instance.adsEnabled,
      'description': ?instance.description,
      'offeringId': ?instance.offeringId,
    };

_BillingFeature _$BillingFeatureFromJson(Map<String, dynamic> json) =>
    _BillingFeature(
      key: json['key'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BillingFeatureToJson(_BillingFeature instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'description': ?instance.description,
    };

_PlanCatalog _$PlanCatalogFromJson(Map<String, dynamic> json) => _PlanCatalog(
  plans:
      (json['plans'] as List<dynamic>?)
          ?.map((e) => BillingPlan.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BillingPlan>[],
  features:
      (json['features'] as List<dynamic>?)
          ?.map((e) => BillingFeature.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BillingFeature>[],
  cancellationTerms: json['cancellationTerms'] as String?,
);

Map<String, dynamic> _$PlanCatalogToJson(_PlanCatalog instance) =>
    <String, dynamic>{
      'plans': instance.plans.map((e) => e.toJson()).toList(),
      'features': instance.features.map((e) => e.toJson()).toList(),
      'cancellationTerms': ?instance.cancellationTerms,
    };
