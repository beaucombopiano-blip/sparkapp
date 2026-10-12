// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationPlanItem {

 String get id;/// dailyQuote | sessionReminder | ...
 String get type; DateTime get fireAt; String get title; String get body;/// App route to open when tapped (e.g. "/focus?sessionId=abc").
 String? get route;
/// Create a copy of NotificationPlanItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPlanItemCopyWith<NotificationPlanItem> get copyWith => _$NotificationPlanItemCopyWithImpl<NotificationPlanItem>(this as NotificationPlanItem, _$identity);

  /// Serializes this NotificationPlanItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationPlanItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPlanItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.fireAt, _this.fireAt) || other.fireAt == _this.fireAt)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.route, _this.route) || other.route == _this.route));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationPlanItem;
  return Object.hash(runtimeType,_this.id,_this.type,_this.fireAt,_this.title,_this.body,_this.route);
}

@override
String toString() {
  final _this = this as NotificationPlanItem;
  return 'NotificationPlanItem(id: ${_this.id}, type: ${_this.type}, fireAt: ${_this.fireAt}, title: ${_this.title}, body: ${_this.body}, route: ${_this.route})';
}


}

/// @nodoc
abstract mixin class $NotificationPlanItemCopyWith<$Res>  {
  factory $NotificationPlanItemCopyWith(NotificationPlanItem value, $Res Function(NotificationPlanItem) _then) = _$NotificationPlanItemCopyWithImpl;
@useResult
$Res call({
 String id, String type, DateTime fireAt, String title, String body, String? route
});




}
/// @nodoc
class _$NotificationPlanItemCopyWithImpl<$Res>
    implements $NotificationPlanItemCopyWith<$Res> {
  _$NotificationPlanItemCopyWithImpl(this._self, this._then);

  final NotificationPlanItem _self;
  final $Res Function(NotificationPlanItem) _then;

/// Create a copy of NotificationPlanItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? fireAt = null,Object? title = null,Object? body = null,Object? route = freezed,}) {
  return _then(NotificationPlanItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,fireAt: null == fireAt ? _self.fireAt : fireAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPlanItem].
extension NotificationPlanItemPatterns on NotificationPlanItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPlanItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPlanItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPlanItem value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPlanItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPlanItem value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPlanItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  DateTime fireAt,  String title,  String body,  String? route)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPlanItem() when $default != null:
return $default(_that.id,_that.type,_that.fireAt,_that.title,_that.body,_that.route);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  DateTime fireAt,  String title,  String body,  String? route)  $default,) {final _that = this;
switch (_that) {
case _NotificationPlanItem():
return $default(_that.id,_that.type,_that.fireAt,_that.title,_that.body,_that.route);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  DateTime fireAt,  String title,  String body,  String? route)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPlanItem() when $default != null:
return $default(_that.id,_that.type,_that.fireAt,_that.title,_that.body,_that.route);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPlanItem implements NotificationPlanItem {
  const _NotificationPlanItem({required this.id, this.type = 'dailyQuote', required this.fireAt, this.title = '', this.body = '', this.route});
  factory _NotificationPlanItem.fromJson(Map<String, dynamic> json) => _$NotificationPlanItemFromJson(json);

@override final  String id;
/// dailyQuote | sessionReminder | ...
@override@JsonKey() final  String type;
@override final  DateTime fireAt;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
/// App route to open when tapped (e.g. "/focus?sessionId=abc").
@override final  String? route;

/// Create a copy of NotificationPlanItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPlanItemCopyWith<_NotificationPlanItem> get copyWith => __$NotificationPlanItemCopyWithImpl<_NotificationPlanItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPlanItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPlanItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.fireAt, fireAt) || other.fireAt == fireAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.route, route) || other.route == route));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,fireAt,title,body,route);
}

@override
String toString() {
    return 'NotificationPlanItem(id: $id, type: $type, fireAt: $fireAt, title: $title, body: $body, route: $route)';
}


}

