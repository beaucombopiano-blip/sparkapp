import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal.freezed.dart';
part 'journal.g.dart';

enum JournalMediaType { image, pdf, none }

enum JournalEntryStatus { pendingUpload, processing, ready, failed, unknown }

/// `users/{uid}/projects/{pid}/journal/{id}`.
@freezed
abstract class JournalEntry with _$JournalEntry {
  const factory JournalEntry({
    required String id,
    String? projectId,
    String? taskId,
    String? milestoneId,
    DateTime? entryDate,
    String? mediaPath,
    String? previewPath,
    @JsonKey(unknownEnumValue: JournalMediaType.none) @Default(JournalMediaType.none) JournalMediaType mediaType,
    String? caption,
    @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)
    @Default(JournalEntryStatus.processing)
    JournalEntryStatus status,
    DateTime? deletedAt,
    DateTime? createdAt,
  }) = _JournalEntry;

  factory JournalEntry.fromJson(Map<String, dynamic> json) => _$JournalEntryFromJson(json);
}

enum TimelineItemKind { entry, milestone, badge, unknown }

/// One row of `getJournalTimeline`. Media URLs are short-lived signed URLs.
@freezed
abstract class JournalTimelineItem with _$JournalTimelineItem {
  const factory JournalTimelineItem({
    @JsonKey(unknownEnumValue: TimelineItemKind.unknown) @Default(TimelineItemKind.entry) TimelineItemKind kind,
    @Default('') String id,
    DateTime? date,
    String? entryId,
    String? caption,
    @JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType? mediaType,
    String? mediaUrl,
    String? thumbnailUrl,
    String? taskId,
    String? taskTitle,
    String? milestoneId,
    String? milestoneTitle,
    String? title,
    String? badgeKey,
    @JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus? status,
  }) = _JournalTimelineItem;

  factory JournalTimelineItem.fromJson(Map<String, dynamic> json) => _$JournalTimelineItemFromJson(json);
}

@freezed
abstract class JournalTimeline with _$JournalTimeline {
  const factory JournalTimeline({
    @Default(<JournalTimelineItem>[]) List<JournalTimelineItem> items,
    DateTime? urlsExpireAt,
  }) = _JournalTimeline;

  factory JournalTimeline.fromJson(Map<String, dynamic> json) => _$JournalTimelineFromJson(json);
}

/// `createJournalEntry` result: where to upload the file.
@freezed
abstract class JournalUploadTarget with _$JournalUploadTarget {
  const factory JournalUploadTarget({
    required String entryId,
    required String uploadPath,
    String? previewUploadPath,
  }) = _JournalUploadTarget;

  factory JournalUploadTarget.fromJson(Map<String, dynamic> json) => _$JournalUploadTargetFromJson(json);
}

enum CollageItemType { photo, tape, caption, badge, milestone, title, unknown }

@freezed
abstract class CollageItem with _$CollageItem {
  const factory CollageItem({
    @JsonKey(unknownEnumValue: CollageItemType.unknown) @Default(CollageItemType.photo) CollageItemType type,

    /// Position and size as fractions (0–1) of the page.
    @Default(0) double x,
    @Default(0) double y,
    @Default(0.3) double w,
    @Default(0.3) double h,

    /// Degrees, clockwise.
    @Default(0) double rotation,
    @Default(0) int z,
    String? mediaPath,
    String? entryId,
    String? text,

    /// Palette token for tape/accents (e.g. "teal").
    String? colorToken,
  }) = _CollageItem;

  factory CollageItem.fromJson(Map<String, dynamic> json) => _$CollageItemFromJson(json);
}

@freezed
abstract class CollagePage with _$CollagePage {
  const factory CollagePage({
    /// width / height.
    @Default(0.75) double aspectRatio,
    @Default(<CollageItem>[]) List<CollageItem> items,
  }) = _CollagePage;

  factory CollagePage.fromJson(Map<String, dynamic> json) => _$CollagePageFromJson(json);
}

@freezed
abstract class CollageLayout with _$CollageLayout {
  const factory CollageLayout({
    @Default(<CollagePage>[]) List<CollagePage> pages,
  }) = _CollageLayout;

  factory CollageLayout.fromJson(Map<String, dynamic> json) => _$CollageLayoutFromJson(json);
}

@freezed
abstract class ScrapbookHighlights with _$ScrapbookHighlights {
  const factory ScrapbookHighlights({
    @Default(<String>[]) List<String> milestones,
    @Default(<String>[]) List<String> badges,
    int? tasksCompleted,
    int? minutesWorked,
  }) = _ScrapbookHighlights;

  factory ScrapbookHighlights.fromJson(Map<String, dynamic> json) => _$ScrapbookHighlightsFromJson(json);
}

/// `users/{uid}/scrapbooks/{id}`.
@freezed
abstract class Scrapbook with _$Scrapbook {
  const factory Scrapbook({
    required String id,

    /// project | yearInReview
    @Default('project') String kind,
    @Default('') String title,
    String? projectId,
    int? year,
    String? narrative,
    CollageLayout? layout,
    ScrapbookHighlights? highlights,

    /// compiling | ready | failed
    @Default('ready') String status,
    DateTime? createdAt,
  }) = _Scrapbook;

  factory Scrapbook.fromJson(Map<String, dynamic> json) => _$ScrapbookFromJson(json);
}

/// `getScrapbook` result: the scrapbook plus 10-minute signed URLs keyed by
/// media path.
@freezed
abstract class ScrapbookView with _$ScrapbookView {
  const factory ScrapbookView({
    required Scrapbook scrapbook,
    @Default(<String, String>{}) Map<String, String> mediaUrls,
  }) = _ScrapbookView;

  factory ScrapbookView.fromJson(Map<String, dynamic> json) => _$ScrapbookViewFromJson(json);
}
