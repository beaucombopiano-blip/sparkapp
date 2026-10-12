// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get id; String get displayName; int? get birthYear;@JsonKey(unknownEnumValue: AgeBracket.unknown) AgeBracket? get ageBracket; String? get timezone; String? get locationCity; String? get locationRegion; String? get locationCountry; String? get characterId;@JsonKey(unknownEnumValue: AppearanceMode.system) AppearanceMode get appearanceMode; String? get themeId;/// `{ "light": {role: "#RRGGBB"}, "dark": {role: "#RRGGBB"} }`
 Map<String, Map<String, String>> get customPalette;@JsonKey(unknownEnumValue: OnboardingPath.unknown) OnboardingPath? get onboardingPath; String get onboardingStep; Map<String, dynamic> get onboardingAnswers; String? get activeProjectId; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.birthYear, _this.birthYear) || other.birthYear == _this.birthYear)&&(identical(other.ageBracket, _this.ageBracket) || other.ageBracket == _this.ageBracket)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.locationCity, _this.locationCity) || other.locationCity == _this.locationCity)&&(identical(other.locationRegion, _this.locationRegion) || other.locationRegion == _this.locationRegion)&&(identical(other.locationCountry, _this.locationCountry) || other.locationCountry == _this.locationCountry)&&(identical(other.characterId, _this.characterId) || other.characterId == _this.characterId)&&(identical(other.appearanceMode, _this.appearanceMode) || other.appearanceMode == _this.appearanceMode)&&(identical(other.themeId, _this.themeId) || other.themeId == _this.themeId)&&const DeepCollectionEquality().equals(other.customPalette, _this.customPalette)&&(identical(other.onboardingPath, _this.onboardingPath) || other.onboardingPath == _this.onboardingPath)&&(identical(other.onboardingStep, _this.onboardingStep) || other.onboardingStep == _this.onboardingStep)&&const DeepCollectionEquality().equals(other.onboardingAnswers, _this.onboardingAnswers)&&(identical(other.activeProjectId, _this.activeProjectId) || other.activeProjectId == _this.activeProjectId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hash(runtimeType,_this.id,_this.displayName,_this.birthYear,_this.ageBracket,_this.timezone,_this.locationCity,_this.locationRegion,_this.locationCountry,_this.characterId,_this.appearanceMode,_this.themeId,const DeepCollectionEquality().hash(_this.customPalette),_this.onboardingPath,_this.onboardingStep,const DeepCollectionEquality().hash(_this.onboardingAnswers),_this.activeProjectId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(id: ${_this.id}, displayName: ${_this.displayName}, birthYear: ${_this.birthYear}, ageBracket: ${_this.ageBracket}, timezone: ${_this.timezone}, locationCity: ${_this.locationCity}, locationRegion: ${_this.locationRegion}, locationCountry: ${_this.locationCountry}, characterId: ${_this.characterId}, appearanceMode: ${_this.appearanceMode}, themeId: ${_this.themeId}, customPalette: ${_this.customPalette}, onboardingPath: ${_this.onboardingPath}, onboardingStep: ${_this.onboardingStep}, onboardingAnswers: ${_this.onboardingAnswers}, activeProjectId: ${_this.activeProjectId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, int? birthYear,@JsonKey(unknownEnumValue: AgeBracket.unknown) AgeBracket? ageBracket, String? timezone, String? locationCity, String? locationRegion, String? locationCountry, String? characterId,@JsonKey(unknownEnumValue: AppearanceMode.system) AppearanceMode appearanceMode, String? themeId, Map<String, Map<String, String>> customPalette,@JsonKey(unknownEnumValue: OnboardingPath.unknown) OnboardingPath? onboardingPath, String onboardingStep, Map<String, dynamic> onboardingAnswers, String? activeProjectId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? birthYear = freezed,Object? ageBracket = freezed,Object? timezone = freezed,Object? locationCity = freezed,Object? locationRegion = freezed,Object? locationCountry = freezed,Object? characterId = freezed,Object? appearanceMode = null,Object? themeId = freezed,Object? customPalette = null,Object? onboardingPath = freezed,Object? onboardingStep = null,Object? onboardingAnswers = null,Object? activeProjectId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,ageBracket: freezed == ageBracket ? _self.ageBracket : ageBracket // ignore: cast_nullable_to_non_nullable
as AgeBracket?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,locationCity: freezed == locationCity ? _self.locationCity : locationCity // ignore: cast_nullable_to_non_nullable
as String?,locationRegion: freezed == locationRegion ? _self.locationRegion : locationRegion // ignore: cast_nullable_to_non_nullable
as String?,locationCountry: freezed == locationCountry ? _self.locationCountry : locationCountry // ignore: cast_nullable_to_non_nullable
as String?,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,appearanceMode: null == appearanceMode ? _self.appearanceMode : appearanceMode // ignore: cast_nullable_to_non_nullable
as AppearanceMode,themeId: freezed == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String?,customPalette: null == customPalette ? _self.customPalette : customPalette // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,onboardingPath: freezed == onboardingPath ? _self.onboardingPath : onboardingPath // ignore: cast_nullable_to_non_nullable
as OnboardingPath?,onboardingStep: null == onboardingStep ? _self.onboardingStep : onboardingStep // ignore: cast_nullable_to_non_nullable
as String,onboardingAnswers: null == onboardingAnswers ? _self.onboardingAnswers : onboardingAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,activeProjectId: freezed == activeProjectId ? _self.activeProjectId : activeProjectId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  int? birthYear, @JsonKey(unknownEnumValue: AgeBracket.unknown)  AgeBracket? ageBracket,  String? timezone,  String? locationCity,  String? locationRegion,  String? locationCountry,  String? characterId, @JsonKey(unknownEnumValue: AppearanceMode.system)  AppearanceMode appearanceMode,  String? themeId,  Map<String, Map<String, String>> customPalette, @JsonKey(unknownEnumValue: OnboardingPath.unknown)  OnboardingPath? onboardingPath,  String onboardingStep,  Map<String, dynamic> onboardingAnswers,  String? activeProjectId,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.displayName,_that.birthYear,_that.ageBracket,_that.timezone,_that.locationCity,_that.locationRegion,_that.locationCountry,_that.characterId,_that.appearanceMode,_that.themeId,_that.customPalette,_that.onboardingPath,_that.onboardingStep,_that.onboardingAnswers,_that.activeProjectId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  int? birthYear, @JsonKey(unknownEnumValue: AgeBracket.unknown)  AgeBracket? ageBracket,  String? timezone,  String? locationCity,  String? locationRegion,  String? locationCountry,  String? characterId, @JsonKey(unknownEnumValue: AppearanceMode.system)  AppearanceMode appearanceMode,  String? themeId,  Map<String, Map<String, String>> customPalette, @JsonKey(unknownEnumValue: OnboardingPath.unknown)  OnboardingPath? onboardingPath,  String onboardingStep,  Map<String, dynamic> onboardingAnswers,  String? activeProjectId,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.displayName,_that.birthYear,_that.ageBracket,_that.timezone,_that.locationCity,_that.locationRegion,_that.locationCountry,_that.characterId,_that.appearanceMode,_that.themeId,_that.customPalette,_that.onboardingPath,_that.onboardingStep,_that.onboardingAnswers,_that.activeProjectId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  int? birthYear, @JsonKey(unknownEnumValue: AgeBracket.unknown)  AgeBracket? ageBracket,  String? timezone,  String? locationCity,  String? locationRegion,  String? locationCountry,  String? characterId, @JsonKey(unknownEnumValue: AppearanceMode.system)  AppearanceMode appearanceMode,  String? themeId,  Map<String, Map<String, String>> customPalette, @JsonKey(unknownEnumValue: OnboardingPath.unknown)  OnboardingPath? onboardingPath,  String onboardingStep,  Map<String, dynamic> onboardingAnswers,  String? activeProjectId,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.displayName,_that.birthYear,_that.ageBracket,_that.timezone,_that.locationCity,_that.locationRegion,_that.locationCountry,_that.characterId,_that.appearanceMode,_that.themeId,_that.customPalette,_that.onboardingPath,_that.onboardingStep,_that.onboardingAnswers,_that.activeProjectId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile extends UserProfile {
  const _UserProfile({required this.id, this.displayName = '', this.birthYear, @JsonKey(unknownEnumValue: AgeBracket.unknown) this.ageBracket, this.timezone, this.locationCity, this.locationRegion, this.locationCountry, this.characterId, @JsonKey(unknownEnumValue: AppearanceMode.system) this.appearanceMode = AppearanceMode.system, this.themeId,  Map<String, Map<String, String>> customPalette = const <String, Map<String, String>>{}, @JsonKey(unknownEnumValue: OnboardingPath.unknown) this.onboardingPath, this.onboardingStep = 'welcome',  Map<String, dynamic> onboardingAnswers = const <String, dynamic>{}, this.activeProjectId, this.createdAt, this.updatedAt}): _customPalette = customPalette,_onboardingAnswers = onboardingAnswers,super._();
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String id;
@override@JsonKey() final  String displayName;
@override final  int? birthYear;
@override@JsonKey(unknownEnumValue: AgeBracket.unknown) final  AgeBracket? ageBracket;
@override final  String? timezone;
@override final  String? locationCity;
@override final  String? locationRegion;
@override final  String? locationCountry;
@override final  String? characterId;
@override@JsonKey(unknownEnumValue: AppearanceMode.system) final  AppearanceMode appearanceMode;
@override final  String? themeId;
/// `{ "light": {role: "#RRGGBB"}, "dark": {role: "#RRGGBB"} }`
 final  Map<String, Map<String, String>> _customPalette;
/// `{ "light": {role: "#RRGGBB"}, "dark": {role: "#RRGGBB"} }`
@override@JsonKey() Map<String, Map<String, String>> get customPalette {
  if (_customPalette is EqualUnmodifiableMapView) return _customPalette;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customPalette);
}

@override@JsonKey(unknownEnumValue: OnboardingPath.unknown) final  OnboardingPath? onboardingPath;
@override@JsonKey() final  String onboardingStep;
 final  Map<String, dynamic> _onboardingAnswers;
@override@JsonKey() Map<String, dynamic> get onboardingAnswers {
  if (_onboardingAnswers is EqualUnmodifiableMapView) return _onboardingAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_onboardingAnswers);
}

@override final  String? activeProjectId;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.ageBracket, ageBracket) || other.ageBracket == ageBracket)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.locationCity, locationCity) || other.locationCity == locationCity)&&(identical(other.locationRegion, locationRegion) || other.locationRegion == locationRegion)&&(identical(other.locationCountry, locationCountry) || other.locationCountry == locationCountry)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.appearanceMode, appearanceMode) || other.appearanceMode == appearanceMode)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&const DeepCollectionEquality().equals(other.customPalette, _customPalette)&&(identical(other.onboardingPath, onboardingPath) || other.onboardingPath == onboardingPath)&&(identical(other.onboardingStep, onboardingStep) || other.onboardingStep == onboardingStep)&&const DeepCollectionEquality().equals(other.onboardingAnswers, _onboardingAnswers)&&(identical(other.activeProjectId, activeProjectId) || other.activeProjectId == activeProjectId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,displayName,birthYear,ageBracket,timezone,locationCity,locationRegion,locationCountry,characterId,appearanceMode,themeId,const DeepCollectionEquality().hash(_customPalette),onboardingPath,onboardingStep,const DeepCollectionEquality().hash(_onboardingAnswers),activeProjectId,createdAt,updatedAt);
}

