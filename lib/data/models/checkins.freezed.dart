// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkins.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Checkin {

 String get id; int get feeling; int get progressRating; String? get challenges; bool get scheduleStillRealistic; String? get encouragement; DateTime? get createdAt;
/// Create a copy of Checkin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckinCopyWith<Checkin> get copyWith => _$CheckinCopyWithImpl<Checkin>(this as Checkin, _$identity);

  /// Serializes this Checkin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Checkin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Checkin&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.feeling, _this.feeling) || other.feeling == _this.feeling)&&(identical(other.progressRating, _this.progressRating) || other.progressRating == _this.progressRating)&&(identical(other.challenges, _this.challenges) || other.challenges == _this.challenges)&&(identical(other.scheduleStillRealistic, _this.scheduleStillRealistic) || other.scheduleStillRealistic == _this.scheduleStillRealistic)&&(identical(other.encouragement, _this.encouragement) || other.encouragement == _this.encouragement)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Checkin;
  return Object.hash(runtimeType,_this.id,_this.feeling,_this.progressRating,_this.challenges,_this.scheduleStillRealistic,_this.encouragement,_this.createdAt);
}

@override
String toString() {
  final _this = this as Checkin;
  return 'Checkin(id: ${_this.id}, feeling: ${_this.feeling}, progressRating: ${_this.progressRating}, challenges: ${_this.challenges}, scheduleStillRealistic: ${_this.scheduleStillRealistic}, encouragement: ${_this.encouragement}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CheckinCopyWith<$Res>  {
  factory $CheckinCopyWith(Checkin value, $Res Function(Checkin) _then) = _$CheckinCopyWithImpl;
@useResult
$Res call({
 String id, int feeling, int progressRating, String? challenges, bool scheduleStillRealistic, String? encouragement, DateTime? createdAt
});




}
/// @nodoc
class _$CheckinCopyWithImpl<$Res>
    implements $CheckinCopyWith<$Res> {
  _$CheckinCopyWithImpl(this._self, this._then);

  final Checkin _self;
  final $Res Function(Checkin) _then;

/// Create a copy of Checkin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? feeling = null,Object? progressRating = null,Object? challenges = freezed,Object? scheduleStillRealistic = null,Object? encouragement = freezed,Object? createdAt = freezed,}) {
  return _then(Checkin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,feeling: null == feeling ? _self.feeling : feeling // ignore: cast_nullable_to_non_nullable
as int,progressRating: null == progressRating ? _self.progressRating : progressRating // ignore: cast_nullable_to_non_nullable
as int,challenges: freezed == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as String?,scheduleStillRealistic: null == scheduleStillRealistic ? _self.scheduleStillRealistic : scheduleStillRealistic // ignore: cast_nullable_to_non_nullable
as bool,encouragement: freezed == encouragement ? _self.encouragement : encouragement // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Checkin].
extension CheckinPatterns on Checkin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Checkin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Checkin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Checkin value)  $default,){
final _that = this;
switch (_that) {
case _Checkin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Checkin value)?  $default,){
final _that = this;
switch (_that) {
case _Checkin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int feeling,  int progressRating,  String? challenges,  bool scheduleStillRealistic,  String? encouragement,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Checkin() when $default != null:
return $default(_that.id,_that.feeling,_that.progressRating,_that.challenges,_that.scheduleStillRealistic,_that.encouragement,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int feeling,  int progressRating,  String? challenges,  bool scheduleStillRealistic,  String? encouragement,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Checkin():
return $default(_that.id,_that.feeling,_that.progressRating,_that.challenges,_that.scheduleStillRealistic,_that.encouragement,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int feeling,  int progressRating,  String? challenges,  bool scheduleStillRealistic,  String? encouragement,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Checkin() when $default != null:
return $default(_that.id,_that.feeling,_that.progressRating,_that.challenges,_that.scheduleStillRealistic,_that.encouragement,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Checkin implements Checkin {
  const _Checkin({required this.id, this.feeling = 3, this.progressRating = 3, this.challenges, this.scheduleStillRealistic = true, this.encouragement, this.createdAt});
  factory _Checkin.fromJson(Map<String, dynamic> json) => _$CheckinFromJson(json);

@override final  String id;
@override@JsonKey() final  int feeling;
@override@JsonKey() final  int progressRating;
@override final  String? challenges;
@override@JsonKey() final  bool scheduleStillRealistic;
@override final  String? encouragement;
@override final  DateTime? createdAt;

/// Create a copy of Checkin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckinCopyWith<_Checkin> get copyWith => __$CheckinCopyWithImpl<_Checkin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckinToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Checkin&&(identical(other.id, id) || other.id == id)&&(identical(other.feeling, feeling) || other.feeling == feeling)&&(identical(other.progressRating, progressRating) || other.progressRating == progressRating)&&(identical(other.challenges, challenges) || other.challenges == challenges)&&(identical(other.scheduleStillRealistic, scheduleStillRealistic) || other.scheduleStillRealistic == scheduleStillRealistic)&&(identical(other.encouragement, encouragement) || other.encouragement == encouragement)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,feeling,progressRating,challenges,scheduleStillRealistic,encouragement,createdAt);
}

@override
String toString() {
    return 'Checkin(id: $id, feeling: $feeling, progressRating: $progressRating, challenges: $challenges, scheduleStillRealistic: $scheduleStillRealistic, encouragement: $encouragement, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CheckinCopyWith<$Res> implements $CheckinCopyWith<$Res> {
  factory _$CheckinCopyWith(_Checkin value, $Res Function(_Checkin) _then) = __$CheckinCopyWithImpl;
@override @useResult
$Res call({
 String id, int feeling, int progressRating, String? challenges, bool scheduleStillRealistic, String? encouragement, DateTime? createdAt
});




}
/// @nodoc
class __$CheckinCopyWithImpl<$Res>
    implements _$CheckinCopyWith<$Res> {
  __$CheckinCopyWithImpl(this._self, this._then);

  final _Checkin _self;
  final $Res Function(_Checkin) _then;

/// Create a copy of Checkin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? feeling = null,Object? progressRating = null,Object? challenges = freezed,Object? scheduleStillRealistic = null,Object? encouragement = freezed,Object? createdAt = freezed,}) {
  return _then(_Checkin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,feeling: null == feeling ? _self.feeling : feeling // ignore: cast_nullable_to_non_nullable
as int,progressRating: null == progressRating ? _self.progressRating : progressRating // ignore: cast_nullable_to_non_nullable
as int,challenges: freezed == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as String?,scheduleStillRealistic: null == scheduleStillRealistic ? _self.scheduleStillRealistic : scheduleStillRealistic // ignore: cast_nullable_to_non_nullable
as bool,encouragement: freezed == encouragement ? _self.encouragement : encouragement // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CheckinResult {

 String get encouragement; Proposal? get proposal;
/// Create a copy of CheckinResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckinResultCopyWith<CheckinResult> get copyWith => _$CheckinResultCopyWithImpl<CheckinResult>(this as CheckinResult, _$identity);

  /// Serializes this CheckinResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckinResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckinResult&&(identical(other.encouragement, _this.encouragement) || other.encouragement == _this.encouragement)&&(identical(other.proposal, _this.proposal) || other.proposal == _this.proposal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckinResult;
  return Object.hash(runtimeType,_this.encouragement,_this.proposal);
}

@override
String toString() {
  final _this = this as CheckinResult;
  return 'CheckinResult(encouragement: ${_this.encouragement}, proposal: ${_this.proposal})';
}


}

/// @nodoc
abstract mixin class $CheckinResultCopyWith<$Res>  {
  factory $CheckinResultCopyWith(CheckinResult value, $Res Function(CheckinResult) _then) = _$CheckinResultCopyWithImpl;
@useResult
$Res call({
 String encouragement, Proposal? proposal
});


$ProposalCopyWith<$Res>? get proposal;

}
/// @nodoc
class _$CheckinResultCopyWithImpl<$Res>
    implements $CheckinResultCopyWith<$Res> {
  _$CheckinResultCopyWithImpl(this._self, this._then);

  final CheckinResult _self;
  final $Res Function(CheckinResult) _then;

/// Create a copy of CheckinResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? encouragement = null,Object? proposal = freezed,}) {
  return _then(CheckinResult(
encouragement: null == encouragement ? _self.encouragement : encouragement // ignore: cast_nullable_to_non_nullable
as String,proposal: freezed == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as Proposal?,
  ));
}
/// Create a copy of CheckinResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProposalCopyWith<$Res>? get proposal {
    if (_self.proposal == null) {
    return null;
  }

  return $ProposalCopyWith<$Res>(_self.proposal!, (value) {
    return _then(_self.copyWith(proposal: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckinResult].
extension CheckinResultPatterns on CheckinResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckinResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckinResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckinResult value)  $default,){
final _that = this;
switch (_that) {
case _CheckinResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckinResult value)?  $default,){
final _that = this;
switch (_that) {
case _CheckinResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String encouragement,  Proposal? proposal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckinResult() when $default != null:
return $default(_that.encouragement,_that.proposal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String encouragement,  Proposal? proposal)  $default,) {final _that = this;
switch (_that) {
case _CheckinResult():
return $default(_that.encouragement,_that.proposal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String encouragement,  Proposal? proposal)?  $default,) {final _that = this;
switch (_that) {
case _CheckinResult() when $default != null:
return $default(_that.encouragement,_that.proposal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckinResult implements CheckinResult {
  const _CheckinResult({this.encouragement = '', this.proposal});
  factory _CheckinResult.fromJson(Map<String, dynamic> json) => _$CheckinResultFromJson(json);

@override@JsonKey() final  String encouragement;
@override final  Proposal? proposal;

/// Create a copy of CheckinResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckinResultCopyWith<_CheckinResult> get copyWith => __$CheckinResultCopyWithImpl<_CheckinResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckinResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckinResult&&(identical(other.encouragement, encouragement) || other.encouragement == encouragement)&&(identical(other.proposal, proposal) || other.proposal == proposal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,encouragement,proposal);
}

@override
String toString() {
    return 'CheckinResult(encouragement: $encouragement, proposal: $proposal)';
}


}

/// @nodoc
abstract mixin class _$CheckinResultCopyWith<$Res> implements $CheckinResultCopyWith<$Res> {
  factory _$CheckinResultCopyWith(_CheckinResult value, $Res Function(_CheckinResult) _then) = __$CheckinResultCopyWithImpl;
@override @useResult
$Res call({
 String encouragement, Proposal? proposal
});


@override $ProposalCopyWith<$Res>? get proposal;

}
/// @nodoc
class __$CheckinResultCopyWithImpl<$Res>
    implements _$CheckinResultCopyWith<$Res> {
  __$CheckinResultCopyWithImpl(this._self, this._then);

  final _CheckinResult _self;
  final $Res Function(_CheckinResult) _then;

/// Create a copy of CheckinResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? encouragement = null,Object? proposal = freezed,}) {
  return _then(_CheckinResult(
encouragement: null == encouragement ? _self.encouragement : encouragement // ignore: cast_nullable_to_non_nullable
as String,proposal: freezed == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as Proposal?,
  ));
}

/// Create a copy of CheckinResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProposalCopyWith<$Res>? get proposal {
    if (_self.proposal == null) {
    return null;
  }

  return $ProposalCopyWith<$Res>(_self.proposal!, (value) {
    return _then(_self.copyWith(proposal: value));
  });
}
}


/// @nodoc
mixin _$Reflection {

 String get id;/// "YYYY-MM"
 String get month; String get learned; String get change; String get goals; DateTime? get createdAt;
/// Create a copy of Reflection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReflectionCopyWith<Reflection> get copyWith => _$ReflectionCopyWithImpl<Reflection>(this as Reflection, _$identity);

  /// Serializes this Reflection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Reflection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reflection&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.learned, _this.learned) || other.learned == _this.learned)&&(identical(other.change, _this.change) || other.change == _this.change)&&(identical(other.goals, _this.goals) || other.goals == _this.goals)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Reflection;
  return Object.hash(runtimeType,_this.id,_this.month,_this.learned,_this.change,_this.goals,_this.createdAt);
}

@override
String toString() {
  final _this = this as Reflection;
  return 'Reflection(id: ${_this.id}, month: ${_this.month}, learned: ${_this.learned}, change: ${_this.change}, goals: ${_this.goals}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ReflectionCopyWith<$Res>  {
  factory $ReflectionCopyWith(Reflection value, $Res Function(Reflection) _then) = _$ReflectionCopyWithImpl;
@useResult
$Res call({
 String id, String month, String learned, String change, String goals, DateTime? createdAt
});




}
/// @nodoc
class _$ReflectionCopyWithImpl<$Res>
    implements $ReflectionCopyWith<$Res> {
  _$ReflectionCopyWithImpl(this._self, this._then);

  final Reflection _self;
  final $Res Function(Reflection) _then;

/// Create a copy of Reflection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? month = null,Object? learned = null,Object? change = null,Object? goals = null,Object? createdAt = freezed,}) {
  return _then(Reflection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,learned: null == learned ? _self.learned : learned // ignore: cast_nullable_to_non_nullable
as String,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as String,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Reflection].
extension ReflectionPatterns on Reflection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reflection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reflection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reflection value)  $default,){
final _that = this;
switch (_that) {
case _Reflection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reflection value)?  $default,){
final _that = this;
switch (_that) {
case _Reflection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String month,  String learned,  String change,  String goals,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reflection() when $default != null:
return $default(_that.id,_that.month,_that.learned,_that.change,_that.goals,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String month,  String learned,  String change,  String goals,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Reflection():
return $default(_that.id,_that.month,_that.learned,_that.change,_that.goals,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String month,  String learned,  String change,  String goals,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Reflection() when $default != null:
return $default(_that.id,_that.month,_that.learned,_that.change,_that.goals,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reflection implements Reflection {
  const _Reflection({required this.id, this.month = '', this.learned = '', this.change = '', this.goals = '', this.createdAt});
  factory _Reflection.fromJson(Map<String, dynamic> json) => _$ReflectionFromJson(json);

@override final  String id;
/// "YYYY-MM"
@override@JsonKey() final  String month;
@override@JsonKey() final  String learned;
@override@JsonKey() final  String change;
@override@JsonKey() final  String goals;
@override final  DateTime? createdAt;

/// Create a copy of Reflection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReflectionCopyWith<_Reflection> get copyWith => __$ReflectionCopyWithImpl<_Reflection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReflectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reflection&&(identical(other.id, id) || other.id == id)&&(identical(other.month, month) || other.month == month)&&(identical(other.learned, learned) || other.learned == learned)&&(identical(other.change, change) || other.change == change)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,month,learned,change,goals,createdAt);
}

@override
String toString() {
    return 'Reflection(id: $id, month: $month, learned: $learned, change: $change, goals: $goals, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReflectionCopyWith<$Res> implements $ReflectionCopyWith<$Res> {
  factory _$ReflectionCopyWith(_Reflection value, $Res Function(_Reflection) _then) = __$ReflectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String month, String learned, String change, String goals, DateTime? createdAt
});




}
/// @nodoc
class __$ReflectionCopyWithImpl<$Res>
    implements _$ReflectionCopyWith<$Res> {
  __$ReflectionCopyWithImpl(this._self, this._then);

  final _Reflection _self;
  final $Res Function(_Reflection) _then;

/// Create a copy of Reflection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? month = null,Object? learned = null,Object? change = null,Object? goals = null,Object? createdAt = freezed,}) {
  return _then(_Reflection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,learned: null == learned ? _self.learned : learned // ignore: cast_nullable_to_non_nullable
as String,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as String,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MonthlyReflectionSummary {

 String get month; int get tasksCompleted; List<String> get milestonesCompleted; int get minutesSpent; List<BadgeAward> get badges; List<String> get challenges; List<String> get upcomingPriorities; Reflection? get existingReflection;
/// Create a copy of MonthlyReflectionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyReflectionSummaryCopyWith<MonthlyReflectionSummary> get copyWith => _$MonthlyReflectionSummaryCopyWithImpl<MonthlyReflectionSummary>(this as MonthlyReflectionSummary, _$identity);

  /// Serializes this MonthlyReflectionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MonthlyReflectionSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyReflectionSummary&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.tasksCompleted, _this.tasksCompleted) || other.tasksCompleted == _this.tasksCompleted)&&const DeepCollectionEquality().equals(other.milestonesCompleted, _this.milestonesCompleted)&&(identical(other.minutesSpent, _this.minutesSpent) || other.minutesSpent == _this.minutesSpent)&&const DeepCollectionEquality().equals(other.badges, _this.badges)&&const DeepCollectionEquality().equals(other.challenges, _this.challenges)&&const DeepCollectionEquality().equals(other.upcomingPriorities, _this.upcomingPriorities)&&(identical(other.existingReflection, _this.existingReflection) || other.existingReflection == _this.existingReflection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MonthlyReflectionSummary;
  return Object.hash(runtimeType,_this.month,_this.tasksCompleted,const DeepCollectionEquality().hash(_this.milestonesCompleted),_this.minutesSpent,const DeepCollectionEquality().hash(_this.badges),const DeepCollectionEquality().hash(_this.challenges),const DeepCollectionEquality().hash(_this.upcomingPriorities),_this.existingReflection);
}

@override
String toString() {
  final _this = this as MonthlyReflectionSummary;
  return 'MonthlyReflectionSummary(month: ${_this.month}, tasksCompleted: ${_this.tasksCompleted}, milestonesCompleted: ${_this.milestonesCompleted}, minutesSpent: ${_this.minutesSpent}, badges: ${_this.badges}, challenges: ${_this.challenges}, upcomingPriorities: ${_this.upcomingPriorities}, existingReflection: ${_this.existingReflection})';
}


}

/// @nodoc
abstract mixin class $MonthlyReflectionSummaryCopyWith<$Res>  {
  factory $MonthlyReflectionSummaryCopyWith(MonthlyReflectionSummary value, $Res Function(MonthlyReflectionSummary) _then) = _$MonthlyReflectionSummaryCopyWithImpl;
@useResult
$Res call({
 String month, int tasksCompleted, List<String> milestonesCompleted, int minutesSpent, List<BadgeAward> badges, List<String> challenges, List<String> upcomingPriorities, Reflection? existingReflection
});


$ReflectionCopyWith<$Res>? get existingReflection;

}
/// @nodoc
class _$MonthlyReflectionSummaryCopyWithImpl<$Res>
    implements $MonthlyReflectionSummaryCopyWith<$Res> {
  _$MonthlyReflectionSummaryCopyWithImpl(this._self, this._then);

  final MonthlyReflectionSummary _self;
  final $Res Function(MonthlyReflectionSummary) _then;

/// Create a copy of MonthlyReflectionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? tasksCompleted = null,Object? milestonesCompleted = null,Object? minutesSpent = null,Object? badges = null,Object? challenges = null,Object? upcomingPriorities = null,Object? existingReflection = freezed,}) {
  return _then(MonthlyReflectionSummary(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,tasksCompleted: null == tasksCompleted ? _self.tasksCompleted : tasksCompleted // ignore: cast_nullable_to_non_nullable
as int,milestonesCompleted: null == milestonesCompleted ? _self.milestonesCompleted : milestonesCompleted // ignore: cast_nullable_to_non_nullable
as List<String>,minutesSpent: null == minutesSpent ? _self.minutesSpent : minutesSpent // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeAward>,challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<String>,upcomingPriorities: null == upcomingPriorities ? _self.upcomingPriorities : upcomingPriorities // ignore: cast_nullable_to_non_nullable
as List<String>,existingReflection: freezed == existingReflection ? _self.existingReflection : existingReflection // ignore: cast_nullable_to_non_nullable
as Reflection?,
  ));
}
/// Create a copy of MonthlyReflectionSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReflectionCopyWith<$Res>? get existingReflection {
    if (_self.existingReflection == null) {
    return null;
  }

  return $ReflectionCopyWith<$Res>(_self.existingReflection!, (value) {
    return _then(_self.copyWith(existingReflection: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthlyReflectionSummary].
extension MonthlyReflectionSummaryPatterns on MonthlyReflectionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyReflectionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyReflectionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyReflectionSummary value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyReflectionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyReflectionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyReflectionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String month,  int tasksCompleted,  List<String> milestonesCompleted,  int minutesSpent,  List<BadgeAward> badges,  List<String> challenges,  List<String> upcomingPriorities,  Reflection? existingReflection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyReflectionSummary() when $default != null:
return $default(_that.month,_that.tasksCompleted,_that.milestonesCompleted,_that.minutesSpent,_that.badges,_that.challenges,_that.upcomingPriorities,_that.existingReflection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String month,  int tasksCompleted,  List<String> milestonesCompleted,  int minutesSpent,  List<BadgeAward> badges,  List<String> challenges,  List<String> upcomingPriorities,  Reflection? existingReflection)  $default,) {final _that = this;
switch (_that) {
case _MonthlyReflectionSummary():
return $default(_that.month,_that.tasksCompleted,_that.milestonesCompleted,_that.minutesSpent,_that.badges,_that.challenges,_that.upcomingPriorities,_that.existingReflection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String month,  int tasksCompleted,  List<String> milestonesCompleted,  int minutesSpent,  List<BadgeAward> badges,  List<String> challenges,  List<String> upcomingPriorities,  Reflection? existingReflection)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyReflectionSummary() when $default != null:
return $default(_that.month,_that.tasksCompleted,_that.milestonesCompleted,_that.minutesSpent,_that.badges,_that.challenges,_that.upcomingPriorities,_that.existingReflection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyReflectionSummary implements MonthlyReflectionSummary {
  const _MonthlyReflectionSummary({this.month = '', this.tasksCompleted = 0,  List<String> milestonesCompleted = const <String>[], this.minutesSpent = 0,  List<BadgeAward> badges = const <BadgeAward>[],  List<String> challenges = const <String>[],  List<String> upcomingPriorities = const <String>[], this.existingReflection}): _milestonesCompleted = milestonesCompleted,_badges = badges,_challenges = challenges,_upcomingPriorities = upcomingPriorities;
  factory _MonthlyReflectionSummary.fromJson(Map<String, dynamic> json) => _$MonthlyReflectionSummaryFromJson(json);

@override@JsonKey() final  String month;
@override@JsonKey() final  int tasksCompleted;
 final  List<String> _milestonesCompleted;
@override@JsonKey() List<String> get milestonesCompleted {
  if (_milestonesCompleted is EqualUnmodifiableListView) return _milestonesCompleted;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestonesCompleted);
}

@override@JsonKey() final  int minutesSpent;
 final  List<BadgeAward> _badges;
@override@JsonKey() List<BadgeAward> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  List<String> _challenges;
@override@JsonKey() List<String> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}

 final  List<String> _upcomingPriorities;
@override@JsonKey() List<String> get upcomingPriorities {
  if (_upcomingPriorities is EqualUnmodifiableListView) return _upcomingPriorities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingPriorities);
}

@override final  Reflection? existingReflection;

/// Create a copy of MonthlyReflectionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyReflectionSummaryCopyWith<_MonthlyReflectionSummary> get copyWith => __$MonthlyReflectionSummaryCopyWithImpl<_MonthlyReflectionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyReflectionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyReflectionSummary&&(identical(other.month, month) || other.month == month)&&(identical(other.tasksCompleted, tasksCompleted) || other.tasksCompleted == tasksCompleted)&&const DeepCollectionEquality().equals(other.milestonesCompleted, _milestonesCompleted)&&(identical(other.minutesSpent, minutesSpent) || other.minutesSpent == minutesSpent)&&const DeepCollectionEquality().equals(other.badges, _badges)&&const DeepCollectionEquality().equals(other.challenges, _challenges)&&const DeepCollectionEquality().equals(other.upcomingPriorities, _upcomingPriorities)&&(identical(other.existingReflection, existingReflection) || other.existingReflection == existingReflection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,month,tasksCompleted,const DeepCollectionEquality().hash(_milestonesCompleted),minutesSpent,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_challenges),const DeepCollectionEquality().hash(_upcomingPriorities),existingReflection);
}

@override
String toString() {
    return 'MonthlyReflectionSummary(month: $month, tasksCompleted: $tasksCompleted, milestonesCompleted: $milestonesCompleted, minutesSpent: $minutesSpent, badges: $badges, challenges: $challenges, upcomingPriorities: $upcomingPriorities, existingReflection: $existingReflection)';
}


}

/// @nodoc
abstract mixin class _$MonthlyReflectionSummaryCopyWith<$Res> implements $MonthlyReflectionSummaryCopyWith<$Res> {
  factory _$MonthlyReflectionSummaryCopyWith(_MonthlyReflectionSummary value, $Res Function(_MonthlyReflectionSummary) _then) = __$MonthlyReflectionSummaryCopyWithImpl;
@override @useResult
$Res call({
 String month, int tasksCompleted, List<String> milestonesCompleted, int minutesSpent, List<BadgeAward> badges, List<String> challenges, List<String> upcomingPriorities, Reflection? existingReflection
});


@override $ReflectionCopyWith<$Res>? get existingReflection;

}
/// @nodoc
class __$MonthlyReflectionSummaryCopyWithImpl<$Res>
    implements _$MonthlyReflectionSummaryCopyWith<$Res> {
  __$MonthlyReflectionSummaryCopyWithImpl(this._self, this._then);

  final _MonthlyReflectionSummary _self;
  final $Res Function(_MonthlyReflectionSummary) _then;

/// Create a copy of MonthlyReflectionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? tasksCompleted = null,Object? milestonesCompleted = null,Object? minutesSpent = null,Object? badges = null,Object? challenges = null,Object? upcomingPriorities = null,Object? existingReflection = freezed,}) {
  return _then(_MonthlyReflectionSummary(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,tasksCompleted: null == tasksCompleted ? _self.tasksCompleted : tasksCompleted // ignore: cast_nullable_to_non_nullable
as int,milestonesCompleted: null == milestonesCompleted ? _self._milestonesCompleted : milestonesCompleted // ignore: cast_nullable_to_non_nullable
as List<String>,minutesSpent: null == minutesSpent ? _self.minutesSpent : minutesSpent // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<BadgeAward>,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<String>,upcomingPriorities: null == upcomingPriorities ? _self._upcomingPriorities : upcomingPriorities // ignore: cast_nullable_to_non_nullable
as List<String>,existingReflection: freezed == existingReflection ? _self.existingReflection : existingReflection // ignore: cast_nullable_to_non_nullable
as Reflection?,
  ));
}

/// Create a copy of MonthlyReflectionSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReflectionCopyWith<$Res>? get existingReflection {
    if (_self.existingReflection == null) {
    return null;
  }

  return $ReflectionCopyWith<$Res>(_self.existingReflection!, (value) {
    return _then(_self.copyWith(existingReflection: value));
  });
}
}

// dart format on
