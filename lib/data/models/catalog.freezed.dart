// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterDef {

 String get id; String get name;/// Short personality line.
 String get description;/// Example notification in the character's voice (onboarding preview).
 String? get sampleNotification; String? get assetKey; bool get isPremium; String? get unlockRule;/// Accent colour token name (e.g. "teal") or hex for the placeholder avatar.
 String? get color; int get order;
/// Create a copy of CharacterDef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDefCopyWith<CharacterDef> get copyWith => _$CharacterDefCopyWithImpl<CharacterDef>(this as CharacterDef, _$identity);

  /// Serializes this CharacterDef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CharacterDef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.sampleNotification, _this.sampleNotification) || other.sampleNotification == _this.sampleNotification)&&(identical(other.assetKey, _this.assetKey) || other.assetKey == _this.assetKey)&&(identical(other.isPremium, _this.isPremium) || other.isPremium == _this.isPremium)&&(identical(other.unlockRule, _this.unlockRule) || other.unlockRule == _this.unlockRule)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.order, _this.order) || other.order == _this.order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CharacterDef;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.sampleNotification,_this.assetKey,_this.isPremium,_this.unlockRule,_this.color,_this.order);
}

@override
String toString() {
  final _this = this as CharacterDef;
  return 'CharacterDef(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, sampleNotification: ${_this.sampleNotification}, assetKey: ${_this.assetKey}, isPremium: ${_this.isPremium}, unlockRule: ${_this.unlockRule}, color: ${_this.color}, order: ${_this.order})';
}


}