@override
String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, birthYear: $birthYear, ageBracket: $ageBracket, timezone: $timezone, locationCity: $locationCity, locationRegion: $locationRegion, locationCountry: $locationCountry, characterId: $characterId, appearanceMode: $appearanceMode, themeId: $themeId, customPalette: $customPalette, onboardingPath: $onboardingPath, onboardingStep: $onboardingStep, onboardingAnswers: $onboardingAnswers, activeProjectId: $activeProjectId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, int? birthYear,@JsonKey(unknownEnumValue: AgeBracket.unknown) AgeBracket? ageBracket, String? timezone, String? locationCity, String? locationRegion, String? locationCountry, String? characterId,@JsonKey(unknownEnumValue: AppearanceMode.system) AppearanceMode appearanceMode, String? themeId, Map<String, Map<String, String>> customPalette,@JsonKey(unknownEnumValue: OnboardingPath.unknown) OnboardingPath? onboardingPath, String onboardingStep, Map<String, dynamic> onboardingAnswers, String? activeProjectId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? birthYear = freezed,Object? ageBracket = freezed,Object? timezone = freezed,Object? locationCity = freezed,Object? locationRegion = freezed,Object? locationCountry = freezed,Object? characterId = freezed,Object? appearanceMode = null,Object? themeId = freezed,Object? customPalette = null,Object? onboardingPath = freezed,Object? onboardingStep = null,Object? onboardingAnswers = null,Object? activeProjectId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,ageBracket: freezed == ageBracket ? _self.ageBracket : ageBracket // ignore: cast_nullable_to_non_nullable
as AgeBracket?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,locationCity: freezed == locationCity ? _self.locationCity : locationCity // ignore: cast_nullable_to_non_nullable
as String?,locationRegion: freezed == locationRegion ? _self.locationRegion : locationRegion // ignore: cast_nullable_to_non_nullable
as String?,locationCountry: freezed == locationCountry ? _self.locationCountry : locationCountry // ignore: cast_nullable_to_non_nullable
as String?,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,appearanceMode: null == appearanceMode ? _self.appearanceMode : appearanceMode // ignore: cast_nullable_to_non_nullable
as AppearanceMode,themeId: freezed == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String?,customPalette: null == customPalette ? _self._customPalette : customPalette // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,onboardingPath: freezed == onboardingPath ? _self.onboardingPath : onboardingPath // ignore: cast_nullable_to_non_nullable
as OnboardingPath?,onboardingStep: null == onboardingStep ? _self.onboardingStep : onboardingStep // ignore: cast_nullable_to_non_nullable
as String,onboardingAnswers: null == onboardingAnswers ? _self._onboardingAnswers : onboardingAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,activeProjectId: freezed == activeProjectId ? _self.activeProjectId : activeProjectId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$UserSettings {

 NotificationPrefs get notifications; PrivacySettings get privacy; CalendarSettings get calendar;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.notifications, _this.notifications) || other.notifications == _this.notifications)&&(identical(other.privacy, _this.privacy) || other.privacy == _this.privacy)&&(identical(other.calendar, _this.calendar) || other.calendar == _this.calendar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserSettings;
  return Object.hash(runtimeType,_this.notifications,_this.privacy,_this.calendar);
}

@override
String toString() {
  final _this = this as UserSettings;
  return 'UserSettings(notifications: ${_this.notifications}, privacy: ${_this.privacy}, calendar: ${_this.calendar})';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
 NotificationPrefs notifications, PrivacySettings privacy, CalendarSettings calendar
});


