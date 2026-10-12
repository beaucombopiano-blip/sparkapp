// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Conversation {

 String get id; String? get title; String? get projectId; String? get lastMessagePreview; DateTime? get lastMessageAt; DateTime? get createdAt;
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCopyWith<Conversation> get copyWith => _$ConversationCopyWithImpl<Conversation>(this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Conversation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.lastMessagePreview, _this.lastMessagePreview) || other.lastMessagePreview == _this.lastMessagePreview)&&(identical(other.lastMessageAt, _this.lastMessageAt) || other.lastMessageAt == _this.lastMessageAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Conversation;
  return Object.hash(runtimeType,_this.id,_this.title,_this.projectId,_this.lastMessagePreview,_this.lastMessageAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as Conversation;
  return 'Conversation(id: ${_this.id}, title: ${_this.title}, projectId: ${_this.projectId}, lastMessagePreview: ${_this.lastMessagePreview}, lastMessageAt: ${_this.lastMessageAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res>  {
  factory $ConversationCopyWith(Conversation value, $Res Function(Conversation) _then) = _$ConversationCopyWithImpl;
@useResult
$Res call({
 String id, String? title, String? projectId, String? lastMessagePreview, DateTime? lastMessageAt, DateTime? createdAt
});




}
/// @nodoc
class _$ConversationCopyWithImpl<$Res>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = freezed,Object? projectId = freezed,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,Object? createdAt = freezed,}) {
  return _then(Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversation value)  $default,){
final _that = this;
switch (_that) {
case _Conversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversation value)?  $default,){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? title,  String? projectId,  String? lastMessagePreview,  DateTime? lastMessageAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.title,_that.projectId,_that.lastMessagePreview,_that.lastMessageAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? title,  String? projectId,  String? lastMessagePreview,  DateTime? lastMessageAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Conversation():
return $default(_that.id,_that.title,_that.projectId,_that.lastMessagePreview,_that.lastMessageAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? title,  String? projectId,  String? lastMessagePreview,  DateTime? lastMessageAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.title,_that.projectId,_that.lastMessagePreview,_that.lastMessageAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conversation implements Conversation {
  const _Conversation({required this.id, this.title, this.projectId, this.lastMessagePreview, this.lastMessageAt, this.createdAt});
  factory _Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

@override final  String id;
@override final  String? title;
@override final  String? projectId;
@override final  String? lastMessagePreview;
@override final  DateTime? lastMessageAt;
@override final  DateTime? createdAt;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCopyWith<_Conversation> get copyWith => __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,projectId,lastMessagePreview,lastMessageAt,createdAt);
}

@override
String toString() {
    return 'Conversation(id: $id, title: $title, projectId: $projectId, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res> implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(_Conversation value, $Res Function(_Conversation) _then) = __$ConversationCopyWithImpl;
@override @useResult
$Res call({
 String id, String? title, String? projectId, String? lastMessagePreview, DateTime? lastMessageAt, DateTime? createdAt
});




}
/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? projectId = freezed,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,Object? createdAt = freezed,}) {
  return _then(_Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$SupportResource {

 String get label; String? get phone; String? get sms; String? get url; String? get description;
/// Create a copy of SupportResource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportResourceCopyWith<SupportResource> get copyWith => _$SupportResourceCopyWithImpl<SupportResource>(this as SupportResource, _$identity);

  /// Serializes this SupportResource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupportResource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportResource&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.sms, _this.sms) || other.sms == _this.sms)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupportResource;
  return Object.hash(runtimeType,_this.label,_this.phone,_this.sms,_this.url,_this.description);
}

@override
String toString() {
  final _this = this as SupportResource;
  return 'SupportResource(label: ${_this.label}, phone: ${_this.phone}, sms: ${_this.sms}, url: ${_this.url}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $SupportResourceCopyWith<$Res>  {
  factory $SupportResourceCopyWith(SupportResource value, $Res Function(SupportResource) _then) = _$SupportResourceCopyWithImpl;
@useResult
$Res call({
 String label, String? phone, String? sms, String? url, String? description
});




}
/// @nodoc
class _$SupportResourceCopyWithImpl<$Res>
    implements $SupportResourceCopyWith<$Res> {
  _$SupportResourceCopyWithImpl(this._self, this._then);

  final SupportResource _self;
  final $Res Function(SupportResource) _then;

/// Create a copy of SupportResource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? phone = freezed,Object? sms = freezed,Object? url = freezed,Object? description = freezed,}) {
  return _then(SupportResource(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,sms: freezed == sms ? _self.sms : sms // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportResource].
extension SupportResourcePatterns on SupportResource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportResource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportResource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportResource value)  $default,){
final _that = this;
switch (_that) {
case _SupportResource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportResource value)?  $default,){
final _that = this;
switch (_that) {
case _SupportResource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String? phone,  String? sms,  String? url,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportResource() when $default != null:
return $default(_that.label,_that.phone,_that.sms,_that.url,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String? phone,  String? sms,  String? url,  String? description)  $default,) {final _that = this;
switch (_that) {
case _SupportResource():
return $default(_that.label,_that.phone,_that.sms,_that.url,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String? phone,  String? sms,  String? url,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _SupportResource() when $default != null:
return $default(_that.label,_that.phone,_that.sms,_that.url,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportResource implements SupportResource {
  const _SupportResource({this.label = '', this.phone, this.sms, this.url, this.description});
  factory _SupportResource.fromJson(Map<String, dynamic> json) => _$SupportResourceFromJson(json);

@override@JsonKey() final  String label;
@override final  String? phone;
@override final  String? sms;
@override final  String? url;
@override final  String? description;

/// Create a copy of SupportResource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportResourceCopyWith<_SupportResource> get copyWith => __$SupportResourceCopyWithImpl<_SupportResource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportResourceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportResource&&(identical(other.label, label) || other.label == label)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.sms, sms) || other.sms == sms)&&(identical(other.url, url) || other.url == url)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,phone,sms,url,description);
}

@override
String toString() {
    return 'SupportResource(label: $label, phone: $phone, sms: $sms, url: $url, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SupportResourceCopyWith<$Res> implements $SupportResourceCopyWith<$Res> {
  factory _$SupportResourceCopyWith(_SupportResource value, $Res Function(_SupportResource) _then) = __$SupportResourceCopyWithImpl;
@override @useResult
$Res call({
 String label, String? phone, String? sms, String? url, String? description
});




}
/// @nodoc
class __$SupportResourceCopyWithImpl<$Res>
    implements _$SupportResourceCopyWith<$Res> {
  __$SupportResourceCopyWithImpl(this._self, this._then);

  final _SupportResource _self;
  final $Res Function(_SupportResource) _then;

/// Create a copy of SupportResource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? phone = freezed,Object? sms = freezed,Object? url = freezed,Object? description = freezed,}) {
  return _then(_SupportResource(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,sms: freezed == sms ? _self.sms : sms // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SafetyInfo {

 bool get crisis; String? get message; List<SupportResource> get resources;
/// Create a copy of SafetyInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SafetyInfoCopyWith<SafetyInfo> get copyWith => _$SafetyInfoCopyWithImpl<SafetyInfo>(this as SafetyInfo, _$identity);

  /// Serializes this SafetyInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SafetyInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SafetyInfo&&(identical(other.crisis, _this.crisis) || other.crisis == _this.crisis)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.resources, _this.resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SafetyInfo;
  return Object.hash(runtimeType,_this.crisis,_this.message,const DeepCollectionEquality().hash(_this.resources));
}

@override
String toString() {
  final _this = this as SafetyInfo;
  return 'SafetyInfo(crisis: ${_this.crisis}, message: ${_this.message}, resources: ${_this.resources})';
}


}

/// @nodoc
abstract mixin class $SafetyInfoCopyWith<$Res>  {
  factory $SafetyInfoCopyWith(SafetyInfo value, $Res Function(SafetyInfo) _then) = _$SafetyInfoCopyWithImpl;
@useResult
$Res call({
 bool crisis, String? message, List<SupportResource> resources
});




}
/// @nodoc
class _$SafetyInfoCopyWithImpl<$Res>
    implements $SafetyInfoCopyWith<$Res> {
  _$SafetyInfoCopyWithImpl(this._self, this._then);

  final SafetyInfo _self;
  final $Res Function(SafetyInfo) _then;

/// Create a copy of SafetyInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? crisis = null,Object? message = freezed,Object? resources = null,}) {
  return _then(SafetyInfo(
crisis: null == crisis ? _self.crisis : crisis // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<SupportResource>,
  ));
}

}


/// Adds pattern-matching-related methods to [SafetyInfo].
extension SafetyInfoPatterns on SafetyInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SafetyInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SafetyInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SafetyInfo value)  $default,){
final _that = this;
switch (_that) {
case _SafetyInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SafetyInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SafetyInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool crisis,  String? message,  List<SupportResource> resources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SafetyInfo() when $default != null:
return $default(_that.crisis,_that.message,_that.resources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool crisis,  String? message,  List<SupportResource> resources)  $default,) {final _that = this;
switch (_that) {
case _SafetyInfo():
return $default(_that.crisis,_that.message,_that.resources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool crisis,  String? message,  List<SupportResource> resources)?  $default,) {final _that = this;
switch (_that) {
case _SafetyInfo() when $default != null:
return $default(_that.crisis,_that.message,_that.resources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SafetyInfo implements SafetyInfo {
  const _SafetyInfo({this.crisis = false, this.message,  List<SupportResource> resources = const <SupportResource>[]}): _resources = resources;
  factory _SafetyInfo.fromJson(Map<String, dynamic> json) => _$SafetyInfoFromJson(json);

@override@JsonKey() final  bool crisis;
@override final  String? message;
 final  List<SupportResource> _resources;
@override@JsonKey() List<SupportResource> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}


/// Create a copy of SafetyInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SafetyInfoCopyWith<_SafetyInfo> get copyWith => __$SafetyInfoCopyWithImpl<_SafetyInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SafetyInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SafetyInfo&&(identical(other.crisis, crisis) || other.crisis == crisis)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.resources, _resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,crisis,message,const DeepCollectionEquality().hash(_resources));
}

@override
String toString() {
    return 'SafetyInfo(crisis: $crisis, message: $message, resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$SafetyInfoCopyWith<$Res> implements $SafetyInfoCopyWith<$Res> {
  factory _$SafetyInfoCopyWith(_SafetyInfo value, $Res Function(_SafetyInfo) _then) = __$SafetyInfoCopyWithImpl;
@override @useResult
$Res call({
 bool crisis, String? message, List<SupportResource> resources
});




}
/// @nodoc
class __$SafetyInfoCopyWithImpl<$Res>
    implements _$SafetyInfoCopyWith<$Res> {
  __$SafetyInfoCopyWithImpl(this._self, this._then);

  final _SafetyInfo _self;
  final $Res Function(_SafetyInfo) _then;

/// Create a copy of SafetyInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? crisis = null,Object? message = freezed,Object? resources = null,}) {
  return _then(_SafetyInfo(
crisis: null == crisis ? _self.crisis : crisis // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<SupportResource>,
  ));
}


}


/// @nodoc
mixin _$ChatMessage {

 String get id; String get role; String get content; List<Map<String, dynamic>> get attachments; List<String> get proposedActionIds; SafetyInfo? get safety; DateTime? get createdAt;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.content, _this.content) || other.content == _this.content)&&const DeepCollectionEquality().equals(other.attachments, _this.attachments)&&const DeepCollectionEquality().equals(other.proposedActionIds, _this.proposedActionIds)&&(identical(other.safety, _this.safety) || other.safety == _this.safety)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatMessage;
  return Object.hash(runtimeType,_this.id,_this.role,_this.content,const DeepCollectionEquality().hash(_this.attachments),const DeepCollectionEquality().hash(_this.proposedActionIds),_this.safety,_this.createdAt);
}

@override
String toString() {
  final _this = this as ChatMessage;
  return 'ChatMessage(id: ${_this.id}, role: ${_this.role}, content: ${_this.content}, attachments: ${_this.attachments}, proposedActionIds: ${_this.proposedActionIds}, safety: ${_this.safety}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, String role, String content, List<Map<String, dynamic>> attachments, List<String> proposedActionIds, SafetyInfo? safety, DateTime? createdAt
});


$SafetyInfoCopyWith<$Res>? get safety;

}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? attachments = null,Object? proposedActionIds = null,Object? safety = freezed,Object? createdAt = freezed,}) {
  return _then(ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,proposedActionIds: null == proposedActionIds ? _self.proposedActionIds : proposedActionIds // ignore: cast_nullable_to_non_nullable
as List<String>,safety: freezed == safety ? _self.safety : safety // ignore: cast_nullable_to_non_nullable
as SafetyInfo?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SafetyInfoCopyWith<$Res>? get safety {
    if (_self.safety == null) {
    return null;
  }

  return $SafetyInfoCopyWith<$Res>(_self.safety!, (value) {
    return _then(_self.copyWith(safety: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String role,  String content,  List<Map<String, dynamic>> attachments,  List<String> proposedActionIds,  SafetyInfo? safety,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.attachments,_that.proposedActionIds,_that.safety,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String role,  String content,  List<Map<String, dynamic>> attachments,  List<String> proposedActionIds,  SafetyInfo? safety,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.role,_that.content,_that.attachments,_that.proposedActionIds,_that.safety,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String role,  String content,  List<Map<String, dynamic>> attachments,  List<String> proposedActionIds,  SafetyInfo? safety,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.attachments,_that.proposedActionIds,_that.safety,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage extends ChatMessage {
  const _ChatMessage({required this.id, this.role = 'assistant', this.content = '',  List<Map<String, dynamic>> attachments = const <Map<String, dynamic>>[],  List<String> proposedActionIds = const <String>[], this.safety, this.createdAt}): _attachments = attachments,_proposedActionIds = proposedActionIds,super._();
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override@JsonKey() final  String role;
@override@JsonKey() final  String content;
 final  List<Map<String, dynamic>> _attachments;
@override@JsonKey() List<Map<String, dynamic>> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

 final  List<String> _proposedActionIds;
@override@JsonKey() List<String> get proposedActionIds {
  if (_proposedActionIds is EqualUnmodifiableListView) return _proposedActionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_proposedActionIds);
}

@override final  SafetyInfo? safety;
@override final  DateTime? createdAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.attachments, _attachments)&&const DeepCollectionEquality().equals(other.proposedActionIds, _proposedActionIds)&&(identical(other.safety, safety) || other.safety == safety)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,role,content,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_proposedActionIds),safety,createdAt);
}

@override
String toString() {
    return 'ChatMessage(id: $id, role: $role, content: $content, attachments: $attachments, proposedActionIds: $proposedActionIds, safety: $safety, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String role, String content, List<Map<String, dynamic>> attachments, List<String> proposedActionIds, SafetyInfo? safety, DateTime? createdAt
});


@override $SafetyInfoCopyWith<$Res>? get safety;

}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? attachments = null,Object? proposedActionIds = null,Object? safety = freezed,Object? createdAt = freezed,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,proposedActionIds: null == proposedActionIds ? _self._proposedActionIds : proposedActionIds // ignore: cast_nullable_to_non_nullable
as List<String>,safety: freezed == safety ? _self.safety : safety // ignore: cast_nullable_to_non_nullable
as SafetyInfo?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SafetyInfoCopyWith<$Res>? get safety {
    if (_self.safety == null) {
    return null;
  }

  return $SafetyInfoCopyWith<$Res>(_self.safety!, (value) {
    return _then(_self.copyWith(safety: value));
  });
}
}


/// @nodoc
mixin _$ProposedAction {

 String get id; String? get conversationId; String? get messageId; String get type;@JsonKey(unknownEnumValue: ProposedActionStatus.unknown) ProposedActionStatus get status;/// Plain-language preview of exactly what would change.
 String get preview; List<String> get previewDetails; Map<String, dynamic> get payload; String? get error; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ProposedAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposedActionCopyWith<ProposedAction> get copyWith => _$ProposedActionCopyWithImpl<ProposedAction>(this as ProposedAction, _$identity);

  /// Serializes this ProposedAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProposedAction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposedAction&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.conversationId, _this.conversationId) || other.conversationId == _this.conversationId)&&(identical(other.messageId, _this.messageId) || other.messageId == _this.messageId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.preview, _this.preview) || other.preview == _this.preview)&&const DeepCollectionEquality().equals(other.previewDetails, _this.previewDetails)&&const DeepCollectionEquality().equals(other.payload, _this.payload)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProposedAction;
  return Object.hash(runtimeType,_this.id,_this.conversationId,_this.messageId,_this.type,_this.status,_this.preview,const DeepCollectionEquality().hash(_this.previewDetails),const DeepCollectionEquality().hash(_this.payload),_this.error,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ProposedAction;
  return 'ProposedAction(id: ${_this.id}, conversationId: ${_this.conversationId}, messageId: ${_this.messageId}, type: ${_this.type}, status: ${_this.status}, preview: ${_this.preview}, previewDetails: ${_this.previewDetails}, payload: ${_this.payload}, error: ${_this.error}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ProposedActionCopyWith<$Res>  {
  factory $ProposedActionCopyWith(ProposedAction value, $Res Function(ProposedAction) _then) = _$ProposedActionCopyWithImpl;
@useResult
$Res call({
 String id, String? conversationId, String? messageId, String type,@JsonKey(unknownEnumValue: ProposedActionStatus.unknown) ProposedActionStatus status, String preview, List<String> previewDetails, Map<String, dynamic> payload, String? error, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ProposedActionCopyWithImpl<$Res>
    implements $ProposedActionCopyWith<$Res> {
  _$ProposedActionCopyWithImpl(this._self, this._then);

  final ProposedAction _self;
  final $Res Function(ProposedAction) _then;

/// Create a copy of ProposedAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = freezed,Object? messageId = freezed,Object? type = null,Object? status = null,Object? preview = null,Object? previewDetails = null,Object? payload = null,Object? error = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ProposedAction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProposedActionStatus,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,previewDetails: null == previewDetails ? _self.previewDetails : previewDetails // ignore: cast_nullable_to_non_nullable
as List<String>,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProposedAction].
extension ProposedActionPatterns on ProposedAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProposedAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProposedAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProposedAction value)  $default,){
final _that = this;
switch (_that) {
case _ProposedAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProposedAction value)?  $default,){
final _that = this;
switch (_that) {
case _ProposedAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? conversationId,  String? messageId,  String type, @JsonKey(unknownEnumValue: ProposedActionStatus.unknown)  ProposedActionStatus status,  String preview,  List<String> previewDetails,  Map<String, dynamic> payload,  String? error,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProposedAction() when $default != null:
return $default(_that.id,_that.conversationId,_that.messageId,_that.type,_that.status,_that.preview,_that.previewDetails,_that.payload,_that.error,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? conversationId,  String? messageId,  String type, @JsonKey(unknownEnumValue: ProposedActionStatus.unknown)  ProposedActionStatus status,  String preview,  List<String> previewDetails,  Map<String, dynamic> payload,  String? error,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProposedAction():
return $default(_that.id,_that.conversationId,_that.messageId,_that.type,_that.status,_that.preview,_that.previewDetails,_that.payload,_that.error,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? conversationId,  String? messageId,  String type, @JsonKey(unknownEnumValue: ProposedActionStatus.unknown)  ProposedActionStatus status,  String preview,  List<String> previewDetails,  Map<String, dynamic> payload,  String? error,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProposedAction() when $default != null:
return $default(_that.id,_that.conversationId,_that.messageId,_that.type,_that.status,_that.preview,_that.previewDetails,_that.payload,_that.error,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProposedAction extends ProposedAction {
  const _ProposedAction({required this.id, this.conversationId, this.messageId, this.type = '', @JsonKey(unknownEnumValue: ProposedActionStatus.unknown) this.status = ProposedActionStatus.pending, this.preview = '',  List<String> previewDetails = const <String>[],  Map<String, dynamic> payload = const <String, dynamic>{}, this.error, this.createdAt, this.updatedAt}): _previewDetails = previewDetails,_payload = payload,super._();
  factory _ProposedAction.fromJson(Map<String, dynamic> json) => _$ProposedActionFromJson(json);

@override final  String id;
@override final  String? conversationId;
@override final  String? messageId;
@override@JsonKey() final  String type;
@override@JsonKey(unknownEnumValue: ProposedActionStatus.unknown) final  ProposedActionStatus status;
/// Plain-language preview of exactly what would change.
@override@JsonKey() final  String preview;
 final  List<String> _previewDetails;
@override@JsonKey() List<String> get previewDetails {
  if (_previewDetails is EqualUnmodifiableListView) return _previewDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previewDetails);
}

 final  Map<String, dynamic> _payload;
@override@JsonKey() Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

@override final  String? error;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ProposedAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProposedActionCopyWith<_ProposedAction> get copyWith => __$ProposedActionCopyWithImpl<_ProposedAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProposedActionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProposedAction&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.preview, preview) || other.preview == preview)&&const DeepCollectionEquality().equals(other.previewDetails, _previewDetails)&&const DeepCollectionEquality().equals(other.payload, _payload)&&(identical(other.error, error) || other.error == error)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,conversationId,messageId,type,status,preview,const DeepCollectionEquality().hash(_previewDetails),const DeepCollectionEquality().hash(_payload),error,createdAt,updatedAt);
}

@override
String toString() {
    return 'ProposedAction(id: $id, conversationId: $conversationId, messageId: $messageId, type: $type, status: $status, preview: $preview, previewDetails: $previewDetails, payload: $payload, error: $error, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProposedActionCopyWith<$Res> implements $ProposedActionCopyWith<$Res> {
  factory _$ProposedActionCopyWith(_ProposedAction value, $Res Function(_ProposedAction) _then) = __$ProposedActionCopyWithImpl;
@override @useResult
$Res call({
 String id, String? conversationId, String? messageId, String type,@JsonKey(unknownEnumValue: ProposedActionStatus.unknown) ProposedActionStatus status, String preview, List<String> previewDetails, Map<String, dynamic> payload, String? error, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ProposedActionCopyWithImpl<$Res>
    implements _$ProposedActionCopyWith<$Res> {
  __$ProposedActionCopyWithImpl(this._self, this._then);

  final _ProposedAction _self;
  final $Res Function(_ProposedAction) _then;

/// Create a copy of ProposedAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = freezed,Object? messageId = freezed,Object? type = null,Object? status = null,Object? preview = null,Object? previewDetails = null,Object? payload = null,Object? error = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProposedAction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProposedActionStatus,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,previewDetails: null == previewDetails ? _self._previewDetails : previewDetails // ignore: cast_nullable_to_non_nullable
as List<String>,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ConfirmActionResult {

 bool get success; String? get message; Map<String, dynamic> get result;
/// Create a copy of ConfirmActionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmActionResultCopyWith<ConfirmActionResult> get copyWith => _$ConfirmActionResultCopyWithImpl<ConfirmActionResult>(this as ConfirmActionResult, _$identity);

  /// Serializes this ConfirmActionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConfirmActionResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmActionResult&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.result, _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConfirmActionResult;
  return Object.hash(runtimeType,_this.success,_this.message,const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as ConfirmActionResult;
  return 'ConfirmActionResult(success: ${_this.success}, message: ${_this.message}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $ConfirmActionResultCopyWith<$Res>  {
  factory $ConfirmActionResultCopyWith(ConfirmActionResult value, $Res Function(ConfirmActionResult) _then) = _$ConfirmActionResultCopyWithImpl;
@useResult
$Res call({
 bool success, String? message, Map<String, dynamic> result
});




}
/// @nodoc
class _$ConfirmActionResultCopyWithImpl<$Res>
    implements $ConfirmActionResultCopyWith<$Res> {
  _$ConfirmActionResultCopyWithImpl(this._self, this._then);

  final ConfirmActionResult _self;
  final $Res Function(ConfirmActionResult) _then;

/// Create a copy of ConfirmActionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = freezed,Object? result = null,}) {
  return _then(ConfirmActionResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmActionResult].
extension ConfirmActionResultPatterns on ConfirmActionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmActionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmActionResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmActionResult value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmActionResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmActionResult value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmActionResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? message,  Map<String, dynamic> result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmActionResult() when $default != null:
return $default(_that.success,_that.message,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? message,  Map<String, dynamic> result)  $default,) {final _that = this;
switch (_that) {
case _ConfirmActionResult():
return $default(_that.success,_that.message,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? message,  Map<String, dynamic> result)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmActionResult() when $default != null:
return $default(_that.success,_that.message,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmActionResult implements ConfirmActionResult {
  const _ConfirmActionResult({this.success = false, this.message,  Map<String, dynamic> result = const <String, dynamic>{}}): _result = result;
  factory _ConfirmActionResult.fromJson(Map<String, dynamic> json) => _$ConfirmActionResultFromJson(json);

@override@JsonKey() final  bool success;
@override final  String? message;
 final  Map<String, dynamic> _result;
@override@JsonKey() Map<String, dynamic> get result {
  if (_result is EqualUnmodifiableMapView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_result);
}


/// Create a copy of ConfirmActionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmActionResultCopyWith<_ConfirmActionResult> get copyWith => __$ConfirmActionResultCopyWithImpl<_ConfirmActionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmActionResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmActionResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.result, _result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_result));
}

@override
String toString() {
    return 'ConfirmActionResult(success: $success, message: $message, result: $result)';
}


}

/// @nodoc
abstract mixin class _$ConfirmActionResultCopyWith<$Res> implements $ConfirmActionResultCopyWith<$Res> {
  factory _$ConfirmActionResultCopyWith(_ConfirmActionResult value, $Res Function(_ConfirmActionResult) _then) = __$ConfirmActionResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? message, Map<String, dynamic> result
});




}
/// @nodoc
class __$ConfirmActionResultCopyWithImpl<$Res>
    implements _$ConfirmActionResultCopyWith<$Res> {
  __$ConfirmActionResultCopyWithImpl(this._self, this._then);

  final _ConfirmActionResult _self;
  final $Res Function(_ConfirmActionResult) _then;

/// Create a copy of ConfirmActionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = freezed,Object? result = null,}) {
  return _then(_ConfirmActionResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
