// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResourceMetrics {

 int? get viewCount; int? get likeCount; int? get citationCount;
/// Create a copy of ResourceMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceMetricsCopyWith<ResourceMetrics> get copyWith => _$ResourceMetricsCopyWithImpl<ResourceMetrics>(this as ResourceMetrics, _$identity);

  /// Serializes this ResourceMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResourceMetrics;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceMetrics&&(identical(other.viewCount, _this.viewCount) || other.viewCount == _this.viewCount)&&(identical(other.likeCount, _this.likeCount) || other.likeCount == _this.likeCount)&&(identical(other.citationCount, _this.citationCount) || other.citationCount == _this.citationCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResourceMetrics;
  return Object.hash(runtimeType,_this.viewCount,_this.likeCount,_this.citationCount);
}

@override
String toString() {
  final _this = this as ResourceMetrics;
  return 'ResourceMetrics(viewCount: ${_this.viewCount}, likeCount: ${_this.likeCount}, citationCount: ${_this.citationCount})';
}


}

/// @nodoc
abstract mixin class $ResourceMetricsCopyWith<$Res>  {
  factory $ResourceMetricsCopyWith(ResourceMetrics value, $Res Function(ResourceMetrics) _then) = _$ResourceMetricsCopyWithImpl;
@useResult
$Res call({
 int? viewCount, int? likeCount, int? citationCount
});




}
/// @nodoc
class _$ResourceMetricsCopyWithImpl<$Res>
    implements $ResourceMetricsCopyWith<$Res> {
  _$ResourceMetricsCopyWithImpl(this._self, this._then);

  final ResourceMetrics _self;
  final $Res Function(ResourceMetrics) _then;

/// Create a copy of ResourceMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewCount = freezed,Object? likeCount = freezed,Object? citationCount = freezed,}) {
  return _then(ResourceMetrics(
viewCount: freezed == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,citationCount: freezed == citationCount ? _self.citationCount : citationCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceMetrics].
extension ResourceMetricsPatterns on ResourceMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceMetrics value)  $default,){
final _that = this;
switch (_that) {
case _ResourceMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? viewCount,  int? likeCount,  int? citationCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceMetrics() when $default != null:
return $default(_that.viewCount,_that.likeCount,_that.citationCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? viewCount,  int? likeCount,  int? citationCount)  $default,) {final _that = this;
switch (_that) {
case _ResourceMetrics():
return $default(_that.viewCount,_that.likeCount,_that.citationCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? viewCount,  int? likeCount,  int? citationCount)?  $default,) {final _that = this;
switch (_that) {
case _ResourceMetrics() when $default != null:
return $default(_that.viewCount,_that.likeCount,_that.citationCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceMetrics implements ResourceMetrics {
  const _ResourceMetrics({this.viewCount, this.likeCount, this.citationCount});
  factory _ResourceMetrics.fromJson(Map<String, dynamic> json) => _$ResourceMetricsFromJson(json);

@override final  int? viewCount;
@override final  int? likeCount;
@override final  int? citationCount;

/// Create a copy of ResourceMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceMetricsCopyWith<_ResourceMetrics> get copyWith => __$ResourceMetricsCopyWithImpl<_ResourceMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceMetrics&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.citationCount, citationCount) || other.citationCount == citationCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,viewCount,likeCount,citationCount);
}

@override
String toString() {
    return 'ResourceMetrics(viewCount: $viewCount, likeCount: $likeCount, citationCount: $citationCount)';
}


}

/// @nodoc
abstract mixin class _$ResourceMetricsCopyWith<$Res> implements $ResourceMetricsCopyWith<$Res> {
  factory _$ResourceMetricsCopyWith(_ResourceMetrics value, $Res Function(_ResourceMetrics) _then) = __$ResourceMetricsCopyWithImpl;
@override @useResult
$Res call({
 int? viewCount, int? likeCount, int? citationCount
});




}
/// @nodoc
class __$ResourceMetricsCopyWithImpl<$Res>
    implements _$ResourceMetricsCopyWith<$Res> {
  __$ResourceMetricsCopyWithImpl(this._self, this._then);

  final _ResourceMetrics _self;
  final $Res Function(_ResourceMetrics) _then;

/// Create a copy of ResourceMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewCount = freezed,Object? likeCount = freezed,Object? citationCount = freezed,}) {
  return _then(_ResourceMetrics(
viewCount: freezed == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int?,likeCount: freezed == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int?,citationCount: freezed == citationCount ? _self.citationCount : citationCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ResourceItem {

 String? get id;@JsonKey(unknownEnumValue: ResourceType.unknown) ResourceType get type; String get title; String? get description; String? get sourceName; String get url; int? get durationSeconds; String? get thumbnailUrl; String? get channel; List<String> get authors; int? get year; String? get venue; ResourceMetrics? get metrics; String? get categoryId;
/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceItemCopyWith<ResourceItem> get copyWith => _$ResourceItemCopyWithImpl<ResourceItem>(this as ResourceItem, _$identity);

  /// Serializes this ResourceItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResourceItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.sourceName, _this.sourceName) || other.sourceName == _this.sourceName)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.durationSeconds, _this.durationSeconds) || other.durationSeconds == _this.durationSeconds)&&(identical(other.thumbnailUrl, _this.thumbnailUrl) || other.thumbnailUrl == _this.thumbnailUrl)&&(identical(other.channel, _this.channel) || other.channel == _this.channel)&&const DeepCollectionEquality().equals(other.authors, _this.authors)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.venue, _this.venue) || other.venue == _this.venue)&&(identical(other.metrics, _this.metrics) || other.metrics == _this.metrics)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResourceItem;
  return Object.hash(runtimeType,_this.id,_this.type,_this.title,_this.description,_this.sourceName,_this.url,_this.durationSeconds,_this.thumbnailUrl,_this.channel,const DeepCollectionEquality().hash(_this.authors),_this.year,_this.venue,_this.metrics,_this.categoryId);
}

@override
String toString() {
  final _this = this as ResourceItem;
  return 'ResourceItem(id: ${_this.id}, type: ${_this.type}, title: ${_this.title}, description: ${_this.description}, sourceName: ${_this.sourceName}, url: ${_this.url}, durationSeconds: ${_this.durationSeconds}, thumbnailUrl: ${_this.thumbnailUrl}, channel: ${_this.channel}, authors: ${_this.authors}, year: ${_this.year}, venue: ${_this.venue}, metrics: ${_this.metrics}, categoryId: ${_this.categoryId})';
}


}

/// @nodoc
abstract mixin class $ResourceItemCopyWith<$Res>  {
  factory $ResourceItemCopyWith(ResourceItem value, $Res Function(ResourceItem) _then) = _$ResourceItemCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(unknownEnumValue: ResourceType.unknown) ResourceType type, String title, String? description, String? sourceName, String url, int? durationSeconds, String? thumbnailUrl, String? channel, List<String> authors, int? year, String? venue, ResourceMetrics? metrics, String? categoryId
});


$ResourceMetricsCopyWith<$Res>? get metrics;

}
/// @nodoc
class _$ResourceItemCopyWithImpl<$Res>
    implements $ResourceItemCopyWith<$Res> {
  _$ResourceItemCopyWithImpl(this._self, this._then);

  final ResourceItem _self;
  final $Res Function(ResourceItem) _then;

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? title = null,Object? description = freezed,Object? sourceName = freezed,Object? url = null,Object? durationSeconds = freezed,Object? thumbnailUrl = freezed,Object? channel = freezed,Object? authors = null,Object? year = freezed,Object? venue = freezed,Object? metrics = freezed,Object? categoryId = freezed,}) {
  return _then(ResourceItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResourceType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,metrics: freezed == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as ResourceMetrics?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceMetricsCopyWith<$Res>? get metrics {
    if (_self.metrics == null) {
    return null;
  }

  return $ResourceMetricsCopyWith<$Res>(_self.metrics!, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResourceItem].
extension ResourceItemPatterns on ResourceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceItem value)  $default,){
final _that = this;
switch (_that) {
case _ResourceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceItem value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(unknownEnumValue: ResourceType.unknown)  ResourceType type,  String title,  String? description,  String? sourceName,  String url,  int? durationSeconds,  String? thumbnailUrl,  String? channel,  List<String> authors,  int? year,  String? venue,  ResourceMetrics? metrics,  String? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.sourceName,_that.url,_that.durationSeconds,_that.thumbnailUrl,_that.channel,_that.authors,_that.year,_that.venue,_that.metrics,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(unknownEnumValue: ResourceType.unknown)  ResourceType type,  String title,  String? description,  String? sourceName,  String url,  int? durationSeconds,  String? thumbnailUrl,  String? channel,  List<String> authors,  int? year,  String? venue,  ResourceMetrics? metrics,  String? categoryId)  $default,) {final _that = this;
switch (_that) {
case _ResourceItem():
return $default(_that.id,_that.type,_that.title,_that.description,_that.sourceName,_that.url,_that.durationSeconds,_that.thumbnailUrl,_that.channel,_that.authors,_that.year,_that.venue,_that.metrics,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(unknownEnumValue: ResourceType.unknown)  ResourceType type,  String title,  String? description,  String? sourceName,  String url,  int? durationSeconds,  String? thumbnailUrl,  String? channel,  List<String> authors,  int? year,  String? venue,  ResourceMetrics? metrics,  String? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.sourceName,_that.url,_that.durationSeconds,_that.thumbnailUrl,_that.channel,_that.authors,_that.year,_that.venue,_that.metrics,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceItem implements ResourceItem {
  const _ResourceItem({this.id, @JsonKey(unknownEnumValue: ResourceType.unknown) this.type = ResourceType.article, this.title = '', this.description, this.sourceName, this.url = '', this.durationSeconds, this.thumbnailUrl, this.channel,  List<String> authors = const <String>[], this.year, this.venue, this.metrics, this.categoryId}): _authors = authors;
  factory _ResourceItem.fromJson(Map<String, dynamic> json) => _$ResourceItemFromJson(json);

@override final  String? id;
@override@JsonKey(unknownEnumValue: ResourceType.unknown) final  ResourceType type;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  String? sourceName;
@override@JsonKey() final  String url;
@override final  int? durationSeconds;
@override final  String? thumbnailUrl;
@override final  String? channel;
 final  List<String> _authors;
@override@JsonKey() List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  int? year;
@override final  String? venue;
@override final  ResourceMetrics? metrics;
@override final  String? categoryId;

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceItemCopyWith<_ResourceItem> get copyWith => __$ResourceItemCopyWithImpl<_ResourceItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.url, url) || other.url == url)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other.authors, _authors)&&(identical(other.year, year) || other.year == year)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.metrics, metrics) || other.metrics == metrics)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,title,description,sourceName,url,durationSeconds,thumbnailUrl,channel,const DeepCollectionEquality().hash(_authors),year,venue,metrics,categoryId);
}

@override
String toString() {
    return 'ResourceItem(id: $id, type: $type, title: $title, description: $description, sourceName: $sourceName, url: $url, durationSeconds: $durationSeconds, thumbnailUrl: $thumbnailUrl, channel: $channel, authors: $authors, year: $year, venue: $venue, metrics: $metrics, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ResourceItemCopyWith<$Res> implements $ResourceItemCopyWith<$Res> {
  factory _$ResourceItemCopyWith(_ResourceItem value, $Res Function(_ResourceItem) _then) = __$ResourceItemCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(unknownEnumValue: ResourceType.unknown) ResourceType type, String title, String? description, String? sourceName, String url, int? durationSeconds, String? thumbnailUrl, String? channel, List<String> authors, int? year, String? venue, ResourceMetrics? metrics, String? categoryId
});