/// @nodoc
abstract mixin class _$NotificationPlanItemCopyWith<$Res> implements $NotificationPlanItemCopyWith<$Res> {
  factory _$NotificationPlanItemCopyWith(_NotificationPlanItem value, $Res Function(_NotificationPlanItem) _then) = __$NotificationPlanItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, DateTime fireAt, String title, String body, String? route
});




}
/// @nodoc
class __$NotificationPlanItemCopyWithImpl<$Res>
    implements _$NotificationPlanItemCopyWith<$Res> {
  __$NotificationPlanItemCopyWithImpl(this._self, this._then);

  final _NotificationPlanItem _self;
  final $Res Function(_NotificationPlanItem) _then;

/// Create a copy of NotificationPlanItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? fireAt = null,Object? title = null,Object? body = null,Object? route = freezed,}) {
  return _then(_NotificationPlanItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,fireAt: null == fireAt ? _self.fireAt : fireAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationPlan {

 List<NotificationPlanItem> get items; DateTime? get generatedAt;
/// Create a copy of NotificationPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPlanCopyWith<NotificationPlan> get copyWith => _$NotificationPlanCopyWithImpl<NotificationPlan>(this as NotificationPlan, _$identity);

  /// Serializes this NotificationPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPlan&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationPlan;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.generatedAt);
}

@override
String toString() {
  final _this = this as NotificationPlan;
  return 'NotificationPlan(items: ${_this.items}, generatedAt: ${_this.generatedAt})';
}


}

/// @nodoc
abstract mixin class $NotificationPlanCopyWith<$Res>  {
  factory $NotificationPlanCopyWith(NotificationPlan value, $Res Function(NotificationPlan) _then) = _$NotificationPlanCopyWithImpl;
@useResult
$Res call({
 List<NotificationPlanItem> items, DateTime? generatedAt
});




}
/// @nodoc
class _$NotificationPlanCopyWithImpl<$Res>
    implements $NotificationPlanCopyWith<$Res> {
  _$NotificationPlanCopyWithImpl(this._self, this._then);

  final NotificationPlan _self;
  final $Res Function(NotificationPlan) _then;

/// Create a copy of NotificationPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? generatedAt = freezed,}) {
  return _then(NotificationPlan(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NotificationPlanItem>,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPlan].
extension NotificationPlanPatterns on NotificationPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPlan value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPlan value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationPlanItem> items,  DateTime? generatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPlan() when $default != null:
return $default(_that.items,_that.generatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationPlanItem> items,  DateTime? generatedAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationPlan():
return $default(_that.items,_that.generatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationPlanItem> items,  DateTime? generatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPlan() when $default != null:
return $default(_that.items,_that.generatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPlan implements NotificationPlan {
  const _NotificationPlan({ List<NotificationPlanItem> items = const <NotificationPlanItem>[], this.generatedAt}): _items = items;
  factory _NotificationPlan.fromJson(Map<String, dynamic> json) => _$NotificationPlanFromJson(json);

 final  List<NotificationPlanItem> _items;
@override@JsonKey() List<NotificationPlanItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? generatedAt;

/// Create a copy of NotificationPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPlanCopyWith<_NotificationPlan> get copyWith => __$NotificationPlanCopyWithImpl<_NotificationPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPlanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPlan&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),generatedAt);
}

@override
String toString() {
    return 'NotificationPlan(items: $items, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationPlanCopyWith<$Res> implements $NotificationPlanCopyWith<$Res> {
  factory _$NotificationPlanCopyWith(_NotificationPlan value, $Res Function(_NotificationPlan) _then) = __$NotificationPlanCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationPlanItem> items, DateTime? generatedAt
});




}
/// @nodoc
class __$NotificationPlanCopyWithImpl<$Res>
    implements _$NotificationPlanCopyWith<$Res> {
  __$NotificationPlanCopyWithImpl(this._self, this._then);

  final _NotificationPlan _self;
  final $Res Function(_NotificationPlan) _then;

/// Create a copy of NotificationPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? generatedAt = freezed,}) {
  return _then(_NotificationPlan(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NotificationPlanItem>,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
