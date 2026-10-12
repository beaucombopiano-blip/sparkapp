// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) =>
    _JournalEntry(
      id: json['id'] as String,
      projectId: json['projectId'] as String?,
      taskId: json['taskId'] as String?,
      milestoneId: json['milestoneId'] as String?,
      entryDate: json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
      mediaPath: json['mediaPath'] as String?,
      previewPath: json['previewPath'] as String?,
      mediaType:
          $enumDecodeNullable(
            _$JournalMediaTypeEnumMap,
            json['mediaType'],
            unknownValue: JournalMediaType.none,
          ) ??
          JournalMediaType.none,
      caption: json['caption'] as String?,
      status:
          $enumDecodeNullable(
            _$JournalEntryStatusEnumMap,
            json['status'],
            unknownValue: JournalEntryStatus.unknown,
          ) ??
          JournalEntryStatus.processing,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$JournalEntryToJson(_JournalEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': ?instance.projectId,
      'taskId': ?instance.taskId,
      'milestoneId': ?instance.milestoneId,
      'entryDate': ?instance.entryDate?.toIso8601String(),
      'mediaPath': ?instance.mediaPath,
      'previewPath': ?instance.previewPath,
      'mediaType': _$JournalMediaTypeEnumMap[instance.mediaType]!,
      'caption': ?instance.caption,
      'status': _$JournalEntryStatusEnumMap[instance.status]!,
      'deletedAt': ?instance.deletedAt?.toIso8601String(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

const _$JournalMediaTypeEnumMap = {
  JournalMediaType.image: 'image',
  JournalMediaType.pdf: 'pdf',
  JournalMediaType.none: 'none',
};

const _$JournalEntryStatusEnumMap = {
  JournalEntryStatus.pendingUpload: 'pendingUpload',
  JournalEntryStatus.processing: 'processing',
  JournalEntryStatus.ready: 'ready',
  JournalEntryStatus.failed: 'failed',
  JournalEntryStatus.unknown: 'unknown',
};

_JournalTimelineItem _$JournalTimelineItemFromJson(Map<String, dynamic> json) =>
    _JournalTimelineItem(
      kind:
          $enumDecodeNullable(
            _$TimelineItemKindEnumMap,
            json['kind'],
            unknownValue: TimelineItemKind.unknown,
          ) ??
          TimelineItemKind.entry,
      id: json['id'] as String? ?? '',
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
      entryId: json['entryId'] as String?,
      caption: json['caption'] as String?,
      mediaType: $enumDecodeNullable(
        _$JournalMediaTypeEnumMap,
        json['mediaType'],
        unknownValue: JournalMediaType.none,
      ),
      mediaUrl: json['mediaUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      taskId: json['taskId'] as String?,
      taskTitle: json['taskTitle'] as String?,
      milestoneId: json['milestoneId'] as String?,
      milestoneTitle: json['milestoneTitle'] as String?,
      title: json['title'] as String?,
      badgeKey: json['badgeKey'] as String?,
      status: $enumDecodeNullable(
        _$JournalEntryStatusEnumMap,
        json['status'],
        unknownValue: JournalEntryStatus.unknown,
      ),
    );

Map<String, dynamic> _$JournalTimelineItemToJson(
  _JournalTimelineItem instance,
) => <String, dynamic>{
  'kind': _$TimelineItemKindEnumMap[instance.kind]!,
  'id': instance.id,
  'date': ?instance.date?.toIso8601String(),
  'entryId': ?instance.entryId,
  'caption': ?instance.caption,
  'mediaType': ?_$JournalMediaTypeEnumMap[instance.mediaType],
  'mediaUrl': ?instance.mediaUrl,
  'thumbnailUrl': ?instance.thumbnailUrl,
  'taskId': ?instance.taskId,
  'taskTitle': ?instance.taskTitle,
  'milestoneId': ?instance.milestoneId,
  'milestoneTitle': ?instance.milestoneTitle,
  'title': ?instance.title,
  'badgeKey': ?instance.badgeKey,
  'status': ?_$JournalEntryStatusEnumMap[instance.status],
};

const _$TimelineItemKindEnumMap = {
  TimelineItemKind.entry: 'entry',
  TimelineItemKind.milestone: 'milestone',
  TimelineItemKind.badge: 'badge',
  TimelineItemKind.unknown: 'unknown',
};

_JournalTimeline _$JournalTimelineFromJson(Map<String, dynamic> json) =>
    _JournalTimeline(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => JournalTimelineItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <JournalTimelineItem>[],
      urlsExpireAt: json['urlsExpireAt'] == null
          ? null
          : DateTime.parse(json['urlsExpireAt'] as String),
    );

Map<String, dynamic> _$JournalTimelineToJson(_JournalTimeline instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'urlsExpireAt': ?instance.urlsExpireAt?.toIso8601String(),
    };

_JournalUploadTarget _$JournalUploadTargetFromJson(Map<String, dynamic> json) =>
    _JournalUploadTarget(
      entryId: json['entryId'] as String,
      uploadPath: json['uploadPath'] as String,
      previewUploadPath: json['previewUploadPath'] as String?,
    );

Map<String, dynamic> _$JournalUploadTargetToJson(
  _JournalUploadTarget instance,
) => <String, dynamic>{
  'entryId': instance.entryId,
  'uploadPath': instance.uploadPath,
  'previewUploadPath': ?instance.previewUploadPath,
};

_CollageItem _$CollageItemFromJson(Map<String, dynamic> json) => _CollageItem(
  type:
      $enumDecodeNullable(
        _$CollageItemTypeEnumMap,
        json['type'],
        unknownValue: CollageItemType.unknown,
      ) ??
      CollageItemType.photo,
  x: (json['x'] as num?)?.toDouble() ?? 0,
  y: (json['y'] as num?)?.toDouble() ?? 0,
  w: (json['w'] as num?)?.toDouble() ?? 0.3,
  h: (json['h'] as num?)?.toDouble() ?? 0.3,
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0,
  z: (json['z'] as num?)?.toInt() ?? 0,
  mediaPath: json['mediaPath'] as String?,
  entryId: json['entryId'] as String?,
  text: json['text'] as String?,
  colorToken: json['colorToken'] as String?,
);

Map<String, dynamic> _$CollageItemToJson(_CollageItem instance) =>
    <String, dynamic>{
      'type': _$CollageItemTypeEnumMap[instance.type]!,
      'x': instance.x,
      'y': instance.y,
      'w': instance.w,
      'h': instance.h,
      'rotation': instance.rotation,
      'z': instance.z,
      'mediaPath': ?instance.mediaPath,
      'entryId': ?instance.entryId,
      'text': ?instance.text,
      'colorToken': ?instance.colorToken,
    };

const _$CollageItemTypeEnumMap = {
  CollageItemType.photo: 'photo',
  CollageItemType.tape: 'tape',
  CollageItemType.caption: 'caption',
  CollageItemType.badge: 'badge',
  CollageItemType.milestone: 'milestone',
  CollageItemType.title: 'title',
  CollageItemType.unknown: 'unknown',
};

_CollagePage _$CollagePageFromJson(Map<String, dynamic> json) => _CollagePage(
  aspectRatio: (json['aspectRatio'] as num?)?.toDouble() ?? 0.75,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CollageItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CollageItem>[],
);

Map<String, dynamic> _$CollagePageToJson(_CollagePage instance) =>
    <String, dynamic>{
      'aspectRatio': instance.aspectRatio,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_CollageLayout _$CollageLayoutFromJson(Map<String, dynamic> json) =>
    _CollageLayout(
      pages:
          (json['pages'] as List<dynamic>?)
              ?.map((e) => CollagePage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CollagePage>[],
    );

Map<String, dynamic> _$CollageLayoutToJson(_CollageLayout instance) =>
    <String, dynamic>{'pages': instance.pages.map((e) => e.toJson()).toList()};

_ScrapbookHighlights _$ScrapbookHighlightsFromJson(Map<String, dynamic> json) =>
    _ScrapbookHighlights(
      milestones:
          (json['milestones'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      badges:
          (json['badges'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      tasksCompleted: (json['tasksCompleted'] as num?)?.toInt(),
      minutesWorked: (json['minutesWorked'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScrapbookHighlightsToJson(
  _ScrapbookHighlights instance,
) => <String, dynamic>{
  'milestones': instance.milestones,
  'badges': instance.badges,
  'tasksCompleted': ?instance.tasksCompleted,
  'minutesWorked': ?instance.minutesWorked,
};

_Scrapbook _$ScrapbookFromJson(Map<String, dynamic> json) => _Scrapbook(
  id: json['id'] as String,
  kind: json['kind'] as String? ?? 'project',
  title: json['title'] as String? ?? '',
  projectId: json['projectId'] as String?,
  year: (json['year'] as num?)?.toInt(),
  narrative: json['narrative'] as String?,
  layout: json['layout'] == null
      ? null
      : CollageLayout.fromJson(json['layout'] as Map<String, dynamic>),
  highlights: json['highlights'] == null
      ? null
      : ScrapbookHighlights.fromJson(
          json['highlights'] as Map<String, dynamic>,
        ),
  status: json['status'] as String? ?? 'ready',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ScrapbookToJson(_Scrapbook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'title': instance.title,
      'projectId': ?instance.projectId,
      'year': ?instance.year,
      'narrative': ?instance.narrative,
      'layout': ?instance.layout?.toJson(),
      'highlights': ?instance.highlights?.toJson(),
      'status': instance.status,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

_ScrapbookView _$ScrapbookViewFromJson(Map<String, dynamic> json) =>
    _ScrapbookView(
      scrapbook: Scrapbook.fromJson(json['scrapbook'] as Map<String, dynamic>),
      mediaUrls:
          (json['mediaUrls'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const <String, String>{},
    );

Map<String, dynamic> _$ScrapbookViewToJson(_ScrapbookView instance) =>
    <String, dynamic>{
      'scrapbook': instance.scrapbook.toJson(),
      'mediaUrls': instance.mediaUrls,
    };
