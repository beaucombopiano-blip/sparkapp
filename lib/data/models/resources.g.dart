// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResourceMetrics _$ResourceMetricsFromJson(Map<String, dynamic> json) =>
    _ResourceMetrics(
      viewCount: (json['viewCount'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      citationCount: (json['citationCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResourceMetricsToJson(_ResourceMetrics instance) =>
    <String, dynamic>{
      'viewCount': ?instance.viewCount,
      'likeCount': ?instance.likeCount,
      'citationCount': ?instance.citationCount,
    };

_ResourceItem _$ResourceItemFromJson(Map<String, dynamic> json) =>
    _ResourceItem(
      id: json['id'] as String?,
      type:
          $enumDecodeNullable(
            _$ResourceTypeEnumMap,
            json['type'],
            unknownValue: ResourceType.unknown,
          ) ??
          ResourceType.article,
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      sourceName: json['sourceName'] as String?,
      url: json['url'] as String? ?? '',
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      channel: json['channel'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      year: (json['year'] as num?)?.toInt(),
      venue: json['venue'] as String?,
      metrics: json['metrics'] == null
          ? null
          : ResourceMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$ResourceItemToJson(_ResourceItem instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': ?instance.description,
      'sourceName': ?instance.sourceName,
      'url': instance.url,
      'durationSeconds': ?instance.durationSeconds,
      'thumbnailUrl': ?instance.thumbnailUrl,
      'channel': ?instance.channel,
      'authors': instance.authors,
      'year': ?instance.year,
      'venue': ?instance.venue,
      'metrics': ?instance.metrics?.toJson(),
      'categoryId': ?instance.categoryId,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.video: 'video',
  ResourceType.paper: 'paper',
  ResourceType.article: 'article',
  ResourceType.tool: 'tool',
  ResourceType.course: 'course',
  ResourceType.unknown: 'unknown',
};

_ResourceCategory _$ResourceCategoryFromJson(Map<String, dynamic> json) =>
    _ResourceCategory(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ResourceCategoryToJson(_ResourceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'icon': ?instance.icon,
      'order': instance.order,
    };

_ResourceResults _$ResourceResultsFromJson(Map<String, dynamic> json) =>
    _ResourceResults(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ResourceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ResourceItem>[],
      query: json['query'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ResourceResultsToJson(_ResourceResults instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'query': ?instance.query,
      'note': ?instance.note,
    };

_Opportunity _$OpportunityFromJson(Map<String, dynamic> json) => _Opportunity(
  id: json['id'] as String?,
  title: json['title'] as String? ?? '',
  organization: json['organization'] as String?,
  description: json['description'] as String?,
  type: json['type'] as String? ?? 'community org',
  eligibility: json['eligibility'] as String?,
  ageRange: json['ageRange'] as String?,
  locationCity: json['locationCity'] as String?,
  locationRegion: json['locationRegion'] as String?,
  locationCountry: json['locationCountry'] as String?,
  isRemote: json['isRemote'] as bool? ?? false,
  deadline: json['deadline'] == null
      ? null
      : DateTime.parse(json['deadline'] as String),
  url: json['url'] as String?,
  label:
      $enumDecodeNullable(
        _$OpportunityLabelEnumMap,
        json['label'],
        unknownValue: OpportunityLabel.aiSuggestion,
      ) ??
      OpportunityLabel.aiSuggestion,
  verifiedAt: json['verifiedAt'] == null
      ? null
      : DateTime.parse(json['verifiedAt'] as String),
);

Map<String, dynamic> _$OpportunityToJson(_Opportunity instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'title': instance.title,
      'organization': ?instance.organization,
      'description': ?instance.description,
      'type': instance.type,
      'eligibility': ?instance.eligibility,
      'ageRange': ?instance.ageRange,
      'locationCity': ?instance.locationCity,
      'locationRegion': ?instance.locationRegion,
      'locationCountry': ?instance.locationCountry,
      'isRemote': instance.isRemote,
      'deadline': ?instance.deadline?.toIso8601String(),
      'url': ?instance.url,
      'label': _$OpportunityLabelEnumMap[instance.label]!,
      'verifiedAt': ?instance.verifiedAt?.toIso8601String(),
    };

const _$OpportunityLabelEnumMap = {
  OpportunityLabel.verified: 'verified',
  OpportunityLabel.foundOnline: 'foundOnline',
  OpportunityLabel.aiSuggestion: 'aiSuggestion',
};

_OpportunityResults _$OpportunityResultsFromJson(Map<String, dynamic> json) =>
    _OpportunityResults(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Opportunity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Opportunity>[],
      outreachTemplate: json['outreachTemplate'] as String?,
      searchStrategies:
          (json['searchStrategies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$OpportunityResultsToJson(_OpportunityResults instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'outreachTemplate': ?instance.outreachTemplate,
      'searchStrategies': instance.searchStrategies,
    };
