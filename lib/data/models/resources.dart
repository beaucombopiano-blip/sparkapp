import 'package:freezed_annotation/freezed_annotation.dart';

part 'resources.freezed.dart';
part 'resources.g.dart';

enum ResourceType { video, paper, article, tool, course, unknown }

@freezed
abstract class ResourceMetrics with _$ResourceMetrics {
  const factory ResourceMetrics({
    int? viewCount,
    int? likeCount,
    int? citationCount,
  }) = _ResourceMetrics;

  factory ResourceMetrics.fromJson(Map<String, dynamic> json) => _$ResourceMetricsFromJson(json);
}

/// A real, link-checked resource returned by `recommendResources` or attached
/// to a companion reply. Metrics are present only when an API returned them.
@freezed
abstract class ResourceItem with _$ResourceItem {
  const factory ResourceItem({
    String? id,
    @JsonKey(unknownEnumValue: ResourceType.unknown) @Default(ResourceType.article) ResourceType type,
    @Default('') String title,
    String? description,
    String? sourceName,
    @Default('') String url,
    int? durationSeconds,
    String? thumbnailUrl,
    String? channel,
    @Default(<String>[]) List<String> authors,
    int? year,
    String? venue,
    ResourceMetrics? metrics,
    String? categoryId,
  }) = _ResourceItem;

  factory ResourceItem.fromJson(Map<String, dynamic> json) => _$ResourceItemFromJson(json);
}

/// `users/{uid}/projects/{pid}/savedResources/{id}`.
@freezed
abstract class SavedResource with _$SavedResource {
  const factory SavedResource({
    required String id,
    required ResourceItem resource,
    String? note,
    DateTime? savedAt,
  }) = _SavedResource;

  /// Accepts both `{resource: {...}, note}` and a flattened resource document.
  factory SavedResource.fromJson(Map<String, dynamic> json) {
    final nested = json['resource'];
    final resourceJson = nested is Map<String, dynamic> ? nested : json;
    return SavedResource(
      id: json['id'] as String,
      resource: ResourceItem.fromJson(resourceJson),
      note: json['note'] as String?,
      savedAt: json['savedAt'] is String ? DateTime.tryParse(json['savedAt'] as String) : null,
    );
  }
}

/// `resourceCategories/{id}` (seeded).
@freezed
abstract class ResourceCategory with _$ResourceCategory {
  const factory ResourceCategory({
    required String id,
    @Default('') String name,
    String? description,
    String? icon,
    @Default(0) int order,
  }) = _ResourceCategory;

  factory ResourceCategory.fromJson(Map<String, dynamic> json) => _$ResourceCategoryFromJson(json);
}

/// `recommendResources` result.
@freezed
abstract class ResourceResults with _$ResourceResults {
  const factory ResourceResults({
    @Default(<ResourceItem>[]) List<ResourceItem> items,
    String? query,
    String? note,
  }) = _ResourceResults;

  factory ResourceResults.fromJson(Map<String, dynamic> json) => _$ResourceResultsFromJson(json);
}

enum OpportunityLabel { verified, foundOnline, aiSuggestion }

/// An opportunity from `findOpportunities` or `opportunities/{id}`.
@freezed
abstract class Opportunity with _$Opportunity {
  const Opportunity._();

  const factory Opportunity({
    String? id,
    @Default('') String title,
    String? organization,
    String? description,
    @Default('community org') String type,
    String? eligibility,
    String? ageRange,
    String? locationCity,
    String? locationRegion,
    String? locationCountry,
    @Default(false) bool isRemote,
    DateTime? deadline,
    String? url,
    @JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion)
    @Default(OpportunityLabel.aiSuggestion)
    OpportunityLabel label,
    DateTime? verifiedAt,
  }) = _Opportunity;

  factory Opportunity.fromJson(Map<String, dynamic> json) => _$OpportunityFromJson(json);

  bool get isAiSuggestion => label == OpportunityLabel.aiSuggestion;

  String? get locationText {
    final parts = <String>[
      if (locationCity != null && locationCity!.isNotEmpty) locationCity!,
      if (locationRegion != null && locationRegion!.isNotEmpty) locationRegion!,
      if (locationCountry != null && locationCountry!.isNotEmpty) locationCountry!,
    ];
    return parts.isEmpty ? null : parts.join(', ');
  }
}

@freezed
abstract class OpportunityResults with _$OpportunityResults {
  const factory OpportunityResults({
    @Default(<Opportunity>[]) List<Opportunity> items,
    String? outreachTemplate,
    @Default(<String>[]) List<String> searchStrategies,
  }) = _OpportunityResults;

  factory OpportunityResults.fromJson(Map<String, dynamic> json) => _$OpportunityResultsFromJson(json);
}
