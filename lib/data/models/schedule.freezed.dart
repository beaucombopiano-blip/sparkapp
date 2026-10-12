// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailabilitySlot {

 String? get id; int get weekday;/// Local "HH:mm".
 String get startTime; int get durationMinutes; int? get maxMinutesPerDay;
/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilitySlotCopyWith<AvailabilitySlot> get copyWith => _$AvailabilitySlotCopyWithImpl<AvailabilitySlot>(this as AvailabilitySlot, _$identity);

  /// Serializes this AvailabilitySlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AvailabilitySlot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilitySlot&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.weekday, _this.weekday) || other.weekday == _this.weekday)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&(identical(other.maxMinutesPerDay, _this.maxMinutesPerDay) || other.maxMinutesPerDay == _this.maxMinutesPerDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AvailabilitySlot;
  return Object.hash(runtimeType,_this.id,_this.weekday,_this.startTime,_this.durationMinutes,_this.maxMinutesPerDay);
}

@override
String toString() {
  final _this = this as AvailabilitySlot;
  return 'AvailabilitySlot(id: ${_this.id}, weekday: ${_this.weekday}, startTime: ${_this.startTime}, durationMinutes: ${_this.durationMinutes}, maxMinutesPerDay: ${_this.maxMinutesPerDay})';
}


}

/// @nodoc
abstract mixin class $AvailabilitySlotCopyWith<$Res>  {
  factory $AvailabilitySlotCopyWith(AvailabilitySlot value, $Res Function(AvailabilitySlot) _then) = _$AvailabilitySlotCopyWithImpl;
@useResult
$Res call({
 String? id, int weekday, String startTime, int durationMinutes, int? maxMinutesPerDay
});




}
/// @nodoc
class _$AvailabilitySlotCopyWithImpl<$Res>
    implements $AvailabilitySlotCopyWith<$Res> {
  _$AvailabilitySlotCopyWithImpl(this._self, this._then);

  final AvailabilitySlot _self;
  final $Res Function(AvailabilitySlot) _then;

/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? weekday = null,Object? startTime = null,Object? durationMinutes = null,Object? maxMinutesPerDay = freezed,}) {
  return _then(AvailabilitySlot(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,maxMinutesPerDay: freezed == maxMinutesPerDay ? _self.maxMinutesPerDay : maxMinutesPerDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilitySlot].
extension AvailabilitySlotPatterns on AvailabilitySlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilitySlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilitySlot value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilitySlot value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int weekday,  String startTime,  int durationMinutes,  int? maxMinutesPerDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
return $default(_that.id,_that.weekday,_that.startTime,_that.durationMinutes,_that.maxMinutesPerDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int weekday,  String startTime,  int durationMinutes,  int? maxMinutesPerDay)  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySlot():
return $default(_that.id,_that.weekday,_that.startTime,_that.durationMinutes,_that.maxMinutesPerDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int weekday,  String startTime,  int durationMinutes,  int? maxMinutesPerDay)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySlot() when $default != null:
return $default(_that.id,_that.weekday,_that.startTime,_that.durationMinutes,_that.maxMinutesPerDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilitySlot extends AvailabilitySlot {
  const _AvailabilitySlot({this.id, required this.weekday, required this.startTime, required this.durationMinutes, this.maxMinutesPerDay}): super._();
  factory _AvailabilitySlot.fromJson(Map<String, dynamic> json) => _$AvailabilitySlotFromJson(json);

@override final  String? id;
@override final  int weekday;
/// Local "HH:mm".
@override final  String startTime;
@override final  int durationMinutes;
@override final  int? maxMinutesPerDay;

/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilitySlotCopyWith<_AvailabilitySlot> get copyWith => __$AvailabilitySlotCopyWithImpl<_AvailabilitySlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilitySlotToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilitySlot&&(identical(other.id, id) || other.id == id)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.maxMinutesPerDay, maxMinutesPerDay) || other.maxMinutesPerDay == maxMinutesPerDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,weekday,startTime,durationMinutes,maxMinutesPerDay);
}

@override
String toString() {
    return 'AvailabilitySlot(id: $id, weekday: $weekday, startTime: $startTime, durationMinutes: $durationMinutes, maxMinutesPerDay: $maxMinutesPerDay)';
}


}

