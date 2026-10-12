// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JournalEntry {

 String get id; String? get projectId; String? get taskId; String? get milestoneId; DateTime? get entryDate; String? get mediaPath; String? get previewPath;@JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType get mediaType; String? get caption;@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus get status; DateTime? get deletedAt; DateTime? get createdAt;
/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalEntryCopyWith<JournalEntry> get copyWith => _$JournalEntryCopyWithImpl<JournalEntry>(this as JournalEntry, _$identity);

  /// Serializes this JournalEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JournalEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.milestoneId, _this.milestoneId) || other.milestoneId == _this.milestoneId)&&(identical(other.entryDate, _this.entryDate) || other.entryDate == _this.entryDate)&&(identical(other.mediaPath, _this.mediaPath) || other.mediaPath == _this.mediaPath)&&(identical(other.previewPath, _this.previewPath) || other.previewPath == _this.previewPath)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.caption, _this.caption) || other.caption == _this.caption)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.deletedAt, _this.deletedAt) || other.deletedAt == _this.deletedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JournalEntry;
  return Object.hash(runtimeType,_this.id,_this.projectId,_this.taskId,_this.milestoneId,_this.entryDate,_this.mediaPath,_this.previewPath,_this.mediaType,_this.caption,_this.status,_this.deletedAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as JournalEntry;
  return 'JournalEntry(id: ${_this.id}, projectId: ${_this.projectId}, taskId: ${_this.taskId}, milestoneId: ${_this.milestoneId}, entryDate: ${_this.entryDate}, mediaPath: ${_this.mediaPath}, previewPath: ${_this.previewPath}, mediaType: ${_this.mediaType}, caption: ${_this.caption}, status: ${_this.status}, deletedAt: ${_this.deletedAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $JournalEntryCopyWith<$Res>  {
  factory $JournalEntryCopyWith(JournalEntry value, $Res Function(JournalEntry) _then) = _$JournalEntryCopyWithImpl;
@useResult
$Res call({
 String id, String? projectId, String? taskId, String? milestoneId, DateTime? entryDate, String? mediaPath, String? previewPath,@JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType mediaType, String? caption,@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus status, DateTime? deletedAt, DateTime? createdAt
});




}
/// @nodoc
class _$JournalEntryCopyWithImpl<$Res>
    implements $JournalEntryCopyWith<$Res> {
  _$JournalEntryCopyWithImpl(this._self, this._then);

  final JournalEntry _self;
  final $Res Function(JournalEntry) _then;

/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = freezed,Object? taskId = freezed,Object? milestoneId = freezed,Object? entryDate = freezed,Object? mediaPath = freezed,Object? previewPath = freezed,Object? mediaType = null,Object? caption = freezed,Object? status = null,Object? deletedAt = freezed,Object? createdAt = freezed,}) {
  return _then(JournalEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,milestoneId: freezed == milestoneId ? _self.milestoneId : milestoneId // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,mediaPath: freezed == mediaPath ? _self.mediaPath : mediaPath // ignore: cast_nullable_to_non_nullable
as String?,previewPath: freezed == previewPath ? _self.previewPath : previewPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as JournalMediaType,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JournalEntryStatus,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalEntry].
extension JournalEntryPatterns on JournalEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalEntry value)  $default,){
final _that = this;
switch (_that) {
case _JournalEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalEntry value)?  $default,){
final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? projectId,  String? taskId,  String? milestoneId,  DateTime? entryDate,  String? mediaPath,  String? previewPath, @JsonKey(unknownEnumValue: JournalMediaType.none)  JournalMediaType mediaType,  String? caption, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)  JournalEntryStatus status,  DateTime? deletedAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
return $default(_that.id,_that.projectId,_that.taskId,_that.milestoneId,_that.entryDate,_that.mediaPath,_that.previewPath,_that.mediaType,_that.caption,_that.status,_that.deletedAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? projectId,  String? taskId,  String? milestoneId,  DateTime? entryDate,  String? mediaPath,  String? previewPath, @JsonKey(unknownEnumValue: JournalMediaType.none)  JournalMediaType mediaType,  String? caption, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)  JournalEntryStatus status,  DateTime? deletedAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _JournalEntry():
return $default(_that.id,_that.projectId,_that.taskId,_that.milestoneId,_that.entryDate,_that.mediaPath,_that.previewPath,_that.mediaType,_that.caption,_that.status,_that.deletedAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? projectId,  String? taskId,  String? milestoneId,  DateTime? entryDate,  String? mediaPath,  String? previewPath, @JsonKey(unknownEnumValue: JournalMediaType.none)  JournalMediaType mediaType,  String? caption, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)  JournalEntryStatus status,  DateTime? deletedAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
return $default(_that.id,_that.projectId,_that.taskId,_that.milestoneId,_that.entryDate,_that.mediaPath,_that.previewPath,_that.mediaType,_that.caption,_that.status,_that.deletedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalEntry implements JournalEntry {
  const _JournalEntry({required this.id, this.projectId, this.taskId, this.milestoneId, this.entryDate, this.mediaPath, this.previewPath, @JsonKey(unknownEnumValue: JournalMediaType.none) this.mediaType = JournalMediaType.none, this.caption, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown) this.status = JournalEntryStatus.processing, this.deletedAt, this.createdAt});
  factory _JournalEntry.fromJson(Map<String, dynamic> json) => _$JournalEntryFromJson(json);

@override final  String id;
@override final  String? projectId;
@override final  String? taskId;
@override final  String? milestoneId;
@override final  DateTime? entryDate;
@override final  String? mediaPath;
@override final  String? previewPath;
@override@JsonKey(unknownEnumValue: JournalMediaType.none) final  JournalMediaType mediaType;
@override final  String? caption;
@override@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) final  JournalEntryStatus status;
@override final  DateTime? deletedAt;
@override final  DateTime? createdAt;

/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalEntryCopyWith<_JournalEntry> get copyWith => __$JournalEntryCopyWithImpl<_JournalEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.milestoneId, milestoneId) || other.milestoneId == milestoneId)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.mediaPath, mediaPath) || other.mediaPath == mediaPath)&&(identical(other.previewPath, previewPath) || other.previewPath == previewPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.status, status) || other.status == status)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,projectId,taskId,milestoneId,entryDate,mediaPath,previewPath,mediaType,caption,status,deletedAt,createdAt);
}