@override $ResourceMetricsCopyWith<$Res>? get metrics;

}
/// @nodoc
class __$ResourceItemCopyWithImpl<$Res>
    implements _$ResourceItemCopyWith<$Res> {
  __$ResourceItemCopyWithImpl(this._self, this._then);

  final _ResourceItem _self;
  final $Res Function(_ResourceItem) _then;

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? title = null,Object? description = freezed,Object? sourceName = freezed,Object? url = null,Object? durationSeconds = freezed,Object? thumbnailUrl = freezed,Object? channel = freezed,Object? authors = null,Object? year = freezed,Object? venue = freezed,Object? metrics = freezed,Object? categoryId = freezed,}) {
  return _then(_ResourceItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResourceType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,metrics: freezed == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as ResourceMetrics?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceMetricsCopyWith<$Res>? get metrics {
    if (_self.metrics == null) {
    return null;
  }

  return $ResourceMetricsCopyWith<$Res>(_self.metrics!, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}

/// @nodoc
mixin _$SavedResource {

 String get id; ResourceItem get resource; String? get note; DateTime? get savedAt;
/// Create a copy of SavedResource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedResourceCopyWith<SavedResource> get copyWith => _$SavedResourceCopyWithImpl<SavedResource>(this as SavedResource, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SavedResource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedResource&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.resource, _this.resource) || other.resource == _this.resource)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.savedAt, _this.savedAt) || other.savedAt == _this.savedAt));
}


@override
int get hashCode {
  final _this = this as SavedResource;
  return Object.hash(runtimeType,_this.id,_this.resource,_this.note,_this.savedAt);
}

@override
String toString() {
  final _this = this as SavedResource;
  return 'SavedResource(id: ${_this.id}, resource: ${_this.resource}, note: ${_this.note}, savedAt: ${_this.savedAt})';
}


}

/// @nodoc
abstract mixin class $SavedResourceCopyWith<$Res>  {
  factory $SavedResourceCopyWith(SavedResource value, $Res Function(SavedResource) _then) = _$SavedResourceCopyWithImpl;
@useResult
$Res call({
 String id, ResourceItem resource, String? note, DateTime? savedAt
});


$ResourceItemCopyWith<$Res> get resource;

}
/// @nodoc
class _$SavedResourceCopyWithImpl<$Res>
    implements $SavedResourceCopyWith<$Res> {
  _$SavedResourceCopyWithImpl(this._self, this._then);

  final SavedResource _self;
  final $Res Function(SavedResource) _then;

/// Create a copy of SavedResource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? resource = null,Object? note = freezed,Object? savedAt = freezed,}) {
  return _then(SavedResource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as ResourceItem,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,savedAt: freezed == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of SavedResource
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceItemCopyWith<$Res> get resource {
  
  return $ResourceItemCopyWith<$Res>(_self.resource, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedResource].
extension SavedResourcePatterns on SavedResource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedResource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedResource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedResource value)  $default,){
final _that = this;
switch (_that) {
case _SavedResource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedResource value)?  $default,){
final _that = this;
switch (_that) {
case _SavedResource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ResourceItem resource,  String? note,  DateTime? savedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedResource() when $default != null:
return $default(_that.id,_that.resource,_that.note,_that.savedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ResourceItem resource,  String? note,  DateTime? savedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedResource():
return $default(_that.id,_that.resource,_that.note,_that.savedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ResourceItem resource,  String? note,  DateTime? savedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedResource() when $default != null:
return $default(_that.id,_that.resource,_that.note,_that.savedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SavedResource implements SavedResource {
  const _SavedResource({required this.id, required this.resource, this.note, this.savedAt});
  

@override final  String id;
@override final  ResourceItem resource;
@override final  String? note;
@override final  DateTime? savedAt;

/// Create a copy of SavedResource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedResourceCopyWith<_SavedResource> get copyWith => __$SavedResourceCopyWithImpl<_SavedResource>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedResource&&(identical(other.id, id) || other.id == id)&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.note, note) || other.note == note)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,resource,note,savedAt);
}

@override
String toString() {
    return 'SavedResource(id: $id, resource: $resource, note: $note, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedResourceCopyWith<$Res> implements $SavedResourceCopyWith<$Res> {
  factory _$SavedResourceCopyWith(_SavedResource value, $Res Function(_SavedResource) _then) = __$SavedResourceCopyWithImpl;
@override @useResult
$Res call({
 String id, ResourceItem resource, String? note, DateTime? savedAt
});


@override $ResourceItemCopyWith<$Res> get resource;

}
/// @nodoc
class __$SavedResourceCopyWithImpl<$Res>
    implements _$SavedResourceCopyWith<$Res> {
  __$SavedResourceCopyWithImpl(this._self, this._then);

  final _SavedResource _self;
  final $Res Function(_SavedResource) _then;

/// Create a copy of SavedResource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? resource = null,Object? note = freezed,Object? savedAt = freezed,}) {
  return _then(_SavedResource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as ResourceItem,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,savedAt: freezed == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of SavedResource
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceItemCopyWith<$Res> get resource {
  
  return $ResourceItemCopyWith<$Res>(_self.resource, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// @nodoc
mixin _$ResourceCategory {

 String get id; String get name; String? get description; String? get icon; int get order;
/// Create a copy of ResourceCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceCategoryCopyWith<ResourceCategory> get copyWith => _$ResourceCategoryCopyWithImpl<ResourceCategory>(this as ResourceCategory, _$identity);

  /// Serializes this ResourceCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResourceCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceCategory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.icon, _this.icon) || other.icon == _this.icon)&&(identical(other.order, _this.order) || other.order == _this.order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResourceCategory;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.icon,_this.order);
}

@override
String toString() {
  final _this = this as ResourceCategory;
  return 'ResourceCategory(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, icon: ${_this.icon}, order: ${_this.order})';
}


}

/// @nodoc
abstract mixin class $ResourceCategoryCopyWith<$Res>  {
  factory $ResourceCategoryCopyWith(ResourceCategory value, $Res Function(ResourceCategory) _then) = _$ResourceCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? icon, int order
});




}
/// @nodoc
class _$ResourceCategoryCopyWithImpl<$Res>
    implements $ResourceCategoryCopyWith<$Res> {
  _$ResourceCategoryCopyWithImpl(this._self, this._then);

  final ResourceCategory _self;
  final $Res Function(ResourceCategory) _then;

/// Create a copy of ResourceCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? icon = freezed,Object? order = null,}) {
  return _then(ResourceCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceCategory].
extension ResourceCategoryPatterns on ResourceCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceCategory value)  $default,){
final _that = this;
switch (_that) {
case _ResourceCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? icon,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceCategory() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.icon,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? icon,  int order)  $default,) {final _that = this;
switch (_that) {
case _ResourceCategory():
return $default(_that.id,_that.name,_that.description,_that.icon,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? icon,  int order)?  $default,) {final _that = this;
switch (_that) {
case _ResourceCategory() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.icon,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceCategory implements ResourceCategory {
  const _ResourceCategory({required this.id, this.name = '', this.description, this.icon, this.order = 0});
  factory _ResourceCategory.fromJson(Map<String, dynamic> json) => _$ResourceCategoryFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override final  String? description;
@override final  String? icon;
@override@JsonKey() final  int order;

/// Create a copy of ResourceCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceCategoryCopyWith<_ResourceCategory> get copyWith => __$ResourceCategoryCopyWithImpl<_ResourceCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,icon,order);
}

@override
String toString() {
    return 'ResourceCategory(id: $id, name: $name, description: $description, icon: $icon, order: $order)';
}


}

/// @nodoc
abstract mixin class _$ResourceCategoryCopyWith<$Res> implements $ResourceCategoryCopyWith<$Res> {
  factory _$ResourceCategoryCopyWith(_ResourceCategory value, $Res Function(_ResourceCategory) _then) = __$ResourceCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? icon, int order
});




}
/// @nodoc
class __$ResourceCategoryCopyWithImpl<$Res>
    implements _$ResourceCategoryCopyWith<$Res> {
  __$ResourceCategoryCopyWithImpl(this._self, this._then);

  final _ResourceCategory _self;
  final $Res Function(_ResourceCategory) _then;

/// Create a copy of ResourceCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? icon = freezed,Object? order = null,}) {
  return _then(_ResourceCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ResourceResults {

 List<ResourceItem> get items; String? get query; String? get note;
/// Create a copy of ResourceResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceResultsCopyWith<ResourceResults> get copyWith => _$ResourceResultsCopyWithImpl<ResourceResults>(this as ResourceResults, _$identity);

  /// Serializes this ResourceResults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResourceResults;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceResults&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResourceResults;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.query,_this.note);
}

@override
String toString() {
  final _this = this as ResourceResults;
  return 'ResourceResults(items: ${_this.items}, query: ${_this.query}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ResourceResultsCopyWith<$Res>  {
  factory $ResourceResultsCopyWith(ResourceResults value, $Res Function(ResourceResults) _then) = _$ResourceResultsCopyWithImpl;
@useResult
$Res call({
 List<ResourceItem> items, String? query, String? note
});




}
/// @nodoc
class _$ResourceResultsCopyWithImpl<$Res>
    implements $ResourceResultsCopyWith<$Res> {
  _$ResourceResultsCopyWithImpl(this._self, this._then);

  final ResourceResults _self;
  final $Res Function(ResourceResults) _then;

/// Create a copy of ResourceResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? query = freezed,Object? note = freezed,}) {
  return _then(ResourceResults(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ResourceItem>,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceResults].
extension ResourceResultsPatterns on ResourceResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceResults value)  $default,){
final _that = this;
switch (_that) {
case _ResourceResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceResults value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ResourceItem> items,  String? query,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceResults() when $default != null:
return $default(_that.items,_that.query,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ResourceItem> items,  String? query,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ResourceResults():
return $default(_that.items,_that.query,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ResourceItem> items,  String? query,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ResourceResults() when $default != null:
return $default(_that.items,_that.query,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceResults implements ResourceResults {
  const _ResourceResults({ List<ResourceItem> items = const <ResourceItem>[], this.query, this.note}): _items = items;
  factory _ResourceResults.fromJson(Map<String, dynamic> json) => _$ResourceResultsFromJson(json);

 final  List<ResourceItem> _items;
@override@JsonKey() List<ResourceItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? query;
@override final  String? note;

/// Create a copy of ResourceResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceResultsCopyWith<_ResourceResults> get copyWith => __$ResourceResultsCopyWithImpl<_ResourceResults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceResultsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceResults&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.query, query) || other.query == query)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),query,note);
}

@override
String toString() {
    return 'ResourceResults(items: $items, query: $query, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ResourceResultsCopyWith<$Res> implements $ResourceResultsCopyWith<$Res> {
  factory _$ResourceResultsCopyWith(_ResourceResults value, $Res Function(_ResourceResults) _then) = __$ResourceResultsCopyWithImpl;
@override @useResult
$Res call({
 List<ResourceItem> items, String? query, String? note
});




}
/// @nodoc
class __$ResourceResultsCopyWithImpl<$Res>
    implements _$ResourceResultsCopyWith<$Res> {
  __$ResourceResultsCopyWithImpl(this._self, this._then);

  final _ResourceResults _self;
  final $Res Function(_ResourceResults) _then;

/// Create a copy of ResourceResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? query = freezed,Object? note = freezed,}) {
  return _then(_ResourceResults(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ResourceItem>,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Opportunity {

 String? get id; String get title; String? get organization; String? get description; String get type; String? get eligibility; String? get ageRange; String? get locationCity; String? get locationRegion; String? get locationCountry; bool get isRemote; DateTime? get deadline; String? get url;@JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion) OpportunityLabel get label; DateTime? get verifiedAt;
/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpportunityCopyWith<Opportunity> get copyWith => _$OpportunityCopyWithImpl<Opportunity>(this as Opportunity, _$identity);

  /// Serializes this Opportunity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Opportunity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Opportunity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.organization, _this.organization) || other.organization == _this.organization)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.eligibility, _this.eligibility) || other.eligibility == _this.eligibility)&&(identical(other.ageRange, _this.ageRange) || other.ageRange == _this.ageRange)&&(identical(other.locationCity, _this.locationCity) || other.locationCity == _this.locationCity)&&(identical(other.locationRegion, _this.locationRegion) || other.locationRegion == _this.locationRegion)&&(identical(other.locationCountry, _this.locationCountry) || other.locationCountry == _this.locationCountry)&&(identical(other.isRemote, _this.isRemote) || other.isRemote == _this.isRemote)&&(identical(other.deadline, _this.deadline) || other.deadline == _this.deadline)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.verifiedAt, _this.verifiedAt) || other.verifiedAt == _this.verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Opportunity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.organization,_this.description,_this.type,_this.eligibility,_this.ageRange,_this.locationCity,_this.locationRegion,_this.locationCountry,_this.isRemote,_this.deadline,_this.url,_this.label,_this.verifiedAt);
}

@override
String toString() {
  final _this = this as Opportunity;
  return 'Opportunity(id: ${_this.id}, title: ${_this.title}, organization: ${_this.organization}, description: ${_this.description}, type: ${_this.type}, eligibility: ${_this.eligibility}, ageRange: ${_this.ageRange}, locationCity: ${_this.locationCity}, locationRegion: ${_this.locationRegion}, locationCountry: ${_this.locationCountry}, isRemote: ${_this.isRemote}, deadline: ${_this.deadline}, url: ${_this.url}, label: ${_this.label}, verifiedAt: ${_this.verifiedAt})';
}


}

/// @nodoc
abstract mixin class $OpportunityCopyWith<$Res>  {
  factory $OpportunityCopyWith(Opportunity value, $Res Function(Opportunity) _then) = _$OpportunityCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String? organization, String? description, String type, String? eligibility, String? ageRange, String? locationCity, String? locationRegion, String? locationCountry, bool isRemote, DateTime? deadline, String? url,@JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion) OpportunityLabel label, DateTime? verifiedAt
});




}
/// @nodoc
class _$OpportunityCopyWithImpl<$Res>
    implements $OpportunityCopyWith<$Res> {
  _$OpportunityCopyWithImpl(this._self, this._then);

  final Opportunity _self;
  final $Res Function(Opportunity) _then;

/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? organization = freezed,Object? description = freezed,Object? type = null,Object? eligibility = freezed,Object? ageRange = freezed,Object? locationCity = freezed,Object? locationRegion = freezed,Object? locationCountry = freezed,Object? isRemote = null,Object? deadline = freezed,Object? url = freezed,Object? label = null,Object? verifiedAt = freezed,}) {
  return _then(Opportunity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as String?,ageRange: freezed == ageRange ? _self.ageRange : ageRange // ignore: cast_nullable_to_non_nullable
as String?,locationCity: freezed == locationCity ? _self.locationCity : locationCity // ignore: cast_nullable_to_non_nullable
as String?,locationRegion: freezed == locationRegion ? _self.locationRegion : locationRegion // ignore: cast_nullable_to_non_nullable
as String?,locationCountry: freezed == locationCountry ? _self.locationCountry : locationCountry // ignore: cast_nullable_to_non_nullable
as String?,isRemote: null == isRemote ? _self.isRemote : isRemote // ignore: cast_nullable_to_non_nullable
as bool,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as OpportunityLabel,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Opportunity].
extension OpportunityPatterns on Opportunity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Opportunity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Opportunity value)  $default,){
final _that = this;
switch (_that) {
case _Opportunity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Opportunity value)?  $default,){
final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String? organization,  String? description,  String type,  String? eligibility,  String? ageRange,  String? locationCity,  String? locationRegion,  String? locationCountry,  bool isRemote,  DateTime? deadline,  String? url, @JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion)  OpportunityLabel label,  DateTime? verifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
return $default(_that.id,_that.title,_that.organization,_that.description,_that.type,_that.eligibility,_that.ageRange,_that.locationCity,_that.locationRegion,_that.locationCountry,_that.isRemote,_that.deadline,_that.url,_that.label,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String? organization,  String? description,  String type,  String? eligibility,  String? ageRange,  String? locationCity,  String? locationRegion,  String? locationCountry,  bool isRemote,  DateTime? deadline,  String? url, @JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion)  OpportunityLabel label,  DateTime? verifiedAt)  $default,) {final _that = this;
switch (_that) {
case _Opportunity():
return $default(_that.id,_that.title,_that.organization,_that.description,_that.type,_that.eligibility,_that.ageRange,_that.locationCity,_that.locationRegion,_that.locationCountry,_that.isRemote,_that.deadline,_that.url,_that.label,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String? organization,  String? description,  String type,  String? eligibility,  String? ageRange,  String? locationCity,  String? locationRegion,  String? locationCountry,  bool isRemote,  DateTime? deadline,  String? url, @JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion)  OpportunityLabel label,  DateTime? verifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
return $default(_that.id,_that.title,_that.organization,_that.description,_that.type,_that.eligibility,_that.ageRange,_that.locationCity,_that.locationRegion,_that.locationCountry,_that.isRemote,_that.deadline,_that.url,_that.label,_that.verifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Opportunity extends Opportunity {
  const _Opportunity({this.id, this.title = '', this.organization, this.description, this.type = 'community org', this.eligibility, this.ageRange, this.locationCity, this.locationRegion, this.locationCountry, this.isRemote = false, this.deadline, this.url, @JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion) this.label = OpportunityLabel.aiSuggestion, this.verifiedAt}): super._();
  factory _Opportunity.fromJson(Map<String, dynamic> json) => _$OpportunityFromJson(json);

@override final  String? id;
@override@JsonKey() final  String title;
@override final  String? organization;
@override final  String? description;
@override@JsonKey() final  String type;
@override final  String? eligibility;
@override final  String? ageRange;
@override final  String? locationCity;
@override final  String? locationRegion;
@override final  String? locationCountry;
@override@JsonKey() final  bool isRemote;
@override final  DateTime? deadline;
@override final  String? url;
@override@JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion) final  OpportunityLabel label;
@override final  DateTime? verifiedAt;

/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpportunityCopyWith<_Opportunity> get copyWith => __$OpportunityCopyWithImpl<_Opportunity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpportunityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Opportunity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.ageRange, ageRange) || other.ageRange == ageRange)&&(identical(other.locationCity, locationCity) || other.locationCity == locationCity)&&(identical(other.locationRegion, locationRegion) || other.locationRegion == locationRegion)&&(identical(other.locationCountry, locationCountry) || other.locationCountry == locationCountry)&&(identical(other.isRemote, isRemote) || other.isRemote == isRemote)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.url, url) || other.url == url)&&(identical(other.label, label) || other.label == label)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,organization,description,type,eligibility,ageRange,locationCity,locationRegion,locationCountry,isRemote,deadline,url,label,verifiedAt);
}

@override
String toString() {
    return 'Opportunity(id: $id, title: $title, organization: $organization, description: $description, type: $type, eligibility: $eligibility, ageRange: $ageRange, locationCity: $locationCity, locationRegion: $locationRegion, locationCountry: $locationCountry, isRemote: $isRemote, deadline: $deadline, url: $url, label: $label, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class _$OpportunityCopyWith<$Res> implements $OpportunityCopyWith<$Res> {
  factory _$OpportunityCopyWith(_Opportunity value, $Res Function(_Opportunity) _then) = __$OpportunityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String? organization, String? description, String type, String? eligibility, String? ageRange, String? locationCity, String? locationRegion, String? locationCountry, bool isRemote, DateTime? deadline, String? url,@JsonKey(unknownEnumValue: OpportunityLabel.aiSuggestion) OpportunityLabel label, DateTime? verifiedAt
});




}
/// @nodoc
class __$OpportunityCopyWithImpl<$Res>
    implements _$OpportunityCopyWith<$Res> {
  __$OpportunityCopyWithImpl(this._self, this._then);

  final _Opportunity _self;
  final $Res Function(_Opportunity) _then;

/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? organization = freezed,Object? description = freezed,Object? type = null,Object? eligibility = freezed,Object? ageRange = freezed,Object? locationCity = freezed,Object? locationRegion = freezed,Object? locationCountry = freezed,Object? isRemote = null,Object? deadline = freezed,Object? url = freezed,Object? label = null,Object? verifiedAt = freezed,}) {
  return _then(_Opportunity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as String?,ageRange: freezed == ageRange ? _self.ageRange : ageRange // ignore: cast_nullable_to_non_nullable
as String?,locationCity: freezed == locationCity ? _self.locationCity : locationCity // ignore: cast_nullable_to_non_nullable
as String?,locationRegion: freezed == locationRegion ? _self.locationRegion : locationRegion // ignore: cast_nullable_to_non_nullable
as String?,locationCountry: freezed == locationCountry ? _self.locationCountry : locationCountry // ignore: cast_nullable_to_non_nullable
as String?,isRemote: null == isRemote ? _self.isRemote : isRemote // ignore: cast_nullable_to_non_nullable
as bool,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as OpportunityLabel,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$OpportunityResults {

 List<Opportunity> get items; String? get outreachTemplate; List<String> get searchStrategies;
/// Create a copy of OpportunityResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpportunityResultsCopyWith<OpportunityResults> get copyWith => _$OpportunityResultsCopyWithImpl<OpportunityResults>(this as OpportunityResults, _$identity);

  /// Serializes this OpportunityResults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OpportunityResults;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpportunityResults&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.outreachTemplate, _this.outreachTemplate) || other.outreachTemplate == _this.outreachTemplate)&&const DeepCollectionEquality().equals(other.searchStrategies, _this.searchStrategies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OpportunityResults;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.outreachTemplate,const DeepCollectionEquality().hash(_this.searchStrategies));
}

@override
String toString() {
  final _this = this as OpportunityResults;
  return 'OpportunityResults(items: ${_this.items}, outreachTemplate: ${_this.outreachTemplate}, searchStrategies: ${_this.searchStrategies})';
}


}

/// @nodoc
abstract mixin class $OpportunityResultsCopyWith<$Res>  {
  factory $OpportunityResultsCopyWith(OpportunityResults value, $Res Function(OpportunityResults) _then) = _$OpportunityResultsCopyWithImpl;
@useResult
$Res call({
 List<Opportunity> items, String? outreachTemplate, List<String> searchStrategies
});




}
/// @nodoc
class _$OpportunityResultsCopyWithImpl<$Res>
    implements $OpportunityResultsCopyWith<$Res> {
  _$OpportunityResultsCopyWithImpl(this._self, this._then);

  final OpportunityResults _self;
  final $Res Function(OpportunityResults) _then;

/// Create a copy of OpportunityResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? outreachTemplate = freezed,Object? searchStrategies = null,}) {
  return _then(OpportunityResults(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Opportunity>,outreachTemplate: freezed == outreachTemplate ? _self.outreachTemplate : outreachTemplate // ignore: cast_nullable_to_non_nullable
as String?,searchStrategies: null == searchStrategies ? _self.searchStrategies : searchStrategies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [OpportunityResults].
extension OpportunityResultsPatterns on OpportunityResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpportunityResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpportunityResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpportunityResults value)  $default,){
final _that = this;
switch (_that) {
case _OpportunityResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpportunityResults value)?  $default,){
final _that = this;
switch (_that) {
case _OpportunityResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Opportunity> items,  String? outreachTemplate,  List<String> searchStrategies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpportunityResults() when $default != null:
return $default(_that.items,_that.outreachTemplate,_that.searchStrategies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Opportunity> items,  String? outreachTemplate,  List<String> searchStrategies)  $default,) {final _that = this;
switch (_that) {
case _OpportunityResults():
return $default(_that.items,_that.outreachTemplate,_that.searchStrategies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Opportunity> items,  String? outreachTemplate,  List<String> searchStrategies)?  $default,) {final _that = this;
switch (_that) {
case _OpportunityResults() when $default != null:
return $default(_that.items,_that.outreachTemplate,_that.searchStrategies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpportunityResults implements OpportunityResults {
  const _OpportunityResults({ List<Opportunity> items = const <Opportunity>[], this.outreachTemplate,  List<String> searchStrategies = const <String>[]}): _items = items,_searchStrategies = searchStrategies;
  factory _OpportunityResults.fromJson(Map<String, dynamic> json) => _$OpportunityResultsFromJson(json);

 final  List<Opportunity> _items;
@override@JsonKey() List<Opportunity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? outreachTemplate;
 final  List<String> _searchStrategies;
@override@JsonKey() List<String> get searchStrategies {
  if (_searchStrategies is EqualUnmodifiableListView) return _searchStrategies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchStrategies);
}


/// Create a copy of OpportunityResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpportunityResultsCopyWith<_OpportunityResults> get copyWith => __$OpportunityResultsCopyWithImpl<_OpportunityResults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpportunityResultsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpportunityResults&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.outreachTemplate, outreachTemplate) || other.outreachTemplate == outreachTemplate)&&const DeepCollectionEquality().equals(other.searchStrategies, _searchStrategies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),outreachTemplate,const DeepCollectionEquality().hash(_searchStrategies));
}

@override
String toString() {
    return 'OpportunityResults(items: $items, outreachTemplate: $outreachTemplate, searchStrategies: $searchStrategies)';
}


}

/// @nodoc
abstract mixin class _$OpportunityResultsCopyWith<$Res> implements $OpportunityResultsCopyWith<$Res> {
  factory _$OpportunityResultsCopyWith(_OpportunityResults value, $Res Function(_OpportunityResults) _then) = __$OpportunityResultsCopyWithImpl;
@override @useResult
$Res call({
 List<Opportunity> items, String? outreachTemplate, List<String> searchStrategies
});




}
/// @nodoc
class __$OpportunityResultsCopyWithImpl<$Res>
    implements _$OpportunityResultsCopyWith<$Res> {
  __$OpportunityResultsCopyWithImpl(this._self, this._then);

  final _OpportunityResults _self;
  final $Res Function(_OpportunityResults) _then;

/// Create a copy of OpportunityResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? outreachTemplate = freezed,Object? searchStrategies = null,}) {
  return _then(_OpportunityResults(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Opportunity>,outreachTemplate: freezed == outreachTemplate ? _self.outreachTemplate : outreachTemplate // ignore: cast_nullable_to_non_nullable
as String?,searchStrategies: null == searchStrategies ? _self._searchStrategies : searchStrategies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