/// @nodoc
abstract mixin class _$AvailabilitySlotCopyWith<$Res> implements $AvailabilitySlotCopyWith<$Res> {
  factory _$AvailabilitySlotCopyWith(_AvailabilitySlot value, $Res Function(_AvailabilitySlot) _then) = __$AvailabilitySlotCopyWithImpl;
@override @useResult
$Res call({
 String? id, int weekday, String startTime, int durationMinutes, int? maxMinutesPerDay
});




}
/// @nodoc
class __$AvailabilitySlotCopyWithImpl<$Res>
    implements _$AvailabilitySlotCopyWith<$Res> {
  __$AvailabilitySlotCopyWithImpl(this._self, this._then);

  final _AvailabilitySlot _self;
  final $Res Function(_AvailabilitySlot) _then;

/// Create a copy of AvailabilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? weekday = null,Object? startTime = null,Object? durationMinutes = null,Object? maxMinutesPerDay = freezed,}) {
  return _then(_AvailabilitySlot(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,maxMinutesPerDay: freezed == maxMinutesPerDay ? _self.maxMinutesPerDay : maxMinutesPerDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AvailabilityException {

 String? get id; DateTime get startDate; DateTime get endDate; String? get reason;
/// Create a copy of AvailabilityException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilityExceptionCopyWith<AvailabilityException> get copyWith => _$AvailabilityExceptionCopyWithImpl<AvailabilityException>(this as AvailabilityException, _$identity);

  /// Serializes this AvailabilityException to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AvailabilityException;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilityException&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AvailabilityException;
  return Object.hash(runtimeType,_this.id,_this.startDate,_this.endDate,_this.reason);
}

@override
String toString() {
  final _this = this as AvailabilityException;
  return 'AvailabilityException(id: ${_this.id}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $AvailabilityExceptionCopyWith<$Res>  {
  factory $AvailabilityExceptionCopyWith(AvailabilityException value, $Res Function(AvailabilityException) _then) = _$AvailabilityExceptionCopyWithImpl;
@useResult
$Res call({
 String? id, DateTime startDate, DateTime endDate, String? reason
});




}
/// @nodoc
class _$AvailabilityExceptionCopyWithImpl<$Res>
    implements $AvailabilityExceptionCopyWith<$Res> {
  _$AvailabilityExceptionCopyWithImpl(this._self, this._then);

  final AvailabilityException _self;
  final $Res Function(AvailabilityException) _then;

/// Create a copy of AvailabilityException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? reason = freezed,}) {
  return _then(AvailabilityException(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilityException].
extension AvailabilityExceptionPatterns on AvailabilityException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilityException value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilityException() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilityException value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilityException():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilityException value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilityException() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  DateTime startDate,  DateTime endDate,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilityException() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  DateTime startDate,  DateTime endDate,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _AvailabilityException():
return $default(_that.id,_that.startDate,_that.endDate,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  DateTime startDate,  DateTime endDate,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilityException() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilityException implements AvailabilityException {
  const _AvailabilityException({this.id, required this.startDate, required this.endDate, this.reason});
  factory _AvailabilityException.fromJson(Map<String, dynamic> json) => _$AvailabilityExceptionFromJson(json);

@override final  String? id;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String? reason;

/// Create a copy of AvailabilityException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilityExceptionCopyWith<_AvailabilityException> get copyWith => __$AvailabilityExceptionCopyWithImpl<_AvailabilityException>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilityExceptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilityException&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,endDate,reason);
}

@override
String toString() {
    return 'AvailabilityException(id: $id, startDate: $startDate, endDate: $endDate, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$AvailabilityExceptionCopyWith<$Res> implements $AvailabilityExceptionCopyWith<$Res> {
  factory _$AvailabilityExceptionCopyWith(_AvailabilityException value, $Res Function(_AvailabilityException) _then) = __$AvailabilityExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? id, DateTime startDate, DateTime endDate, String? reason
});




}
/// @nodoc
class __$AvailabilityExceptionCopyWithImpl<$Res>
    implements _$AvailabilityExceptionCopyWith<$Res> {
  __$AvailabilityExceptionCopyWithImpl(this._self, this._then);

  final _AvailabilityException _self;
  final $Res Function(_AvailabilityException) _then;

/// Create a copy of AvailabilityException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? startDate = null,Object? endDate = null,Object? reason = freezed,}) {
  return _then(_AvailabilityException(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Proposal {

 String get id; String? get projectId; String get type;@JsonKey(unknownEnumValue: ProposalStatus.unknown) ProposalStatus get status; String? get title; String? get summary; String? get reason; List<ProposalChange> get changes; List<ProposalOption> get options;/// False when the work no longer fits and the user must pick an option.
 bool get fits; DateTime? get createdAt; DateTime? get expiresAt;
/// Create a copy of Proposal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalCopyWith<Proposal> get copyWith => _$ProposalCopyWithImpl<Proposal>(this as Proposal, _$identity);

  /// Serializes this Proposal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Proposal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Proposal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&const DeepCollectionEquality().equals(other.changes, _this.changes)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.fits, _this.fits) || other.fits == _this.fits)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Proposal;
  return Object.hash(runtimeType,_this.id,_this.projectId,_this.type,_this.status,_this.title,_this.summary,_this.reason,const DeepCollectionEquality().hash(_this.changes),const DeepCollectionEquality().hash(_this.options),_this.fits,_this.createdAt,_this.expiresAt);
}

@override
String toString() {
  final _this = this as Proposal;
  return 'Proposal(id: ${_this.id}, projectId: ${_this.projectId}, type: ${_this.type}, status: ${_this.status}, title: ${_this.title}, summary: ${_this.summary}, reason: ${_this.reason}, changes: ${_this.changes}, options: ${_this.options}, fits: ${_this.fits}, createdAt: ${_this.createdAt}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $ProposalCopyWith<$Res>  {
  factory $ProposalCopyWith(Proposal value, $Res Function(Proposal) _then) = _$ProposalCopyWithImpl;
@useResult
$Res call({
 String id, String? projectId, String type,@JsonKey(unknownEnumValue: ProposalStatus.unknown) ProposalStatus status, String? title, String? summary, String? reason, List<ProposalChange> changes, List<ProposalOption> options, bool fits, DateTime? createdAt, DateTime? expiresAt
});




}
/// @nodoc
class _$ProposalCopyWithImpl<$Res>
    implements $ProposalCopyWith<$Res> {
  _$ProposalCopyWithImpl(this._self, this._then);

  final Proposal _self;
  final $Res Function(Proposal) _then;

/// Create a copy of Proposal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = freezed,Object? type = null,Object? status = null,Object? title = freezed,Object? summary = freezed,Object? reason = freezed,Object? changes = null,Object? options = null,Object? fits = null,Object? createdAt = freezed,Object? expiresAt = freezed,}) {
  return _then(Proposal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProposalStatus,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,changes: null == changes ? _self.changes : changes // ignore: cast_nullable_to_non_nullable
as List<ProposalChange>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<ProposalOption>,fits: null == fits ? _self.fits : fits // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Proposal].
extension ProposalPatterns on Proposal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Proposal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Proposal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Proposal value)  $default,){
final _that = this;
switch (_that) {
case _Proposal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Proposal value)?  $default,){
final _that = this;
switch (_that) {
case _Proposal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? projectId,  String type, @JsonKey(unknownEnumValue: ProposalStatus.unknown)  ProposalStatus status,  String? title,  String? summary,  String? reason,  List<ProposalChange> changes,  List<ProposalOption> options,  bool fits,  DateTime? createdAt,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Proposal() when $default != null:
return $default(_that.id,_that.projectId,_that.type,_that.status,_that.title,_that.summary,_that.reason,_that.changes,_that.options,_that.fits,_that.createdAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? projectId,  String type, @JsonKey(unknownEnumValue: ProposalStatus.unknown)  ProposalStatus status,  String? title,  String? summary,  String? reason,  List<ProposalChange> changes,  List<ProposalOption> options,  bool fits,  DateTime? createdAt,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _Proposal():
return $default(_that.id,_that.projectId,_that.type,_that.status,_that.title,_that.summary,_that.reason,_that.changes,_that.options,_that.fits,_that.createdAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? projectId,  String type, @JsonKey(unknownEnumValue: ProposalStatus.unknown)  ProposalStatus status,  String? title,  String? summary,  String? reason,  List<ProposalChange> changes,  List<ProposalOption> options,  bool fits,  DateTime? createdAt,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _Proposal() when $default != null:
return $default(_that.id,_that.projectId,_that.type,_that.status,_that.title,_that.summary,_that.reason,_that.changes,_that.options,_that.fits,_that.createdAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Proposal extends Proposal {
  const _Proposal({required this.id, this.projectId, this.type = 'reschedule', @JsonKey(unknownEnumValue: ProposalStatus.unknown) this.status = ProposalStatus.pending, this.title, this.summary, this.reason,  List<ProposalChange> changes = const <ProposalChange>[],  List<ProposalOption> options = const <ProposalOption>[], this.fits = true, this.createdAt, this.expiresAt}): _changes = changes,_options = options,super._();
  factory _Proposal.fromJson(Map<String, dynamic> json) => _$ProposalFromJson(json);

@override final  String id;
@override final  String? projectId;
@override@JsonKey() final  String type;
@override@JsonKey(unknownEnumValue: ProposalStatus.unknown) final  ProposalStatus status;
@override final  String? title;
@override final  String? summary;
@override final  String? reason;
 final  List<ProposalChange> _changes;
@override@JsonKey() List<ProposalChange> get changes {
  if (_changes is EqualUnmodifiableListView) return _changes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_changes);
}

 final  List<ProposalOption> _options;
@override@JsonKey() List<ProposalOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

/// False when the work no longer fits and the user must pick an option.
@override@JsonKey() final  bool fits;
@override final  DateTime? createdAt;
@override final  DateTime? expiresAt;

/// Create a copy of Proposal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProposalCopyWith<_Proposal> get copyWith => __$ProposalCopyWithImpl<_Proposal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProposalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Proposal&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.changes, _changes)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.fits, fits) || other.fits == fits)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,projectId,type,status,title,summary,reason,const DeepCollectionEquality().hash(_changes),const DeepCollectionEquality().hash(_options),fits,createdAt,expiresAt);
}

@override
String toString() {
    return 'Proposal(id: $id, projectId: $projectId, type: $type, status: $status, title: $title, summary: $summary, reason: $reason, changes: $changes, options: $options, fits: $fits, createdAt: $createdAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$ProposalCopyWith<$Res> implements $ProposalCopyWith<$Res> {
  factory _$ProposalCopyWith(_Proposal value, $Res Function(_Proposal) _then) = __$ProposalCopyWithImpl;
@override @useResult
$Res call({
 String id, String? projectId, String type,@JsonKey(unknownEnumValue: ProposalStatus.unknown) ProposalStatus status, String? title, String? summary, String? reason, List<ProposalChange> changes, List<ProposalOption> options, bool fits, DateTime? createdAt, DateTime? expiresAt
});




}
/// @nodoc
class __$ProposalCopyWithImpl<$Res>
    implements _$ProposalCopyWith<$Res> {
  __$ProposalCopyWithImpl(this._self, this._then);

  final _Proposal _self;
  final $Res Function(_Proposal) _then;

/// Create a copy of Proposal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = freezed,Object? type = null,Object? status = null,Object? title = freezed,Object? summary = freezed,Object? reason = freezed,Object? changes = null,Object? options = null,Object? fits = null,Object? createdAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_Proposal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProposalStatus,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,changes: null == changes ? _self._changes : changes // ignore: cast_nullable_to_non_nullable
as List<ProposalChange>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ProposalOption>,fits: null == fits ? _self.fits : fits // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProposalChange {

/// move | add | remove | obsolete | deadline | availability | edit
 String get kind; String get title; String? get description; String? get taskId; String? get sessionId; DateTime? get fromDate; DateTime? get toDate; int? get minutes;
/// Create a copy of ProposalChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalChangeCopyWith<ProposalChange> get copyWith => _$ProposalChangeCopyWithImpl<ProposalChange>(this as ProposalChange, _$identity);

  /// Serializes this ProposalChange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProposalChange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalChange&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.fromDate, _this.fromDate) || other.fromDate == _this.fromDate)&&(identical(other.toDate, _this.toDate) || other.toDate == _this.toDate)&&(identical(other.minutes, _this.minutes) || other.minutes == _this.minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProposalChange;
  return Object.hash(runtimeType,_this.kind,_this.title,_this.description,_this.taskId,_this.sessionId,_this.fromDate,_this.toDate,_this.minutes);
}

@override
String toString() {
  final _this = this as ProposalChange;
  return 'ProposalChange(kind: ${_this.kind}, title: ${_this.title}, description: ${_this.description}, taskId: ${_this.taskId}, sessionId: ${_this.sessionId}, fromDate: ${_this.fromDate}, toDate: ${_this.toDate}, minutes: ${_this.minutes})';
}


}

/// @nodoc
abstract mixin class $ProposalChangeCopyWith<$Res>  {
  factory $ProposalChangeCopyWith(ProposalChange value, $Res Function(ProposalChange) _then) = _$ProposalChangeCopyWithImpl;
@useResult
$Res call({
 String kind, String title, String? description, String? taskId, String? sessionId, DateTime? fromDate, DateTime? toDate, int? minutes
});




}
/// @nodoc
class _$ProposalChangeCopyWithImpl<$Res>
    implements $ProposalChangeCopyWith<$Res> {
  _$ProposalChangeCopyWithImpl(this._self, this._then);

  final ProposalChange _self;
  final $Res Function(ProposalChange) _then;

/// Create a copy of ProposalChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? title = null,Object? description = freezed,Object? taskId = freezed,Object? sessionId = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? minutes = freezed,}) {
  return _then(ProposalChange(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProposalChange].
extension ProposalChangePatterns on ProposalChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProposalChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProposalChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProposalChange value)  $default,){
final _that = this;
switch (_that) {
case _ProposalChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProposalChange value)?  $default,){
final _that = this;
switch (_that) {
case _ProposalChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String title,  String? description,  String? taskId,  String? sessionId,  DateTime? fromDate,  DateTime? toDate,  int? minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProposalChange() when $default != null:
return $default(_that.kind,_that.title,_that.description,_that.taskId,_that.sessionId,_that.fromDate,_that.toDate,_that.minutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String title,  String? description,  String? taskId,  String? sessionId,  DateTime? fromDate,  DateTime? toDate,  int? minutes)  $default,) {final _that = this;
switch (_that) {
case _ProposalChange():
return $default(_that.kind,_that.title,_that.description,_that.taskId,_that.sessionId,_that.fromDate,_that.toDate,_that.minutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String title,  String? description,  String? taskId,  String? sessionId,  DateTime? fromDate,  DateTime? toDate,  int? minutes)?  $default,) {final _that = this;
switch (_that) {
case _ProposalChange() when $default != null:
return $default(_that.kind,_that.title,_that.description,_that.taskId,_that.sessionId,_that.fromDate,_that.toDate,_that.minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProposalChange implements ProposalChange {
  const _ProposalChange({this.kind = 'edit', this.title = '', this.description, this.taskId, this.sessionId, this.fromDate, this.toDate, this.minutes});
  factory _ProposalChange.fromJson(Map<String, dynamic> json) => _$ProposalChangeFromJson(json);

/// move | add | remove | obsolete | deadline | availability | edit
@override@JsonKey() final  String kind;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  String? taskId;
@override final  String? sessionId;
@override final  DateTime? fromDate;
@override final  DateTime? toDate;
@override final  int? minutes;

/// Create a copy of ProposalChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProposalChangeCopyWith<_ProposalChange> get copyWith => __$ProposalChangeCopyWithImpl<_ProposalChange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProposalChangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProposalChange&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,title,description,taskId,sessionId,fromDate,toDate,minutes);
}

@override
String toString() {
    return 'ProposalChange(kind: $kind, title: $title, description: $description, taskId: $taskId, sessionId: $sessionId, fromDate: $fromDate, toDate: $toDate, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$ProposalChangeCopyWith<$Res> implements $ProposalChangeCopyWith<$Res> {
  factory _$ProposalChangeCopyWith(_ProposalChange value, $Res Function(_ProposalChange) _then) = __$ProposalChangeCopyWithImpl;
@override @useResult
$Res call({
 String kind, String title, String? description, String? taskId, String? sessionId, DateTime? fromDate, DateTime? toDate, int? minutes
});




}
/// @nodoc
class __$ProposalChangeCopyWithImpl<$Res>
    implements _$ProposalChangeCopyWith<$Res> {
  __$ProposalChangeCopyWithImpl(this._self, this._then);

  final _ProposalChange _self;
  final $Res Function(_ProposalChange) _then;

/// Create a copy of ProposalChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? title = null,Object? description = freezed,Object? taskId = freezed,Object? sessionId = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? minutes = freezed,}) {
  return _then(_ProposalChange(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ProposalOption {

 String get id;/// extendDeadline | cutScope | addHours
 String get kind; String get label; String? get description; DateTime? get newEndDate; int? get extraMinutesPerWeek; List<String> get cutTaskTitles;
/// Create a copy of ProposalOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalOptionCopyWith<ProposalOption> get copyWith => _$ProposalOptionCopyWithImpl<ProposalOption>(this as ProposalOption, _$identity);

  /// Serializes this ProposalOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProposalOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.newEndDate, _this.newEndDate) || other.newEndDate == _this.newEndDate)&&(identical(other.extraMinutesPerWeek, _this.extraMinutesPerWeek) || other.extraMinutesPerWeek == _this.extraMinutesPerWeek)&&const DeepCollectionEquality().equals(other.cutTaskTitles, _this.cutTaskTitles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProposalOption;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.label,_this.description,_this.newEndDate,_this.extraMinutesPerWeek,const DeepCollectionEquality().hash(_this.cutTaskTitles));
}

@override
String toString() {
  final _this = this as ProposalOption;
  return 'ProposalOption(id: ${_this.id}, kind: ${_this.kind}, label: ${_this.label}, description: ${_this.description}, newEndDate: ${_this.newEndDate}, extraMinutesPerWeek: ${_this.extraMinutesPerWeek}, cutTaskTitles: ${_this.cutTaskTitles})';
}


}

/// @nodoc
abstract mixin class $ProposalOptionCopyWith<$Res>  {
  factory $ProposalOptionCopyWith(ProposalOption value, $Res Function(ProposalOption) _then) = _$ProposalOptionCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String label, String? description, DateTime? newEndDate, int? extraMinutesPerWeek, List<String> cutTaskTitles
});




}
/// @nodoc
class _$ProposalOptionCopyWithImpl<$Res>
    implements $ProposalOptionCopyWith<$Res> {
  _$ProposalOptionCopyWithImpl(this._self, this._then);

  final ProposalOption _self;
  final $Res Function(ProposalOption) _then;

/// Create a copy of ProposalOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? label = null,Object? description = freezed,Object? newEndDate = freezed,Object? extraMinutesPerWeek = freezed,Object? cutTaskTitles = null,}) {
  return _then(ProposalOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,newEndDate: freezed == newEndDate ? _self.newEndDate : newEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,extraMinutesPerWeek: freezed == extraMinutesPerWeek ? _self.extraMinutesPerWeek : extraMinutesPerWeek // ignore: cast_nullable_to_non_nullable
as int?,cutTaskTitles: null == cutTaskTitles ? _self.cutTaskTitles : cutTaskTitles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProposalOption].
extension ProposalOptionPatterns on ProposalOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProposalOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProposalOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProposalOption value)  $default,){
final _that = this;
switch (_that) {
case _ProposalOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProposalOption value)?  $default,){
final _that = this;
switch (_that) {
case _ProposalOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String label,  String? description,  DateTime? newEndDate,  int? extraMinutesPerWeek,  List<String> cutTaskTitles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProposalOption() when $default != null:
return $default(_that.id,_that.kind,_that.label,_that.description,_that.newEndDate,_that.extraMinutesPerWeek,_that.cutTaskTitles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String label,  String? description,  DateTime? newEndDate,  int? extraMinutesPerWeek,  List<String> cutTaskTitles)  $default,) {final _that = this;
switch (_that) {
case _ProposalOption():
return $default(_that.id,_that.kind,_that.label,_that.description,_that.newEndDate,_that.extraMinutesPerWeek,_that.cutTaskTitles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String label,  String? description,  DateTime? newEndDate,  int? extraMinutesPerWeek,  List<String> cutTaskTitles)?  $default,) {final _that = this;
switch (_that) {
case _ProposalOption() when $default != null:
return $default(_that.id,_that.kind,_that.label,_that.description,_that.newEndDate,_that.extraMinutesPerWeek,_that.cutTaskTitles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProposalOption implements ProposalOption {
  const _ProposalOption({required this.id, this.kind = 'extendDeadline', this.label = '', this.description, this.newEndDate, this.extraMinutesPerWeek,  List<String> cutTaskTitles = const <String>[]}): _cutTaskTitles = cutTaskTitles;
  factory _ProposalOption.fromJson(Map<String, dynamic> json) => _$ProposalOptionFromJson(json);

@override final  String id;
/// extendDeadline | cutScope | addHours
@override@JsonKey() final  String kind;
@override@JsonKey() final  String label;
@override final  String? description;
@override final  DateTime? newEndDate;
@override final  int? extraMinutesPerWeek;
 final  List<String> _cutTaskTitles;
@override@JsonKey() List<String> get cutTaskTitles {
  if (_cutTaskTitles is EqualUnmodifiableListView) return _cutTaskTitles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cutTaskTitles);
}


/// Create a copy of ProposalOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProposalOptionCopyWith<_ProposalOption> get copyWith => __$ProposalOptionCopyWithImpl<_ProposalOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProposalOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProposalOption&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.newEndDate, newEndDate) || other.newEndDate == newEndDate)&&(identical(other.extraMinutesPerWeek, extraMinutesPerWeek) || other.extraMinutesPerWeek == extraMinutesPerWeek)&&const DeepCollectionEquality().equals(other.cutTaskTitles, _cutTaskTitles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,label,description,newEndDate,extraMinutesPerWeek,const DeepCollectionEquality().hash(_cutTaskTitles));
}

@override
String toString() {
    return 'ProposalOption(id: $id, kind: $kind, label: $label, description: $description, newEndDate: $newEndDate, extraMinutesPerWeek: $extraMinutesPerWeek, cutTaskTitles: $cutTaskTitles)';
}


}

/// @nodoc
abstract mixin class _$ProposalOptionCopyWith<$Res> implements $ProposalOptionCopyWith<$Res> {
  factory _$ProposalOptionCopyWith(_ProposalOption value, $Res Function(_ProposalOption) _then) = __$ProposalOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String label, String? description, DateTime? newEndDate, int? extraMinutesPerWeek, List<String> cutTaskTitles
});




}
/// @nodoc
class __$ProposalOptionCopyWithImpl<$Res>
    implements _$ProposalOptionCopyWith<$Res> {
  __$ProposalOptionCopyWithImpl(this._self, this._then);

  final _ProposalOption _self;
  final $Res Function(_ProposalOption) _then;

/// Create a copy of ProposalOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? label = null,Object? description = freezed,Object? newEndDate = freezed,Object? extraMinutesPerWeek = freezed,Object? cutTaskTitles = null,}) {
  return _then(_ProposalOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,newEndDate: freezed == newEndDate ? _self.newEndDate : newEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,extraMinutesPerWeek: freezed == extraMinutesPerWeek ? _self.extraMinutesPerWeek : extraMinutesPerWeek // ignore: cast_nullable_to_non_nullable
as int?,cutTaskTitles: null == cutTaskTitles ? _self._cutTaskTitles : cutTaskTitles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