@override
String toString() {
    return 'JournalEntry(id: $id, projectId: $projectId, taskId: $taskId, milestoneId: $milestoneId, entryDate: $entryDate, mediaPath: $mediaPath, previewPath: $previewPath, mediaType: $mediaType, caption: $caption, status: $status, deletedAt: $deletedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JournalEntryCopyWith<$Res> implements $JournalEntryCopyWith<$Res> {
  factory _$JournalEntryCopyWith(_JournalEntry value, $Res Function(_JournalEntry) _then) = __$JournalEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String? projectId, String? taskId, String? milestoneId, DateTime? entryDate, String? mediaPath, String? previewPath,@JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType mediaType, String? caption,@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus status, DateTime? deletedAt, DateTime? createdAt
});




}
/// @nodoc
class __$JournalEntryCopyWithImpl<$Res>
    implements _$JournalEntryCopyWith<$Res> {
  __$JournalEntryCopyWithImpl(this._self, this._then);

  final _JournalEntry _self;
  final $Res Function(_JournalEntry) _then;

/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = freezed,Object? taskId = freezed,Object? milestoneId = freezed,Object? entryDate = freezed,Object? mediaPath = freezed,Object? previewPath = freezed,Object? mediaType = null,Object? caption = freezed,Object? status = null,Object? deletedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_JournalEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,milestoneId: freezed == milestoneId ? _self.milestoneId : milestoneId // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,mediaPath: freezed == mediaPath ? _self.mediaPath : mediaPath // ignore: cast_nullable_to_non_nullable
as String?,previewPath: freezed == previewPath ? _self.previewPath : previewPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as JournalMediaType,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JournalEntryStatus,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$JournalTimelineItem {

@JsonKey(unknownEnumValue: TimelineItemKind.unknown) TimelineItemKind get kind; String get id; DateTime? get date; String? get entryId; String? get caption;@JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType? get mediaType; String? get mediaUrl; String? get thumbnailUrl; String? get taskId; String? get taskTitle; String? get milestoneId; String? get milestoneTitle; String? get title; String? get badgeKey;@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus? get status;
/// Create a copy of JournalTimelineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalTimelineItemCopyWith<JournalTimelineItem> get copyWith => _$JournalTimelineItemCopyWithImpl<JournalTimelineItem>(this as JournalTimelineItem, _$identity);

  /// Serializes this JournalTimelineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JournalTimelineItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalTimelineItem&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId)&&(identical(other.caption, _this.caption) || other.caption == _this.caption)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.mediaUrl, _this.mediaUrl) || other.mediaUrl == _this.mediaUrl)&&(identical(other.thumbnailUrl, _this.thumbnailUrl) || other.thumbnailUrl == _this.thumbnailUrl)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.taskTitle, _this.taskTitle) || other.taskTitle == _this.taskTitle)&&(identical(other.milestoneId, _this.milestoneId) || other.milestoneId == _this.milestoneId)&&(identical(other.milestoneTitle, _this.milestoneTitle) || other.milestoneTitle == _this.milestoneTitle)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.badgeKey, _this.badgeKey) || other.badgeKey == _this.badgeKey)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JournalTimelineItem;
  return Object.hash(runtimeType,_this.kind,_this.id,_this.date,_this.entryId,_this.caption,_this.mediaType,_this.mediaUrl,_this.thumbnailUrl,_this.taskId,_this.taskTitle,_this.milestoneId,_this.milestoneTitle,_this.title,_this.badgeKey,_this.status);
}

@override
String toString() {
  final _this = this as JournalTimelineItem;
  return 'JournalTimelineItem(kind: ${_this.kind}, id: ${_this.id}, date: ${_this.date}, entryId: ${_this.entryId}, caption: ${_this.caption}, mediaType: ${_this.mediaType}, mediaUrl: ${_this.mediaUrl}, thumbnailUrl: ${_this.thumbnailUrl}, taskId: ${_this.taskId}, taskTitle: ${_this.taskTitle}, milestoneId: ${_this.milestoneId}, milestoneTitle: ${_this.milestoneTitle}, title: ${_this.title}, badgeKey: ${_this.badgeKey}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $JournalTimelineItemCopyWith<$Res>  {
  factory $JournalTimelineItemCopyWith(JournalTimelineItem value, $Res Function(JournalTimelineItem) _then) = _$JournalTimelineItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: TimelineItemKind.unknown) TimelineItemKind kind, String id, DateTime? date, String? entryId, String? caption,@JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType? mediaType, String? mediaUrl, String? thumbnailUrl, String? taskId, String? taskTitle, String? milestoneId, String? milestoneTitle, String? title, String? badgeKey,@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus? status
});




}
/// @nodoc
class _$JournalTimelineItemCopyWithImpl<$Res>
    implements $JournalTimelineItemCopyWith<$Res> {
  _$JournalTimelineItemCopyWithImpl(this._self, this._then);

  final JournalTimelineItem _self;
  final $Res Function(JournalTimelineItem) _then;

/// Create a copy of JournalTimelineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,Object? date = freezed,Object? entryId = freezed,Object? caption = freezed,Object? mediaType = freezed,Object? mediaUrl = freezed,Object? thumbnailUrl = freezed,Object? taskId = freezed,Object? taskTitle = freezed,Object? milestoneId = freezed,Object? milestoneTitle = freezed,Object? title = freezed,Object? badgeKey = freezed,Object? status = freezed,}) {
  return _then(JournalTimelineItem(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TimelineItemKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as JournalMediaType?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,taskTitle: freezed == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String?,milestoneId: freezed == milestoneId ? _self.milestoneId : milestoneId // ignore: cast_nullable_to_non_nullable
as String?,milestoneTitle: freezed == milestoneTitle ? _self.milestoneTitle : milestoneTitle // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,badgeKey: freezed == badgeKey ? _self.badgeKey : badgeKey // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JournalEntryStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalTimelineItem].
extension JournalTimelineItemPatterns on JournalTimelineItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalTimelineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalTimelineItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalTimelineItem value)  $default,){
final _that = this;
switch (_that) {
case _JournalTimelineItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalTimelineItem value)?  $default,){
final _that = this;
switch (_that) {
case _JournalTimelineItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: TimelineItemKind.unknown)  TimelineItemKind kind,  String id,  DateTime? date,  String? entryId,  String? caption, @JsonKey(unknownEnumValue: JournalMediaType.none)  JournalMediaType? mediaType,  String? mediaUrl,  String? thumbnailUrl,  String? taskId,  String? taskTitle,  String? milestoneId,  String? milestoneTitle,  String? title,  String? badgeKey, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)  JournalEntryStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalTimelineItem() when $default != null:
return $default(_that.kind,_that.id,_that.date,_that.entryId,_that.caption,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.taskId,_that.taskTitle,_that.milestoneId,_that.milestoneTitle,_that.title,_that.badgeKey,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: TimelineItemKind.unknown)  TimelineItemKind kind,  String id,  DateTime? date,  String? entryId,  String? caption, @JsonKey(unknownEnumValue: JournalMediaType.none)  JournalMediaType? mediaType,  String? mediaUrl,  String? thumbnailUrl,  String? taskId,  String? taskTitle,  String? milestoneId,  String? milestoneTitle,  String? title,  String? badgeKey, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)  JournalEntryStatus? status)  $default,) {final _that = this;
switch (_that) {
case _JournalTimelineItem():
return $default(_that.kind,_that.id,_that.date,_that.entryId,_that.caption,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.taskId,_that.taskTitle,_that.milestoneId,_that.milestoneTitle,_that.title,_that.badgeKey,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: TimelineItemKind.unknown)  TimelineItemKind kind,  String id,  DateTime? date,  String? entryId,  String? caption, @JsonKey(unknownEnumValue: JournalMediaType.none)  JournalMediaType? mediaType,  String? mediaUrl,  String? thumbnailUrl,  String? taskId,  String? taskTitle,  String? milestoneId,  String? milestoneTitle,  String? title,  String? badgeKey, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown)  JournalEntryStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _JournalTimelineItem() when $default != null:
return $default(_that.kind,_that.id,_that.date,_that.entryId,_that.caption,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.taskId,_that.taskTitle,_that.milestoneId,_that.milestoneTitle,_that.title,_that.badgeKey,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalTimelineItem implements JournalTimelineItem {
  const _JournalTimelineItem({@JsonKey(unknownEnumValue: TimelineItemKind.unknown) this.kind = TimelineItemKind.entry, this.id = '', this.date, this.entryId, this.caption, @JsonKey(unknownEnumValue: JournalMediaType.none) this.mediaType, this.mediaUrl, this.thumbnailUrl, this.taskId, this.taskTitle, this.milestoneId, this.milestoneTitle, this.title, this.badgeKey, @JsonKey(unknownEnumValue: JournalEntryStatus.unknown) this.status});
  factory _JournalTimelineItem.fromJson(Map<String, dynamic> json) => _$JournalTimelineItemFromJson(json);

@override@JsonKey(unknownEnumValue: TimelineItemKind.unknown) final  TimelineItemKind kind;
@override@JsonKey() final  String id;
@override final  DateTime? date;
@override final  String? entryId;
@override final  String? caption;
@override@JsonKey(unknownEnumValue: JournalMediaType.none) final  JournalMediaType? mediaType;
@override final  String? mediaUrl;
@override final  String? thumbnailUrl;
@override final  String? taskId;
@override final  String? taskTitle;
@override final  String? milestoneId;
@override final  String? milestoneTitle;
@override final  String? title;
@override final  String? badgeKey;
@override@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) final  JournalEntryStatus? status;

/// Create a copy of JournalTimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalTimelineItemCopyWith<_JournalTimelineItem> get copyWith => __$JournalTimelineItemCopyWithImpl<_JournalTimelineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalTimelineItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalTimelineItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.milestoneId, milestoneId) || other.milestoneId == milestoneId)&&(identical(other.milestoneTitle, milestoneTitle) || other.milestoneTitle == milestoneTitle)&&(identical(other.title, title) || other.title == title)&&(identical(other.badgeKey, badgeKey) || other.badgeKey == badgeKey)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,id,date,entryId,caption,mediaType,mediaUrl,thumbnailUrl,taskId,taskTitle,milestoneId,milestoneTitle,title,badgeKey,status);
}

@override
String toString() {
    return 'JournalTimelineItem(kind: $kind, id: $id, date: $date, entryId: $entryId, caption: $caption, mediaType: $mediaType, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, taskId: $taskId, taskTitle: $taskTitle, milestoneId: $milestoneId, milestoneTitle: $milestoneTitle, title: $title, badgeKey: $badgeKey, status: $status)';
}


}