$NotificationPrefsCopyWith<$Res> get notifications;$PrivacySettingsCopyWith<$Res> get privacy;$CalendarSettingsCopyWith<$Res> get calendar;

}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? privacy = null,Object? calendar = null,}) {
  return _then(UserSettings(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as NotificationPrefs,privacy: null == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as PrivacySettings,calendar: null == calendar ? _self.calendar : calendar // ignore: cast_nullable_to_non_nullable
as CalendarSettings,
  ));
}
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPrefsCopyWith<$Res> get notifications {
  
  return $NotificationPrefsCopyWith<$Res>(_self.notifications, (value) {
    return _then(_self.copyWith(notifications: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<$Res> get privacy {
  
  return $PrivacySettingsCopyWith<$Res>(_self.privacy, (value) {
    return _then(_self.copyWith(privacy: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarSettingsCopyWith<$Res> get calendar {
  
  return $CalendarSettingsCopyWith<$Res>(_self.calendar, (value) {
    return _then(_self.copyWith(calendar: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationPrefs notifications,  PrivacySettings privacy,  CalendarSettings calendar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.notifications,_that.privacy,_that.calendar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationPrefs notifications,  PrivacySettings privacy,  CalendarSettings calendar)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.notifications,_that.privacy,_that.calendar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationPrefs notifications,  PrivacySettings privacy,  CalendarSettings calendar)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.notifications,_that.privacy,_that.calendar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({this.notifications = const NotificationPrefs(), this.privacy = const PrivacySettings(), this.calendar = const CalendarSettings()});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@JsonKey() final  NotificationPrefs notifications;
@override@JsonKey() final  PrivacySettings privacy;
@override@JsonKey() final  CalendarSettings calendar;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.calendar, calendar) || other.calendar == calendar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,notifications,privacy,calendar);
}

@override
String toString() {
    return 'UserSettings(notifications: $notifications, privacy: $privacy, calendar: $calendar)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
 NotificationPrefs notifications, PrivacySettings privacy, CalendarSettings calendar
});


@override $NotificationPrefsCopyWith<$Res> get notifications;@override $PrivacySettingsCopyWith<$Res> get privacy;@override $CalendarSettingsCopyWith<$Res> get calendar;

}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? privacy = null,Object? calendar = null,}) {
  return _then(_UserSettings(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as NotificationPrefs,privacy: null == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as PrivacySettings,calendar: null == calendar ? _self.calendar : calendar // ignore: cast_nullable_to_non_nullable
as CalendarSettings,
  ));
}

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPrefsCopyWith<$Res> get notifications {
  
  return $NotificationPrefsCopyWith<$Res>(_self.notifications, (value) {
    return _then(_self.copyWith(notifications: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<$Res> get privacy {
  
  return $PrivacySettingsCopyWith<$Res>(_self.privacy, (value) {
    return _then(_self.copyWith(privacy: value));
  });
}/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarSettingsCopyWith<$Res> get calendar {
  
  return $CalendarSettingsCopyWith<$Res>(_self.calendar, (value) {
    return _then(_self.copyWith(calendar: value));
  });
}
}


/// @nodoc
mixin _$NotificationPrefs {

 bool get dailyQuote; bool get sessionReminder; int get sessionReminderLeadMinutes; bool get taskDeadlineReminders; bool get weeklyCheckin; bool get monthlyReflection; bool get celebrations;/// Local "HH:mm"; null means no quiet hours.
 String? get quietHoursStart; String? get quietHoursEnd; int get maxPerDay;/// Last known OS permission state reported by the app: granted | denied | unknown.
 String get osPermission;
/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPrefsCopyWith<NotificationPrefs> get copyWith => _$NotificationPrefsCopyWithImpl<NotificationPrefs>(this as NotificationPrefs, _$identity);

  /// Serializes this NotificationPrefs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationPrefs;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPrefs&&(identical(other.dailyQuote, _this.dailyQuote) || other.dailyQuote == _this.dailyQuote)&&(identical(other.sessionReminder, _this.sessionReminder) || other.sessionReminder == _this.sessionReminder)&&(identical(other.sessionReminderLeadMinutes, _this.sessionReminderLeadMinutes) || other.sessionReminderLeadMinutes == _this.sessionReminderLeadMinutes)&&(identical(other.taskDeadlineReminders, _this.taskDeadlineReminders) || other.taskDeadlineReminders == _this.taskDeadlineReminders)&&(identical(other.weeklyCheckin, _this.weeklyCheckin) || other.weeklyCheckin == _this.weeklyCheckin)&&(identical(other.monthlyReflection, _this.monthlyReflection) || other.monthlyReflection == _this.monthlyReflection)&&(identical(other.celebrations, _this.celebrations) || other.celebrations == _this.celebrations)&&(identical(other.quietHoursStart, _this.quietHoursStart) || other.quietHoursStart == _this.quietHoursStart)&&(identical(other.quietHoursEnd, _this.quietHoursEnd) || other.quietHoursEnd == _this.quietHoursEnd)&&(identical(other.maxPerDay, _this.maxPerDay) || other.maxPerDay == _this.maxPerDay)&&(identical(other.osPermission, _this.osPermission) || other.osPermission == _this.osPermission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationPrefs;
  return Object.hash(runtimeType,_this.dailyQuote,_this.sessionReminder,_this.sessionReminderLeadMinutes,_this.taskDeadlineReminders,_this.weeklyCheckin,_this.monthlyReflection,_this.celebrations,_this.quietHoursStart,_this.quietHoursEnd,_this.maxPerDay,_this.osPermission);
}

@override
String toString() {
  final _this = this as NotificationPrefs;
  return 'NotificationPrefs(dailyQuote: ${_this.dailyQuote}, sessionReminder: ${_this.sessionReminder}, sessionReminderLeadMinutes: ${_this.sessionReminderLeadMinutes}, taskDeadlineReminders: ${_this.taskDeadlineReminders}, weeklyCheckin: ${_this.weeklyCheckin}, monthlyReflection: ${_this.monthlyReflection}, celebrations: ${_this.celebrations}, quietHoursStart: ${_this.quietHoursStart}, quietHoursEnd: ${_this.quietHoursEnd}, maxPerDay: ${_this.maxPerDay}, osPermission: ${_this.osPermission})';
}


}

/// @nodoc
abstract mixin class $NotificationPrefsCopyWith<$Res>  {
  factory $NotificationPrefsCopyWith(NotificationPrefs value, $Res Function(NotificationPrefs) _then) = _$NotificationPrefsCopyWithImpl;
@useResult
$Res call({
 bool dailyQuote, bool sessionReminder, int sessionReminderLeadMinutes, bool taskDeadlineReminders, bool weeklyCheckin, bool monthlyReflection, bool celebrations, String? quietHoursStart, String? quietHoursEnd, int maxPerDay, String osPermission
});




}
/// @nodoc
class _$NotificationPrefsCopyWithImpl<$Res>
    implements $NotificationPrefsCopyWith<$Res> {
  _$NotificationPrefsCopyWithImpl(this._self, this._then);

  final NotificationPrefs _self;
  final $Res Function(NotificationPrefs) _then;

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyQuote = null,Object? sessionReminder = null,Object? sessionReminderLeadMinutes = null,Object? taskDeadlineReminders = null,Object? weeklyCheckin = null,Object? monthlyReflection = null,Object? celebrations = null,Object? quietHoursStart = freezed,Object? quietHoursEnd = freezed,Object? maxPerDay = null,Object? osPermission = null,}) {
  return _then(NotificationPrefs(
dailyQuote: null == dailyQuote ? _self.dailyQuote : dailyQuote // ignore: cast_nullable_to_non_nullable
as bool,sessionReminder: null == sessionReminder ? _self.sessionReminder : sessionReminder // ignore: cast_nullable_to_non_nullable
as bool,sessionReminderLeadMinutes: null == sessionReminderLeadMinutes ? _self.sessionReminderLeadMinutes : sessionReminderLeadMinutes // ignore: cast_nullable_to_non_nullable
as int,taskDeadlineReminders: null == taskDeadlineReminders ? _self.taskDeadlineReminders : taskDeadlineReminders // ignore: cast_nullable_to_non_nullable
as bool,weeklyCheckin: null == weeklyCheckin ? _self.weeklyCheckin : weeklyCheckin // ignore: cast_nullable_to_non_nullable
as bool,monthlyReflection: null == monthlyReflection ? _self.monthlyReflection : monthlyReflection // ignore: cast_nullable_to_non_nullable
as bool,celebrations: null == celebrations ? _self.celebrations : celebrations // ignore: cast_nullable_to_non_nullable
as bool,quietHoursStart: freezed == quietHoursStart ? _self.quietHoursStart : quietHoursStart // ignore: cast_nullable_to_non_nullable
as String?,quietHoursEnd: freezed == quietHoursEnd ? _self.quietHoursEnd : quietHoursEnd // ignore: cast_nullable_to_non_nullable
as String?,maxPerDay: null == maxPerDay ? _self.maxPerDay : maxPerDay // ignore: cast_nullable_to_non_nullable
as int,osPermission: null == osPermission ? _self.osPermission : osPermission // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPrefs].
extension NotificationPrefsPatterns on NotificationPrefs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPrefs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPrefs value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPrefs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPrefs value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool dailyQuote,  bool sessionReminder,  int sessionReminderLeadMinutes,  bool taskDeadlineReminders,  bool weeklyCheckin,  bool monthlyReflection,  bool celebrations,  String? quietHoursStart,  String? quietHoursEnd,  int maxPerDay,  String osPermission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
return $default(_that.dailyQuote,_that.sessionReminder,_that.sessionReminderLeadMinutes,_that.taskDeadlineReminders,_that.weeklyCheckin,_that.monthlyReflection,_that.celebrations,_that.quietHoursStart,_that.quietHoursEnd,_that.maxPerDay,_that.osPermission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool dailyQuote,  bool sessionReminder,  int sessionReminderLeadMinutes,  bool taskDeadlineReminders,  bool weeklyCheckin,  bool monthlyReflection,  bool celebrations,  String? quietHoursStart,  String? quietHoursEnd,  int maxPerDay,  String osPermission)  $default,) {final _that = this;
switch (_that) {
case _NotificationPrefs():
return $default(_that.dailyQuote,_that.sessionReminder,_that.sessionReminderLeadMinutes,_that.taskDeadlineReminders,_that.weeklyCheckin,_that.monthlyReflection,_that.celebrations,_that.quietHoursStart,_that.quietHoursEnd,_that.maxPerDay,_that.osPermission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool dailyQuote,  bool sessionReminder,  int sessionReminderLeadMinutes,  bool taskDeadlineReminders,  bool weeklyCheckin,  bool monthlyReflection,  bool celebrations,  String? quietHoursStart,  String? quietHoursEnd,  int maxPerDay,  String osPermission)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
return $default(_that.dailyQuote,_that.sessionReminder,_that.sessionReminderLeadMinutes,_that.taskDeadlineReminders,_that.weeklyCheckin,_that.monthlyReflection,_that.celebrations,_that.quietHoursStart,_that.quietHoursEnd,_that.maxPerDay,_that.osPermission);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPrefs implements NotificationPrefs {
  const _NotificationPrefs({this.dailyQuote = true, this.sessionReminder = true, this.sessionReminderLeadMinutes = 10, this.taskDeadlineReminders = true, this.weeklyCheckin = true, this.monthlyReflection = true, this.celebrations = true, this.quietHoursStart, this.quietHoursEnd, this.maxPerDay = 4, this.osPermission = 'unknown'});
  factory _NotificationPrefs.fromJson(Map<String, dynamic> json) => _$NotificationPrefsFromJson(json);

@override@JsonKey() final  bool dailyQuote;
@override@JsonKey() final  bool sessionReminder;
@override@JsonKey() final  int sessionReminderLeadMinutes;
@override@JsonKey() final  bool taskDeadlineReminders;
@override@JsonKey() final  bool weeklyCheckin;
@override@JsonKey() final  bool monthlyReflection;
@override@JsonKey() final  bool celebrations;
/// Local "HH:mm"; null means no quiet hours.
@override final  String? quietHoursStart;
@override final  String? quietHoursEnd;
@override@JsonKey() final  int maxPerDay;
/// Last known OS permission state reported by the app: granted | denied | unknown.
@override@JsonKey() final  String osPermission;

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPrefsCopyWith<_NotificationPrefs> get copyWith => __$NotificationPrefsCopyWithImpl<_NotificationPrefs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPrefsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPrefs&&(identical(other.dailyQuote, dailyQuote) || other.dailyQuote == dailyQuote)&&(identical(other.sessionReminder, sessionReminder) || other.sessionReminder == sessionReminder)&&(identical(other.sessionReminderLeadMinutes, sessionReminderLeadMinutes) || other.sessionReminderLeadMinutes == sessionReminderLeadMinutes)&&(identical(other.taskDeadlineReminders, taskDeadlineReminders) || other.taskDeadlineReminders == taskDeadlineReminders)&&(identical(other.weeklyCheckin, weeklyCheckin) || other.weeklyCheckin == weeklyCheckin)&&(identical(other.monthlyReflection, monthlyReflection) || other.monthlyReflection == monthlyReflection)&&(identical(other.celebrations, celebrations) || other.celebrations == celebrations)&&(identical(other.quietHoursStart, quietHoursStart) || other.quietHoursStart == quietHoursStart)&&(identical(other.quietHoursEnd, quietHoursEnd) || other.quietHoursEnd == quietHoursEnd)&&(identical(other.maxPerDay, maxPerDay) || other.maxPerDay == maxPerDay)&&(identical(other.osPermission, osPermission) || other.osPermission == osPermission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dailyQuote,sessionReminder,sessionReminderLeadMinutes,taskDeadlineReminders,weeklyCheckin,monthlyReflection,celebrations,quietHoursStart,quietHoursEnd,maxPerDay,osPermission);
}

@override
String toString() {
    return 'NotificationPrefs(dailyQuote: $dailyQuote, sessionReminder: $sessionReminder, sessionReminderLeadMinutes: $sessionReminderLeadMinutes, taskDeadlineReminders: $taskDeadlineReminders, weeklyCheckin: $weeklyCheckin, monthlyReflection: $monthlyReflection, celebrations: $celebrations, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, maxPerDay: $maxPerDay, osPermission: $osPermission)';
}


}

/// @nodoc
abstract mixin class _$NotificationPrefsCopyWith<$Res> implements $NotificationPrefsCopyWith<$Res> {
  factory _$NotificationPrefsCopyWith(_NotificationPrefs value, $Res Function(_NotificationPrefs) _then) = __$NotificationPrefsCopyWithImpl;
@override @useResult
$Res call({
 bool dailyQuote, bool sessionReminder, int sessionReminderLeadMinutes, bool taskDeadlineReminders, bool weeklyCheckin, bool monthlyReflection, bool celebrations, String? quietHoursStart, String? quietHoursEnd, int maxPerDay, String osPermission
});




}
/// @nodoc
class __$NotificationPrefsCopyWithImpl<$Res>
    implements _$NotificationPrefsCopyWith<$Res> {
  __$NotificationPrefsCopyWithImpl(this._self, this._then);

  final _NotificationPrefs _self;
  final $Res Function(_NotificationPrefs) _then;

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyQuote = null,Object? sessionReminder = null,Object? sessionReminderLeadMinutes = null,Object? taskDeadlineReminders = null,Object? weeklyCheckin = null,Object? monthlyReflection = null,Object? celebrations = null,Object? quietHoursStart = freezed,Object? quietHoursEnd = freezed,Object? maxPerDay = null,Object? osPermission = null,}) {
  return _then(_NotificationPrefs(
dailyQuote: null == dailyQuote ? _self.dailyQuote : dailyQuote // ignore: cast_nullable_to_non_nullable
as bool,sessionReminder: null == sessionReminder ? _self.sessionReminder : sessionReminder // ignore: cast_nullable_to_non_nullable
as bool,sessionReminderLeadMinutes: null == sessionReminderLeadMinutes ? _self.sessionReminderLeadMinutes : sessionReminderLeadMinutes // ignore: cast_nullable_to_non_nullable
as int,taskDeadlineReminders: null == taskDeadlineReminders ? _self.taskDeadlineReminders : taskDeadlineReminders // ignore: cast_nullable_to_non_nullable
as bool,weeklyCheckin: null == weeklyCheckin ? _self.weeklyCheckin : weeklyCheckin // ignore: cast_nullable_to_non_nullable
as bool,monthlyReflection: null == monthlyReflection ? _self.monthlyReflection : monthlyReflection // ignore: cast_nullable_to_non_nullable
as bool,celebrations: null == celebrations ? _self.celebrations : celebrations // ignore: cast_nullable_to_non_nullable
as bool,quietHoursStart: freezed == quietHoursStart ? _self.quietHoursStart : quietHoursStart // ignore: cast_nullable_to_non_nullable
as String?,quietHoursEnd: freezed == quietHoursEnd ? _self.quietHoursEnd : quietHoursEnd // ignore: cast_nullable_to_non_nullable
as String?,maxPerDay: null == maxPerDay ? _self.maxPerDay : maxPerDay // ignore: cast_nullable_to_non_nullable
as int,osPermission: null == osPermission ? _self.osPermission : osPermission // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PrivacySettings {

 bool get leaderboardOptIn; bool get communityOptIn; String get communityVisibility; bool get shareLocationForOpportunities;
/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<PrivacySettings> get copyWith => _$PrivacySettingsCopyWithImpl<PrivacySettings>(this as PrivacySettings, _$identity);

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PrivacySettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacySettings&&(identical(other.leaderboardOptIn, _this.leaderboardOptIn) || other.leaderboardOptIn == _this.leaderboardOptIn)&&(identical(other.communityOptIn, _this.communityOptIn) || other.communityOptIn == _this.communityOptIn)&&(identical(other.communityVisibility, _this.communityVisibility) || other.communityVisibility == _this.communityVisibility)&&(identical(other.shareLocationForOpportunities, _this.shareLocationForOpportunities) || other.shareLocationForOpportunities == _this.shareLocationForOpportunities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PrivacySettings;
  return Object.hash(runtimeType,_this.leaderboardOptIn,_this.communityOptIn,_this.communityVisibility,_this.shareLocationForOpportunities);
}

@override
String toString() {
  final _this = this as PrivacySettings;
  return 'PrivacySettings(leaderboardOptIn: ${_this.leaderboardOptIn}, communityOptIn: ${_this.communityOptIn}, communityVisibility: ${_this.communityVisibility}, shareLocationForOpportunities: ${_this.shareLocationForOpportunities})';
}


}

/// @nodoc
abstract mixin class $PrivacySettingsCopyWith<$Res>  {
  factory $PrivacySettingsCopyWith(PrivacySettings value, $Res Function(PrivacySettings) _then) = _$PrivacySettingsCopyWithImpl;
@useResult
$Res call({
 bool leaderboardOptIn, bool communityOptIn, String communityVisibility, bool shareLocationForOpportunities
});




}
/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._self, this._then);

  final PrivacySettings _self;
  final $Res Function(PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaderboardOptIn = null,Object? communityOptIn = null,Object? communityVisibility = null,Object? shareLocationForOpportunities = null,}) {
  return _then(PrivacySettings(
leaderboardOptIn: null == leaderboardOptIn ? _self.leaderboardOptIn : leaderboardOptIn // ignore: cast_nullable_to_non_nullable
as bool,communityOptIn: null == communityOptIn ? _self.communityOptIn : communityOptIn // ignore: cast_nullable_to_non_nullable
as bool,communityVisibility: null == communityVisibility ? _self.communityVisibility : communityVisibility // ignore: cast_nullable_to_non_nullable
as String,shareLocationForOpportunities: null == shareLocationForOpportunities ? _self.shareLocationForOpportunities : shareLocationForOpportunities // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacySettings].
extension PrivacySettingsPatterns on PrivacySettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacySettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacySettings value)  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacySettings value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool leaderboardOptIn,  bool communityOptIn,  String communityVisibility,  bool shareLocationForOpportunities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.leaderboardOptIn,_that.communityOptIn,_that.communityVisibility,_that.shareLocationForOpportunities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool leaderboardOptIn,  bool communityOptIn,  String communityVisibility,  bool shareLocationForOpportunities)  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings():
return $default(_that.leaderboardOptIn,_that.communityOptIn,_that.communityVisibility,_that.shareLocationForOpportunities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool leaderboardOptIn,  bool communityOptIn,  String communityVisibility,  bool shareLocationForOpportunities)?  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.leaderboardOptIn,_that.communityOptIn,_that.communityVisibility,_that.shareLocationForOpportunities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacySettings implements PrivacySettings {
  const _PrivacySettings({this.leaderboardOptIn = false, this.communityOptIn = false, this.communityVisibility = 'private', this.shareLocationForOpportunities = false});
  factory _PrivacySettings.fromJson(Map<String, dynamic> json) => _$PrivacySettingsFromJson(json);

@override@JsonKey() final  bool leaderboardOptIn;
@override@JsonKey() final  bool communityOptIn;
@override@JsonKey() final  String communityVisibility;
@override@JsonKey() final  bool shareLocationForOpportunities;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacySettingsCopyWith<_PrivacySettings> get copyWith => __$PrivacySettingsCopyWithImpl<_PrivacySettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacySettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacySettings&&(identical(other.leaderboardOptIn, leaderboardOptIn) || other.leaderboardOptIn == leaderboardOptIn)&&(identical(other.communityOptIn, communityOptIn) || other.communityOptIn == communityOptIn)&&(identical(other.communityVisibility, communityVisibility) || other.communityVisibility == communityVisibility)&&(identical(other.shareLocationForOpportunities, shareLocationForOpportunities) || other.shareLocationForOpportunities == shareLocationForOpportunities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,leaderboardOptIn,communityOptIn,communityVisibility,shareLocationForOpportunities);
}

@override
String toString() {
    return 'PrivacySettings(leaderboardOptIn: $leaderboardOptIn, communityOptIn: $communityOptIn, communityVisibility: $communityVisibility, shareLocationForOpportunities: $shareLocationForOpportunities)';
}


}

/// @nodoc
abstract mixin class _$PrivacySettingsCopyWith<$Res> implements $PrivacySettingsCopyWith<$Res> {
  factory _$PrivacySettingsCopyWith(_PrivacySettings value, $Res Function(_PrivacySettings) _then) = __$PrivacySettingsCopyWithImpl;
@override @useResult
$Res call({
 bool leaderboardOptIn, bool communityOptIn, String communityVisibility, bool shareLocationForOpportunities
});




}
/// @nodoc
class __$PrivacySettingsCopyWithImpl<$Res>
    implements _$PrivacySettingsCopyWith<$Res> {
  __$PrivacySettingsCopyWithImpl(this._self, this._then);

  final _PrivacySettings _self;
  final $Res Function(_PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaderboardOptIn = null,Object? communityOptIn = null,Object? communityVisibility = null,Object? shareLocationForOpportunities = null,}) {
  return _then(_PrivacySettings(
leaderboardOptIn: null == leaderboardOptIn ? _self.leaderboardOptIn : leaderboardOptIn // ignore: cast_nullable_to_non_nullable
as bool,communityOptIn: null == communityOptIn ? _self.communityOptIn : communityOptIn // ignore: cast_nullable_to_non_nullable
as bool,communityVisibility: null == communityVisibility ? _self.communityVisibility : communityVisibility // ignore: cast_nullable_to_non_nullable
as String,shareLocationForOpportunities: null == shareLocationForOpportunities ? _self.shareLocationForOpportunities : shareLocationForOpportunities // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CalendarSettings {

 bool get connected; String? get googleEmail; bool get syncSessionsToGoogle; String? get targetCalendarId; String? get targetCalendarName; bool get respectBusyTimes;@JsonKey(unknownEnumValue: CalendarSyncState.idle) CalendarSyncState get syncState; DateTime? get lastSyncAt; String? get lastError;
/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarSettingsCopyWith<CalendarSettings> get copyWith => _$CalendarSettingsCopyWithImpl<CalendarSettings>(this as CalendarSettings, _$identity);

  /// Serializes this CalendarSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CalendarSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarSettings&&(identical(other.connected, _this.connected) || other.connected == _this.connected)&&(identical(other.googleEmail, _this.googleEmail) || other.googleEmail == _this.googleEmail)&&(identical(other.syncSessionsToGoogle, _this.syncSessionsToGoogle) || other.syncSessionsToGoogle == _this.syncSessionsToGoogle)&&(identical(other.targetCalendarId, _this.targetCalendarId) || other.targetCalendarId == _this.targetCalendarId)&&(identical(other.targetCalendarName, _this.targetCalendarName) || other.targetCalendarName == _this.targetCalendarName)&&(identical(other.respectBusyTimes, _this.respectBusyTimes) || other.respectBusyTimes == _this.respectBusyTimes)&&(identical(other.syncState, _this.syncState) || other.syncState == _this.syncState)&&(identical(other.lastSyncAt, _this.lastSyncAt) || other.lastSyncAt == _this.lastSyncAt)&&(identical(other.lastError, _this.lastError) || other.lastError == _this.lastError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CalendarSettings;
  return Object.hash(runtimeType,_this.connected,_this.googleEmail,_this.syncSessionsToGoogle,_this.targetCalendarId,_this.targetCalendarName,_this.respectBusyTimes,_this.syncState,_this.lastSyncAt,_this.lastError);
}

@override
String toString() {
  final _this = this as CalendarSettings;
  return 'CalendarSettings(connected: ${_this.connected}, googleEmail: ${_this.googleEmail}, syncSessionsToGoogle: ${_this.syncSessionsToGoogle}, targetCalendarId: ${_this.targetCalendarId}, targetCalendarName: ${_this.targetCalendarName}, respectBusyTimes: ${_this.respectBusyTimes}, syncState: ${_this.syncState}, lastSyncAt: ${_this.lastSyncAt}, lastError: ${_this.lastError})';
}


}

/// @nodoc
abstract mixin class $CalendarSettingsCopyWith<$Res>  {
  factory $CalendarSettingsCopyWith(CalendarSettings value, $Res Function(CalendarSettings) _then) = _$CalendarSettingsCopyWithImpl;
@useResult
$Res call({
 bool connected, String? googleEmail, bool syncSessionsToGoogle, String? targetCalendarId, String? targetCalendarName, bool respectBusyTimes,@JsonKey(unknownEnumValue: CalendarSyncState.idle) CalendarSyncState syncState, DateTime? lastSyncAt, String? lastError
});




}
/// @nodoc
class _$CalendarSettingsCopyWithImpl<$Res>
    implements $CalendarSettingsCopyWith<$Res> {
  _$CalendarSettingsCopyWithImpl(this._self, this._then);

  final CalendarSettings _self;
  final $Res Function(CalendarSettings) _then;

/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connected = null,Object? googleEmail = freezed,Object? syncSessionsToGoogle = null,Object? targetCalendarId = freezed,Object? targetCalendarName = freezed,Object? respectBusyTimes = null,Object? syncState = null,Object? lastSyncAt = freezed,Object? lastError = freezed,}) {
  return _then(CalendarSettings(
connected: null == connected ? _self.connected : connected // ignore: cast_nullable_to_non_nullable
as bool,googleEmail: freezed == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String?,syncSessionsToGoogle: null == syncSessionsToGoogle ? _self.syncSessionsToGoogle : syncSessionsToGoogle // ignore: cast_nullable_to_non_nullable
as bool,targetCalendarId: freezed == targetCalendarId ? _self.targetCalendarId : targetCalendarId // ignore: cast_nullable_to_non_nullable
as String?,targetCalendarName: freezed == targetCalendarName ? _self.targetCalendarName : targetCalendarName // ignore: cast_nullable_to_non_nullable
as String?,respectBusyTimes: null == respectBusyTimes ? _self.respectBusyTimes : respectBusyTimes // ignore: cast_nullable_to_non_nullable
as bool,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as CalendarSyncState,lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarSettings].
extension CalendarSettingsPatterns on CalendarSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarSettings value)  $default,){
final _that = this;
switch (_that) {
case _CalendarSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarSettings value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool connected,  String? googleEmail,  bool syncSessionsToGoogle,  String? targetCalendarId,  String? targetCalendarName,  bool respectBusyTimes, @JsonKey(unknownEnumValue: CalendarSyncState.idle)  CalendarSyncState syncState,  DateTime? lastSyncAt,  String? lastError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
return $default(_that.connected,_that.googleEmail,_that.syncSessionsToGoogle,_that.targetCalendarId,_that.targetCalendarName,_that.respectBusyTimes,_that.syncState,_that.lastSyncAt,_that.lastError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool connected,  String? googleEmail,  bool syncSessionsToGoogle,  String? targetCalendarId,  String? targetCalendarName,  bool respectBusyTimes, @JsonKey(unknownEnumValue: CalendarSyncState.idle)  CalendarSyncState syncState,  DateTime? lastSyncAt,  String? lastError)  $default,) {final _that = this;
switch (_that) {
case _CalendarSettings():
return $default(_that.connected,_that.googleEmail,_that.syncSessionsToGoogle,_that.targetCalendarId,_that.targetCalendarName,_that.respectBusyTimes,_that.syncState,_that.lastSyncAt,_that.lastError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool connected,  String? googleEmail,  bool syncSessionsToGoogle,  String? targetCalendarId,  String? targetCalendarName,  bool respectBusyTimes, @JsonKey(unknownEnumValue: CalendarSyncState.idle)  CalendarSyncState syncState,  DateTime? lastSyncAt,  String? lastError)?  $default,) {final _that = this;
switch (_that) {
case _CalendarSettings() when $default != null:
return $default(_that.connected,_that.googleEmail,_that.syncSessionsToGoogle,_that.targetCalendarId,_that.targetCalendarName,_that.respectBusyTimes,_that.syncState,_that.lastSyncAt,_that.lastError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarSettings implements CalendarSettings {
  const _CalendarSettings({this.connected = false, this.googleEmail, this.syncSessionsToGoogle = true, this.targetCalendarId, this.targetCalendarName, this.respectBusyTimes = true, @JsonKey(unknownEnumValue: CalendarSyncState.idle) this.syncState = CalendarSyncState.disconnected, this.lastSyncAt, this.lastError});
  factory _CalendarSettings.fromJson(Map<String, dynamic> json) => _$CalendarSettingsFromJson(json);

@override@JsonKey() final  bool connected;
@override final  String? googleEmail;
@override@JsonKey() final  bool syncSessionsToGoogle;
@override final  String? targetCalendarId;
@override final  String? targetCalendarName;
@override@JsonKey() final  bool respectBusyTimes;
@override@JsonKey(unknownEnumValue: CalendarSyncState.idle) final  CalendarSyncState syncState;
@override final  DateTime? lastSyncAt;
@override final  String? lastError;

/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarSettingsCopyWith<_CalendarSettings> get copyWith => __$CalendarSettingsCopyWithImpl<_CalendarSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarSettings&&(identical(other.connected, connected) || other.connected == connected)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.syncSessionsToGoogle, syncSessionsToGoogle) || other.syncSessionsToGoogle == syncSessionsToGoogle)&&(identical(other.targetCalendarId, targetCalendarId) || other.targetCalendarId == targetCalendarId)&&(identical(other.targetCalendarName, targetCalendarName) || other.targetCalendarName == targetCalendarName)&&(identical(other.respectBusyTimes, respectBusyTimes) || other.respectBusyTimes == respectBusyTimes)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,connected,googleEmail,syncSessionsToGoogle,targetCalendarId,targetCalendarName,respectBusyTimes,syncState,lastSyncAt,lastError);
}

@override
String toString() {
    return 'CalendarSettings(connected: $connected, googleEmail: $googleEmail, syncSessionsToGoogle: $syncSessionsToGoogle, targetCalendarId: $targetCalendarId, targetCalendarName: $targetCalendarName, respectBusyTimes: $respectBusyTimes, syncState: $syncState, lastSyncAt: $lastSyncAt, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class _$CalendarSettingsCopyWith<$Res> implements $CalendarSettingsCopyWith<$Res> {
  factory _$CalendarSettingsCopyWith(_CalendarSettings value, $Res Function(_CalendarSettings) _then) = __$CalendarSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool connected, String? googleEmail, bool syncSessionsToGoogle, String? targetCalendarId, String? targetCalendarName, bool respectBusyTimes,@JsonKey(unknownEnumValue: CalendarSyncState.idle) CalendarSyncState syncState, DateTime? lastSyncAt, String? lastError
});




}
/// @nodoc
class __$CalendarSettingsCopyWithImpl<$Res>
    implements _$CalendarSettingsCopyWith<$Res> {
  __$CalendarSettingsCopyWithImpl(this._self, this._then);

  final _CalendarSettings _self;
  final $Res Function(_CalendarSettings) _then;

/// Create a copy of CalendarSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connected = null,Object? googleEmail = freezed,Object? syncSessionsToGoogle = null,Object? targetCalendarId = freezed,Object? targetCalendarName = freezed,Object? respectBusyTimes = null,Object? syncState = null,Object? lastSyncAt = freezed,Object? lastError = freezed,}) {
  return _then(_CalendarSettings(
connected: null == connected ? _self.connected : connected // ignore: cast_nullable_to_non_nullable
as bool,googleEmail: freezed == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String?,syncSessionsToGoogle: null == syncSessionsToGoogle ? _self.syncSessionsToGoogle : syncSessionsToGoogle // ignore: cast_nullable_to_non_nullable
as bool,targetCalendarId: freezed == targetCalendarId ? _self.targetCalendarId : targetCalendarId // ignore: cast_nullable_to_non_nullable
as String?,targetCalendarName: freezed == targetCalendarName ? _self.targetCalendarName : targetCalendarName // ignore: cast_nullable_to_non_nullable
as String?,respectBusyTimes: null == respectBusyTimes ? _self.respectBusyTimes : respectBusyTimes // ignore: cast_nullable_to_non_nullable
as bool,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as CalendarSyncState,lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppFlags {

/// `all_premium` (launch default) or `enforced`.
 String get entitlementsMode; bool get communityEnabled; String? get supportEmail; String? get termsUrl; String? get privacyUrl;
/// Create a copy of AppFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFlagsCopyWith<AppFlags> get copyWith => _$AppFlagsCopyWithImpl<AppFlags>(this as AppFlags, _$identity);

  /// Serializes this AppFlags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppFlags;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFlags&&(identical(other.entitlementsMode, _this.entitlementsMode) || other.entitlementsMode == _this.entitlementsMode)&&(identical(other.communityEnabled, _this.communityEnabled) || other.communityEnabled == _this.communityEnabled)&&(identical(other.supportEmail, _this.supportEmail) || other.supportEmail == _this.supportEmail)&&(identical(other.termsUrl, _this.termsUrl) || other.termsUrl == _this.termsUrl)&&(identical(other.privacyUrl, _this.privacyUrl) || other.privacyUrl == _this.privacyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppFlags;
  return Object.hash(runtimeType,_this.entitlementsMode,_this.communityEnabled,_this.supportEmail,_this.termsUrl,_this.privacyUrl);
}

@override
String toString() {
  final _this = this as AppFlags;
  return 'AppFlags(entitlementsMode: ${_this.entitlementsMode}, communityEnabled: ${_this.communityEnabled}, supportEmail: ${_this.supportEmail}, termsUrl: ${_this.termsUrl}, privacyUrl: ${_this.privacyUrl})';
}


}

/// @nodoc
abstract mixin class $AppFlagsCopyWith<$Res>  {
  factory $AppFlagsCopyWith(AppFlags value, $Res Function(AppFlags) _then) = _$AppFlagsCopyWithImpl;
@useResult
$Res call({
 String entitlementsMode, bool communityEnabled, String? supportEmail, String? termsUrl, String? privacyUrl
});




}
/// @nodoc
class _$AppFlagsCopyWithImpl<$Res>
    implements $AppFlagsCopyWith<$Res> {
  _$AppFlagsCopyWithImpl(this._self, this._then);

  final AppFlags _self;
  final $Res Function(AppFlags) _then;

/// Create a copy of AppFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entitlementsMode = null,Object? communityEnabled = null,Object? supportEmail = freezed,Object? termsUrl = freezed,Object? privacyUrl = freezed,}) {
  return _then(AppFlags(
entitlementsMode: null == entitlementsMode ? _self.entitlementsMode : entitlementsMode // ignore: cast_nullable_to_non_nullable
as String,communityEnabled: null == communityEnabled ? _self.communityEnabled : communityEnabled // ignore: cast_nullable_to_non_nullable
as bool,supportEmail: freezed == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String?,termsUrl: freezed == termsUrl ? _self.termsUrl : termsUrl // ignore: cast_nullable_to_non_nullable
as String?,privacyUrl: freezed == privacyUrl ? _self.privacyUrl : privacyUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppFlags].
extension AppFlagsPatterns on AppFlags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppFlags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppFlags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppFlags value)  $default,){
final _that = this;
switch (_that) {
case _AppFlags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppFlags value)?  $default,){
final _that = this;
switch (_that) {
case _AppFlags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String entitlementsMode,  bool communityEnabled,  String? supportEmail,  String? termsUrl,  String? privacyUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppFlags() when $default != null:
return $default(_that.entitlementsMode,_that.communityEnabled,_that.supportEmail,_that.termsUrl,_that.privacyUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String entitlementsMode,  bool communityEnabled,  String? supportEmail,  String? termsUrl,  String? privacyUrl)  $default,) {final _that = this;
switch (_that) {
case _AppFlags():
return $default(_that.entitlementsMode,_that.communityEnabled,_that.supportEmail,_that.termsUrl,_that.privacyUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String entitlementsMode,  bool communityEnabled,  String? supportEmail,  String? termsUrl,  String? privacyUrl)?  $default,) {final _that = this;
switch (_that) {
case _AppFlags() when $default != null:
return $default(_that.entitlementsMode,_that.communityEnabled,_that.supportEmail,_that.termsUrl,_that.privacyUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppFlags extends AppFlags {
  const _AppFlags({this.entitlementsMode = 'all_premium', this.communityEnabled = false, this.supportEmail, this.termsUrl, this.privacyUrl}): super._();
  factory _AppFlags.fromJson(Map<String, dynamic> json) => _$AppFlagsFromJson(json);

/// `all_premium` (launch default) or `enforced`.
@override@JsonKey() final  String entitlementsMode;
@override@JsonKey() final  bool communityEnabled;
@override final  String? supportEmail;
@override final  String? termsUrl;
@override final  String? privacyUrl;

/// Create a copy of AppFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppFlagsCopyWith<_AppFlags> get copyWith => __$AppFlagsCopyWithImpl<_AppFlags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppFlagsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppFlags&&(identical(other.entitlementsMode, entitlementsMode) || other.entitlementsMode == entitlementsMode)&&(identical(other.communityEnabled, communityEnabled) || other.communityEnabled == communityEnabled)&&(identical(other.supportEmail, supportEmail) || other.supportEmail == supportEmail)&&(identical(other.termsUrl, termsUrl) || other.termsUrl == termsUrl)&&(identical(other.privacyUrl, privacyUrl) || other.privacyUrl == privacyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,entitlementsMode,communityEnabled,supportEmail,termsUrl,privacyUrl);
}

@override
String toString() {
    return 'AppFlags(entitlementsMode: $entitlementsMode, communityEnabled: $communityEnabled, supportEmail: $supportEmail, termsUrl: $termsUrl, privacyUrl: $privacyUrl)';
}


}

/// @nodoc
abstract mixin class _$AppFlagsCopyWith<$Res> implements $AppFlagsCopyWith<$Res> {
  factory _$AppFlagsCopyWith(_AppFlags value, $Res Function(_AppFlags) _then) = __$AppFlagsCopyWithImpl;
@override @useResult
$Res call({
 String entitlementsMode, bool communityEnabled, String? supportEmail, String? termsUrl, String? privacyUrl
});




}
/// @nodoc
class __$AppFlagsCopyWithImpl<$Res>
    implements _$AppFlagsCopyWith<$Res> {
  __$AppFlagsCopyWithImpl(this._self, this._then);

  final _AppFlags _self;
  final $Res Function(_AppFlags) _then;

/// Create a copy of AppFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entitlementsMode = null,Object? communityEnabled = null,Object? supportEmail = freezed,Object? termsUrl = freezed,Object? privacyUrl = freezed,}) {
  return _then(_AppFlags(
entitlementsMode: null == entitlementsMode ? _self.entitlementsMode : entitlementsMode // ignore: cast_nullable_to_non_nullable
as String,communityEnabled: null == communityEnabled ? _self.communityEnabled : communityEnabled // ignore: cast_nullable_to_non_nullable
as bool,supportEmail: freezed == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String?,termsUrl: freezed == termsUrl ? _self.termsUrl : termsUrl // ignore: cast_nullable_to_non_nullable
as String?,privacyUrl: freezed == privacyUrl ? _self.privacyUrl : privacyUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Entitlements {

 String get plan; List<String> get features; String? get source; DateTime? get trialEndsAt; DateTime? get renewsAt; DateTime? get expiresAt; bool get willRenew; List<EntitlementGrant> get grants; bool get adsEnabled; DowngradeNotice? get downgradeNotice; String? get mode; String? get store; DateTime? get updatedAt;
/// Create a copy of Entitlements
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntitlementsCopyWith<Entitlements> get copyWith => _$EntitlementsCopyWithImpl<Entitlements>(this as Entitlements, _$identity);

  /// Serializes this Entitlements to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Entitlements;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Entitlements&&(identical(other.plan, _this.plan) || other.plan == _this.plan)&&const DeepCollectionEquality().equals(other.features, _this.features)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.trialEndsAt, _this.trialEndsAt) || other.trialEndsAt == _this.trialEndsAt)&&(identical(other.renewsAt, _this.renewsAt) || other.renewsAt == _this.renewsAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.willRenew, _this.willRenew) || other.willRenew == _this.willRenew)&&const DeepCollectionEquality().equals(other.grants, _this.grants)&&(identical(other.adsEnabled, _this.adsEnabled) || other.adsEnabled == _this.adsEnabled)&&(identical(other.downgradeNotice, _this.downgradeNotice) || other.downgradeNotice == _this.downgradeNotice)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.store, _this.store) || other.store == _this.store)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Entitlements;
  return Object.hash(runtimeType,_this.plan,const DeepCollectionEquality().hash(_this.features),_this.source,_this.trialEndsAt,_this.renewsAt,_this.expiresAt,_this.willRenew,const DeepCollectionEquality().hash(_this.grants),_this.adsEnabled,_this.downgradeNotice,_this.mode,_this.store,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Entitlements;
  return 'Entitlements(plan: ${_this.plan}, features: ${_this.features}, source: ${_this.source}, trialEndsAt: ${_this.trialEndsAt}, renewsAt: ${_this.renewsAt}, expiresAt: ${_this.expiresAt}, willRenew: ${_this.willRenew}, grants: ${_this.grants}, adsEnabled: ${_this.adsEnabled}, downgradeNotice: ${_this.downgradeNotice}, mode: ${_this.mode}, store: ${_this.store}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $EntitlementsCopyWith<$Res>  {
  factory $EntitlementsCopyWith(Entitlements value, $Res Function(Entitlements) _then) = _$EntitlementsCopyWithImpl;
@useResult
$Res call({
 String plan, List<String> features, String? source, DateTime? trialEndsAt, DateTime? renewsAt, DateTime? expiresAt, bool willRenew, List<EntitlementGrant> grants, bool adsEnabled, DowngradeNotice? downgradeNotice, String? mode, String? store, DateTime? updatedAt
});


$DowngradeNoticeCopyWith<$Res>? get downgradeNotice;

}
/// @nodoc
class _$EntitlementsCopyWithImpl<$Res>
    implements $EntitlementsCopyWith<$Res> {
  _$EntitlementsCopyWithImpl(this._self, this._then);

  final Entitlements _self;
  final $Res Function(Entitlements) _then;

/// Create a copy of Entitlements
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plan = null,Object? features = null,Object? source = freezed,Object? trialEndsAt = freezed,Object? renewsAt = freezed,Object? expiresAt = freezed,Object? willRenew = null,Object? grants = null,Object? adsEnabled = null,Object? downgradeNotice = freezed,Object? mode = freezed,Object? store = freezed,Object? updatedAt = freezed,}) {
  return _then(Entitlements(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,renewsAt: freezed == renewsAt ? _self.renewsAt : renewsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,willRenew: null == willRenew ? _self.willRenew : willRenew // ignore: cast_nullable_to_non_nullable
as bool,grants: null == grants ? _self.grants : grants // ignore: cast_nullable_to_non_nullable
as List<EntitlementGrant>,adsEnabled: null == adsEnabled ? _self.adsEnabled : adsEnabled // ignore: cast_nullable_to_non_nullable
as bool,downgradeNotice: freezed == downgradeNotice ? _self.downgradeNotice : downgradeNotice // ignore: cast_nullable_to_non_nullable
as DowngradeNotice?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Entitlements
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DowngradeNoticeCopyWith<$Res>? get downgradeNotice {
    if (_self.downgradeNotice == null) {
    return null;
  }

  return $DowngradeNoticeCopyWith<$Res>(_self.downgradeNotice!, (value) {
    return _then(_self.copyWith(downgradeNotice: value));
  });
}
}


/// Adds pattern-matching-related methods to [Entitlements].
extension EntitlementsPatterns on Entitlements {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Entitlements value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Entitlements() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Entitlements value)  $default,){
final _that = this;
switch (_that) {
case _Entitlements():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Entitlements value)?  $default,){
final _that = this;
switch (_that) {
case _Entitlements() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String plan,  List<String> features,  String? source,  DateTime? trialEndsAt,  DateTime? renewsAt,  DateTime? expiresAt,  bool willRenew,  List<EntitlementGrant> grants,  bool adsEnabled,  DowngradeNotice? downgradeNotice,  String? mode,  String? store,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Entitlements() when $default != null:
return $default(_that.plan,_that.features,_that.source,_that.trialEndsAt,_that.renewsAt,_that.expiresAt,_that.willRenew,_that.grants,_that.adsEnabled,_that.downgradeNotice,_that.mode,_that.store,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String plan,  List<String> features,  String? source,  DateTime? trialEndsAt,  DateTime? renewsAt,  DateTime? expiresAt,  bool willRenew,  List<EntitlementGrant> grants,  bool adsEnabled,  DowngradeNotice? downgradeNotice,  String? mode,  String? store,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Entitlements():
return $default(_that.plan,_that.features,_that.source,_that.trialEndsAt,_that.renewsAt,_that.expiresAt,_that.willRenew,_that.grants,_that.adsEnabled,_that.downgradeNotice,_that.mode,_that.store,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String plan,  List<String> features,  String? source,  DateTime? trialEndsAt,  DateTime? renewsAt,  DateTime? expiresAt,  bool willRenew,  List<EntitlementGrant> grants,  bool adsEnabled,  DowngradeNotice? downgradeNotice,  String? mode,  String? store,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Entitlements() when $default != null:
return $default(_that.plan,_that.features,_that.source,_that.trialEndsAt,_that.renewsAt,_that.expiresAt,_that.willRenew,_that.grants,_that.adsEnabled,_that.downgradeNotice,_that.mode,_that.store,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Entitlements extends Entitlements {
  const _Entitlements({this.plan = 'basic',  List<String> features = const <String>[], this.source, this.trialEndsAt, this.renewsAt, this.expiresAt, this.willRenew = false,  List<EntitlementGrant> grants = const <EntitlementGrant>[], this.adsEnabled = false, this.downgradeNotice, this.mode, this.store, this.updatedAt}): _features = features,_grants = grants,super._();
  factory _Entitlements.fromJson(Map<String, dynamic> json) => _$EntitlementsFromJson(json);

@override@JsonKey() final  String plan;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override final  String? source;
@override final  DateTime? trialEndsAt;
@override final  DateTime? renewsAt;
@override final  DateTime? expiresAt;
@override@JsonKey() final  bool willRenew;
 final  List<EntitlementGrant> _grants;
@override@JsonKey() List<EntitlementGrant> get grants {
  if (_grants is EqualUnmodifiableListView) return _grants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_grants);
}

@override@JsonKey() final  bool adsEnabled;
@override final  DowngradeNotice? downgradeNotice;
@override final  String? mode;
@override final  String? store;
@override final  DateTime? updatedAt;

/// Create a copy of Entitlements
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntitlementsCopyWith<_Entitlements> get copyWith => __$EntitlementsCopyWithImpl<_Entitlements>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntitlementsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Entitlements&&(identical(other.plan, plan) || other.plan == plan)&&const DeepCollectionEquality().equals(other.features, _features)&&(identical(other.source, source) || other.source == source)&&(identical(other.trialEndsAt, trialEndsAt) || other.trialEndsAt == trialEndsAt)&&(identical(other.renewsAt, renewsAt) || other.renewsAt == renewsAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.willRenew, willRenew) || other.willRenew == willRenew)&&const DeepCollectionEquality().equals(other.grants, _grants)&&(identical(other.adsEnabled, adsEnabled) || other.adsEnabled == adsEnabled)&&(identical(other.downgradeNotice, downgradeNotice) || other.downgradeNotice == downgradeNotice)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.store, store) || other.store == store)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,plan,const DeepCollectionEquality().hash(_features),source,trialEndsAt,renewsAt,expiresAt,willRenew,const DeepCollectionEquality().hash(_grants),adsEnabled,downgradeNotice,mode,store,updatedAt);
}

@override
String toString() {
    return 'Entitlements(plan: $plan, features: $features, source: $source, trialEndsAt: $trialEndsAt, renewsAt: $renewsAt, expiresAt: $expiresAt, willRenew: $willRenew, grants: $grants, adsEnabled: $adsEnabled, downgradeNotice: $downgradeNotice, mode: $mode, store: $store, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EntitlementsCopyWith<$Res> implements $EntitlementsCopyWith<$Res> {
  factory _$EntitlementsCopyWith(_Entitlements value, $Res Function(_Entitlements) _then) = __$EntitlementsCopyWithImpl;
@override @useResult
$Res call({
 String plan, List<String> features, String? source, DateTime? trialEndsAt, DateTime? renewsAt, DateTime? expiresAt, bool willRenew, List<EntitlementGrant> grants, bool adsEnabled, DowngradeNotice? downgradeNotice, String? mode, String? store, DateTime? updatedAt
});


@override $DowngradeNoticeCopyWith<$Res>? get downgradeNotice;

}
/// @nodoc
class __$EntitlementsCopyWithImpl<$Res>
    implements _$EntitlementsCopyWith<$Res> {
  __$EntitlementsCopyWithImpl(this._self, this._then);

  final _Entitlements _self;
  final $Res Function(_Entitlements) _then;

/// Create a copy of Entitlements
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plan = null,Object? features = null,Object? source = freezed,Object? trialEndsAt = freezed,Object? renewsAt = freezed,Object? expiresAt = freezed,Object? willRenew = null,Object? grants = null,Object? adsEnabled = null,Object? downgradeNotice = freezed,Object? mode = freezed,Object? store = freezed,Object? updatedAt = freezed,}) {
  return _then(_Entitlements(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,renewsAt: freezed == renewsAt ? _self.renewsAt : renewsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,willRenew: null == willRenew ? _self.willRenew : willRenew // ignore: cast_nullable_to_non_nullable
as bool,grants: null == grants ? _self._grants : grants // ignore: cast_nullable_to_non_nullable
as List<EntitlementGrant>,adsEnabled: null == adsEnabled ? _self.adsEnabled : adsEnabled // ignore: cast_nullable_to_non_nullable
as bool,downgradeNotice: freezed == downgradeNotice ? _self.downgradeNotice : downgradeNotice // ignore: cast_nullable_to_non_nullable
as DowngradeNotice?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Entitlements
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DowngradeNoticeCopyWith<$Res>? get downgradeNotice {
    if (_self.downgradeNotice == null) {
    return null;
  }

  return $DowngradeNoticeCopyWith<$Res>(_self.downgradeNotice!, (value) {
    return _then(_self.copyWith(downgradeNotice: value));
  });
}
}


/// @nodoc
mixin _$EntitlementGrant {

 String get planKey; String? get source; DateTime? get startsAt; DateTime? get endsAt; String? get reason;
/// Create a copy of EntitlementGrant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntitlementGrantCopyWith<EntitlementGrant> get copyWith => _$EntitlementGrantCopyWithImpl<EntitlementGrant>(this as EntitlementGrant, _$identity);

  /// Serializes this EntitlementGrant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EntitlementGrant;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntitlementGrant&&(identical(other.planKey, _this.planKey) || other.planKey == _this.planKey)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EntitlementGrant;
  return Object.hash(runtimeType,_this.planKey,_this.source,_this.startsAt,_this.endsAt,_this.reason);
}

@override
String toString() {
  final _this = this as EntitlementGrant;
  return 'EntitlementGrant(planKey: ${_this.planKey}, source: ${_this.source}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $EntitlementGrantCopyWith<$Res>  {
  factory $EntitlementGrantCopyWith(EntitlementGrant value, $Res Function(EntitlementGrant) _then) = _$EntitlementGrantCopyWithImpl;
@useResult
$Res call({
 String planKey, String? source, DateTime? startsAt, DateTime? endsAt, String? reason
});




}
/// @nodoc
class _$EntitlementGrantCopyWithImpl<$Res>
    implements $EntitlementGrantCopyWith<$Res> {
  _$EntitlementGrantCopyWithImpl(this._self, this._then);

  final EntitlementGrant _self;
  final $Res Function(EntitlementGrant) _then;

/// Create a copy of EntitlementGrant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planKey = null,Object? source = freezed,Object? startsAt = freezed,Object? endsAt = freezed,Object? reason = freezed,}) {
  return _then(EntitlementGrant(
planKey: null == planKey ? _self.planKey : planKey // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EntitlementGrant].
extension EntitlementGrantPatterns on EntitlementGrant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntitlementGrant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntitlementGrant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntitlementGrant value)  $default,){
final _that = this;
switch (_that) {
case _EntitlementGrant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntitlementGrant value)?  $default,){
final _that = this;
switch (_that) {
case _EntitlementGrant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String planKey,  String? source,  DateTime? startsAt,  DateTime? endsAt,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntitlementGrant() when $default != null:
return $default(_that.planKey,_that.source,_that.startsAt,_that.endsAt,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String planKey,  String? source,  DateTime? startsAt,  DateTime? endsAt,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _EntitlementGrant():
return $default(_that.planKey,_that.source,_that.startsAt,_that.endsAt,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String planKey,  String? source,  DateTime? startsAt,  DateTime? endsAt,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _EntitlementGrant() when $default != null:
return $default(_that.planKey,_that.source,_that.startsAt,_that.endsAt,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntitlementGrant implements EntitlementGrant {
  const _EntitlementGrant({required this.planKey, this.source, this.startsAt, this.endsAt, this.reason});
  factory _EntitlementGrant.fromJson(Map<String, dynamic> json) => _$EntitlementGrantFromJson(json);

@override final  String planKey;
@override final  String? source;
@override final  DateTime? startsAt;
@override final  DateTime? endsAt;
@override final  String? reason;

/// Create a copy of EntitlementGrant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntitlementGrantCopyWith<_EntitlementGrant> get copyWith => __$EntitlementGrantCopyWithImpl<_EntitlementGrant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntitlementGrantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntitlementGrant&&(identical(other.planKey, planKey) || other.planKey == planKey)&&(identical(other.source, source) || other.source == source)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,planKey,source,startsAt,endsAt,reason);
}

@override
String toString() {
    return 'EntitlementGrant(planKey: $planKey, source: $source, startsAt: $startsAt, endsAt: $endsAt, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$EntitlementGrantCopyWith<$Res> implements $EntitlementGrantCopyWith<$Res> {
  factory _$EntitlementGrantCopyWith(_EntitlementGrant value, $Res Function(_EntitlementGrant) _then) = __$EntitlementGrantCopyWithImpl;
@override @useResult
$Res call({
 String planKey, String? source, DateTime? startsAt, DateTime? endsAt, String? reason
});




}
/// @nodoc
class __$EntitlementGrantCopyWithImpl<$Res>
    implements _$EntitlementGrantCopyWith<$Res> {
  __$EntitlementGrantCopyWithImpl(this._self, this._then);

  final _EntitlementGrant _self;
  final $Res Function(_EntitlementGrant) _then;

/// Create a copy of EntitlementGrant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planKey = null,Object? source = freezed,Object? startsAt = freezed,Object? endsAt = freezed,Object? reason = freezed,}) {
  return _then(_EntitlementGrant(
planKey: null == planKey ? _self.planKey : planKey // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DowngradeNotice {

 String? get message; String? get fromPlan; String? get toPlan; List<String> get lockedFeatures; DateTime? get changedAt; bool get dismissed;
/// Create a copy of DowngradeNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DowngradeNoticeCopyWith<DowngradeNotice> get copyWith => _$DowngradeNoticeCopyWithImpl<DowngradeNotice>(this as DowngradeNotice, _$identity);

  /// Serializes this DowngradeNotice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DowngradeNotice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DowngradeNotice&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.fromPlan, _this.fromPlan) || other.fromPlan == _this.fromPlan)&&(identical(other.toPlan, _this.toPlan) || other.toPlan == _this.toPlan)&&const DeepCollectionEquality().equals(other.lockedFeatures, _this.lockedFeatures)&&(identical(other.changedAt, _this.changedAt) || other.changedAt == _this.changedAt)&&(identical(other.dismissed, _this.dismissed) || other.dismissed == _this.dismissed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DowngradeNotice;
  return Object.hash(runtimeType,_this.message,_this.fromPlan,_this.toPlan,const DeepCollectionEquality().hash(_this.lockedFeatures),_this.changedAt,_this.dismissed);
}

@override
String toString() {
  final _this = this as DowngradeNotice;
  return 'DowngradeNotice(message: ${_this.message}, fromPlan: ${_this.fromPlan}, toPlan: ${_this.toPlan}, lockedFeatures: ${_this.lockedFeatures}, changedAt: ${_this.changedAt}, dismissed: ${_this.dismissed})';
}


}

/// @nodoc
abstract mixin class $DowngradeNoticeCopyWith<$Res>  {
  factory $DowngradeNoticeCopyWith(DowngradeNotice value, $Res Function(DowngradeNotice) _then) = _$DowngradeNoticeCopyWithImpl;
@useResult
$Res call({
 String? message, String? fromPlan, String? toPlan, List<String> lockedFeatures, DateTime? changedAt, bool dismissed
});




}
/// @nodoc
class _$DowngradeNoticeCopyWithImpl<$Res>
    implements $DowngradeNoticeCopyWith<$Res> {
  _$DowngradeNoticeCopyWithImpl(this._self, this._then);

  final DowngradeNotice _self;
  final $Res Function(DowngradeNotice) _then;

/// Create a copy of DowngradeNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? fromPlan = freezed,Object? toPlan = freezed,Object? lockedFeatures = null,Object? changedAt = freezed,Object? dismissed = null,}) {
  return _then(DowngradeNotice(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromPlan: freezed == fromPlan ? _self.fromPlan : fromPlan // ignore: cast_nullable_to_non_nullable
as String?,toPlan: freezed == toPlan ? _self.toPlan : toPlan // ignore: cast_nullable_to_non_nullable
as String?,lockedFeatures: null == lockedFeatures ? _self.lockedFeatures : lockedFeatures // ignore: cast_nullable_to_non_nullable
as List<String>,changedAt: freezed == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dismissed: null == dismissed ? _self.dismissed : dismissed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DowngradeNotice].
extension DowngradeNoticePatterns on DowngradeNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DowngradeNotice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DowngradeNotice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DowngradeNotice value)  $default,){
final _that = this;
switch (_that) {
case _DowngradeNotice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DowngradeNotice value)?  $default,){
final _that = this;
switch (_that) {
case _DowngradeNotice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  String? fromPlan,  String? toPlan,  List<String> lockedFeatures,  DateTime? changedAt,  bool dismissed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DowngradeNotice() when $default != null:
return $default(_that.message,_that.fromPlan,_that.toPlan,_that.lockedFeatures,_that.changedAt,_that.dismissed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  String? fromPlan,  String? toPlan,  List<String> lockedFeatures,  DateTime? changedAt,  bool dismissed)  $default,) {final _that = this;
switch (_that) {
case _DowngradeNotice():
return $default(_that.message,_that.fromPlan,_that.toPlan,_that.lockedFeatures,_that.changedAt,_that.dismissed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  String? fromPlan,  String? toPlan,  List<String> lockedFeatures,  DateTime? changedAt,  bool dismissed)?  $default,) {final _that = this;
switch (_that) {
case _DowngradeNotice() when $default != null:
return $default(_that.message,_that.fromPlan,_that.toPlan,_that.lockedFeatures,_that.changedAt,_that.dismissed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DowngradeNotice implements DowngradeNotice {
  const _DowngradeNotice({this.message, this.fromPlan, this.toPlan,  List<String> lockedFeatures = const <String>[], this.changedAt, this.dismissed = false}): _lockedFeatures = lockedFeatures;
  factory _DowngradeNotice.fromJson(Map<String, dynamic> json) => _$DowngradeNoticeFromJson(json);

@override final  String? message;
@override final  String? fromPlan;
@override final  String? toPlan;
 final  List<String> _lockedFeatures;
@override@JsonKey() List<String> get lockedFeatures {
  if (_lockedFeatures is EqualUnmodifiableListView) return _lockedFeatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lockedFeatures);
}

@override final  DateTime? changedAt;
@override@JsonKey() final  bool dismissed;

/// Create a copy of DowngradeNotice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DowngradeNoticeCopyWith<_DowngradeNotice> get copyWith => __$DowngradeNoticeCopyWithImpl<_DowngradeNotice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DowngradeNoticeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DowngradeNotice&&(identical(other.message, message) || other.message == message)&&(identical(other.fromPlan, fromPlan) || other.fromPlan == fromPlan)&&(identical(other.toPlan, toPlan) || other.toPlan == toPlan)&&const DeepCollectionEquality().equals(other.lockedFeatures, _lockedFeatures)&&(identical(other.changedAt, changedAt) || other.changedAt == changedAt)&&(identical(other.dismissed, dismissed) || other.dismissed == dismissed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,message,fromPlan,toPlan,const DeepCollectionEquality().hash(_lockedFeatures),changedAt,dismissed);
}

@override
String toString() {
    return 'DowngradeNotice(message: $message, fromPlan: $fromPlan, toPlan: $toPlan, lockedFeatures: $lockedFeatures, changedAt: $changedAt, dismissed: $dismissed)';
}


}

/// @nodoc
abstract mixin class _$DowngradeNoticeCopyWith<$Res> implements $DowngradeNoticeCopyWith<$Res> {
  factory _$DowngradeNoticeCopyWith(_DowngradeNotice value, $Res Function(_DowngradeNotice) _then) = __$DowngradeNoticeCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? fromPlan, String? toPlan, List<String> lockedFeatures, DateTime? changedAt, bool dismissed
});




}
/// @nodoc
class __$DowngradeNoticeCopyWithImpl<$Res>
    implements _$DowngradeNoticeCopyWith<$Res> {
  __$DowngradeNoticeCopyWithImpl(this._self, this._then);

  final _DowngradeNotice _self;
  final $Res Function(_DowngradeNotice) _then;

/// Create a copy of DowngradeNotice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? fromPlan = freezed,Object? toPlan = freezed,Object? lockedFeatures = null,Object? changedAt = freezed,Object? dismissed = null,}) {
  return _then(_DowngradeNotice(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromPlan: freezed == fromPlan ? _self.fromPlan : fromPlan // ignore: cast_nullable_to_non_nullable
as String?,toPlan: freezed == toPlan ? _self.toPlan : toPlan // ignore: cast_nullable_to_non_nullable
as String?,lockedFeatures: null == lockedFeatures ? _self._lockedFeatures : lockedFeatures // ignore: cast_nullable_to_non_nullable
as List<String>,changedAt: freezed == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dismissed: null == dismissed ? _self.dismissed : dismissed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