/// @nodoc
abstract mixin class $CharacterDefCopyWith<$Res>  {
  factory $CharacterDefCopyWith(CharacterDef value, $Res Function(CharacterDef) _then) = _$CharacterDefCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String? sampleNotification, String? assetKey, bool isPremium, String? unlockRule, String? color, int order
});




}
/// @nodoc
class _$CharacterDefCopyWithImpl<$Res>
    implements $CharacterDefCopyWith<$Res> {
  _$CharacterDefCopyWithImpl(this._self, this._then);

  final CharacterDef _self;
  final $Res Function(CharacterDef) _then;

/// Create a copy of CharacterDef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? sampleNotification = freezed,Object? assetKey = freezed,Object? isPremium = null,Object? unlockRule = freezed,Object? color = freezed,Object? order = null,}) {
  return _then(CharacterDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sampleNotification: freezed == sampleNotification ? _self.sampleNotification : sampleNotification // ignore: cast_nullable_to_non_nullable
as String?,assetKey: freezed == assetKey ? _self.assetKey : assetKey // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,unlockRule: freezed == unlockRule ? _self.unlockRule : unlockRule // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterDef].
extension CharacterDefPatterns on CharacterDef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterDef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterDef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterDef value)  $default,){
final _that = this;
switch (_that) {
case _CharacterDef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterDef value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterDef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String? sampleNotification,  String? assetKey,  bool isPremium,  String? unlockRule,  String? color,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterDef() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.sampleNotification,_that.assetKey,_that.isPremium,_that.unlockRule,_that.color,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String? sampleNotification,  String? assetKey,  bool isPremium,  String? unlockRule,  String? color,  int order)  $default,) {final _that = this;
switch (_that) {
case _CharacterDef():
return $default(_that.id,_that.name,_that.description,_that.sampleNotification,_that.assetKey,_that.isPremium,_that.unlockRule,_that.color,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String? sampleNotification,  String? assetKey,  bool isPremium,  String? unlockRule,  String? color,  int order)?  $default,) {final _that = this;
switch (_that) {
case _CharacterDef() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.sampleNotification,_that.assetKey,_that.isPremium,_that.unlockRule,_that.color,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterDef implements CharacterDef {
  const _CharacterDef({required this.id, this.name = '', this.description = '', this.sampleNotification, this.assetKey, this.isPremium = false, this.unlockRule, this.color, this.order = 0});
  factory _CharacterDef.fromJson(Map<String, dynamic> json) => _$CharacterDefFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
/// Short personality line.
@override@JsonKey() final  String description;
/// Example notification in the character's voice (onboarding preview).
@override final  String? sampleNotification;
@override final  String? assetKey;
@override@JsonKey() final  bool isPremium;
@override final  String? unlockRule;
/// Accent colour token name (e.g. "teal") or hex for the placeholder avatar.
@override final  String? color;
@override@JsonKey() final  int order;

/// Create a copy of CharacterDef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterDefCopyWith<_CharacterDef> get copyWith => __$CharacterDefCopyWithImpl<_CharacterDef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterDefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterDef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sampleNotification, sampleNotification) || other.sampleNotification == sampleNotification)&&(identical(other.assetKey, assetKey) || other.assetKey == assetKey)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.unlockRule, unlockRule) || other.unlockRule == unlockRule)&&(identical(other.color, color) || other.color == color)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,sampleNotification,assetKey,isPremium,unlockRule,color,order);
}

@override
String toString() {
    return 'CharacterDef(id: $id, name: $name, description: $description, sampleNotification: $sampleNotification, assetKey: $assetKey, isPremium: $isPremium, unlockRule: $unlockRule, color: $color, order: $order)';
}


}

/// @nodoc
abstract mixin class _$CharacterDefCopyWith<$Res> implements $CharacterDefCopyWith<$Res> {
  factory _$CharacterDefCopyWith(_CharacterDef value, $Res Function(_CharacterDef) _then) = __$CharacterDefCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String? sampleNotification, String? assetKey, bool isPremium, String? unlockRule, String? color, int order
});




}
/// @nodoc
class __$CharacterDefCopyWithImpl<$Res>
    implements _$CharacterDefCopyWith<$Res> {
  __$CharacterDefCopyWithImpl(this._self, this._then);

  final _CharacterDef _self;
  final $Res Function(_CharacterDef) _then;

/// Create a copy of CharacterDef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? sampleNotification = freezed,Object? assetKey = freezed,Object? isPremium = null,Object? unlockRule = freezed,Object? color = freezed,Object? order = null,}) {
  return _then(_CharacterDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sampleNotification: freezed == sampleNotification ? _self.sampleNotification : sampleNotification // ignore: cast_nullable_to_non_nullable
as String?,assetKey: freezed == assetKey ? _self.assetKey : assetKey // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,unlockRule: freezed == unlockRule ? _self.unlockRule : unlockRule // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ThemeDef {

 String get id; String get name; String get kind;/// `{light: {token: hex}, dark: {token: hex}}`.
 Map<String, Map<String, String>> get palette; String get availability;/// "MM-DD" season window for seasonal themes.
 String? get seasonStart; String? get seasonEnd;/// fall | winter | spring | summer — selects the corner decoration.
 String? get decoration; int get order;
/// Create a copy of ThemeDef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeDefCopyWith<ThemeDef> get copyWith => _$ThemeDefCopyWithImpl<ThemeDef>(this as ThemeDef, _$identity);

  /// Serializes this ThemeDef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ThemeDef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeDef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.palette, _this.palette)&&(identical(other.availability, _this.availability) || other.availability == _this.availability)&&(identical(other.seasonStart, _this.seasonStart) || other.seasonStart == _this.seasonStart)&&(identical(other.seasonEnd, _this.seasonEnd) || other.seasonEnd == _this.seasonEnd)&&(identical(other.decoration, _this.decoration) || other.decoration == _this.decoration)&&(identical(other.order, _this.order) || other.order == _this.order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ThemeDef;
  return Object.hash(runtimeType,_this.id,_this.name,_this.kind,const DeepCollectionEquality().hash(_this.palette),_this.availability,_this.seasonStart,_this.seasonEnd,_this.decoration,_this.order);
}

@override
String toString() {
  final _this = this as ThemeDef;
  return 'ThemeDef(id: ${_this.id}, name: ${_this.name}, kind: ${_this.kind}, palette: ${_this.palette}, availability: ${_this.availability}, seasonStart: ${_this.seasonStart}, seasonEnd: ${_this.seasonEnd}, decoration: ${_this.decoration}, order: ${_this.order})';
}


}