/// @nodoc
abstract mixin class _$JournalTimelineItemCopyWith<$Res> implements $JournalTimelineItemCopyWith<$Res> {
  factory _$JournalTimelineItemCopyWith(_JournalTimelineItem value, $Res Function(_JournalTimelineItem) _then) = __$JournalTimelineItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: TimelineItemKind.unknown) TimelineItemKind kind, String id, DateTime? date, String? entryId, String? caption,@JsonKey(unknownEnumValue: JournalMediaType.none) JournalMediaType? mediaType, String? mediaUrl, String? thumbnailUrl, String? taskId, String? taskTitle, String? milestoneId, String? milestoneTitle, String? title, String? badgeKey,@JsonKey(unknownEnumValue: JournalEntryStatus.unknown) JournalEntryStatus? status
});




}
/// @nodoc
class __$JournalTimelineItemCopyWithImpl<$Res>
    implements _$JournalTimelineItemCopyWith<$Res> {
  __$JournalTimelineItemCopyWithImpl(this._self, this._then);

  final _JournalTimelineItem _self;
  final $Res Function(_JournalTimelineItem) _then;

/// Create a copy of JournalTimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,Object? date = freezed,Object? entryId = freezed,Object? caption = freezed,Object? mediaType = freezed,Object? mediaUrl = freezed,Object? thumbnailUrl = freezed,Object? taskId = freezed,Object? taskTitle = freezed,Object? milestoneId = freezed,Object? milestoneTitle = freezed,Object? title = freezed,Object? badgeKey = freezed,Object? status = freezed,}) {
  return _then(_JournalTimelineItem(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TimelineItemKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as JournalMediaType?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,taskTitle: freezed == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String?,milestoneId: freezed == milestoneId ? _self.milestoneId : milestoneId // ignore: cast_nullable_to_non_nullable
as String?,milestoneTitle: freezed == milestoneTitle ? _self.milestoneTitle : milestoneTitle // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,badgeKey: freezed == badgeKey ? _self.badgeKey : badgeKey // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JournalEntryStatus?,
  ));
}


}


/// @nodoc
mixin _$JournalTimeline {

 List<JournalTimelineItem> get items; DateTime? get urlsExpireAt;
/// Create a copy of JournalTimeline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalTimelineCopyWith<JournalTimeline> get copyWith => _$JournalTimelineCopyWithImpl<JournalTimeline>(this as JournalTimeline, _$identity);

  /// Serializes this JournalTimeline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JournalTimeline;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalTimeline&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.urlsExpireAt, _this.urlsExpireAt) || other.urlsExpireAt == _this.urlsExpireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JournalTimeline;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.urlsExpireAt);
}

@override
String toString() {
  final _this = this as JournalTimeline;
  return 'JournalTimeline(items: ${_this.items}, urlsExpireAt: ${_this.urlsExpireAt})';
}


}

