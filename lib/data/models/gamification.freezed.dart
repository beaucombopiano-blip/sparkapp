// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Streaks {

 int get daily; int get weekly; int get longestDaily;
/// Create a copy of Streaks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreaksCopyWith<Streaks> get copyWith => _$StreaksCopyWithImpl<Streaks>(this as Streaks, _$identity);

  /// Serializes this Streaks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Streaks;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Streaks&&(identical(other.daily, _this.daily) || other.daily == _this.daily)&&(identical(other.weekly, _this.weekly) || other.weekly == _this.weekly)&&(identical(other.longestDaily, _this.longestDaily) || other.longestDaily == _this.longestDaily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Streaks;
  return Object.hash(runtimeType,_this.daily,_this.weekly,_this.longestDaily);
}

@override
String toString() {
  final _this = this as Streaks;
  return 'Streaks(daily: ${_this.daily}, weekly: ${_this.weekly}, longestDaily: ${_this.longestDaily})';
}


}

/// @nodoc
abstract mixin class $StreaksCopyWith<$Res>  {
  factory $StreaksCopyWith(Streaks value, $Res Function(Streaks) _then) = _$StreaksCopyWithImpl;
@useResult
$Res call({
 int daily, int weekly, int longestDaily
});




}
/// @nodoc
class _$StreaksCopyWithImpl<$Res>
    implements $StreaksCopyWith<$Res> {
  _$StreaksCopyWithImpl(this._self, this._then);

  final Streaks _self;
  final $Res Function(Streaks) _then;

/// Create a copy of Streaks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? daily = null,Object? weekly = null,Object? longestDaily = null,}) {
  return _then(Streaks(
daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as int,weekly: null == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as int,longestDaily: null == longestDaily ? _self.longestDaily : longestDaily // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Streaks].
extension StreaksPatterns on Streaks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Streaks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Streaks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Streaks value)  $default,){
final _that = this;
switch (_that) {
case _Streaks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Streaks value)?  $default,){
final _that = this;
switch (_that) {
case _Streaks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int daily,  int weekly,  int longestDaily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Streaks() when $default != null:
return $default(_that.daily,_that.weekly,_that.longestDaily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int daily,  int weekly,  int longestDaily)  $default,) {final _that = this;
switch (_that) {
case _Streaks():
return $default(_that.daily,_that.weekly,_that.longestDaily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int daily,  int weekly,  int longestDaily)?  $default,) {final _that = this;
switch (_that) {
case _Streaks() when $default != null:
return $default(_that.daily,_that.weekly,_that.longestDaily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Streaks implements Streaks {
  const _Streaks({this.daily = 0, this.weekly = 0, this.longestDaily = 0});
  factory _Streaks.fromJson(Map<String, dynamic> json) => _$StreaksFromJson(json);

@override@JsonKey() final  int daily;
@override@JsonKey() final  int weekly;
@override@JsonKey() final  int longestDaily;

/// Create a copy of Streaks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreaksCopyWith<_Streaks> get copyWith => __$StreaksCopyWithImpl<_Streaks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreaksToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Streaks&&(identical(other.daily, daily) || other.daily == daily)&&(identical(other.weekly, weekly) || other.weekly == weekly)&&(identical(other.longestDaily, longestDaily) || other.longestDaily == longestDaily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,daily,weekly,longestDaily);
}

@override
String toString() {
    return 'Streaks(daily: $daily, weekly: $weekly, longestDaily: $longestDaily)';
}


}

/// @nodoc
abstract mixin class _$StreaksCopyWith<$Res> implements $StreaksCopyWith<$Res> {
  factory _$StreaksCopyWith(_Streaks value, $Res Function(_Streaks) _then) = __$StreaksCopyWithImpl;
@override @useResult
$Res call({
 int daily, int weekly, int longestDaily
});




}
/// @nodoc
class __$StreaksCopyWithImpl<$Res>
    implements _$StreaksCopyWith<$Res> {
  __$StreaksCopyWithImpl(this._self, this._then);

  final _Streaks _self;
  final $Res Function(_Streaks) _then;

/// Create a copy of Streaks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? daily = null,Object? weekly = null,Object? longestDaily = null,}) {
  return _then(_Streaks(
daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as int,weekly: null == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as int,longestDaily: null == longestDaily ? _self.longestDaily : longestDaily // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BadgeDef {

 String get id; String get name; String get description; String? get howToEarn; String? get icon; int get points; int get order;
/// Create a copy of BadgeDef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeDefCopyWith<BadgeDef> get copyWith => _$BadgeDefCopyWithImpl<BadgeDef>(this as BadgeDef, _$identity);

  /// Serializes this BadgeDef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BadgeDef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeDef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.howToEarn, _this.howToEarn) || other.howToEarn == _this.howToEarn)&&(identical(other.icon, _this.icon) || other.icon == _this.icon)&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.order, _this.order) || other.order == _this.order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BadgeDef;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.howToEarn,_this.icon,_this.points,_this.order);
}

@override
String toString() {
  final _this = this as BadgeDef;
  return 'BadgeDef(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, howToEarn: ${_this.howToEarn}, icon: ${_this.icon}, points: ${_this.points}, order: ${_this.order})';
}


}

/// @nodoc
abstract mixin class $BadgeDefCopyWith<$Res>  {
  factory $BadgeDefCopyWith(BadgeDef value, $Res Function(BadgeDef) _then) = _$BadgeDefCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String? howToEarn, String? icon, int points, int order
});




}
/// @nodoc
class _$BadgeDefCopyWithImpl<$Res>
    implements $BadgeDefCopyWith<$Res> {
  _$BadgeDefCopyWithImpl(this._self, this._then);

  final BadgeDef _self;
  final $Res Function(BadgeDef) _then;

/// Create a copy of BadgeDef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? howToEarn = freezed,Object? icon = freezed,Object? points = null,Object? order = null,}) {
  return _then(BadgeDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,howToEarn: freezed == howToEarn ? _self.howToEarn : howToEarn // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeDef].
extension BadgeDefPatterns on BadgeDef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeDef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeDef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeDef value)  $default,){
final _that = this;
switch (_that) {
case _BadgeDef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeDef value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeDef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String? howToEarn,  String? icon,  int points,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeDef() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.howToEarn,_that.icon,_that.points,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String? howToEarn,  String? icon,  int points,  int order)  $default,) {final _that = this;
switch (_that) {
case _BadgeDef():
return $default(_that.id,_that.name,_that.description,_that.howToEarn,_that.icon,_that.points,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String? howToEarn,  String? icon,  int points,  int order)?  $default,) {final _that = this;
switch (_that) {
case _BadgeDef() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.howToEarn,_that.icon,_that.points,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BadgeDef implements BadgeDef {
  const _BadgeDef({required this.id, this.name = '', this.description = '', this.howToEarn, this.icon, this.points = 0, this.order = 0});
  factory _BadgeDef.fromJson(Map<String, dynamic> json) => _$BadgeDefFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override final  String? howToEarn;
@override final  String? icon;
@override@JsonKey() final  int points;
@override@JsonKey() final  int order;

/// Create a copy of BadgeDef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeDefCopyWith<_BadgeDef> get copyWith => __$BadgeDefCopyWithImpl<_BadgeDef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeDefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeDef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.howToEarn, howToEarn) || other.howToEarn == howToEarn)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.points, points) || other.points == points)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,howToEarn,icon,points,order);
}

@override
String toString() {
    return 'BadgeDef(id: $id, name: $name, description: $description, howToEarn: $howToEarn, icon: $icon, points: $points, order: $order)';
}


}

/// @nodoc
abstract mixin class _$BadgeDefCopyWith<$Res> implements $BadgeDefCopyWith<$Res> {
  factory _$BadgeDefCopyWith(_BadgeDef value, $Res Function(_BadgeDef) _then) = __$BadgeDefCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String? howToEarn, String? icon, int points, int order
});




}
/// @nodoc
class __$BadgeDefCopyWithImpl<$Res>
    implements _$BadgeDefCopyWith<$Res> {
  __$BadgeDefCopyWithImpl(this._self, this._then);

  final _BadgeDef _self;
  final $Res Function(_BadgeDef) _then;

/// Create a copy of BadgeDef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? howToEarn = freezed,Object? icon = freezed,Object? points = null,Object? order = null,}) {
  return _then(_BadgeDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,howToEarn: freezed == howToEarn ? _self.howToEarn : howToEarn // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$EarnedBadge {

 String get id; DateTime? get earnedAt; String? get projectId;
/// Create a copy of EarnedBadge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarnedBadgeCopyWith<EarnedBadge> get copyWith => _$EarnedBadgeCopyWithImpl<EarnedBadge>(this as EarnedBadge, _$identity);

  /// Serializes this EarnedBadge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EarnedBadge;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EarnedBadge&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.earnedAt, _this.earnedAt) || other.earnedAt == _this.earnedAt)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EarnedBadge;
  return Object.hash(runtimeType,_this.id,_this.earnedAt,_this.projectId);
}

@override
String toString() {
  final _this = this as EarnedBadge;
  return 'EarnedBadge(id: ${_this.id}, earnedAt: ${_this.earnedAt}, projectId: ${_this.projectId})';
}


}

/// @nodoc
abstract mixin class $EarnedBadgeCopyWith<$Res>  {
  factory $EarnedBadgeCopyWith(EarnedBadge value, $Res Function(EarnedBadge) _then) = _$EarnedBadgeCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? earnedAt, String? projectId
});




}
/// @nodoc
class _$EarnedBadgeCopyWithImpl<$Res>
    implements $EarnedBadgeCopyWith<$Res> {
  _$EarnedBadgeCopyWithImpl(this._self, this._then);

  final EarnedBadge _self;
  final $Res Function(EarnedBadge) _then;

/// Create a copy of EarnedBadge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? earnedAt = freezed,Object? projectId = freezed,}) {
  return _then(EarnedBadge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,earnedAt: freezed == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EarnedBadge].
extension EarnedBadgePatterns on EarnedBadge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EarnedBadge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EarnedBadge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EarnedBadge value)  $default,){
final _that = this;
switch (_that) {
case _EarnedBadge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EarnedBadge value)?  $default,){
final _that = this;
switch (_that) {
case _EarnedBadge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime? earnedAt,  String? projectId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EarnedBadge() when $default != null:
return $default(_that.id,_that.earnedAt,_that.projectId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime? earnedAt,  String? projectId)  $default,) {final _that = this;
switch (_that) {
case _EarnedBadge():
return $default(_that.id,_that.earnedAt,_that.projectId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime? earnedAt,  String? projectId)?  $default,) {final _that = this;
switch (_that) {
case _EarnedBadge() when $default != null:
return $default(_that.id,_that.earnedAt,_that.projectId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EarnedBadge implements EarnedBadge {
  const _EarnedBadge({required this.id, this.earnedAt, this.projectId});
  factory _EarnedBadge.fromJson(Map<String, dynamic> json) => _$EarnedBadgeFromJson(json);

@override final  String id;
@override final  DateTime? earnedAt;
@override final  String? projectId;

/// Create a copy of EarnedBadge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarnedBadgeCopyWith<_EarnedBadge> get copyWith => __$EarnedBadgeCopyWithImpl<_EarnedBadge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EarnedBadgeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EarnedBadge&&(identical(other.id, id) || other.id == id)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.projectId, projectId) || other.projectId == projectId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,earnedAt,projectId);
}

@override
String toString() {
    return 'EarnedBadge(id: $id, earnedAt: $earnedAt, projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$EarnedBadgeCopyWith<$Res> implements $EarnedBadgeCopyWith<$Res> {
  factory _$EarnedBadgeCopyWith(_EarnedBadge value, $Res Function(_EarnedBadge) _then) = __$EarnedBadgeCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? earnedAt, String? projectId
});




}
/// @nodoc
class __$EarnedBadgeCopyWithImpl<$Res>
    implements _$EarnedBadgeCopyWith<$Res> {
  __$EarnedBadgeCopyWithImpl(this._self, this._then);

  final _EarnedBadge _self;
  final $Res Function(_EarnedBadge) _then;

/// Create a copy of EarnedBadge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? earnedAt = freezed,Object? projectId = freezed,}) {
  return _then(_EarnedBadge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,earnedAt: freezed == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BadgeAward {

 String get key; String get name; String? get description; String? get icon; int get points;
/// Create a copy of BadgeAward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeAwardCopyWith<BadgeAward> get copyWith => _$BadgeAwardCopyWithImpl<BadgeAward>(this as BadgeAward, _$identity);

  /// Serializes this BadgeAward to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BadgeAward;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeAward&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.icon, _this.icon) || other.icon == _this.icon)&&(identical(other.points, _this.points) || other.points == _this.points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BadgeAward;
  return Object.hash(runtimeType,_this.key,_this.name,_this.description,_this.icon,_this.points);
}

@override
String toString() {
  final _this = this as BadgeAward;
  return 'BadgeAward(key: ${_this.key}, name: ${_this.name}, description: ${_this.description}, icon: ${_this.icon}, points: ${_this.points})';
}


}

/// @nodoc
abstract mixin class $BadgeAwardCopyWith<$Res>  {
  factory $BadgeAwardCopyWith(BadgeAward value, $Res Function(BadgeAward) _then) = _$BadgeAwardCopyWithImpl;
@useResult
$Res call({
 String key, String name, String? description, String? icon, int points
});




}
/// @nodoc
class _$BadgeAwardCopyWithImpl<$Res>
    implements $BadgeAwardCopyWith<$Res> {
  _$BadgeAwardCopyWithImpl(this._self, this._then);

  final BadgeAward _self;
  final $Res Function(BadgeAward) _then;

/// Create a copy of BadgeAward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? description = freezed,Object? icon = freezed,Object? points = null,}) {
  return _then(BadgeAward(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeAward].
extension BadgeAwardPatterns on BadgeAward {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeAward value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeAward() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeAward value)  $default,){
final _that = this;
switch (_that) {
case _BadgeAward():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeAward value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeAward() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String? description,  String? icon,  int points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeAward() when $default != null:
return $default(_that.key,_that.name,_that.description,_that.icon,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String? description,  String? icon,  int points)  $default,) {final _that = this;
switch (_that) {
case _BadgeAward():
return $default(_that.key,_that.name,_that.description,_that.icon,_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String? description,  String? icon,  int points)?  $default,) {final _that = this;
switch (_that) {
case _BadgeAward() when $default != null:
return $default(_that.key,_that.name,_that.description,_that.icon,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BadgeAward implements BadgeAward {
  const _BadgeAward({this.key = '', this.name = '', this.description, this.icon, this.points = 0});
  factory _BadgeAward.fromJson(Map<String, dynamic> json) => _$BadgeAwardFromJson(json);

@override@JsonKey() final  String key;
@override@JsonKey() final  String name;
@override final  String? description;
@override final  String? icon;
@override@JsonKey() final  int points;

/// Create a copy of BadgeAward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeAwardCopyWith<_BadgeAward> get copyWith => __$BadgeAwardCopyWithImpl<_BadgeAward>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeAwardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeAward&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,name,description,icon,points);
}

@override
String toString() {
    return 'BadgeAward(key: $key, name: $name, description: $description, icon: $icon, points: $points)';
}


}

/// @nodoc
abstract mixin class _$BadgeAwardCopyWith<$Res> implements $BadgeAwardCopyWith<$Res> {
  factory _$BadgeAwardCopyWith(_BadgeAward value, $Res Function(_BadgeAward) _then) = __$BadgeAwardCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String? description, String? icon, int points
});




}
/// @nodoc
class __$BadgeAwardCopyWithImpl<$Res>
    implements _$BadgeAwardCopyWith<$Res> {
  __$BadgeAwardCopyWithImpl(this._self, this._then);

  final _BadgeAward _self;
  final $Res Function(_BadgeAward) _then;

/// Create a copy of BadgeAward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? description = freezed,Object? icon = freezed,Object? points = null,}) {
  return _then(_BadgeAward(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Challenge {

 String get id; String get title; String get description; DateTime? get startsAt; DateTime? get endsAt; String? get criteria; String? get reward; bool get active;
/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeCopyWith<Challenge> get copyWith => _$ChallengeCopyWithImpl<Challenge>(this as Challenge, _$identity);

  /// Serializes this Challenge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Challenge;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Challenge&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.criteria, _this.criteria) || other.criteria == _this.criteria)&&(identical(other.reward, _this.reward) || other.reward == _this.reward)&&(identical(other.active, _this.active) || other.active == _this.active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Challenge;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.startsAt,_this.endsAt,_this.criteria,_this.reward,_this.active);
}

@override
String toString() {
  final _this = this as Challenge;
  return 'Challenge(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, criteria: ${_this.criteria}, reward: ${_this.reward}, active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $ChallengeCopyWith<$Res>  {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) _then) = _$ChallengeCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime? startsAt, DateTime? endsAt, String? criteria, String? reward, bool active
});




}
/// @nodoc
class _$ChallengeCopyWithImpl<$Res>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._self, this._then);

  final Challenge _self;
  final $Res Function(Challenge) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = freezed,Object? endsAt = freezed,Object? criteria = freezed,Object? reward = freezed,Object? active = null,}) {
  return _then(Challenge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,criteria: freezed == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as String?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Challenge].
extension ChallengePatterns on Challenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Challenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Challenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Challenge value)  $default,){
final _that = this;
switch (_that) {
case _Challenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Challenge value)?  $default,){
final _that = this;
switch (_that) {
case _Challenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime? startsAt,  DateTime? endsAt,  String? criteria,  String? reward,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.criteria,_that.reward,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime? startsAt,  DateTime? endsAt,  String? criteria,  String? reward,  bool active)  $default,) {final _that = this;
switch (_that) {
case _Challenge():
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.criteria,_that.reward,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime? startsAt,  DateTime? endsAt,  String? criteria,  String? reward,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startsAt,_that.endsAt,_that.criteria,_that.reward,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Challenge implements Challenge {
  const _Challenge({required this.id, this.title = '', this.description = '', this.startsAt, this.endsAt, this.criteria, this.reward, this.active = true});
  factory _Challenge.fromJson(Map<String, dynamic> json) => _$ChallengeFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  DateTime? startsAt;
@override final  DateTime? endsAt;
@override final  String? criteria;
@override final  String? reward;
@override@JsonKey() final  bool active;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeCopyWith<_Challenge> get copyWith => __$ChallengeCopyWithImpl<_Challenge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Challenge&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.criteria, criteria) || other.criteria == criteria)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,startsAt,endsAt,criteria,reward,active);
}

@override
String toString() {
    return 'Challenge(id: $id, title: $title, description: $description, startsAt: $startsAt, endsAt: $endsAt, criteria: $criteria, reward: $reward, active: $active)';
}


}

/// @nodoc
abstract mixin class _$ChallengeCopyWith<$Res> implements $ChallengeCopyWith<$Res> {
  factory _$ChallengeCopyWith(_Challenge value, $Res Function(_Challenge) _then) = __$ChallengeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime? startsAt, DateTime? endsAt, String? criteria, String? reward, bool active
});




}
/// @nodoc
class __$ChallengeCopyWithImpl<$Res>
    implements _$ChallengeCopyWith<$Res> {
  __$ChallengeCopyWithImpl(this._self, this._then);

  final _Challenge _self;
  final $Res Function(_Challenge) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startsAt = freezed,Object? endsAt = freezed,Object? criteria = freezed,Object? reward = freezed,Object? active = null,}) {
  return _then(_Challenge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,criteria: freezed == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as String?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ChallengeParticipation {

 String get id; DateTime? get joinedAt; double get progress; String get status; DateTime? get completedAt;
/// Create a copy of ChallengeParticipation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeParticipationCopyWith<ChallengeParticipation> get copyWith => _$ChallengeParticipationCopyWithImpl<ChallengeParticipation>(this as ChallengeParticipation, _$identity);

  /// Serializes this ChallengeParticipation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChallengeParticipation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeParticipation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.joinedAt, _this.joinedAt) || other.joinedAt == _this.joinedAt)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChallengeParticipation;
  return Object.hash(runtimeType,_this.id,_this.joinedAt,_this.progress,_this.status,_this.completedAt);
}

@override
String toString() {
  final _this = this as ChallengeParticipation;
  return 'ChallengeParticipation(id: ${_this.id}, joinedAt: ${_this.joinedAt}, progress: ${_this.progress}, status: ${_this.status}, completedAt: ${_this.completedAt})';
}


}

/// @nodoc
abstract mixin class $ChallengeParticipationCopyWith<$Res>  {
  factory $ChallengeParticipationCopyWith(ChallengeParticipation value, $Res Function(ChallengeParticipation) _then) = _$ChallengeParticipationCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? joinedAt, double progress, String status, DateTime? completedAt
});




}
/// @nodoc
class _$ChallengeParticipationCopyWithImpl<$Res>
    implements $ChallengeParticipationCopyWith<$Res> {
  _$ChallengeParticipationCopyWithImpl(this._self, this._then);

  final ChallengeParticipation _self;
  final $Res Function(ChallengeParticipation) _then;

/// Create a copy of ChallengeParticipation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? joinedAt = freezed,Object? progress = null,Object? status = null,Object? completedAt = freezed,}) {
  return _then(ChallengeParticipation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeParticipation].
extension ChallengeParticipationPatterns on ChallengeParticipation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeParticipation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeParticipation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeParticipation value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeParticipation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeParticipation value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeParticipation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime? joinedAt,  double progress,  String status,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeParticipation() when $default != null:
return $default(_that.id,_that.joinedAt,_that.progress,_that.status,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime? joinedAt,  double progress,  String status,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _ChallengeParticipation():
return $default(_that.id,_that.joinedAt,_that.progress,_that.status,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime? joinedAt,  double progress,  String status,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeParticipation() when $default != null:
return $default(_that.id,_that.joinedAt,_that.progress,_that.status,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengeParticipation implements ChallengeParticipation {
  const _ChallengeParticipation({required this.id, this.joinedAt, this.progress = 0, this.status = 'active', this.completedAt});
  factory _ChallengeParticipation.fromJson(Map<String, dynamic> json) => _$ChallengeParticipationFromJson(json);

@override final  String id;
@override final  DateTime? joinedAt;
@override@JsonKey() final  double progress;
@override@JsonKey() final  String status;
@override final  DateTime? completedAt;

/// Create a copy of ChallengeParticipation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeParticipationCopyWith<_ChallengeParticipation> get copyWith => __$ChallengeParticipationCopyWithImpl<_ChallengeParticipation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeParticipationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeParticipation&&(identical(other.id, id) || other.id == id)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,joinedAt,progress,status,completedAt);
}

@override
String toString() {
    return 'ChallengeParticipation(id: $id, joinedAt: $joinedAt, progress: $progress, status: $status, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$ChallengeParticipationCopyWith<$Res> implements $ChallengeParticipationCopyWith<$Res> {
  factory _$ChallengeParticipationCopyWith(_ChallengeParticipation value, $Res Function(_ChallengeParticipation) _then) = __$ChallengeParticipationCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? joinedAt, double progress, String status, DateTime? completedAt
});




}
/// @nodoc
class __$ChallengeParticipationCopyWithImpl<$Res>
    implements _$ChallengeParticipationCopyWith<$Res> {
  __$ChallengeParticipationCopyWithImpl(this._self, this._then);

  final _ChallengeParticipation _self;
  final $Res Function(_ChallengeParticipation) _then;

/// Create a copy of ChallengeParticipation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? joinedAt = freezed,Object? progress = null,Object? status = null,Object? completedAt = freezed,}) {
  return _then(_ChallengeParticipation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$LeaderboardWeek {

 String get id; String? get board; DateTime? get weekStart; List<LeaderboardEntry> get entries;
/// Create a copy of LeaderboardWeek
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardWeekCopyWith<LeaderboardWeek> get copyWith => _$LeaderboardWeekCopyWithImpl<LeaderboardWeek>(this as LeaderboardWeek, _$identity);

  /// Serializes this LeaderboardWeek to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeaderboardWeek;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardWeek&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.board, _this.board) || other.board == _this.board)&&(identical(other.weekStart, _this.weekStart) || other.weekStart == _this.weekStart)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeaderboardWeek;
  return Object.hash(runtimeType,_this.id,_this.board,_this.weekStart,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as LeaderboardWeek;
  return 'LeaderboardWeek(id: ${_this.id}, board: ${_this.board}, weekStart: ${_this.weekStart}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $LeaderboardWeekCopyWith<$Res>  {
  factory $LeaderboardWeekCopyWith(LeaderboardWeek value, $Res Function(LeaderboardWeek) _then) = _$LeaderboardWeekCopyWithImpl;
@useResult
$Res call({
 String id, String? board, DateTime? weekStart, List<LeaderboardEntry> entries
});




}
/// @nodoc
class _$LeaderboardWeekCopyWithImpl<$Res>
    implements $LeaderboardWeekCopyWith<$Res> {
  _$LeaderboardWeekCopyWithImpl(this._self, this._then);

  final LeaderboardWeek _self;
  final $Res Function(LeaderboardWeek) _then;

/// Create a copy of LeaderboardWeek
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? board = freezed,Object? weekStart = freezed,Object? entries = null,}) {
  return _then(LeaderboardWeek(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,board: freezed == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as String?,weekStart: freezed == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime?,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardWeek].
extension LeaderboardWeekPatterns on LeaderboardWeek {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardWeek value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardWeek() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardWeek value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardWeek():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardWeek value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardWeek() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? board,  DateTime? weekStart,  List<LeaderboardEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardWeek() when $default != null:
return $default(_that.id,_that.board,_that.weekStart,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? board,  DateTime? weekStart,  List<LeaderboardEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardWeek():
return $default(_that.id,_that.board,_that.weekStart,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? board,  DateTime? weekStart,  List<LeaderboardEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardWeek() when $default != null:
return $default(_that.id,_that.board,_that.weekStart,_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderboardWeek implements LeaderboardWeek {
  const _LeaderboardWeek({required this.id, this.board, this.weekStart,  List<LeaderboardEntry> entries = const <LeaderboardEntry>[]}): _entries = entries;
  factory _LeaderboardWeek.fromJson(Map<String, dynamic> json) => _$LeaderboardWeekFromJson(json);

@override final  String id;
@override final  String? board;
@override final  DateTime? weekStart;
 final  List<LeaderboardEntry> _entries;
@override@JsonKey() List<LeaderboardEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of LeaderboardWeek
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardWeekCopyWith<_LeaderboardWeek> get copyWith => __$LeaderboardWeekCopyWithImpl<_LeaderboardWeek>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardWeekToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardWeek&&(identical(other.id, id) || other.id == id)&&(identical(other.board, board) || other.board == board)&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&const DeepCollectionEquality().equals(other.entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,board,weekStart,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'LeaderboardWeek(id: $id, board: $board, weekStart: $weekStart, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardWeekCopyWith<$Res> implements $LeaderboardWeekCopyWith<$Res> {
  factory _$LeaderboardWeekCopyWith(_LeaderboardWeek value, $Res Function(_LeaderboardWeek) _then) = __$LeaderboardWeekCopyWithImpl;
@override @useResult
$Res call({
 String id, String? board, DateTime? weekStart, List<LeaderboardEntry> entries
});




}
/// @nodoc
class __$LeaderboardWeekCopyWithImpl<$Res>
    implements _$LeaderboardWeekCopyWith<$Res> {
  __$LeaderboardWeekCopyWithImpl(this._self, this._then);

  final _LeaderboardWeek _self;
  final $Res Function(_LeaderboardWeek) _then;

/// Create a copy of LeaderboardWeek
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? board = freezed,Object? weekStart = freezed,Object? entries = null,}) {
  return _then(_LeaderboardWeek(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,board: freezed == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as String?,weekStart: freezed == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime?,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,
  ));
}


}


/// @nodoc
mixin _$LeaderboardEntry {

 int get rank; String get pseudonym; String? get characterId; int get points; String? get entryId;
/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith => _$LeaderboardEntryCopyWithImpl<LeaderboardEntry>(this as LeaderboardEntry, _$identity);

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeaderboardEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardEntry&&(identical(other.rank, _this.rank) || other.rank == _this.rank)&&(identical(other.pseudonym, _this.pseudonym) || other.pseudonym == _this.pseudonym)&&(identical(other.characterId, _this.characterId) || other.characterId == _this.characterId)&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeaderboardEntry;
  return Object.hash(runtimeType,_this.rank,_this.pseudonym,_this.characterId,_this.points,_this.entryId);
}

@override
String toString() {
  final _this = this as LeaderboardEntry;
  return 'LeaderboardEntry(rank: ${_this.rank}, pseudonym: ${_this.pseudonym}, characterId: ${_this.characterId}, points: ${_this.points}, entryId: ${_this.entryId})';
}


}

/// @nodoc
abstract mixin class $LeaderboardEntryCopyWith<$Res>  {
  factory $LeaderboardEntryCopyWith(LeaderboardEntry value, $Res Function(LeaderboardEntry) _then) = _$LeaderboardEntryCopyWithImpl;
@useResult
$Res call({
 int rank, String pseudonym, String? characterId, int points, String? entryId
});




}
/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final LeaderboardEntry _self;
  final $Res Function(LeaderboardEntry) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? pseudonym = null,Object? characterId = freezed,Object? points = null,Object? entryId = freezed,}) {
  return _then(LeaderboardEntry(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,pseudonym: null == pseudonym ? _self.pseudonym : pseudonym // ignore: cast_nullable_to_non_nullable
as String,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardEntry].
extension LeaderboardEntryPatterns on LeaderboardEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardEntry value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank,  String pseudonym,  String? characterId,  int points,  String? entryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
return $default(_that.rank,_that.pseudonym,_that.characterId,_that.points,_that.entryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank,  String pseudonym,  String? characterId,  int points,  String? entryId)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardEntry():
return $default(_that.rank,_that.pseudonym,_that.characterId,_that.points,_that.entryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank,  String pseudonym,  String? characterId,  int points,  String? entryId)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardEntry() when $default != null:
return $default(_that.rank,_that.pseudonym,_that.characterId,_that.points,_that.entryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderboardEntry implements LeaderboardEntry {
  const _LeaderboardEntry({this.rank = 0, this.pseudonym = '', this.characterId, this.points = 0, this.entryId});
  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) => _$LeaderboardEntryFromJson(json);

@override@JsonKey() final  int rank;
@override@JsonKey() final  String pseudonym;
@override final  String? characterId;
@override@JsonKey() final  int points;
@override final  String? entryId;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardEntryCopyWith<_LeaderboardEntry> get copyWith => __$LeaderboardEntryCopyWithImpl<_LeaderboardEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardEntry&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.pseudonym, pseudonym) || other.pseudonym == pseudonym)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.points, points) || other.points == points)&&(identical(other.entryId, entryId) || other.entryId == entryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rank,pseudonym,characterId,points,entryId);
}

@override
String toString() {
    return 'LeaderboardEntry(rank: $rank, pseudonym: $pseudonym, characterId: $characterId, points: $points, entryId: $entryId)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardEntryCopyWith<$Res> implements $LeaderboardEntryCopyWith<$Res> {
  factory _$LeaderboardEntryCopyWith(_LeaderboardEntry value, $Res Function(_LeaderboardEntry) _then) = __$LeaderboardEntryCopyWithImpl;
@override @useResult
$Res call({
 int rank, String pseudonym, String? characterId, int points, String? entryId
});




}
/// @nodoc
class __$LeaderboardEntryCopyWithImpl<$Res>
    implements _$LeaderboardEntryCopyWith<$Res> {
  __$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final _LeaderboardEntry _self;
  final $Res Function(_LeaderboardEntry) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? pseudonym = null,Object? characterId = freezed,Object? points = null,Object? entryId = freezed,}) {
  return _then(_LeaderboardEntry(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,pseudonym: null == pseudonym ? _self.pseudonym : pseudonym // ignore: cast_nullable_to_non_nullable
as String,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Celebration {

 String? get id;@JsonKey(unknownEnumValue: CelebrationKind.unknown) CelebrationKind get kind; String get title; String? get message; String? get badgeKey;
/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CelebrationCopyWith<Celebration> get copyWith => _$CelebrationCopyWithImpl<Celebration>(this as Celebration, _$identity);

  /// Serializes this Celebration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Celebration;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Celebration&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.badgeKey, _this.badgeKey) || other.badgeKey == _this.badgeKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Celebration;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.title,_this.message,_this.badgeKey);
}

@override
String toString() {
  final _this = this as Celebration;
  return 'Celebration(id: ${_this.id}, kind: ${_this.kind}, title: ${_this.title}, message: ${_this.message}, badgeKey: ${_this.badgeKey})';
}


}

/// @nodoc
abstract mixin class $CelebrationCopyWith<$Res>  {
  factory $CelebrationCopyWith(Celebration value, $Res Function(Celebration) _then) = _$CelebrationCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(unknownEnumValue: CelebrationKind.unknown) CelebrationKind kind, String title, String? message, String? badgeKey
});




}
/// @nodoc
class _$CelebrationCopyWithImpl<$Res>
    implements $CelebrationCopyWith<$Res> {
  _$CelebrationCopyWithImpl(this._self, this._then);

  final Celebration _self;
  final $Res Function(Celebration) _then;

/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? kind = null,Object? title = null,Object? message = freezed,Object? badgeKey = freezed,}) {
  return _then(Celebration(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CelebrationKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,badgeKey: freezed == badgeKey ? _self.badgeKey : badgeKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Celebration].
extension CelebrationPatterns on Celebration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Celebration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Celebration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Celebration value)  $default,){
final _that = this;
switch (_that) {
case _Celebration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Celebration value)?  $default,){
final _that = this;
switch (_that) {
case _Celebration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(unknownEnumValue: CelebrationKind.unknown)  CelebrationKind kind,  String title,  String? message,  String? badgeKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Celebration() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.message,_that.badgeKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(unknownEnumValue: CelebrationKind.unknown)  CelebrationKind kind,  String title,  String? message,  String? badgeKey)  $default,) {final _that = this;
switch (_that) {
case _Celebration():
return $default(_that.id,_that.kind,_that.title,_that.message,_that.badgeKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(unknownEnumValue: CelebrationKind.unknown)  CelebrationKind kind,  String title,  String? message,  String? badgeKey)?  $default,) {final _that = this;
switch (_that) {
case _Celebration() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.message,_that.badgeKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Celebration implements Celebration {
  const _Celebration({this.id, @JsonKey(unknownEnumValue: CelebrationKind.unknown) this.kind = CelebrationKind.badge, this.title = '', this.message, this.badgeKey});
  factory _Celebration.fromJson(Map<String, dynamic> json) => _$CelebrationFromJson(json);

@override final  String? id;
@override@JsonKey(unknownEnumValue: CelebrationKind.unknown) final  CelebrationKind kind;
@override@JsonKey() final  String title;
@override final  String? message;
@override final  String? badgeKey;

/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CelebrationCopyWith<_Celebration> get copyWith => __$CelebrationCopyWithImpl<_Celebration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CelebrationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Celebration&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.badgeKey, badgeKey) || other.badgeKey == badgeKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,title,message,badgeKey);
}

@override
String toString() {
    return 'Celebration(id: $id, kind: $kind, title: $title, message: $message, badgeKey: $badgeKey)';
}


}

/// @nodoc
abstract mixin class _$CelebrationCopyWith<$Res> implements $CelebrationCopyWith<$Res> {
  factory _$CelebrationCopyWith(_Celebration value, $Res Function(_Celebration) _then) = __$CelebrationCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(unknownEnumValue: CelebrationKind.unknown) CelebrationKind kind, String title, String? message, String? badgeKey
});




}
/// @nodoc
class __$CelebrationCopyWithImpl<$Res>
    implements _$CelebrationCopyWith<$Res> {
  __$CelebrationCopyWithImpl(this._self, this._then);

  final _Celebration _self;
  final $Res Function(_Celebration) _then;

/// Create a copy of Celebration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? kind = null,Object? title = null,Object? message = freezed,Object? badgeKey = freezed,}) {
  return _then(_Celebration(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CelebrationKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,badgeKey: freezed == badgeKey ? _self.badgeKey : badgeKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Unlock {

 String get id;/// theme | character
 String get kind; String get key; DateTime? get unlockedAt;
/// Create a copy of Unlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnlockCopyWith<Unlock> get copyWith => _$UnlockCopyWithImpl<Unlock>(this as Unlock, _$identity);

  /// Serializes this Unlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Unlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unlock&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.unlockedAt, _this.unlockedAt) || other.unlockedAt == _this.unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Unlock;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.key,_this.unlockedAt);
}

@override
String toString() {
  final _this = this as Unlock;
  return 'Unlock(id: ${_this.id}, kind: ${_this.kind}, key: ${_this.key}, unlockedAt: ${_this.unlockedAt})';
}


}

/// @nodoc
abstract mixin class $UnlockCopyWith<$Res>  {
  factory $UnlockCopyWith(Unlock value, $Res Function(Unlock) _then) = _$UnlockCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String key, DateTime? unlockedAt
});




}
/// @nodoc
class _$UnlockCopyWithImpl<$Res>
    implements $UnlockCopyWith<$Res> {
  _$UnlockCopyWithImpl(this._self, this._then);

  final Unlock _self;
  final $Res Function(Unlock) _then;

/// Create a copy of Unlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? key = null,Object? unlockedAt = freezed,}) {
  return _then(Unlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Unlock].
extension UnlockPatterns on Unlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Unlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Unlock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Unlock value)  $default,){
final _that = this;
switch (_that) {
case _Unlock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Unlock value)?  $default,){
final _that = this;
switch (_that) {
case _Unlock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String key,  DateTime? unlockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Unlock() when $default != null:
return $default(_that.id,_that.kind,_that.key,_that.unlockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String key,  DateTime? unlockedAt)  $default,) {final _that = this;
switch (_that) {
case _Unlock():
return $default(_that.id,_that.kind,_that.key,_that.unlockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String key,  DateTime? unlockedAt)?  $default,) {final _that = this;
switch (_that) {
case _Unlock() when $default != null:
return $default(_that.id,_that.kind,_that.key,_that.unlockedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Unlock implements Unlock {
  const _Unlock({required this.id, this.kind = 'theme', this.key = '', this.unlockedAt});
  factory _Unlock.fromJson(Map<String, dynamic> json) => _$UnlockFromJson(json);

@override final  String id;
/// theme | character
@override@JsonKey() final  String kind;
@override@JsonKey() final  String key;
@override final  DateTime? unlockedAt;

/// Create a copy of Unlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnlockCopyWith<_Unlock> get copyWith => __$UnlockCopyWithImpl<_Unlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unlock&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.key, key) || other.key == key)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,key,unlockedAt);
}

@override
String toString() {
    return 'Unlock(id: $id, kind: $kind, key: $key, unlockedAt: $unlockedAt)';
}


}

/// @nodoc
abstract mixin class _$UnlockCopyWith<$Res> implements $UnlockCopyWith<$Res> {
  factory _$UnlockCopyWith(_Unlock value, $Res Function(_Unlock) _then) = __$UnlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String key, DateTime? unlockedAt
});




}
/// @nodoc
class __$UnlockCopyWithImpl<$Res>
    implements _$UnlockCopyWith<$Res> {
  __$UnlockCopyWithImpl(this._self, this._then);

  final _Unlock _self;
  final $Res Function(_Unlock) _then;

/// Create a copy of Unlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? key = null,Object? unlockedAt = freezed,}) {
  return _then(_Unlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