/// @nodoc
abstract mixin class $ThemeDefCopyWith<$Res>  {
  factory $ThemeDefCopyWith(ThemeDef value, $Res Function(ThemeDef) _then) = _$ThemeDefCopyWithImpl;
@useResult
$Res call({
 String id, String name, String kind, Map<String, Map<String, String>> palette, String availability, String? seasonStart, String? seasonEnd, String? decoration, int order
});




}
/// @nodoc
class _$ThemeDefCopyWithImpl<$Res>
    implements $ThemeDefCopyWith<$Res> {
  _$ThemeDefCopyWithImpl(this._self, this._then);

  final ThemeDef _self;
  final $Res Function(ThemeDef) _then;

/// Create a copy of ThemeDef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? palette = null,Object? availability = null,Object? seasonStart = freezed,Object? seasonEnd = freezed,Object? decoration = freezed,Object? order = null,}) {
  return _then(ThemeDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,palette: null == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as String,seasonStart: freezed == seasonStart ? _self.seasonStart : seasonStart // ignore: cast_nullable_to_non_nullable
as String?,seasonEnd: freezed == seasonEnd ? _self.seasonEnd : seasonEnd // ignore: cast_nullable_to_non_nullable
as String?,decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeDef].
extension ThemeDefPatterns on ThemeDef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeDef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeDef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeDef value)  $default,){
final _that = this;
switch (_that) {
case _ThemeDef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeDef value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeDef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String kind,  Map<String, Map<String, String>> palette,  String availability,  String? seasonStart,  String? seasonEnd,  String? decoration,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeDef() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.palette,_that.availability,_that.seasonStart,_that.seasonEnd,_that.decoration,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String kind,  Map<String, Map<String, String>> palette,  String availability,  String? seasonStart,  String? seasonEnd,  String? decoration,  int order)  $default,) {final _that = this;
switch (_that) {
case _ThemeDef():
return $default(_that.id,_that.name,_that.kind,_that.palette,_that.availability,_that.seasonStart,_that.seasonEnd,_that.decoration,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String kind,  Map<String, Map<String, String>> palette,  String availability,  String? seasonStart,  String? seasonEnd,  String? decoration,  int order)?  $default,) {final _that = this;
switch (_that) {
case _ThemeDef() when $default != null:
return $default(_that.id,_that.name,_that.kind,_that.palette,_that.availability,_that.seasonStart,_that.seasonEnd,_that.decoration,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemeDef extends ThemeDef {
  const _ThemeDef({required this.id, this.name = '', this.kind = 'preset',  Map<String, Map<String, String>> palette = const <String, Map<String, String>>{}, this.availability = 'free', this.seasonStart, this.seasonEnd, this.decoration, this.order = 0}): _palette = palette,super._();
  factory _ThemeDef.fromJson(Map<String, dynamic> json) => _$ThemeDefFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String kind;
/// `{light: {token: hex}, dark: {token: hex}}`.
 final  Map<String, Map<String, String>> _palette;
/// `{light: {token: hex}, dark: {token: hex}}`.
@override@JsonKey() Map<String, Map<String, String>> get palette {
  if (_palette is EqualUnmodifiableMapView) return _palette;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_palette);
}

@override@JsonKey() final  String availability;
/// "MM-DD" season window for seasonal themes.
@override final  String? seasonStart;
@override final  String? seasonEnd;
/// fall | winter | spring | summer — selects the corner decoration.
@override final  String? decoration;
@override@JsonKey() final  int order;

/// Create a copy of ThemeDef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeDefCopyWith<_ThemeDef> get copyWith => __$ThemeDefCopyWithImpl<_ThemeDef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeDefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeDef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.palette, _palette)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.seasonStart, seasonStart) || other.seasonStart == seasonStart)&&(identical(other.seasonEnd, seasonEnd) || other.seasonEnd == seasonEnd)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,kind,const DeepCollectionEquality().hash(_palette),availability,seasonStart,seasonEnd,decoration,order);
}

@override
String toString() {
    return 'ThemeDef(id: $id, name: $name, kind: $kind, palette: $palette, availability: $availability, seasonStart: $seasonStart, seasonEnd: $seasonEnd, decoration: $decoration, order: $order)';
}


}

/// @nodoc
abstract mixin class _$ThemeDefCopyWith<$Res> implements $ThemeDefCopyWith<$Res> {
  factory _$ThemeDefCopyWith(_ThemeDef value, $Res Function(_ThemeDef) _then) = __$ThemeDefCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String kind, Map<String, Map<String, String>> palette, String availability, String? seasonStart, String? seasonEnd, String? decoration, int order
});




}
/// @nodoc
class __$ThemeDefCopyWithImpl<$Res>
    implements _$ThemeDefCopyWith<$Res> {
  __$ThemeDefCopyWithImpl(this._self, this._then);

  final _ThemeDef _self;
  final $Res Function(_ThemeDef) _then;

/// Create a copy of ThemeDef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kind = null,Object? palette = null,Object? availability = null,Object? seasonStart = freezed,Object? seasonEnd = freezed,Object? decoration = freezed,Object? order = null,}) {
  return _then(_ThemeDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,palette: null == palette ? _self._palette : palette // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as String,seasonStart: freezed == seasonStart ? _self.seasonStart : seasonStart // ignore: cast_nullable_to_non_nullable
as String?,seasonEnd: freezed == seasonEnd ? _self.seasonEnd : seasonEnd // ignore: cast_nullable_to_non_nullable
as String?,decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