/// @nodoc
abstract mixin class $JournalTimelineCopyWith<$Res>  {
  factory $JournalTimelineCopyWith(JournalTimeline value, $Res Function(JournalTimeline) _then) = _$JournalTimelineCopyWithImpl;
@useResult
$Res call({
 List<JournalTimelineItem> items, DateTime? urlsExpireAt
});




}
/// @nodoc
class _$JournalTimelineCopyWithImpl<$Res>
    implements $JournalTimelineCopyWith<$Res> {
  _$JournalTimelineCopyWithImpl(this._self, this._then);

  final JournalTimeline _self;
  final $Res Function(JournalTimeline) _then;

/// Create a copy of JournalTimeline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? urlsExpireAt = freezed,}) {
  return _then(JournalTimeline(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<JournalTimelineItem>,urlsExpireAt: freezed == urlsExpireAt ? _self.urlsExpireAt : urlsExpireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalTimeline].
extension JournalTimelinePatterns on JournalTimeline {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalTimeline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalTimeline() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalTimeline value)  $default,){
final _that = this;
switch (_that) {
case _JournalTimeline():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalTimeline value)?  $default,){
final _that = this;
switch (_that) {
case _JournalTimeline() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JournalTimelineItem> items,  DateTime? urlsExpireAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalTimeline() when $default != null:
return $default(_that.items,_that.urlsExpireAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JournalTimelineItem> items,  DateTime? urlsExpireAt)  $default,) {final _that = this;
switch (_that) {
case _JournalTimeline():
return $default(_that.items,_that.urlsExpireAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JournalTimelineItem> items,  DateTime? urlsExpireAt)?  $default,) {final _that = this;
switch (_that) {
case _JournalTimeline() when $default != null:
return $default(_that.items,_that.urlsExpireAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalTimeline implements JournalTimeline {
  const _JournalTimeline({ List<JournalTimelineItem> items = const <JournalTimelineItem>[], this.urlsExpireAt}): _items = items;
  factory _JournalTimeline.fromJson(Map<String, dynamic> json) => _$JournalTimelineFromJson(json);

 final  List<JournalTimelineItem> _items;
@override@JsonKey() List<JournalTimelineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? urlsExpireAt;

/// Create a copy of JournalTimeline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalTimelineCopyWith<_JournalTimeline> get copyWith => __$JournalTimelineCopyWithImpl<_JournalTimeline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalTimelineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalTimeline&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.urlsExpireAt, urlsExpireAt) || other.urlsExpireAt == urlsExpireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),urlsExpireAt);
}

@override
String toString() {
    return 'JournalTimeline(items: $items, urlsExpireAt: $urlsExpireAt)';
}


}

/// @nodoc
abstract mixin class _$JournalTimelineCopyWith<$Res> implements $JournalTimelineCopyWith<$Res> {
  factory _$JournalTimelineCopyWith(_JournalTimeline value, $Res Function(_JournalTimeline) _then) = __$JournalTimelineCopyWithImpl;
@override @useResult
$Res call({
 List<JournalTimelineItem> items, DateTime? urlsExpireAt
});




}
/// @nodoc
class __$JournalTimelineCopyWithImpl<$Res>
    implements _$JournalTimelineCopyWith<$Res> {
  __$JournalTimelineCopyWithImpl(this._self, this._then);

  final _JournalTimeline _self;
  final $Res Function(_JournalTimeline) _then;

/// Create a copy of JournalTimeline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? urlsExpireAt = freezed,}) {
  return _then(_JournalTimeline(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<JournalTimelineItem>,urlsExpireAt: freezed == urlsExpireAt ? _self.urlsExpireAt : urlsExpireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$JournalUploadTarget {

 String get entryId; String get uploadPath; String? get previewUploadPath;
/// Create a copy of JournalUploadTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalUploadTargetCopyWith<JournalUploadTarget> get copyWith => _$JournalUploadTargetCopyWithImpl<JournalUploadTarget>(this as JournalUploadTarget, _$identity);

  /// Serializes this JournalUploadTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JournalUploadTarget;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalUploadTarget&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId)&&(identical(other.uploadPath, _this.uploadPath) || other.uploadPath == _this.uploadPath)&&(identical(other.previewUploadPath, _this.previewUploadPath) || other.previewUploadPath == _this.previewUploadPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JournalUploadTarget;
  return Object.hash(runtimeType,_this.entryId,_this.uploadPath,_this.previewUploadPath);
}

@override
String toString() {
  final _this = this as JournalUploadTarget;
  return 'JournalUploadTarget(entryId: ${_this.entryId}, uploadPath: ${_this.uploadPath}, previewUploadPath: ${_this.previewUploadPath})';
}


}

/// @nodoc
abstract mixin class $JournalUploadTargetCopyWith<$Res>  {
  factory $JournalUploadTargetCopyWith(JournalUploadTarget value, $Res Function(JournalUploadTarget) _then) = _$JournalUploadTargetCopyWithImpl;
@useResult
$Res call({
 String entryId, String uploadPath, String? previewUploadPath
});




}
/// @nodoc
class _$JournalUploadTargetCopyWithImpl<$Res>
    implements $JournalUploadTargetCopyWith<$Res> {
  _$JournalUploadTargetCopyWithImpl(this._self, this._then);

  final JournalUploadTarget _self;
  final $Res Function(JournalUploadTarget) _then;

/// Create a copy of JournalUploadTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entryId = null,Object? uploadPath = null,Object? previewUploadPath = freezed,}) {
  return _then(JournalUploadTarget(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,uploadPath: null == uploadPath ? _self.uploadPath : uploadPath // ignore: cast_nullable_to_non_nullable
as String,previewUploadPath: freezed == previewUploadPath ? _self.previewUploadPath : previewUploadPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalUploadTarget].
extension JournalUploadTargetPatterns on JournalUploadTarget {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalUploadTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalUploadTarget() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalUploadTarget value)  $default,){
final _that = this;
switch (_that) {
case _JournalUploadTarget():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalUploadTarget value)?  $default,){
final _that = this;
switch (_that) {
case _JournalUploadTarget() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String entryId,  String uploadPath,  String? previewUploadPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalUploadTarget() when $default != null:
return $default(_that.entryId,_that.uploadPath,_that.previewUploadPath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String entryId,  String uploadPath,  String? previewUploadPath)  $default,) {final _that = this;
switch (_that) {
case _JournalUploadTarget():
return $default(_that.entryId,_that.uploadPath,_that.previewUploadPath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String entryId,  String uploadPath,  String? previewUploadPath)?  $default,) {final _that = this;
switch (_that) {
case _JournalUploadTarget() when $default != null:
return $default(_that.entryId,_that.uploadPath,_that.previewUploadPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalUploadTarget implements JournalUploadTarget {
  const _JournalUploadTarget({required this.entryId, required this.uploadPath, this.previewUploadPath});
  factory _JournalUploadTarget.fromJson(Map<String, dynamic> json) => _$JournalUploadTargetFromJson(json);

@override final  String entryId;
@override final  String uploadPath;
@override final  String? previewUploadPath;

/// Create a copy of JournalUploadTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalUploadTargetCopyWith<_JournalUploadTarget> get copyWith => __$JournalUploadTargetCopyWithImpl<_JournalUploadTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalUploadTargetToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalUploadTarget&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.uploadPath, uploadPath) || other.uploadPath == uploadPath)&&(identical(other.previewUploadPath, previewUploadPath) || other.previewUploadPath == previewUploadPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,entryId,uploadPath,previewUploadPath);
}

@override
String toString() {
    return 'JournalUploadTarget(entryId: $entryId, uploadPath: $uploadPath, previewUploadPath: $previewUploadPath)';
}


}

/// @nodoc
abstract mixin class _$JournalUploadTargetCopyWith<$Res> implements $JournalUploadTargetCopyWith<$Res> {
  factory _$JournalUploadTargetCopyWith(_JournalUploadTarget value, $Res Function(_JournalUploadTarget) _then) = __$JournalUploadTargetCopyWithImpl;
@override @useResult
$Res call({
 String entryId, String uploadPath, String? previewUploadPath
});




}
/// @nodoc
class __$JournalUploadTargetCopyWithImpl<$Res>
    implements _$JournalUploadTargetCopyWith<$Res> {
  __$JournalUploadTargetCopyWithImpl(this._self, this._then);

  final _JournalUploadTarget _self;
  final $Res Function(_JournalUploadTarget) _then;

/// Create a copy of JournalUploadTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryId = null,Object? uploadPath = null,Object? previewUploadPath = freezed,}) {
  return _then(_JournalUploadTarget(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,uploadPath: null == uploadPath ? _self.uploadPath : uploadPath // ignore: cast_nullable_to_non_nullable
as String,previewUploadPath: freezed == previewUploadPath ? _self.previewUploadPath : previewUploadPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CollageItem {

@JsonKey(unknownEnumValue: CollageItemType.unknown) CollageItemType get type;/// Position and size as fractions (0–1) of the page.
 double get x; double get y; double get w; double get h;/// Degrees, clockwise.
 double get rotation; int get z; String? get mediaPath; String? get entryId; String? get text;/// Palette token for tape/accents (e.g. "teal").
 String? get colorToken;
/// Create a copy of CollageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollageItemCopyWith<CollageItem> get copyWith => _$CollageItemCopyWithImpl<CollageItem>(this as CollageItem, _$identity);

  /// Serializes this CollageItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CollageItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollageItem&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.w, _this.w) || other.w == _this.w)&&(identical(other.h, _this.h) || other.h == _this.h)&&(identical(other.rotation, _this.rotation) || other.rotation == _this.rotation)&&(identical(other.z, _this.z) || other.z == _this.z)&&(identical(other.mediaPath, _this.mediaPath) || other.mediaPath == _this.mediaPath)&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.colorToken, _this.colorToken) || other.colorToken == _this.colorToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CollageItem;
  return Object.hash(runtimeType,_this.type,_this.x,_this.y,_this.w,_this.h,_this.rotation,_this.z,_this.mediaPath,_this.entryId,_this.text,_this.colorToken);
}

@override
String toString() {
  final _this = this as CollageItem;
  return 'CollageItem(type: ${_this.type}, x: ${_this.x}, y: ${_this.y}, w: ${_this.w}, h: ${_this.h}, rotation: ${_this.rotation}, z: ${_this.z}, mediaPath: ${_this.mediaPath}, entryId: ${_this.entryId}, text: ${_this.text}, colorToken: ${_this.colorToken})';
}


}

/// @nodoc
abstract mixin class $CollageItemCopyWith<$Res>  {
  factory $CollageItemCopyWith(CollageItem value, $Res Function(CollageItem) _then) = _$CollageItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: CollageItemType.unknown) CollageItemType type, double x, double y, double w, double h, double rotation, int z, String? mediaPath, String? entryId, String? text, String? colorToken
});




}
/// @nodoc
class _$CollageItemCopyWithImpl<$Res>
    implements $CollageItemCopyWith<$Res> {
  _$CollageItemCopyWithImpl(this._self, this._then);

  final CollageItem _self;
  final $Res Function(CollageItem) _then;

/// Create a copy of CollageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? x = null,Object? y = null,Object? w = null,Object? h = null,Object? rotation = null,Object? z = null,Object? mediaPath = freezed,Object? entryId = freezed,Object? text = freezed,Object? colorToken = freezed,}) {
  return _then(CollageItem(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CollageItemType,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,h: null == h ? _self.h : h // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as int,mediaPath: freezed == mediaPath ? _self.mediaPath : mediaPath // ignore: cast_nullable_to_non_nullable
as String?,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,colorToken: freezed == colorToken ? _self.colorToken : colorToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CollageItem].
extension CollageItemPatterns on CollageItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollageItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollageItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollageItem value)  $default,){
final _that = this;
switch (_that) {
case _CollageItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollageItem value)?  $default,){
final _that = this;
switch (_that) {
case _CollageItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: CollageItemType.unknown)  CollageItemType type,  double x,  double y,  double w,  double h,  double rotation,  int z,  String? mediaPath,  String? entryId,  String? text,  String? colorToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollageItem() when $default != null:
return $default(_that.type,_that.x,_that.y,_that.w,_that.h,_that.rotation,_that.z,_that.mediaPath,_that.entryId,_that.text,_that.colorToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: CollageItemType.unknown)  CollageItemType type,  double x,  double y,  double w,  double h,  double rotation,  int z,  String? mediaPath,  String? entryId,  String? text,  String? colorToken)  $default,) {final _that = this;
switch (_that) {
case _CollageItem():
return $default(_that.type,_that.x,_that.y,_that.w,_that.h,_that.rotation,_that.z,_that.mediaPath,_that.entryId,_that.text,_that.colorToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: CollageItemType.unknown)  CollageItemType type,  double x,  double y,  double w,  double h,  double rotation,  int z,  String? mediaPath,  String? entryId,  String? text,  String? colorToken)?  $default,) {final _that = this;
switch (_that) {
case _CollageItem() when $default != null:
return $default(_that.type,_that.x,_that.y,_that.w,_that.h,_that.rotation,_that.z,_that.mediaPath,_that.entryId,_that.text,_that.colorToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollageItem implements CollageItem {
  const _CollageItem({@JsonKey(unknownEnumValue: CollageItemType.unknown) this.type = CollageItemType.photo, this.x = 0, this.y = 0, this.w = 0.3, this.h = 0.3, this.rotation = 0, this.z = 0, this.mediaPath, this.entryId, this.text, this.colorToken});
  factory _CollageItem.fromJson(Map<String, dynamic> json) => _$CollageItemFromJson(json);

@override@JsonKey(unknownEnumValue: CollageItemType.unknown) final  CollageItemType type;
/// Position and size as fractions (0–1) of the page.
@override@JsonKey() final  double x;
@override@JsonKey() final  double y;
@override@JsonKey() final  double w;
@override@JsonKey() final  double h;
/// Degrees, clockwise.
@override@JsonKey() final  double rotation;
@override@JsonKey() final  int z;
@override final  String? mediaPath;
@override final  String? entryId;
@override final  String? text;
/// Palette token for tape/accents (e.g. "teal").
@override final  String? colorToken;

/// Create a copy of CollageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollageItemCopyWith<_CollageItem> get copyWith => __$CollageItemCopyWithImpl<_CollageItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollageItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollageItem&&(identical(other.type, type) || other.type == type)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.w, w) || other.w == w)&&(identical(other.h, h) || other.h == h)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.z, z) || other.z == z)&&(identical(other.mediaPath, mediaPath) || other.mediaPath == mediaPath)&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.text, text) || other.text == text)&&(identical(other.colorToken, colorToken) || other.colorToken == colorToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,x,y,w,h,rotation,z,mediaPath,entryId,text,colorToken);
}

@override
String toString() {
    return 'CollageItem(type: $type, x: $x, y: $y, w: $w, h: $h, rotation: $rotation, z: $z, mediaPath: $mediaPath, entryId: $entryId, text: $text, colorToken: $colorToken)';
}


}

/// @nodoc
abstract mixin class _$CollageItemCopyWith<$Res> implements $CollageItemCopyWith<$Res> {
  factory _$CollageItemCopyWith(_CollageItem value, $Res Function(_CollageItem) _then) = __$CollageItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: CollageItemType.unknown) CollageItemType type, double x, double y, double w, double h, double rotation, int z, String? mediaPath, String? entryId, String? text, String? colorToken
});




}
/// @nodoc
class __$CollageItemCopyWithImpl<$Res>
    implements _$CollageItemCopyWith<$Res> {
  __$CollageItemCopyWithImpl(this._self, this._then);

  final _CollageItem _self;
  final $Res Function(_CollageItem) _then;

/// Create a copy of CollageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? x = null,Object? y = null,Object? w = null,Object? h = null,Object? rotation = null,Object? z = null,Object? mediaPath = freezed,Object? entryId = freezed,Object? text = freezed,Object? colorToken = freezed,}) {
  return _then(_CollageItem(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CollageItemType,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,h: null == h ? _self.h : h // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as int,mediaPath: freezed == mediaPath ? _self.mediaPath : mediaPath // ignore: cast_nullable_to_non_nullable
as String?,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,colorToken: freezed == colorToken ? _self.colorToken : colorToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CollagePage {

/// width / height.
 double get aspectRatio; List<CollageItem> get items;
/// Create a copy of CollagePage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollagePageCopyWith<CollagePage> get copyWith => _$CollagePageCopyWithImpl<CollagePage>(this as CollagePage, _$identity);

  /// Serializes this CollagePage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CollagePage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollagePage&&(identical(other.aspectRatio, _this.aspectRatio) || other.aspectRatio == _this.aspectRatio)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CollagePage;
  return Object.hash(runtimeType,_this.aspectRatio,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as CollagePage;
  return 'CollagePage(aspectRatio: ${_this.aspectRatio}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $CollagePageCopyWith<$Res>  {
  factory $CollagePageCopyWith(CollagePage value, $Res Function(CollagePage) _then) = _$CollagePageCopyWithImpl;
@useResult
$Res call({
 double aspectRatio, List<CollageItem> items
});




}
/// @nodoc
class _$CollagePageCopyWithImpl<$Res>
    implements $CollagePageCopyWith<$Res> {
  _$CollagePageCopyWithImpl(this._self, this._then);

  final CollagePage _self;
  final $Res Function(CollagePage) _then;

/// Create a copy of CollagePage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aspectRatio = null,Object? items = null,}) {
  return _then(CollagePage(
aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CollageItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CollagePage].
extension CollagePagePatterns on CollagePage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollagePage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollagePage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollagePage value)  $default,){
final _that = this;
switch (_that) {
case _CollagePage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollagePage value)?  $default,){
final _that = this;
switch (_that) {
case _CollagePage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double aspectRatio,  List<CollageItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollagePage() when $default != null:
return $default(_that.aspectRatio,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double aspectRatio,  List<CollageItem> items)  $default,) {final _that = this;
switch (_that) {
case _CollagePage():
return $default(_that.aspectRatio,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double aspectRatio,  List<CollageItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CollagePage() when $default != null:
return $default(_that.aspectRatio,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollagePage implements CollagePage {
  const _CollagePage({this.aspectRatio = 0.75,  List<CollageItem> items = const <CollageItem>[]}): _items = items;
  factory _CollagePage.fromJson(Map<String, dynamic> json) => _$CollagePageFromJson(json);

/// width / height.
@override@JsonKey() final  double aspectRatio;
 final  List<CollageItem> _items;
@override@JsonKey() List<CollageItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CollagePage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollagePageCopyWith<_CollagePage> get copyWith => __$CollagePageCopyWithImpl<_CollagePage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollagePageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollagePage&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,aspectRatio,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'CollagePage(aspectRatio: $aspectRatio, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CollagePageCopyWith<$Res> implements $CollagePageCopyWith<$Res> {
  factory _$CollagePageCopyWith(_CollagePage value, $Res Function(_CollagePage) _then) = __$CollagePageCopyWithImpl;
@override @useResult
$Res call({
 double aspectRatio, List<CollageItem> items
});




}
/// @nodoc
class __$CollagePageCopyWithImpl<$Res>
    implements _$CollagePageCopyWith<$Res> {
  __$CollagePageCopyWithImpl(this._self, this._then);

  final _CollagePage _self;
  final $Res Function(_CollagePage) _then;

/// Create a copy of CollagePage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aspectRatio = null,Object? items = null,}) {
  return _then(_CollagePage(
aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CollageItem>,
  ));
}


}


/// @nodoc
mixin _$CollageLayout {

 List<CollagePage> get pages;
/// Create a copy of CollageLayout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollageLayoutCopyWith<CollageLayout> get copyWith => _$CollageLayoutCopyWithImpl<CollageLayout>(this as CollageLayout, _$identity);

  /// Serializes this CollageLayout to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CollageLayout;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollageLayout&&const DeepCollectionEquality().equals(other.pages, _this.pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CollageLayout;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.pages));
}

@override
String toString() {
  final _this = this as CollageLayout;
  return 'CollageLayout(pages: ${_this.pages})';
}


}

/// @nodoc
abstract mixin class $CollageLayoutCopyWith<$Res>  {
  factory $CollageLayoutCopyWith(CollageLayout value, $Res Function(CollageLayout) _then) = _$CollageLayoutCopyWithImpl;
@useResult
$Res call({
 List<CollagePage> pages
});




}
/// @nodoc
class _$CollageLayoutCopyWithImpl<$Res>
    implements $CollageLayoutCopyWith<$Res> {
  _$CollageLayoutCopyWithImpl(this._self, this._then);

  final CollageLayout _self;
  final $Res Function(CollageLayout) _then;

/// Create a copy of CollageLayout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pages = null,}) {
  return _then(CollageLayout(
pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<CollagePage>,
  ));
}

}


/// Adds pattern-matching-related methods to [CollageLayout].
extension CollageLayoutPatterns on CollageLayout {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollageLayout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollageLayout() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollageLayout value)  $default,){
final _that = this;
switch (_that) {
case _CollageLayout():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollageLayout value)?  $default,){
final _that = this;
switch (_that) {
case _CollageLayout() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CollagePage> pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollageLayout() when $default != null:
return $default(_that.pages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CollagePage> pages)  $default,) {final _that = this;
switch (_that) {
case _CollageLayout():
return $default(_that.pages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CollagePage> pages)?  $default,) {final _that = this;
switch (_that) {
case _CollageLayout() when $default != null:
return $default(_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollageLayout implements CollageLayout {
  const _CollageLayout({ List<CollagePage> pages = const <CollagePage>[]}): _pages = pages;
  factory _CollageLayout.fromJson(Map<String, dynamic> json) => _$CollageLayoutFromJson(json);

 final  List<CollagePage> _pages;
@override@JsonKey() List<CollagePage> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of CollageLayout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollageLayoutCopyWith<_CollageLayout> get copyWith => __$CollageLayoutCopyWithImpl<_CollageLayout>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollageLayoutToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollageLayout&&const DeepCollectionEquality().equals(other.pages, _pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_pages));
}

@override
String toString() {
    return 'CollageLayout(pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$CollageLayoutCopyWith<$Res> implements $CollageLayoutCopyWith<$Res> {
  factory _$CollageLayoutCopyWith(_CollageLayout value, $Res Function(_CollageLayout) _then) = __$CollageLayoutCopyWithImpl;
@override @useResult
$Res call({
 List<CollagePage> pages
});




}
/// @nodoc
class __$CollageLayoutCopyWithImpl<$Res>
    implements _$CollageLayoutCopyWith<$Res> {
  __$CollageLayoutCopyWithImpl(this._self, this._then);

  final _CollageLayout _self;
  final $Res Function(_CollageLayout) _then;

/// Create a copy of CollageLayout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pages = null,}) {
  return _then(_CollageLayout(
pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<CollagePage>,
  ));
}


}


/// @nodoc
mixin _$ScrapbookHighlights {

 List<String> get milestones; List<String> get badges; int? get tasksCompleted; int? get minutesWorked;
/// Create a copy of ScrapbookHighlights
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapbookHighlightsCopyWith<ScrapbookHighlights> get copyWith => _$ScrapbookHighlightsCopyWithImpl<ScrapbookHighlights>(this as ScrapbookHighlights, _$identity);

  /// Serializes this ScrapbookHighlights to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScrapbookHighlights;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapbookHighlights&&const DeepCollectionEquality().equals(other.milestones, _this.milestones)&&const DeepCollectionEquality().equals(other.badges, _this.badges)&&(identical(other.tasksCompleted, _this.tasksCompleted) || other.tasksCompleted == _this.tasksCompleted)&&(identical(other.minutesWorked, _this.minutesWorked) || other.minutesWorked == _this.minutesWorked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScrapbookHighlights;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.milestones),const DeepCollectionEquality().hash(_this.badges),_this.tasksCompleted,_this.minutesWorked);
}

@override
String toString() {
  final _this = this as ScrapbookHighlights;
  return 'ScrapbookHighlights(milestones: ${_this.milestones}, badges: ${_this.badges}, tasksCompleted: ${_this.tasksCompleted}, minutesWorked: ${_this.minutesWorked})';
}


}

/// @nodoc
abstract mixin class $ScrapbookHighlightsCopyWith<$Res>  {
  factory $ScrapbookHighlightsCopyWith(ScrapbookHighlights value, $Res Function(ScrapbookHighlights) _then) = _$ScrapbookHighlightsCopyWithImpl;
@useResult
$Res call({
 List<String> milestones, List<String> badges, int? tasksCompleted, int? minutesWorked
});




}
/// @nodoc
class _$ScrapbookHighlightsCopyWithImpl<$Res>
    implements $ScrapbookHighlightsCopyWith<$Res> {
  _$ScrapbookHighlightsCopyWithImpl(this._self, this._then);

  final ScrapbookHighlights _self;
  final $Res Function(ScrapbookHighlights) _then;

/// Create a copy of ScrapbookHighlights
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? milestones = null,Object? badges = null,Object? tasksCompleted = freezed,Object? minutesWorked = freezed,}) {
  return _then(ScrapbookHighlights(
milestones: null == milestones ? _self.milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<String>,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,tasksCompleted: freezed == tasksCompleted ? _self.tasksCompleted : tasksCompleted // ignore: cast_nullable_to_non_nullable
as int?,minutesWorked: freezed == minutesWorked ? _self.minutesWorked : minutesWorked // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapbookHighlights].
extension ScrapbookHighlightsPatterns on ScrapbookHighlights {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapbookHighlights value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapbookHighlights() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapbookHighlights value)  $default,){
final _that = this;
switch (_that) {
case _ScrapbookHighlights():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapbookHighlights value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapbookHighlights() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> milestones,  List<String> badges,  int? tasksCompleted,  int? minutesWorked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapbookHighlights() when $default != null:
return $default(_that.milestones,_that.badges,_that.tasksCompleted,_that.minutesWorked);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> milestones,  List<String> badges,  int? tasksCompleted,  int? minutesWorked)  $default,) {final _that = this;
switch (_that) {
case _ScrapbookHighlights():
return $default(_that.milestones,_that.badges,_that.tasksCompleted,_that.minutesWorked);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> milestones,  List<String> badges,  int? tasksCompleted,  int? minutesWorked)?  $default,) {final _that = this;
switch (_that) {
case _ScrapbookHighlights() when $default != null:
return $default(_that.milestones,_that.badges,_that.tasksCompleted,_that.minutesWorked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapbookHighlights implements ScrapbookHighlights {
  const _ScrapbookHighlights({ List<String> milestones = const <String>[],  List<String> badges = const <String>[], this.tasksCompleted, this.minutesWorked}): _milestones = milestones,_badges = badges;
  factory _ScrapbookHighlights.fromJson(Map<String, dynamic> json) => _$ScrapbookHighlightsFromJson(json);

 final  List<String> _milestones;
@override@JsonKey() List<String> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}

 final  List<String> _badges;
@override@JsonKey() List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

@override final  int? tasksCompleted;
@override final  int? minutesWorked;

/// Create a copy of ScrapbookHighlights
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapbookHighlightsCopyWith<_ScrapbookHighlights> get copyWith => __$ScrapbookHighlightsCopyWithImpl<_ScrapbookHighlights>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapbookHighlightsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapbookHighlights&&const DeepCollectionEquality().equals(other.milestones, _milestones)&&const DeepCollectionEquality().equals(other.badges, _badges)&&(identical(other.tasksCompleted, tasksCompleted) || other.tasksCompleted == tasksCompleted)&&(identical(other.minutesWorked, minutesWorked) || other.minutesWorked == minutesWorked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_milestones),const DeepCollectionEquality().hash(_badges),tasksCompleted,minutesWorked);
}

@override
String toString() {
    return 'ScrapbookHighlights(milestones: $milestones, badges: $badges, tasksCompleted: $tasksCompleted, minutesWorked: $minutesWorked)';
}


}

/// @nodoc
abstract mixin class _$ScrapbookHighlightsCopyWith<$Res> implements $ScrapbookHighlightsCopyWith<$Res> {
  factory _$ScrapbookHighlightsCopyWith(_ScrapbookHighlights value, $Res Function(_ScrapbookHighlights) _then) = __$ScrapbookHighlightsCopyWithImpl;
@override @useResult
$Res call({
 List<String> milestones, List<String> badges, int? tasksCompleted, int? minutesWorked
});




}
/// @nodoc
class __$ScrapbookHighlightsCopyWithImpl<$Res>
    implements _$ScrapbookHighlightsCopyWith<$Res> {
  __$ScrapbookHighlightsCopyWithImpl(this._self, this._then);

  final _ScrapbookHighlights _self;
  final $Res Function(_ScrapbookHighlights) _then;

/// Create a copy of ScrapbookHighlights
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? milestones = null,Object? badges = null,Object? tasksCompleted = freezed,Object? minutesWorked = freezed,}) {
  return _then(_ScrapbookHighlights(
milestones: null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<String>,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,tasksCompleted: freezed == tasksCompleted ? _self.tasksCompleted : tasksCompleted // ignore: cast_nullable_to_non_nullable
as int?,minutesWorked: freezed == minutesWorked ? _self.minutesWorked : minutesWorked // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Scrapbook {

 String get id;/// project | yearInReview
 String get kind; String get title; String? get projectId; int? get year; String? get narrative; CollageLayout? get layout; ScrapbookHighlights? get highlights;/// compiling | ready | failed
 String get status; DateTime? get createdAt;
/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapbookCopyWith<Scrapbook> get copyWith => _$ScrapbookCopyWithImpl<Scrapbook>(this as Scrapbook, _$identity);

  /// Serializes this Scrapbook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Scrapbook;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scrapbook&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.narrative, _this.narrative) || other.narrative == _this.narrative)&&(identical(other.layout, _this.layout) || other.layout == _this.layout)&&(identical(other.highlights, _this.highlights) || other.highlights == _this.highlights)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Scrapbook;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.title,_this.projectId,_this.year,_this.narrative,_this.layout,_this.highlights,_this.status,_this.createdAt);
}

@override
String toString() {
  final _this = this as Scrapbook;
  return 'Scrapbook(id: ${_this.id}, kind: ${_this.kind}, title: ${_this.title}, projectId: ${_this.projectId}, year: ${_this.year}, narrative: ${_this.narrative}, layout: ${_this.layout}, highlights: ${_this.highlights}, status: ${_this.status}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ScrapbookCopyWith<$Res>  {
  factory $ScrapbookCopyWith(Scrapbook value, $Res Function(Scrapbook) _then) = _$ScrapbookCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String title, String? projectId, int? year, String? narrative, CollageLayout? layout, ScrapbookHighlights? highlights, String status, DateTime? createdAt
});


$CollageLayoutCopyWith<$Res>? get layout;$ScrapbookHighlightsCopyWith<$Res>? get highlights;

}
/// @nodoc
class _$ScrapbookCopyWithImpl<$Res>
    implements $ScrapbookCopyWith<$Res> {
  _$ScrapbookCopyWithImpl(this._self, this._then);

  final Scrapbook _self;
  final $Res Function(Scrapbook) _then;

/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? projectId = freezed,Object? year = freezed,Object? narrative = freezed,Object? layout = freezed,Object? highlights = freezed,Object? status = null,Object? createdAt = freezed,}) {
  return _then(Scrapbook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,layout: freezed == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as CollageLayout?,highlights: freezed == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as ScrapbookHighlights?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollageLayoutCopyWith<$Res>? get layout {
    if (_self.layout == null) {
    return null;
  }

  return $CollageLayoutCopyWith<$Res>(_self.layout!, (value) {
    return _then(_self.copyWith(layout: value));
  });
}/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScrapbookHighlightsCopyWith<$Res>? get highlights {
    if (_self.highlights == null) {
    return null;
  }

  return $ScrapbookHighlightsCopyWith<$Res>(_self.highlights!, (value) {
    return _then(_self.copyWith(highlights: value));
  });
}
}


/// Adds pattern-matching-related methods to [Scrapbook].
extension ScrapbookPatterns on Scrapbook {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scrapbook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scrapbook() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scrapbook value)  $default,){
final _that = this;
switch (_that) {
case _Scrapbook():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scrapbook value)?  $default,){
final _that = this;
switch (_that) {
case _Scrapbook() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  String? projectId,  int? year,  String? narrative,  CollageLayout? layout,  ScrapbookHighlights? highlights,  String status,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scrapbook() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.projectId,_that.year,_that.narrative,_that.layout,_that.highlights,_that.status,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  String? projectId,  int? year,  String? narrative,  CollageLayout? layout,  ScrapbookHighlights? highlights,  String status,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Scrapbook():
return $default(_that.id,_that.kind,_that.title,_that.projectId,_that.year,_that.narrative,_that.layout,_that.highlights,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String title,  String? projectId,  int? year,  String? narrative,  CollageLayout? layout,  ScrapbookHighlights? highlights,  String status,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Scrapbook() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.projectId,_that.year,_that.narrative,_that.layout,_that.highlights,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Scrapbook implements Scrapbook {
  const _Scrapbook({required this.id, this.kind = 'project', this.title = '', this.projectId, this.year, this.narrative, this.layout, this.highlights, this.status = 'ready', this.createdAt});
  factory _Scrapbook.fromJson(Map<String, dynamic> json) => _$ScrapbookFromJson(json);

@override final  String id;
/// project | yearInReview
@override@JsonKey() final  String kind;
@override@JsonKey() final  String title;
@override final  String? projectId;
@override final  int? year;
@override final  String? narrative;
@override final  CollageLayout? layout;
@override final  ScrapbookHighlights? highlights;
/// compiling | ready | failed
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;

/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapbookCopyWith<_Scrapbook> get copyWith => __$ScrapbookCopyWithImpl<_Scrapbook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapbookToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scrapbook&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.year, year) || other.year == year)&&(identical(other.narrative, narrative) || other.narrative == narrative)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.highlights, highlights) || other.highlights == highlights)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,title,projectId,year,narrative,layout,highlights,status,createdAt);
}

@override
String toString() {
    return 'Scrapbook(id: $id, kind: $kind, title: $title, projectId: $projectId, year: $year, narrative: $narrative, layout: $layout, highlights: $highlights, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ScrapbookCopyWith<$Res> implements $ScrapbookCopyWith<$Res> {
  factory _$ScrapbookCopyWith(_Scrapbook value, $Res Function(_Scrapbook) _then) = __$ScrapbookCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String title, String? projectId, int? year, String? narrative, CollageLayout? layout, ScrapbookHighlights? highlights, String status, DateTime? createdAt
});


@override $CollageLayoutCopyWith<$Res>? get layout;@override $ScrapbookHighlightsCopyWith<$Res>? get highlights;

}
/// @nodoc
class __$ScrapbookCopyWithImpl<$Res>
    implements _$ScrapbookCopyWith<$Res> {
  __$ScrapbookCopyWithImpl(this._self, this._then);

  final _Scrapbook _self;
  final $Res Function(_Scrapbook) _then;

/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? projectId = freezed,Object? year = freezed,Object? narrative = freezed,Object? layout = freezed,Object? highlights = freezed,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_Scrapbook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,layout: freezed == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as CollageLayout?,highlights: freezed == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as ScrapbookHighlights?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollageLayoutCopyWith<$Res>? get layout {
    if (_self.layout == null) {
    return null;
  }

  return $CollageLayoutCopyWith<$Res>(_self.layout!, (value) {
    return _then(_self.copyWith(layout: value));
  });
}/// Create a copy of Scrapbook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScrapbookHighlightsCopyWith<$Res>? get highlights {
    if (_self.highlights == null) {
    return null;
  }

  return $ScrapbookHighlightsCopyWith<$Res>(_self.highlights!, (value) {
    return _then(_self.copyWith(highlights: value));
  });
}
}


/// @nodoc
mixin _$ScrapbookView {

 Scrapbook get scrapbook; Map<String, String> get mediaUrls;
/// Create a copy of ScrapbookView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapbookViewCopyWith<ScrapbookView> get copyWith => _$ScrapbookViewCopyWithImpl<ScrapbookView>(this as ScrapbookView, _$identity);

  /// Serializes this ScrapbookView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScrapbookView;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapbookView&&(identical(other.scrapbook, _this.scrapbook) || other.scrapbook == _this.scrapbook)&&const DeepCollectionEquality().equals(other.mediaUrls, _this.mediaUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScrapbookView;
  return Object.hash(runtimeType,_this.scrapbook,const DeepCollectionEquality().hash(_this.mediaUrls));
}

@override
String toString() {
  final _this = this as ScrapbookView;
  return 'ScrapbookView(scrapbook: ${_this.scrapbook}, mediaUrls: ${_this.mediaUrls})';
}


}

/// @nodoc
abstract mixin class $ScrapbookViewCopyWith<$Res>  {
  factory $ScrapbookViewCopyWith(ScrapbookView value, $Res Function(ScrapbookView) _then) = _$ScrapbookViewCopyWithImpl;
@useResult
$Res call({
 Scrapbook scrapbook, Map<String, String> mediaUrls
});


$ScrapbookCopyWith<$Res> get scrapbook;

}
/// @nodoc
class _$ScrapbookViewCopyWithImpl<$Res>
    implements $ScrapbookViewCopyWith<$Res> {
  _$ScrapbookViewCopyWithImpl(this._self, this._then);

  final ScrapbookView _self;
  final $Res Function(ScrapbookView) _then;

/// Create a copy of ScrapbookView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scrapbook = null,Object? mediaUrls = null,}) {
  return _then(ScrapbookView(
scrapbook: null == scrapbook ? _self.scrapbook : scrapbook // ignore: cast_nullable_to_non_nullable
as Scrapbook,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}
/// Create a copy of ScrapbookView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScrapbookCopyWith<$Res> get scrapbook {
  
  return $ScrapbookCopyWith<$Res>(_self.scrapbook, (value) {
    return _then(_self.copyWith(scrapbook: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScrapbookView].
extension ScrapbookViewPatterns on ScrapbookView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapbookView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapbookView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapbookView value)  $default,){
final _that = this;
switch (_that) {
case _ScrapbookView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapbookView value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapbookView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Scrapbook scrapbook,  Map<String, String> mediaUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapbookView() when $default != null:
return $default(_that.scrapbook,_that.mediaUrls);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Scrapbook scrapbook,  Map<String, String> mediaUrls)  $default,) {final _that = this;
switch (_that) {
case _ScrapbookView():
return $default(_that.scrapbook,_that.mediaUrls);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Scrapbook scrapbook,  Map<String, String> mediaUrls)?  $default,) {final _that = this;
switch (_that) {
case _ScrapbookView() when $default != null:
return $default(_that.scrapbook,_that.mediaUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapbookView implements ScrapbookView {
  const _ScrapbookView({required this.scrapbook,  Map<String, String> mediaUrls = const <String, String>{}}): _mediaUrls = mediaUrls;
  factory _ScrapbookView.fromJson(Map<String, dynamic> json) => _$ScrapbookViewFromJson(json);

@override final  Scrapbook scrapbook;
 final  Map<String, String> _mediaUrls;
@override@JsonKey() Map<String, String> get mediaUrls {
  if (_mediaUrls is EqualUnmodifiableMapView) return _mediaUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_mediaUrls);
}


/// Create a copy of ScrapbookView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapbookViewCopyWith<_ScrapbookView> get copyWith => __$ScrapbookViewCopyWithImpl<_ScrapbookView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapbookViewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapbookView&&(identical(other.scrapbook, scrapbook) || other.scrapbook == scrapbook)&&const DeepCollectionEquality().equals(other.mediaUrls, _mediaUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,scrapbook,const DeepCollectionEquality().hash(_mediaUrls));
}

@override
String toString() {
    return 'ScrapbookView(scrapbook: $scrapbook, mediaUrls: $mediaUrls)';
}


}

/// @nodoc
abstract mixin class _$ScrapbookViewCopyWith<$Res> implements $ScrapbookViewCopyWith<$Res> {
  factory _$ScrapbookViewCopyWith(_ScrapbookView value, $Res Function(_ScrapbookView) _then) = __$ScrapbookViewCopyWithImpl;
@override @useResult
$Res call({
 Scrapbook scrapbook, Map<String, String> mediaUrls
});


@override $ScrapbookCopyWith<$Res> get scrapbook;

}
/// @nodoc
class __$ScrapbookViewCopyWithImpl<$Res>
    implements _$ScrapbookViewCopyWith<$Res> {
  __$ScrapbookViewCopyWithImpl(this._self, this._then);

  final _ScrapbookView _self;
  final $Res Function(_ScrapbookView) _then;

/// Create a copy of ScrapbookView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scrapbook = null,Object? mediaUrls = null,}) {
  return _then(_ScrapbookView(
scrapbook: null == scrapbook ? _self.scrapbook : scrapbook // ignore: cast_nullable_to_non_nullable
as Scrapbook,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of ScrapbookView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScrapbookCopyWith<$Res> get scrapbook {
  
  return $ScrapbookCopyWith<$Res>(_self.scrapbook, (value) {
    return _then(_self.copyWith(scrapbook: value));
  });
}
}

// dart format on
