// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectProfile {

 String? get goal; String? get motivation; String? get audienceOrBeneficiary; String? get scale; String? get successDefinition; String? get desiredFinishDate; String? get existingSkillsAndResources; String? get constraintsAndChallenges; String? get projectType; String? get title; List<String> get assumedFields;
/// Create a copy of ProjectProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectProfileCopyWith<ProjectProfile> get copyWith => _$ProjectProfileCopyWithImpl<ProjectProfile>(this as ProjectProfile, _$identity);

  /// Serializes this ProjectProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectProfile&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&(identical(other.motivation, _this.motivation) || other.motivation == _this.motivation)&&(identical(other.audienceOrBeneficiary, _this.audienceOrBeneficiary) || other.audienceOrBeneficiary == _this.audienceOrBeneficiary)&&(identical(other.scale, _this.scale) || other.scale == _this.scale)&&(identical(other.successDefinition, _this.successDefinition) || other.successDefinition == _this.successDefinition)&&(identical(other.desiredFinishDate, _this.desiredFinishDate) || other.desiredFinishDate == _this.desiredFinishDate)&&(identical(other.existingSkillsAndResources, _this.existingSkillsAndResources) || other.existingSkillsAndResources == _this.existingSkillsAndResources)&&(identical(other.constraintsAndChallenges, _this.constraintsAndChallenges) || other.constraintsAndChallenges == _this.constraintsAndChallenges)&&(identical(other.projectType, _this.projectType) || other.projectType == _this.projectType)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.assumedFields, _this.assumedFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectProfile;
  return Object.hash(runtimeType,_this.goal,_this.motivation,_this.audienceOrBeneficiary,_this.scale,_this.successDefinition,_this.desiredFinishDate,_this.existingSkillsAndResources,_this.constraintsAndChallenges,_this.projectType,_this.title,const DeepCollectionEquality().hash(_this.assumedFields));
}

@override
String toString() {
  final _this = this as ProjectProfile;
  return 'ProjectProfile(goal: ${_this.goal}, motivation: ${_this.motivation}, audienceOrBeneficiary: ${_this.audienceOrBeneficiary}, scale: ${_this.scale}, successDefinition: ${_this.successDefinition}, desiredFinishDate: ${_this.desiredFinishDate}, existingSkillsAndResources: ${_this.existingSkillsAndResources}, constraintsAndChallenges: ${_this.constraintsAndChallenges}, projectType: ${_this.projectType}, title: ${_this.title}, assumedFields: ${_this.assumedFields})';
}


}

/// @nodoc
abstract mixin class $ProjectProfileCopyWith<$Res>  {
  factory $ProjectProfileCopyWith(ProjectProfile value, $Res Function(ProjectProfile) _then) = _$ProjectProfileCopyWithImpl;
@useResult
$Res call({
 String? goal, String? motivation, String? audienceOrBeneficiary, String? scale, String? successDefinition, String? desiredFinishDate, String? existingSkillsAndResources, String? constraintsAndChallenges, String? projectType, String? title, List<String> assumedFields
});




}
/// @nodoc
class _$ProjectProfileCopyWithImpl<$Res>
    implements $ProjectProfileCopyWith<$Res> {
  _$ProjectProfileCopyWithImpl(this._self, this._then);

  final ProjectProfile _self;
  final $Res Function(ProjectProfile) _then;

/// Create a copy of ProjectProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goal = freezed,Object? motivation = freezed,Object? audienceOrBeneficiary = freezed,Object? scale = freezed,Object? successDefinition = freezed,Object? desiredFinishDate = freezed,Object? existingSkillsAndResources = freezed,Object? constraintsAndChallenges = freezed,Object? projectType = freezed,Object? title = freezed,Object? assumedFields = null,}) {
  return _then(ProjectProfile(
goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String?,motivation: freezed == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String?,audienceOrBeneficiary: freezed == audienceOrBeneficiary ? _self.audienceOrBeneficiary : audienceOrBeneficiary // ignore: cast_nullable_to_non_nullable
as String?,scale: freezed == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as String?,successDefinition: freezed == successDefinition ? _self.successDefinition : successDefinition // ignore: cast_nullable_to_non_nullable
as String?,desiredFinishDate: freezed == desiredFinishDate ? _self.desiredFinishDate : desiredFinishDate // ignore: cast_nullable_to_non_nullable
as String?,existingSkillsAndResources: freezed == existingSkillsAndResources ? _self.existingSkillsAndResources : existingSkillsAndResources // ignore: cast_nullable_to_non_nullable
as String?,constraintsAndChallenges: freezed == constraintsAndChallenges ? _self.constraintsAndChallenges : constraintsAndChallenges // ignore: cast_nullable_to_non_nullable
as String?,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,assumedFields: null == assumedFields ? _self.assumedFields : assumedFields // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectProfile].
extension ProjectProfilePatterns on ProjectProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectProfile value)  $default,){
final _that = this;
switch (_that) {
case _ProjectProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? goal,  String? motivation,  String? audienceOrBeneficiary,  String? scale,  String? successDefinition,  String? desiredFinishDate,  String? existingSkillsAndResources,  String? constraintsAndChallenges,  String? projectType,  String? title,  List<String> assumedFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectProfile() when $default != null:
return $default(_that.goal,_that.motivation,_that.audienceOrBeneficiary,_that.scale,_that.successDefinition,_that.desiredFinishDate,_that.existingSkillsAndResources,_that.constraintsAndChallenges,_that.projectType,_that.title,_that.assumedFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? goal,  String? motivation,  String? audienceOrBeneficiary,  String? scale,  String? successDefinition,  String? desiredFinishDate,  String? existingSkillsAndResources,  String? constraintsAndChallenges,  String? projectType,  String? title,  List<String> assumedFields)  $default,) {final _that = this;
switch (_that) {
case _ProjectProfile():
return $default(_that.goal,_that.motivation,_that.audienceOrBeneficiary,_that.scale,_that.successDefinition,_that.desiredFinishDate,_that.existingSkillsAndResources,_that.constraintsAndChallenges,_that.projectType,_that.title,_that.assumedFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? goal,  String? motivation,  String? audienceOrBeneficiary,  String? scale,  String? successDefinition,  String? desiredFinishDate,  String? existingSkillsAndResources,  String? constraintsAndChallenges,  String? projectType,  String? title,  List<String> assumedFields)?  $default,) {final _that = this;
switch (_that) {
case _ProjectProfile() when $default != null:
return $default(_that.goal,_that.motivation,_that.audienceOrBeneficiary,_that.scale,_that.successDefinition,_that.desiredFinishDate,_that.existingSkillsAndResources,_that.constraintsAndChallenges,_that.projectType,_that.title,_that.assumedFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectProfile implements ProjectProfile {
  const _ProjectProfile({this.goal, this.motivation, this.audienceOrBeneficiary, this.scale, this.successDefinition, this.desiredFinishDate, this.existingSkillsAndResources, this.constraintsAndChallenges, this.projectType, this.title,  List<String> assumedFields = const <String>[]}): _assumedFields = assumedFields;
  factory _ProjectProfile.fromJson(Map<String, dynamic> json) => _$ProjectProfileFromJson(json);

@override final  String? goal;
@override final  String? motivation;
@override final  String? audienceOrBeneficiary;
@override final  String? scale;
@override final  String? successDefinition;
@override final  String? desiredFinishDate;
@override final  String? existingSkillsAndResources;
@override final  String? constraintsAndChallenges;
@override final  String? projectType;
@override final  String? title;
 final  List<String> _assumedFields;
@override@JsonKey() List<String> get assumedFields {
  if (_assumedFields is EqualUnmodifiableListView) return _assumedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assumedFields);
}


/// Create a copy of ProjectProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectProfileCopyWith<_ProjectProfile> get copyWith => __$ProjectProfileCopyWithImpl<_ProjectProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectProfile&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.audienceOrBeneficiary, audienceOrBeneficiary) || other.audienceOrBeneficiary == audienceOrBeneficiary)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.successDefinition, successDefinition) || other.successDefinition == successDefinition)&&(identical(other.desiredFinishDate, desiredFinishDate) || other.desiredFinishDate == desiredFinishDate)&&(identical(other.existingSkillsAndResources, existingSkillsAndResources) || other.existingSkillsAndResources == existingSkillsAndResources)&&(identical(other.constraintsAndChallenges, constraintsAndChallenges) || other.constraintsAndChallenges == constraintsAndChallenges)&&(identical(other.projectType, projectType) || other.projectType == projectType)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.assumedFields, _assumedFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,goal,motivation,audienceOrBeneficiary,scale,successDefinition,desiredFinishDate,existingSkillsAndResources,constraintsAndChallenges,projectType,title,const DeepCollectionEquality().hash(_assumedFields));
}

@override
String toString() {
    return 'ProjectProfile(goal: $goal, motivation: $motivation, audienceOrBeneficiary: $audienceOrBeneficiary, scale: $scale, successDefinition: $successDefinition, desiredFinishDate: $desiredFinishDate, existingSkillsAndResources: $existingSkillsAndResources, constraintsAndChallenges: $constraintsAndChallenges, projectType: $projectType, title: $title, assumedFields: $assumedFields)';
}


}

/// @nodoc
abstract mixin class _$ProjectProfileCopyWith<$Res> implements $ProjectProfileCopyWith<$Res> {
  factory _$ProjectProfileCopyWith(_ProjectProfile value, $Res Function(_ProjectProfile) _then) = __$ProjectProfileCopyWithImpl;
@override @useResult
$Res call({
 String? goal, String? motivation, String? audienceOrBeneficiary, String? scale, String? successDefinition, String? desiredFinishDate, String? existingSkillsAndResources, String? constraintsAndChallenges, String? projectType, String? title, List<String> assumedFields
});




}
/// @nodoc
class __$ProjectProfileCopyWithImpl<$Res>
    implements _$ProjectProfileCopyWith<$Res> {
  __$ProjectProfileCopyWithImpl(this._self, this._then);

  final _ProjectProfile _self;
  final $Res Function(_ProjectProfile) _then;

/// Create a copy of ProjectProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goal = freezed,Object? motivation = freezed,Object? audienceOrBeneficiary = freezed,Object? scale = freezed,Object? successDefinition = freezed,Object? desiredFinishDate = freezed,Object? existingSkillsAndResources = freezed,Object? constraintsAndChallenges = freezed,Object? projectType = freezed,Object? title = freezed,Object? assumedFields = null,}) {
  return _then(_ProjectProfile(
goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String?,motivation: freezed == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String?,audienceOrBeneficiary: freezed == audienceOrBeneficiary ? _self.audienceOrBeneficiary : audienceOrBeneficiary // ignore: cast_nullable_to_non_nullable
as String?,scale: freezed == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as String?,successDefinition: freezed == successDefinition ? _self.successDefinition : successDefinition // ignore: cast_nullable_to_non_nullable
as String?,desiredFinishDate: freezed == desiredFinishDate ? _self.desiredFinishDate : desiredFinishDate // ignore: cast_nullable_to_non_nullable
as String?,existingSkillsAndResources: freezed == existingSkillsAndResources ? _self.existingSkillsAndResources : existingSkillsAndResources // ignore: cast_nullable_to_non_nullable
as String?,constraintsAndChallenges: freezed == constraintsAndChallenges ? _self.constraintsAndChallenges : constraintsAndChallenges // ignore: cast_nullable_to_non_nullable
as String?,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,assumedFields: null == assumedFields ? _self._assumedFields : assumedFields // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PlanPreview {

 List<PreviewPhase> get phases; int get taskCount; List<PreviewTask> get firstTasks;
/// Create a copy of PlanPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanPreviewCopyWith<PlanPreview> get copyWith => _$PlanPreviewCopyWithImpl<PlanPreview>(this as PlanPreview, _$identity);

  /// Serializes this PlanPreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanPreview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanPreview&&const DeepCollectionEquality().equals(other.phases, _this.phases)&&(identical(other.taskCount, _this.taskCount) || other.taskCount == _this.taskCount)&&const DeepCollectionEquality().equals(other.firstTasks, _this.firstTasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanPreview;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.phases),_this.taskCount,const DeepCollectionEquality().hash(_this.firstTasks));
}

@override
String toString() {
  final _this = this as PlanPreview;
  return 'PlanPreview(phases: ${_this.phases}, taskCount: ${_this.taskCount}, firstTasks: ${_this.firstTasks})';
}


}

/// @nodoc
abstract mixin class $PlanPreviewCopyWith<$Res>  {
  factory $PlanPreviewCopyWith(PlanPreview value, $Res Function(PlanPreview) _then) = _$PlanPreviewCopyWithImpl;
@useResult
$Res call({
 List<PreviewPhase> phases, int taskCount, List<PreviewTask> firstTasks
});




}
/// @nodoc
class _$PlanPreviewCopyWithImpl<$Res>
    implements $PlanPreviewCopyWith<$Res> {
  _$PlanPreviewCopyWithImpl(this._self, this._then);

  final PlanPreview _self;
  final $Res Function(PlanPreview) _then;

/// Create a copy of PlanPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phases = null,Object? taskCount = null,Object? firstTasks = null,}) {
  return _then(PlanPreview(
phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<PreviewPhase>,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,firstTasks: null == firstTasks ? _self.firstTasks : firstTasks // ignore: cast_nullable_to_non_nullable
as List<PreviewTask>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanPreview].
extension PlanPreviewPatterns on PlanPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanPreview value)  $default,){
final _that = this;
switch (_that) {
case _PlanPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanPreview value)?  $default,){
final _that = this;
switch (_that) {
case _PlanPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PreviewPhase> phases,  int taskCount,  List<PreviewTask> firstTasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanPreview() when $default != null:
return $default(_that.phases,_that.taskCount,_that.firstTasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PreviewPhase> phases,  int taskCount,  List<PreviewTask> firstTasks)  $default,) {final _that = this;
switch (_that) {
case _PlanPreview():
return $default(_that.phases,_that.taskCount,_that.firstTasks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PreviewPhase> phases,  int taskCount,  List<PreviewTask> firstTasks)?  $default,) {final _that = this;
switch (_that) {
case _PlanPreview() when $default != null:
return $default(_that.phases,_that.taskCount,_that.firstTasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanPreview implements PlanPreview {
  const _PlanPreview({ List<PreviewPhase> phases = const <PreviewPhase>[], this.taskCount = 0,  List<PreviewTask> firstTasks = const <PreviewTask>[]}): _phases = phases,_firstTasks = firstTasks;
  factory _PlanPreview.fromJson(Map<String, dynamic> json) => _$PlanPreviewFromJson(json);

 final  List<PreviewPhase> _phases;
@override@JsonKey() List<PreviewPhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}

@override@JsonKey() final  int taskCount;
 final  List<PreviewTask> _firstTasks;
@override@JsonKey() List<PreviewTask> get firstTasks {
  if (_firstTasks is EqualUnmodifiableListView) return _firstTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_firstTasks);
}


/// Create a copy of PlanPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanPreviewCopyWith<_PlanPreview> get copyWith => __$PlanPreviewCopyWithImpl<_PlanPreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanPreviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanPreview&&const DeepCollectionEquality().equals(other.phases, _phases)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&const DeepCollectionEquality().equals(other.firstTasks, _firstTasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_phases),taskCount,const DeepCollectionEquality().hash(_firstTasks));
}

@override
String toString() {
    return 'PlanPreview(phases: $phases, taskCount: $taskCount, firstTasks: $firstTasks)';
}


}

/// @nodoc
abstract mixin class _$PlanPreviewCopyWith<$Res> implements $PlanPreviewCopyWith<$Res> {
  factory _$PlanPreviewCopyWith(_PlanPreview value, $Res Function(_PlanPreview) _then) = __$PlanPreviewCopyWithImpl;
@override @useResult
$Res call({
 List<PreviewPhase> phases, int taskCount, List<PreviewTask> firstTasks
});




}
/// @nodoc
class __$PlanPreviewCopyWithImpl<$Res>
    implements _$PlanPreviewCopyWith<$Res> {
  __$PlanPreviewCopyWithImpl(this._self, this._then);

  final _PlanPreview _self;
  final $Res Function(_PlanPreview) _then;

/// Create a copy of PlanPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phases = null,Object? taskCount = null,Object? firstTasks = null,}) {
  return _then(_PlanPreview(
phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<PreviewPhase>,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,firstTasks: null == firstTasks ? _self._firstTasks : firstTasks // ignore: cast_nullable_to_non_nullable
as List<PreviewTask>,
  ));
}


}


/// @nodoc
mixin _$PreviewPhase {

 String get title; List<String> get milestoneTitles;
/// Create a copy of PreviewPhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewPhaseCopyWith<PreviewPhase> get copyWith => _$PreviewPhaseCopyWithImpl<PreviewPhase>(this as PreviewPhase, _$identity);

  /// Serializes this PreviewPhase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PreviewPhase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewPhase&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.milestoneTitles, _this.milestoneTitles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PreviewPhase;
  return Object.hash(runtimeType,_this.title,const DeepCollectionEquality().hash(_this.milestoneTitles));
}

@override
String toString() {
  final _this = this as PreviewPhase;
  return 'PreviewPhase(title: ${_this.title}, milestoneTitles: ${_this.milestoneTitles})';
}


}

/// @nodoc
abstract mixin class $PreviewPhaseCopyWith<$Res>  {
  factory $PreviewPhaseCopyWith(PreviewPhase value, $Res Function(PreviewPhase) _then) = _$PreviewPhaseCopyWithImpl;
@useResult
$Res call({
 String title, List<String> milestoneTitles
});




}
/// @nodoc
class _$PreviewPhaseCopyWithImpl<$Res>
    implements $PreviewPhaseCopyWith<$Res> {
  _$PreviewPhaseCopyWithImpl(this._self, this._then);

  final PreviewPhase _self;
  final $Res Function(PreviewPhase) _then;

/// Create a copy of PreviewPhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? milestoneTitles = null,}) {
  return _then(PreviewPhase(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,milestoneTitles: null == milestoneTitles ? _self.milestoneTitles : milestoneTitles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PreviewPhase].
extension PreviewPhasePatterns on PreviewPhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreviewPhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreviewPhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreviewPhase value)  $default,){
final _that = this;
switch (_that) {
case _PreviewPhase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreviewPhase value)?  $default,){
final _that = this;
switch (_that) {
case _PreviewPhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<String> milestoneTitles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreviewPhase() when $default != null:
return $default(_that.title,_that.milestoneTitles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<String> milestoneTitles)  $default,) {final _that = this;
switch (_that) {
case _PreviewPhase():
return $default(_that.title,_that.milestoneTitles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<String> milestoneTitles)?  $default,) {final _that = this;
switch (_that) {
case _PreviewPhase() when $default != null:
return $default(_that.title,_that.milestoneTitles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreviewPhase implements PreviewPhase {
  const _PreviewPhase({required this.title,  List<String> milestoneTitles = const <String>[]}): _milestoneTitles = milestoneTitles;
  factory _PreviewPhase.fromJson(Map<String, dynamic> json) => _$PreviewPhaseFromJson(json);

@override final  String title;
 final  List<String> _milestoneTitles;
@override@JsonKey() List<String> get milestoneTitles {
  if (_milestoneTitles is EqualUnmodifiableListView) return _milestoneTitles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestoneTitles);
}


/// Create a copy of PreviewPhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewPhaseCopyWith<_PreviewPhase> get copyWith => __$PreviewPhaseCopyWithImpl<_PreviewPhase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreviewPhaseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewPhase&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.milestoneTitles, _milestoneTitles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_milestoneTitles));
}

@override
String toString() {
    return 'PreviewPhase(title: $title, milestoneTitles: $milestoneTitles)';
}


}

/// @nodoc
abstract mixin class _$PreviewPhaseCopyWith<$Res> implements $PreviewPhaseCopyWith<$Res> {
  factory _$PreviewPhaseCopyWith(_PreviewPhase value, $Res Function(_PreviewPhase) _then) = __$PreviewPhaseCopyWithImpl;
@override @useResult
$Res call({
 String title, List<String> milestoneTitles
});




}
/// @nodoc
class __$PreviewPhaseCopyWithImpl<$Res>
    implements _$PreviewPhaseCopyWith<$Res> {
  __$PreviewPhaseCopyWithImpl(this._self, this._then);

  final _PreviewPhase _self;
  final $Res Function(_PreviewPhase) _then;

/// Create a copy of PreviewPhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? milestoneTitles = null,}) {
  return _then(_PreviewPhase(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,milestoneTitles: null == milestoneTitles ? _self._milestoneTitles : milestoneTitles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PreviewTask {

 String get title; int? get estimatedMinutes; String? get description;
/// Create a copy of PreviewTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewTaskCopyWith<PreviewTask> get copyWith => _$PreviewTaskCopyWithImpl<PreviewTask>(this as PreviewTask, _$identity);

  /// Serializes this PreviewTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PreviewTask;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewTask&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.estimatedMinutes, _this.estimatedMinutes) || other.estimatedMinutes == _this.estimatedMinutes)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PreviewTask;
  return Object.hash(runtimeType,_this.title,_this.estimatedMinutes,_this.description);
}

@override
String toString() {
  final _this = this as PreviewTask;
  return 'PreviewTask(title: ${_this.title}, estimatedMinutes: ${_this.estimatedMinutes}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $PreviewTaskCopyWith<$Res>  {
  factory $PreviewTaskCopyWith(PreviewTask value, $Res Function(PreviewTask) _then) = _$PreviewTaskCopyWithImpl;
@useResult
$Res call({
 String title, int? estimatedMinutes, String? description
});




}
/// @nodoc
class _$PreviewTaskCopyWithImpl<$Res>
    implements $PreviewTaskCopyWith<$Res> {
  _$PreviewTaskCopyWithImpl(this._self, this._then);

  final PreviewTask _self;
  final $Res Function(PreviewTask) _then;

/// Create a copy of PreviewTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? estimatedMinutes = freezed,Object? description = freezed,}) {
  return _then(PreviewTask(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PreviewTask].
extension PreviewTaskPatterns on PreviewTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreviewTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreviewTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreviewTask value)  $default,){
final _that = this;
switch (_that) {
case _PreviewTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreviewTask value)?  $default,){
final _that = this;
switch (_that) {
case _PreviewTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int? estimatedMinutes,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreviewTask() when $default != null:
return $default(_that.title,_that.estimatedMinutes,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int? estimatedMinutes,  String? description)  $default,) {final _that = this;
switch (_that) {
case _PreviewTask():
return $default(_that.title,_that.estimatedMinutes,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int? estimatedMinutes,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _PreviewTask() when $default != null:
return $default(_that.title,_that.estimatedMinutes,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreviewTask implements PreviewTask {
  const _PreviewTask({required this.title, this.estimatedMinutes, this.description});
  factory _PreviewTask.fromJson(Map<String, dynamic> json) => _$PreviewTaskFromJson(json);

@override final  String title;
@override final  int? estimatedMinutes;
@override final  String? description;

/// Create a copy of PreviewTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewTaskCopyWith<_PreviewTask> get copyWith => __$PreviewTaskCopyWithImpl<_PreviewTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreviewTaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewTask&&(identical(other.title, title) || other.title == title)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,estimatedMinutes,description);
}

@override
String toString() {
    return 'PreviewTask(title: $title, estimatedMinutes: $estimatedMinutes, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PreviewTaskCopyWith<$Res> implements $PreviewTaskCopyWith<$Res> {
  factory _$PreviewTaskCopyWith(_PreviewTask value, $Res Function(_PreviewTask) _then) = __$PreviewTaskCopyWithImpl;
@override @useResult
$Res call({
 String title, int? estimatedMinutes, String? description
});




}
/// @nodoc
class __$PreviewTaskCopyWithImpl<$Res>
    implements _$PreviewTaskCopyWith<$Res> {
  __$PreviewTaskCopyWithImpl(this._self, this._then);

  final _PreviewTask _self;
  final $Res Function(_PreviewTask) _then;

/// Create a copy of PreviewTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? estimatedMinutes = freezed,Object? description = freezed,}) {
  return _then(_PreviewTask(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Project {

 String get id; String get title; String? get description; String? get projectType; ProjectProfile? get profile; String? get source; String? get sourceId; DateTime? get startDate; DateTime? get targetEndDate;@JsonKey(unknownEnumValue: ProjectStatus.unknown) ProjectStatus get status; bool get scheduleAtRisk; int? get activePlanVersion; String? get summary; int get completedMinutes; int get totalMinutes; int get completedTaskCount; int get totalTaskCount; int get completedMilestoneCount; int get totalMilestoneCount; String? get currentMilestoneId; String? get currentPhaseId; DateTime? get nextSessionAt; Streaks? get streak; PlanPreview? get preview; DateTime? get completedAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Project;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.projectType, _this.projectType) || other.projectType == _this.projectType)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.targetEndDate, _this.targetEndDate) || other.targetEndDate == _this.targetEndDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.scheduleAtRisk, _this.scheduleAtRisk) || other.scheduleAtRisk == _this.scheduleAtRisk)&&(identical(other.activePlanVersion, _this.activePlanVersion) || other.activePlanVersion == _this.activePlanVersion)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.completedMinutes, _this.completedMinutes) || other.completedMinutes == _this.completedMinutes)&&(identical(other.totalMinutes, _this.totalMinutes) || other.totalMinutes == _this.totalMinutes)&&(identical(other.completedTaskCount, _this.completedTaskCount) || other.completedTaskCount == _this.completedTaskCount)&&(identical(other.totalTaskCount, _this.totalTaskCount) || other.totalTaskCount == _this.totalTaskCount)&&(identical(other.completedMilestoneCount, _this.completedMilestoneCount) || other.completedMilestoneCount == _this.completedMilestoneCount)&&(identical(other.totalMilestoneCount, _this.totalMilestoneCount) || other.totalMilestoneCount == _this.totalMilestoneCount)&&(identical(other.currentMilestoneId, _this.currentMilestoneId) || other.currentMilestoneId == _this.currentMilestoneId)&&(identical(other.currentPhaseId, _this.currentPhaseId) || other.currentPhaseId == _this.currentPhaseId)&&(identical(other.nextSessionAt, _this.nextSessionAt) || other.nextSessionAt == _this.nextSessionAt)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.preview, _this.preview) || other.preview == _this.preview)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Project;
  return Object.hashAll([runtimeType,_this.id,_this.title,_this.description,_this.projectType,_this.profile,_this.source,_this.sourceId,_this.startDate,_this.targetEndDate,_this.status,_this.scheduleAtRisk,_this.activePlanVersion,_this.summary,_this.completedMinutes,_this.totalMinutes,_this.completedTaskCount,_this.totalTaskCount,_this.completedMilestoneCount,_this.totalMilestoneCount,_this.currentMilestoneId,_this.currentPhaseId,_this.nextSessionAt,_this.streak,_this.preview,_this.completedAt,_this.createdAt,_this.updatedAt]);
}

@override
String toString() {
  final _this = this as Project;
  return 'Project(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, projectType: ${_this.projectType}, profile: ${_this.profile}, source: ${_this.source}, sourceId: ${_this.sourceId}, startDate: ${_this.startDate}, targetEndDate: ${_this.targetEndDate}, status: ${_this.status}, scheduleAtRisk: ${_this.scheduleAtRisk}, activePlanVersion: ${_this.activePlanVersion}, summary: ${_this.summary}, completedMinutes: ${_this.completedMinutes}, totalMinutes: ${_this.totalMinutes}, completedTaskCount: ${_this.completedTaskCount}, totalTaskCount: ${_this.totalTaskCount}, completedMilestoneCount: ${_this.completedMilestoneCount}, totalMilestoneCount: ${_this.totalMilestoneCount}, currentMilestoneId: ${_this.currentMilestoneId}, currentPhaseId: ${_this.currentPhaseId}, nextSessionAt: ${_this.nextSessionAt}, streak: ${_this.streak}, preview: ${_this.preview}, completedAt: ${_this.completedAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String? projectType, ProjectProfile? profile, String? source, String? sourceId, DateTime? startDate, DateTime? targetEndDate,@JsonKey(unknownEnumValue: ProjectStatus.unknown) ProjectStatus status, bool scheduleAtRisk, int? activePlanVersion, String? summary, int completedMinutes, int totalMinutes, int completedTaskCount, int totalTaskCount, int completedMilestoneCount, int totalMilestoneCount, String? currentMilestoneId, String? currentPhaseId, DateTime? nextSessionAt, Streaks? streak, PlanPreview? preview, DateTime? completedAt, DateTime? createdAt, DateTime? updatedAt
});


$ProjectProfileCopyWith<$Res>? get profile;$StreaksCopyWith<$Res>? get streak;$PlanPreviewCopyWith<$Res>? get preview;

}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? projectType = freezed,Object? profile = freezed,Object? source = freezed,Object? sourceId = freezed,Object? startDate = freezed,Object? targetEndDate = freezed,Object? status = null,Object? scheduleAtRisk = null,Object? activePlanVersion = freezed,Object? summary = freezed,Object? completedMinutes = null,Object? totalMinutes = null,Object? completedTaskCount = null,Object? totalTaskCount = null,Object? completedMilestoneCount = null,Object? totalMilestoneCount = null,Object? currentMilestoneId = freezed,Object? currentPhaseId = freezed,Object? nextSessionAt = freezed,Object? streak = freezed,Object? preview = freezed,Object? completedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProjectProfile?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,targetEndDate: freezed == targetEndDate ? _self.targetEndDate : targetEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,scheduleAtRisk: null == scheduleAtRisk ? _self.scheduleAtRisk : scheduleAtRisk // ignore: cast_nullable_to_non_nullable
as bool,activePlanVersion: freezed == activePlanVersion ? _self.activePlanVersion : activePlanVersion // ignore: cast_nullable_to_non_nullable
as int?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,completedMinutes: null == completedMinutes ? _self.completedMinutes : completedMinutes // ignore: cast_nullable_to_non_nullable
as int,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,completedTaskCount: null == completedTaskCount ? _self.completedTaskCount : completedTaskCount // ignore: cast_nullable_to_non_nullable
as int,totalTaskCount: null == totalTaskCount ? _self.totalTaskCount : totalTaskCount // ignore: cast_nullable_to_non_nullable
as int,completedMilestoneCount: null == completedMilestoneCount ? _self.completedMilestoneCount : completedMilestoneCount // ignore: cast_nullable_to_non_nullable
as int,totalMilestoneCount: null == totalMilestoneCount ? _self.totalMilestoneCount : totalMilestoneCount // ignore: cast_nullable_to_non_nullable
as int,currentMilestoneId: freezed == currentMilestoneId ? _self.currentMilestoneId : currentMilestoneId // ignore: cast_nullable_to_non_nullable
as String?,currentPhaseId: freezed == currentPhaseId ? _self.currentPhaseId : currentPhaseId // ignore: cast_nullable_to_non_nullable
as String?,nextSessionAt: freezed == nextSessionAt ? _self.nextSessionAt : nextSessionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as Streaks?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as PlanPreview?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $ProjectProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreaksCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $StreaksCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanPreviewCopyWith<$Res>? get preview {
    if (_self.preview == null) {
    return null;
  }

  return $PlanPreviewCopyWith<$Res>(_self.preview!, (value) {
    return _then(_self.copyWith(preview: value));
  });
}
}


/// Adds pattern-matching-related methods to [Project].
extension ProjectPatterns on Project {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Project value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Project value)  $default,){
final _that = this;
switch (_that) {
case _Project():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Project value)?  $default,){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String? projectType,  ProjectProfile? profile,  String? source,  String? sourceId,  DateTime? startDate,  DateTime? targetEndDate, @JsonKey(unknownEnumValue: ProjectStatus.unknown)  ProjectStatus status,  bool scheduleAtRisk,  int? activePlanVersion,  String? summary,  int completedMinutes,  int totalMinutes,  int completedTaskCount,  int totalTaskCount,  int completedMilestoneCount,  int totalMilestoneCount,  String? currentMilestoneId,  String? currentPhaseId,  DateTime? nextSessionAt,  Streaks? streak,  PlanPreview? preview,  DateTime? completedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.projectType,_that.profile,_that.source,_that.sourceId,_that.startDate,_that.targetEndDate,_that.status,_that.scheduleAtRisk,_that.activePlanVersion,_that.summary,_that.completedMinutes,_that.totalMinutes,_that.completedTaskCount,_that.totalTaskCount,_that.completedMilestoneCount,_that.totalMilestoneCount,_that.currentMilestoneId,_that.currentPhaseId,_that.nextSessionAt,_that.streak,_that.preview,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String? projectType,  ProjectProfile? profile,  String? source,  String? sourceId,  DateTime? startDate,  DateTime? targetEndDate, @JsonKey(unknownEnumValue: ProjectStatus.unknown)  ProjectStatus status,  bool scheduleAtRisk,  int? activePlanVersion,  String? summary,  int completedMinutes,  int totalMinutes,  int completedTaskCount,  int totalTaskCount,  int completedMilestoneCount,  int totalMilestoneCount,  String? currentMilestoneId,  String? currentPhaseId,  DateTime? nextSessionAt,  Streaks? streak,  PlanPreview? preview,  DateTime? completedAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Project():
return $default(_that.id,_that.title,_that.description,_that.projectType,_that.profile,_that.source,_that.sourceId,_that.startDate,_that.targetEndDate,_that.status,_that.scheduleAtRisk,_that.activePlanVersion,_that.summary,_that.completedMinutes,_that.totalMinutes,_that.completedTaskCount,_that.totalTaskCount,_that.completedMilestoneCount,_that.totalMilestoneCount,_that.currentMilestoneId,_that.currentPhaseId,_that.nextSessionAt,_that.streak,_that.preview,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String? projectType,  ProjectProfile? profile,  String? source,  String? sourceId,  DateTime? startDate,  DateTime? targetEndDate, @JsonKey(unknownEnumValue: ProjectStatus.unknown)  ProjectStatus status,  bool scheduleAtRisk,  int? activePlanVersion,  String? summary,  int completedMinutes,  int totalMinutes,  int completedTaskCount,  int totalTaskCount,  int completedMilestoneCount,  int totalMilestoneCount,  String? currentMilestoneId,  String? currentPhaseId,  DateTime? nextSessionAt,  Streaks? streak,  PlanPreview? preview,  DateTime? completedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.projectType,_that.profile,_that.source,_that.sourceId,_that.startDate,_that.targetEndDate,_that.status,_that.scheduleAtRisk,_that.activePlanVersion,_that.summary,_that.completedMinutes,_that.totalMinutes,_that.completedTaskCount,_that.totalTaskCount,_that.completedMilestoneCount,_that.totalMilestoneCount,_that.currentMilestoneId,_that.currentPhaseId,_that.nextSessionAt,_that.streak,_that.preview,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Project extends Project {
  const _Project({required this.id, this.title = '', this.description, this.projectType, this.profile, this.source, this.sourceId, this.startDate, this.targetEndDate, @JsonKey(unknownEnumValue: ProjectStatus.unknown) this.status = ProjectStatus.planning, this.scheduleAtRisk = false, this.activePlanVersion, this.summary, this.completedMinutes = 0, this.totalMinutes = 0, this.completedTaskCount = 0, this.totalTaskCount = 0, this.completedMilestoneCount = 0, this.totalMilestoneCount = 0, this.currentMilestoneId, this.currentPhaseId, this.nextSessionAt, this.streak, this.preview, this.completedAt, this.createdAt, this.updatedAt}): super._();
  factory _Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  String? projectType;
@override final  ProjectProfile? profile;
@override final  String? source;
@override final  String? sourceId;
@override final  DateTime? startDate;
@override final  DateTime? targetEndDate;
@override@JsonKey(unknownEnumValue: ProjectStatus.unknown) final  ProjectStatus status;
@override@JsonKey() final  bool scheduleAtRisk;
@override final  int? activePlanVersion;
@override final  String? summary;
@override@JsonKey() final  int completedMinutes;
@override@JsonKey() final  int totalMinutes;
@override@JsonKey() final  int completedTaskCount;
@override@JsonKey() final  int totalTaskCount;
@override@JsonKey() final  int completedMilestoneCount;
@override@JsonKey() final  int totalMilestoneCount;
@override final  String? currentMilestoneId;
@override final  String? currentPhaseId;
@override final  DateTime? nextSessionAt;
@override final  Streaks? streak;
@override final  PlanPreview? preview;
@override final  DateTime? completedAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCopyWith<_Project> get copyWith => __$ProjectCopyWithImpl<_Project>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectType, projectType) || other.projectType == projectType)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.targetEndDate, targetEndDate) || other.targetEndDate == targetEndDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduleAtRisk, scheduleAtRisk) || other.scheduleAtRisk == scheduleAtRisk)&&(identical(other.activePlanVersion, activePlanVersion) || other.activePlanVersion == activePlanVersion)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.completedMinutes, completedMinutes) || other.completedMinutes == completedMinutes)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.completedTaskCount, completedTaskCount) || other.completedTaskCount == completedTaskCount)&&(identical(other.totalTaskCount, totalTaskCount) || other.totalTaskCount == totalTaskCount)&&(identical(other.completedMilestoneCount, completedMilestoneCount) || other.completedMilestoneCount == completedMilestoneCount)&&(identical(other.totalMilestoneCount, totalMilestoneCount) || other.totalMilestoneCount == totalMilestoneCount)&&(identical(other.currentMilestoneId, currentMilestoneId) || other.currentMilestoneId == currentMilestoneId)&&(identical(other.currentPhaseId, currentPhaseId) || other.currentPhaseId == currentPhaseId)&&(identical(other.nextSessionAt, nextSessionAt) || other.nextSessionAt == nextSessionAt)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,title,description,projectType,profile,source,sourceId,startDate,targetEndDate,status,scheduleAtRisk,activePlanVersion,summary,completedMinutes,totalMinutes,completedTaskCount,totalTaskCount,completedMilestoneCount,totalMilestoneCount,currentMilestoneId,currentPhaseId,nextSessionAt,streak,preview,completedAt,createdAt,updatedAt]);
}

@override
String toString() {
    return 'Project(id: $id, title: $title, description: $description, projectType: $projectType, profile: $profile, source: $source, sourceId: $sourceId, startDate: $startDate, targetEndDate: $targetEndDate, status: $status, scheduleAtRisk: $scheduleAtRisk, activePlanVersion: $activePlanVersion, summary: $summary, completedMinutes: $completedMinutes, totalMinutes: $totalMinutes, completedTaskCount: $completedTaskCount, totalTaskCount: $totalTaskCount, completedMilestoneCount: $completedMilestoneCount, totalMilestoneCount: $totalMilestoneCount, currentMilestoneId: $currentMilestoneId, currentPhaseId: $currentPhaseId, nextSessionAt: $nextSessionAt, streak: $streak, preview: $preview, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String? projectType, ProjectProfile? profile, String? source, String? sourceId, DateTime? startDate, DateTime? targetEndDate,@JsonKey(unknownEnumValue: ProjectStatus.unknown) ProjectStatus status, bool scheduleAtRisk, int? activePlanVersion, String? summary, int completedMinutes, int totalMinutes, int completedTaskCount, int totalTaskCount, int completedMilestoneCount, int totalMilestoneCount, String? currentMilestoneId, String? currentPhaseId, DateTime? nextSessionAt, Streaks? streak, PlanPreview? preview, DateTime? completedAt, DateTime? createdAt, DateTime? updatedAt
});


@override $ProjectProfileCopyWith<$Res>? get profile;@override $StreaksCopyWith<$Res>? get streak;@override $PlanPreviewCopyWith<$Res>? get preview;

}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? projectType = freezed,Object? profile = freezed,Object? source = freezed,Object? sourceId = freezed,Object? startDate = freezed,Object? targetEndDate = freezed,Object? status = null,Object? scheduleAtRisk = null,Object? activePlanVersion = freezed,Object? summary = freezed,Object? completedMinutes = null,Object? totalMinutes = null,Object? completedTaskCount = null,Object? totalTaskCount = null,Object? completedMilestoneCount = null,Object? totalMilestoneCount = null,Object? currentMilestoneId = freezed,Object? currentPhaseId = freezed,Object? nextSessionAt = freezed,Object? streak = freezed,Object? preview = freezed,Object? completedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProjectProfile?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,targetEndDate: freezed == targetEndDate ? _self.targetEndDate : targetEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,scheduleAtRisk: null == scheduleAtRisk ? _self.scheduleAtRisk : scheduleAtRisk // ignore: cast_nullable_to_non_nullable
as bool,activePlanVersion: freezed == activePlanVersion ? _self.activePlanVersion : activePlanVersion // ignore: cast_nullable_to_non_nullable
as int?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,completedMinutes: null == completedMinutes ? _self.completedMinutes : completedMinutes // ignore: cast_nullable_to_non_nullable
as int,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,completedTaskCount: null == completedTaskCount ? _self.completedTaskCount : completedTaskCount // ignore: cast_nullable_to_non_nullable
as int,totalTaskCount: null == totalTaskCount ? _self.totalTaskCount : totalTaskCount // ignore: cast_nullable_to_non_nullable
as int,completedMilestoneCount: null == completedMilestoneCount ? _self.completedMilestoneCount : completedMilestoneCount // ignore: cast_nullable_to_non_nullable
as int,totalMilestoneCount: null == totalMilestoneCount ? _self.totalMilestoneCount : totalMilestoneCount // ignore: cast_nullable_to_non_nullable
as int,currentMilestoneId: freezed == currentMilestoneId ? _self.currentMilestoneId : currentMilestoneId // ignore: cast_nullable_to_non_nullable
as String?,currentPhaseId: freezed == currentPhaseId ? _self.currentPhaseId : currentPhaseId // ignore: cast_nullable_to_non_nullable
as String?,nextSessionAt: freezed == nextSessionAt ? _self.nextSessionAt : nextSessionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,streak: freezed == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as Streaks?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as PlanPreview?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $ProjectProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreaksCopyWith<$Res>? get streak {
    if (_self.streak == null) {
    return null;
  }

  return $StreaksCopyWith<$Res>(_self.streak!, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanPreviewCopyWith<$Res>? get preview {
    if (_self.preview == null) {
    return null;
  }

  return $PlanPreviewCopyWith<$Res>(_self.preview!, (value) {
    return _then(_self.copyWith(preview: value));
  });
}
}


/// @nodoc
mixin _$Phase {

 String get id; int? get planVersion; int get order; String get title; String? get description; DateTime? get startDate; DateTime? get endDate;@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus get status;
/// Create a copy of Phase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhaseCopyWith<Phase> get copyWith => _$PhaseCopyWithImpl<Phase>(this as Phase, _$identity);

  /// Serializes this Phase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Phase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Phase&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.planVersion, _this.planVersion) || other.planVersion == _this.planVersion)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Phase;
  return Object.hash(runtimeType,_this.id,_this.planVersion,_this.order,_this.title,_this.description,_this.startDate,_this.endDate,_this.status);
}

@override
String toString() {
  final _this = this as Phase;
  return 'Phase(id: ${_this.id}, planVersion: ${_this.planVersion}, order: ${_this.order}, title: ${_this.title}, description: ${_this.description}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $PhaseCopyWith<$Res>  {
  factory $PhaseCopyWith(Phase value, $Res Function(Phase) _then) = _$PhaseCopyWithImpl;
@useResult
$Res call({
 String id, int? planVersion, int order, String title, String? description, DateTime? startDate, DateTime? endDate,@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus status
});




}
/// @nodoc
class _$PhaseCopyWithImpl<$Res>
    implements $PhaseCopyWith<$Res> {
  _$PhaseCopyWithImpl(this._self, this._then);

  final Phase _self;
  final $Res Function(Phase) _then;

/// Create a copy of Phase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? planVersion = freezed,Object? order = null,Object? title = null,Object? description = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? status = null,}) {
  return _then(Phase(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MilestoneStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Phase].
extension PhasePatterns on Phase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Phase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Phase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Phase value)  $default,){
final _that = this;
switch (_that) {
case _Phase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Phase value)?  $default,){
final _that = this;
switch (_that) {
case _Phase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int? planVersion,  int order,  String title,  String? description,  DateTime? startDate,  DateTime? endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Phase() when $default != null:
return $default(_that.id,_that.planVersion,_that.order,_that.title,_that.description,_that.startDate,_that.endDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int? planVersion,  int order,  String title,  String? description,  DateTime? startDate,  DateTime? endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status)  $default,) {final _that = this;
switch (_that) {
case _Phase():
return $default(_that.id,_that.planVersion,_that.order,_that.title,_that.description,_that.startDate,_that.endDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int? planVersion,  int order,  String title,  String? description,  DateTime? startDate,  DateTime? endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status)?  $default,) {final _that = this;
switch (_that) {
case _Phase() when $default != null:
return $default(_that.id,_that.planVersion,_that.order,_that.title,_that.description,_that.startDate,_that.endDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Phase implements Phase {
  const _Phase({required this.id, this.planVersion, this.order = 0, this.title = '', this.description, this.startDate, this.endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown) this.status = MilestoneStatus.upcoming});
  factory _Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);

@override final  String id;
@override final  int? planVersion;
@override@JsonKey() final  int order;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey(unknownEnumValue: MilestoneStatus.unknown) final  MilestoneStatus status;

/// Create a copy of Phase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhaseCopyWith<_Phase> get copyWith => __$PhaseCopyWithImpl<_Phase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhaseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Phase&&(identical(other.id, id) || other.id == id)&&(identical(other.planVersion, planVersion) || other.planVersion == planVersion)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,planVersion,order,title,description,startDate,endDate,status);
}

@override
String toString() {
    return 'Phase(id: $id, planVersion: $planVersion, order: $order, title: $title, description: $description, startDate: $startDate, endDate: $endDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PhaseCopyWith<$Res> implements $PhaseCopyWith<$Res> {
  factory _$PhaseCopyWith(_Phase value, $Res Function(_Phase) _then) = __$PhaseCopyWithImpl;
@override @useResult
$Res call({
 String id, int? planVersion, int order, String title, String? description, DateTime? startDate, DateTime? endDate,@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus status
});




}
/// @nodoc
class __$PhaseCopyWithImpl<$Res>
    implements _$PhaseCopyWith<$Res> {
  __$PhaseCopyWithImpl(this._self, this._then);

  final _Phase _self;
  final $Res Function(_Phase) _then;

/// Create a copy of Phase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? planVersion = freezed,Object? order = null,Object? title = null,Object? description = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? status = null,}) {
  return _then(_Phase(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MilestoneStatus,
  ));
}


}


/// @nodoc
mixin _$Milestone {

 String get id; int? get planVersion; String? get phaseId; int get order; String get title; String? get description; DateTime? get targetDate;@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus get status; DateTime? get completedAt;
/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneCopyWith<Milestone> get copyWith => _$MilestoneCopyWithImpl<Milestone>(this as Milestone, _$identity);

  /// Serializes this Milestone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Milestone;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Milestone&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.planVersion, _this.planVersion) || other.planVersion == _this.planVersion)&&(identical(other.phaseId, _this.phaseId) || other.phaseId == _this.phaseId)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.targetDate, _this.targetDate) || other.targetDate == _this.targetDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Milestone;
  return Object.hash(runtimeType,_this.id,_this.planVersion,_this.phaseId,_this.order,_this.title,_this.description,_this.targetDate,_this.status,_this.completedAt);
}

@override
String toString() {
  final _this = this as Milestone;
  return 'Milestone(id: ${_this.id}, planVersion: ${_this.planVersion}, phaseId: ${_this.phaseId}, order: ${_this.order}, title: ${_this.title}, description: ${_this.description}, targetDate: ${_this.targetDate}, status: ${_this.status}, completedAt: ${_this.completedAt})';
}


}

/// @nodoc
abstract mixin class $MilestoneCopyWith<$Res>  {
  factory $MilestoneCopyWith(Milestone value, $Res Function(Milestone) _then) = _$MilestoneCopyWithImpl;
@useResult
$Res call({
 String id, int? planVersion, String? phaseId, int order, String title, String? description, DateTime? targetDate,@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus status, DateTime? completedAt
});




}
/// @nodoc
class _$MilestoneCopyWithImpl<$Res>
    implements $MilestoneCopyWith<$Res> {
  _$MilestoneCopyWithImpl(this._self, this._then);

  final Milestone _self;
  final $Res Function(Milestone) _then;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? planVersion = freezed,Object? phaseId = freezed,Object? order = null,Object? title = null,Object? description = freezed,Object? targetDate = freezed,Object? status = null,Object? completedAt = freezed,}) {
  return _then(Milestone(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,phaseId: freezed == phaseId ? _self.phaseId : phaseId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MilestoneStatus,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Milestone].
extension MilestonePatterns on Milestone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Milestone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Milestone value)  $default,){
final _that = this;
switch (_that) {
case _Milestone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Milestone value)?  $default,){
final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int? planVersion,  String? phaseId,  int order,  String title,  String? description,  DateTime? targetDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Milestone() when $default != null:
return $default(_that.id,_that.planVersion,_that.phaseId,_that.order,_that.title,_that.description,_that.targetDate,_that.status,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int? planVersion,  String? phaseId,  int order,  String title,  String? description,  DateTime? targetDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _Milestone():
return $default(_that.id,_that.planVersion,_that.phaseId,_that.order,_that.title,_that.description,_that.targetDate,_that.status,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int? planVersion,  String? phaseId,  int order,  String title,  String? description,  DateTime? targetDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _Milestone() when $default != null:
return $default(_that.id,_that.planVersion,_that.phaseId,_that.order,_that.title,_that.description,_that.targetDate,_that.status,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Milestone implements Milestone {
  const _Milestone({required this.id, this.planVersion, this.phaseId, this.order = 0, this.title = '', this.description, this.targetDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown) this.status = MilestoneStatus.upcoming, this.completedAt});
  factory _Milestone.fromJson(Map<String, dynamic> json) => _$MilestoneFromJson(json);

@override final  String id;
@override final  int? planVersion;
@override final  String? phaseId;
@override@JsonKey() final  int order;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  DateTime? targetDate;
@override@JsonKey(unknownEnumValue: MilestoneStatus.unknown) final  MilestoneStatus status;
@override final  DateTime? completedAt;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneCopyWith<_Milestone> get copyWith => __$MilestoneCopyWithImpl<_Milestone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Milestone&&(identical(other.id, id) || other.id == id)&&(identical(other.planVersion, planVersion) || other.planVersion == planVersion)&&(identical(other.phaseId, phaseId) || other.phaseId == phaseId)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,planVersion,phaseId,order,title,description,targetDate,status,completedAt);
}

@override
String toString() {
    return 'Milestone(id: $id, planVersion: $planVersion, phaseId: $phaseId, order: $order, title: $title, description: $description, targetDate: $targetDate, status: $status, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$MilestoneCopyWith<$Res> implements $MilestoneCopyWith<$Res> {
  factory _$MilestoneCopyWith(_Milestone value, $Res Function(_Milestone) _then) = __$MilestoneCopyWithImpl;
@override @useResult
$Res call({
 String id, int? planVersion, String? phaseId, int order, String title, String? description, DateTime? targetDate,@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus status, DateTime? completedAt
});




}
/// @nodoc
class __$MilestoneCopyWithImpl<$Res>
    implements _$MilestoneCopyWith<$Res> {
  __$MilestoneCopyWithImpl(this._self, this._then);

  final _Milestone _self;
  final $Res Function(_Milestone) _then;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? planVersion = freezed,Object? phaseId = freezed,Object? order = null,Object? title = null,Object? description = freezed,Object? targetDate = freezed,Object? status = null,Object? completedAt = freezed,}) {
  return _then(_Milestone(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,phaseId: freezed == phaseId ? _self.phaseId : phaseId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MilestoneStatus,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Task {

 String get id; String? get projectId; int? get planVersion; String? get milestoneId; String? get phaseId; int get order; String get title; String? get description; String? get completionCriteria; int get estimatedMinutes;@JsonKey(unknownEnumValue: TaskPriority.medium) TaskPriority get priority; List<String> get dependsOn; bool get actionable; DateTime? get suggestedDate; String? get sessionId;@JsonKey(unknownEnumValue: TaskStatus.unknown) TaskStatus get status; DateTime? get completedAt; String? get source;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Task;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.planVersion, _this.planVersion) || other.planVersion == _this.planVersion)&&(identical(other.milestoneId, _this.milestoneId) || other.milestoneId == _this.milestoneId)&&(identical(other.phaseId, _this.phaseId) || other.phaseId == _this.phaseId)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.completionCriteria, _this.completionCriteria) || other.completionCriteria == _this.completionCriteria)&&(identical(other.estimatedMinutes, _this.estimatedMinutes) || other.estimatedMinutes == _this.estimatedMinutes)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&const DeepCollectionEquality().equals(other.dependsOn, _this.dependsOn)&&(identical(other.actionable, _this.actionable) || other.actionable == _this.actionable)&&(identical(other.suggestedDate, _this.suggestedDate) || other.suggestedDate == _this.suggestedDate)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Task;
  return Object.hash(runtimeType,_this.id,_this.projectId,_this.planVersion,_this.milestoneId,_this.phaseId,_this.order,_this.title,_this.description,_this.completionCriteria,_this.estimatedMinutes,_this.priority,const DeepCollectionEquality().hash(_this.dependsOn),_this.actionable,_this.suggestedDate,_this.sessionId,_this.status,_this.completedAt,_this.source);
}

@override
String toString() {
  final _this = this as Task;
  return 'Task(id: ${_this.id}, projectId: ${_this.projectId}, planVersion: ${_this.planVersion}, milestoneId: ${_this.milestoneId}, phaseId: ${_this.phaseId}, order: ${_this.order}, title: ${_this.title}, description: ${_this.description}, completionCriteria: ${_this.completionCriteria}, estimatedMinutes: ${_this.estimatedMinutes}, priority: ${_this.priority}, dependsOn: ${_this.dependsOn}, actionable: ${_this.actionable}, suggestedDate: ${_this.suggestedDate}, sessionId: ${_this.sessionId}, status: ${_this.status}, completedAt: ${_this.completedAt}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 String id, String? projectId, int? planVersion, String? milestoneId, String? phaseId, int order, String title, String? description, String? completionCriteria, int estimatedMinutes,@JsonKey(unknownEnumValue: TaskPriority.medium) TaskPriority priority, List<String> dependsOn, bool actionable, DateTime? suggestedDate, String? sessionId,@JsonKey(unknownEnumValue: TaskStatus.unknown) TaskStatus status, DateTime? completedAt, String? source
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = freezed,Object? planVersion = freezed,Object? milestoneId = freezed,Object? phaseId = freezed,Object? order = null,Object? title = null,Object? description = freezed,Object? completionCriteria = freezed,Object? estimatedMinutes = null,Object? priority = null,Object? dependsOn = null,Object? actionable = null,Object? suggestedDate = freezed,Object? sessionId = freezed,Object? status = null,Object? completedAt = freezed,Object? source = freezed,}) {
  return _then(Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,milestoneId: freezed == milestoneId ? _self.milestoneId : milestoneId // ignore: cast_nullable_to_non_nullable
as String?,phaseId: freezed == phaseId ? _self.phaseId : phaseId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,completionCriteria: freezed == completionCriteria ? _self.completionCriteria : completionCriteria // ignore: cast_nullable_to_non_nullable
as String?,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,dependsOn: null == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as List<String>,actionable: null == actionable ? _self.actionable : actionable // ignore: cast_nullable_to_non_nullable
as bool,suggestedDate: freezed == suggestedDate ? _self.suggestedDate : suggestedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? projectId,  int? planVersion,  String? milestoneId,  String? phaseId,  int order,  String title,  String? description,  String? completionCriteria,  int estimatedMinutes, @JsonKey(unknownEnumValue: TaskPriority.medium)  TaskPriority priority,  List<String> dependsOn,  bool actionable,  DateTime? suggestedDate,  String? sessionId, @JsonKey(unknownEnumValue: TaskStatus.unknown)  TaskStatus status,  DateTime? completedAt,  String? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.projectId,_that.planVersion,_that.milestoneId,_that.phaseId,_that.order,_that.title,_that.description,_that.completionCriteria,_that.estimatedMinutes,_that.priority,_that.dependsOn,_that.actionable,_that.suggestedDate,_that.sessionId,_that.status,_that.completedAt,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? projectId,  int? planVersion,  String? milestoneId,  String? phaseId,  int order,  String title,  String? description,  String? completionCriteria,  int estimatedMinutes, @JsonKey(unknownEnumValue: TaskPriority.medium)  TaskPriority priority,  List<String> dependsOn,  bool actionable,  DateTime? suggestedDate,  String? sessionId, @JsonKey(unknownEnumValue: TaskStatus.unknown)  TaskStatus status,  DateTime? completedAt,  String? source)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.projectId,_that.planVersion,_that.milestoneId,_that.phaseId,_that.order,_that.title,_that.description,_that.completionCriteria,_that.estimatedMinutes,_that.priority,_that.dependsOn,_that.actionable,_that.suggestedDate,_that.sessionId,_that.status,_that.completedAt,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? projectId,  int? planVersion,  String? milestoneId,  String? phaseId,  int order,  String title,  String? description,  String? completionCriteria,  int estimatedMinutes, @JsonKey(unknownEnumValue: TaskPriority.medium)  TaskPriority priority,  List<String> dependsOn,  bool actionable,  DateTime? suggestedDate,  String? sessionId, @JsonKey(unknownEnumValue: TaskStatus.unknown)  TaskStatus status,  DateTime? completedAt,  String? source)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.projectId,_that.planVersion,_that.milestoneId,_that.phaseId,_that.order,_that.title,_that.description,_that.completionCriteria,_that.estimatedMinutes,_that.priority,_that.dependsOn,_that.actionable,_that.suggestedDate,_that.sessionId,_that.status,_that.completedAt,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Task extends Task {
  const _Task({required this.id, this.projectId, this.planVersion, this.milestoneId, this.phaseId, this.order = 0, this.title = '', this.description, this.completionCriteria, this.estimatedMinutes = 30, @JsonKey(unknownEnumValue: TaskPriority.medium) this.priority = TaskPriority.medium,  List<String> dependsOn = const <String>[], this.actionable = false, this.suggestedDate, this.sessionId, @JsonKey(unknownEnumValue: TaskStatus.unknown) this.status = TaskStatus.pending, this.completedAt, this.source}): _dependsOn = dependsOn,super._();
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override final  String id;
@override final  String? projectId;
@override final  int? planVersion;
@override final  String? milestoneId;
@override final  String? phaseId;
@override@JsonKey() final  int order;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  String? completionCriteria;
@override@JsonKey() final  int estimatedMinutes;
@override@JsonKey(unknownEnumValue: TaskPriority.medium) final  TaskPriority priority;
 final  List<String> _dependsOn;
@override@JsonKey() List<String> get dependsOn {
  if (_dependsOn is EqualUnmodifiableListView) return _dependsOn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dependsOn);
}

@override@JsonKey() final  bool actionable;
@override final  DateTime? suggestedDate;
@override final  String? sessionId;
@override@JsonKey(unknownEnumValue: TaskStatus.unknown) final  TaskStatus status;
@override final  DateTime? completedAt;
@override final  String? source;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.planVersion, planVersion) || other.planVersion == planVersion)&&(identical(other.milestoneId, milestoneId) || other.milestoneId == milestoneId)&&(identical(other.phaseId, phaseId) || other.phaseId == phaseId)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.completionCriteria, completionCriteria) || other.completionCriteria == completionCriteria)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.dependsOn, _dependsOn)&&(identical(other.actionable, actionable) || other.actionable == actionable)&&(identical(other.suggestedDate, suggestedDate) || other.suggestedDate == suggestedDate)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,projectId,planVersion,milestoneId,phaseId,order,title,description,completionCriteria,estimatedMinutes,priority,const DeepCollectionEquality().hash(_dependsOn),actionable,suggestedDate,sessionId,status,completedAt,source);
}

@override
String toString() {
    return 'Task(id: $id, projectId: $projectId, planVersion: $planVersion, milestoneId: $milestoneId, phaseId: $phaseId, order: $order, title: $title, description: $description, completionCriteria: $completionCriteria, estimatedMinutes: $estimatedMinutes, priority: $priority, dependsOn: $dependsOn, actionable: $actionable, suggestedDate: $suggestedDate, sessionId: $sessionId, status: $status, completedAt: $completedAt, source: $source)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String? projectId, int? planVersion, String? milestoneId, String? phaseId, int order, String title, String? description, String? completionCriteria, int estimatedMinutes,@JsonKey(unknownEnumValue: TaskPriority.medium) TaskPriority priority, List<String> dependsOn, bool actionable, DateTime? suggestedDate, String? sessionId,@JsonKey(unknownEnumValue: TaskStatus.unknown) TaskStatus status, DateTime? completedAt, String? source
});




}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = freezed,Object? planVersion = freezed,Object? milestoneId = freezed,Object? phaseId = freezed,Object? order = null,Object? title = null,Object? description = freezed,Object? completionCriteria = freezed,Object? estimatedMinutes = null,Object? priority = null,Object? dependsOn = null,Object? actionable = null,Object? suggestedDate = freezed,Object? sessionId = freezed,Object? status = null,Object? completedAt = freezed,Object? source = freezed,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,milestoneId: freezed == milestoneId ? _self.milestoneId : milestoneId // ignore: cast_nullable_to_non_nullable
as String?,phaseId: freezed == phaseId ? _self.phaseId : phaseId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,completionCriteria: freezed == completionCriteria ? _self.completionCriteria : completionCriteria // ignore: cast_nullable_to_non_nullable
as String?,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,dependsOn: null == dependsOn ? _self._dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as List<String>,actionable: null == actionable ? _self.actionable : actionable // ignore: cast_nullable_to_non_nullable
as bool,suggestedDate: freezed == suggestedDate ? _self.suggestedDate : suggestedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WorkSession {

 String get id; String? get projectId; int? get planVersion; DateTime get startsAt; DateTime? get endsAt; int get durationMinutes;@JsonKey(unknownEnumValue: SessionStatus.unknown) SessionStatus get status; List<String> get taskIds; String? get googleEventId;
/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<WorkSession> get copyWith => _$WorkSessionCopyWithImpl<WorkSession>(this as WorkSession, _$identity);

  /// Serializes this WorkSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WorkSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.planVersion, _this.planVersion) || other.planVersion == _this.planVersion)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.taskIds, _this.taskIds)&&(identical(other.googleEventId, _this.googleEventId) || other.googleEventId == _this.googleEventId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WorkSession;
  return Object.hash(runtimeType,_this.id,_this.projectId,_this.planVersion,_this.startsAt,_this.endsAt,_this.durationMinutes,_this.status,const DeepCollectionEquality().hash(_this.taskIds),_this.googleEventId);
}

@override
String toString() {
  final _this = this as WorkSession;
  return 'WorkSession(id: ${_this.id}, projectId: ${_this.projectId}, planVersion: ${_this.planVersion}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, durationMinutes: ${_this.durationMinutes}, status: ${_this.status}, taskIds: ${_this.taskIds}, googleEventId: ${_this.googleEventId})';
}


}

/// @nodoc
abstract mixin class $WorkSessionCopyWith<$Res>  {
  factory $WorkSessionCopyWith(WorkSession value, $Res Function(WorkSession) _then) = _$WorkSessionCopyWithImpl;
@useResult
$Res call({
 String id, String? projectId, int? planVersion, DateTime startsAt, DateTime? endsAt, int durationMinutes,@JsonKey(unknownEnumValue: SessionStatus.unknown) SessionStatus status, List<String> taskIds, String? googleEventId
});




}
/// @nodoc
class _$WorkSessionCopyWithImpl<$Res>
    implements $WorkSessionCopyWith<$Res> {
  _$WorkSessionCopyWithImpl(this._self, this._then);

  final WorkSession _self;
  final $Res Function(WorkSession) _then;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = freezed,Object? planVersion = freezed,Object? startsAt = null,Object? endsAt = freezed,Object? durationMinutes = null,Object? status = null,Object? taskIds = null,Object? googleEventId = freezed,}) {
  return _then(WorkSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,taskIds: null == taskIds ? _self.taskIds : taskIds // ignore: cast_nullable_to_non_nullable
as List<String>,googleEventId: freezed == googleEventId ? _self.googleEventId : googleEventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkSession].
extension WorkSessionPatterns on WorkSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkSession value)  $default,){
final _that = this;
switch (_that) {
case _WorkSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkSession value)?  $default,){
final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? projectId,  int? planVersion,  DateTime startsAt,  DateTime? endsAt,  int durationMinutes, @JsonKey(unknownEnumValue: SessionStatus.unknown)  SessionStatus status,  List<String> taskIds,  String? googleEventId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that.id,_that.projectId,_that.planVersion,_that.startsAt,_that.endsAt,_that.durationMinutes,_that.status,_that.taskIds,_that.googleEventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? projectId,  int? planVersion,  DateTime startsAt,  DateTime? endsAt,  int durationMinutes, @JsonKey(unknownEnumValue: SessionStatus.unknown)  SessionStatus status,  List<String> taskIds,  String? googleEventId)  $default,) {final _that = this;
switch (_that) {
case _WorkSession():
return $default(_that.id,_that.projectId,_that.planVersion,_that.startsAt,_that.endsAt,_that.durationMinutes,_that.status,_that.taskIds,_that.googleEventId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? projectId,  int? planVersion,  DateTime startsAt,  DateTime? endsAt,  int durationMinutes, @JsonKey(unknownEnumValue: SessionStatus.unknown)  SessionStatus status,  List<String> taskIds,  String? googleEventId)?  $default,) {final _that = this;
switch (_that) {
case _WorkSession() when $default != null:
return $default(_that.id,_that.projectId,_that.planVersion,_that.startsAt,_that.endsAt,_that.durationMinutes,_that.status,_that.taskIds,_that.googleEventId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkSession extends WorkSession {
  const _WorkSession({required this.id, this.projectId, this.planVersion, required this.startsAt, this.endsAt, this.durationMinutes = 60, @JsonKey(unknownEnumValue: SessionStatus.unknown) this.status = SessionStatus.scheduled,  List<String> taskIds = const <String>[], this.googleEventId}): _taskIds = taskIds,super._();
  factory _WorkSession.fromJson(Map<String, dynamic> json) => _$WorkSessionFromJson(json);

@override final  String id;
@override final  String? projectId;
@override final  int? planVersion;
@override final  DateTime startsAt;
@override final  DateTime? endsAt;
@override@JsonKey() final  int durationMinutes;
@override@JsonKey(unknownEnumValue: SessionStatus.unknown) final  SessionStatus status;
 final  List<String> _taskIds;
@override@JsonKey() List<String> get taskIds {
  if (_taskIds is EqualUnmodifiableListView) return _taskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taskIds);
}

@override final  String? googleEventId;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkSessionCopyWith<_WorkSession> get copyWith => __$WorkSessionCopyWithImpl<_WorkSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkSessionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkSession&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.planVersion, planVersion) || other.planVersion == planVersion)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.taskIds, _taskIds)&&(identical(other.googleEventId, googleEventId) || other.googleEventId == googleEventId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,projectId,planVersion,startsAt,endsAt,durationMinutes,status,const DeepCollectionEquality().hash(_taskIds),googleEventId);
}

@override
String toString() {
    return 'WorkSession(id: $id, projectId: $projectId, planVersion: $planVersion, startsAt: $startsAt, endsAt: $endsAt, durationMinutes: $durationMinutes, status: $status, taskIds: $taskIds, googleEventId: $googleEventId)';
}


}

/// @nodoc
abstract mixin class _$WorkSessionCopyWith<$Res> implements $WorkSessionCopyWith<$Res> {
  factory _$WorkSessionCopyWith(_WorkSession value, $Res Function(_WorkSession) _then) = __$WorkSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String? projectId, int? planVersion, DateTime startsAt, DateTime? endsAt, int durationMinutes,@JsonKey(unknownEnumValue: SessionStatus.unknown) SessionStatus status, List<String> taskIds, String? googleEventId
});




}
/// @nodoc
class __$WorkSessionCopyWithImpl<$Res>
    implements _$WorkSessionCopyWith<$Res> {
  __$WorkSessionCopyWithImpl(this._self, this._then);

  final _WorkSession _self;
  final $Res Function(_WorkSession) _then;

/// Create a copy of WorkSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = freezed,Object? planVersion = freezed,Object? startsAt = null,Object? endsAt = freezed,Object? durationMinutes = null,Object? status = null,Object? taskIds = null,Object? googleEventId = freezed,}) {
  return _then(_WorkSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,taskIds: null == taskIds ? _self._taskIds : taskIds // ignore: cast_nullable_to_non_nullable
as List<String>,googleEventId: freezed == googleEventId ? _self.googleEventId : googleEventId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NamedRef {

 String? get id; String get title; DateTime? get date; DateTime? get targetDate; String? get kind;
/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedRefCopyWith<NamedRef> get copyWith => _$NamedRefCopyWithImpl<NamedRef>(this as NamedRef, _$identity);

  /// Serializes this NamedRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NamedRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedRef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.targetDate, _this.targetDate) || other.targetDate == _this.targetDate)&&(identical(other.kind, _this.kind) || other.kind == _this.kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NamedRef;
  return Object.hash(runtimeType,_this.id,_this.title,_this.date,_this.targetDate,_this.kind);
}

@override
String toString() {
  final _this = this as NamedRef;
  return 'NamedRef(id: ${_this.id}, title: ${_this.title}, date: ${_this.date}, targetDate: ${_this.targetDate}, kind: ${_this.kind})';
}


}

/// @nodoc
abstract mixin class $NamedRefCopyWith<$Res>  {
  factory $NamedRefCopyWith(NamedRef value, $Res Function(NamedRef) _then) = _$NamedRefCopyWithImpl;
@useResult
$Res call({
 String? id, String title, DateTime? date, DateTime? targetDate, String? kind
});




}
/// @nodoc
class _$NamedRefCopyWithImpl<$Res>
    implements $NamedRefCopyWith<$Res> {
  _$NamedRefCopyWithImpl(this._self, this._then);

  final NamedRef _self;
  final $Res Function(NamedRef) _then;

/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? date = freezed,Object? targetDate = freezed,Object? kind = freezed,}) {
  return _then(NamedRef(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NamedRef].
extension NamedRefPatterns on NamedRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamedRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamedRef value)  $default,){
final _that = this;
switch (_that) {
case _NamedRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamedRef value)?  $default,){
final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  DateTime? date,  DateTime? targetDate,  String? kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.targetDate,_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  DateTime? date,  DateTime? targetDate,  String? kind)  $default,) {final _that = this;
switch (_that) {
case _NamedRef():
return $default(_that.id,_that.title,_that.date,_that.targetDate,_that.kind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  DateTime? date,  DateTime? targetDate,  String? kind)?  $default,) {final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.targetDate,_that.kind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NamedRef implements NamedRef {
  const _NamedRef({this.id, this.title = '', this.date, this.targetDate, this.kind});
  factory _NamedRef.fromJson(Map<String, dynamic> json) => _$NamedRefFromJson(json);

@override final  String? id;
@override@JsonKey() final  String title;
@override final  DateTime? date;
@override final  DateTime? targetDate;
@override final  String? kind;

/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamedRefCopyWith<_NamedRef> get copyWith => __$NamedRefCopyWithImpl<_NamedRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedRefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamedRef&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,date,targetDate,kind);
}

@override
String toString() {
    return 'NamedRef(id: $id, title: $title, date: $date, targetDate: $targetDate, kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$NamedRefCopyWith<$Res> implements $NamedRefCopyWith<$Res> {
  factory _$NamedRefCopyWith(_NamedRef value, $Res Function(_NamedRef) _then) = __$NamedRefCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, DateTime? date, DateTime? targetDate, String? kind
});




}
/// @nodoc
class __$NamedRefCopyWithImpl<$Res>
    implements _$NamedRefCopyWith<$Res> {
  __$NamedRefCopyWithImpl(this._self, this._then);

  final _NamedRef _self;
  final $Res Function(_NamedRef) _then;

/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? date = freezed,Object? targetDate = freezed,Object? kind = freezed,}) {
  return _then(_NamedRef(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Progress {

 double get percentComplete; int get completedMinutes; int get remainingMinutes; double get projectedPercentByWeekEnd; NamedRef? get currentPhase; NamedRef? get currentMilestone; NamedRef? get nextDeadline; int? get daysLeft; bool get onTrack; Streaks? get streaks;
/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressCopyWith<Progress> get copyWith => _$ProgressCopyWithImpl<Progress>(this as Progress, _$identity);

  /// Serializes this Progress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Progress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Progress&&(identical(other.percentComplete, _this.percentComplete) || other.percentComplete == _this.percentComplete)&&(identical(other.completedMinutes, _this.completedMinutes) || other.completedMinutes == _this.completedMinutes)&&(identical(other.remainingMinutes, _this.remainingMinutes) || other.remainingMinutes == _this.remainingMinutes)&&(identical(other.projectedPercentByWeekEnd, _this.projectedPercentByWeekEnd) || other.projectedPercentByWeekEnd == _this.projectedPercentByWeekEnd)&&(identical(other.currentPhase, _this.currentPhase) || other.currentPhase == _this.currentPhase)&&(identical(other.currentMilestone, _this.currentMilestone) || other.currentMilestone == _this.currentMilestone)&&(identical(other.nextDeadline, _this.nextDeadline) || other.nextDeadline == _this.nextDeadline)&&(identical(other.daysLeft, _this.daysLeft) || other.daysLeft == _this.daysLeft)&&(identical(other.onTrack, _this.onTrack) || other.onTrack == _this.onTrack)&&(identical(other.streaks, _this.streaks) || other.streaks == _this.streaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Progress;
  return Object.hash(runtimeType,_this.percentComplete,_this.completedMinutes,_this.remainingMinutes,_this.projectedPercentByWeekEnd,_this.currentPhase,_this.currentMilestone,_this.nextDeadline,_this.daysLeft,_this.onTrack,_this.streaks);
}

@override
String toString() {
  final _this = this as Progress;
  return 'Progress(percentComplete: ${_this.percentComplete}, completedMinutes: ${_this.completedMinutes}, remainingMinutes: ${_this.remainingMinutes}, projectedPercentByWeekEnd: ${_this.projectedPercentByWeekEnd}, currentPhase: ${_this.currentPhase}, currentMilestone: ${_this.currentMilestone}, nextDeadline: ${_this.nextDeadline}, daysLeft: ${_this.daysLeft}, onTrack: ${_this.onTrack}, streaks: ${_this.streaks})';
}


}

/// @nodoc
abstract mixin class $ProgressCopyWith<$Res>  {
  factory $ProgressCopyWith(Progress value, $Res Function(Progress) _then) = _$ProgressCopyWithImpl;
@useResult
$Res call({
 double percentComplete, int completedMinutes, int remainingMinutes, double projectedPercentByWeekEnd, NamedRef? currentPhase, NamedRef? currentMilestone, NamedRef? nextDeadline, int? daysLeft, bool onTrack, Streaks? streaks
});


$NamedRefCopyWith<$Res>? get currentPhase;$NamedRefCopyWith<$Res>? get currentMilestone;$NamedRefCopyWith<$Res>? get nextDeadline;$StreaksCopyWith<$Res>? get streaks;

}
/// @nodoc
class _$ProgressCopyWithImpl<$Res>
    implements $ProgressCopyWith<$Res> {
  _$ProgressCopyWithImpl(this._self, this._then);

  final Progress _self;
  final $Res Function(Progress) _then;

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? percentComplete = null,Object? completedMinutes = null,Object? remainingMinutes = null,Object? projectedPercentByWeekEnd = null,Object? currentPhase = freezed,Object? currentMilestone = freezed,Object? nextDeadline = freezed,Object? daysLeft = freezed,Object? onTrack = null,Object? streaks = freezed,}) {
  return _then(Progress(
percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as double,completedMinutes: null == completedMinutes ? _self.completedMinutes : completedMinutes // ignore: cast_nullable_to_non_nullable
as int,remainingMinutes: null == remainingMinutes ? _self.remainingMinutes : remainingMinutes // ignore: cast_nullable_to_non_nullable
as int,projectedPercentByWeekEnd: null == projectedPercentByWeekEnd ? _self.projectedPercentByWeekEnd : projectedPercentByWeekEnd // ignore: cast_nullable_to_non_nullable
as double,currentPhase: freezed == currentPhase ? _self.currentPhase : currentPhase // ignore: cast_nullable_to_non_nullable
as NamedRef?,currentMilestone: freezed == currentMilestone ? _self.currentMilestone : currentMilestone // ignore: cast_nullable_to_non_nullable
as NamedRef?,nextDeadline: freezed == nextDeadline ? _self.nextDeadline : nextDeadline // ignore: cast_nullable_to_non_nullable
as NamedRef?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,onTrack: null == onTrack ? _self.onTrack : onTrack // ignore: cast_nullable_to_non_nullable
as bool,streaks: freezed == streaks ? _self.streaks : streaks // ignore: cast_nullable_to_non_nullable
as Streaks?,
  ));
}
/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get currentPhase {
    if (_self.currentPhase == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.currentPhase!, (value) {
    return _then(_self.copyWith(currentPhase: value));
  });
}/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get currentMilestone {
    if (_self.currentMilestone == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.currentMilestone!, (value) {
    return _then(_self.copyWith(currentMilestone: value));
  });
}/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get nextDeadline {
    if (_self.nextDeadline == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.nextDeadline!, (value) {
    return _then(_self.copyWith(nextDeadline: value));
  });
}/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreaksCopyWith<$Res>? get streaks {
    if (_self.streaks == null) {
    return null;
  }

  return $StreaksCopyWith<$Res>(_self.streaks!, (value) {
    return _then(_self.copyWith(streaks: value));
  });
}
}


/// Adds pattern-matching-related methods to [Progress].
extension ProgressPatterns on Progress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Progress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Progress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Progress value)  $default,){
final _that = this;
switch (_that) {
case _Progress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Progress value)?  $default,){
final _that = this;
switch (_that) {
case _Progress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double percentComplete,  int completedMinutes,  int remainingMinutes,  double projectedPercentByWeekEnd,  NamedRef? currentPhase,  NamedRef? currentMilestone,  NamedRef? nextDeadline,  int? daysLeft,  bool onTrack,  Streaks? streaks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Progress() when $default != null:
return $default(_that.percentComplete,_that.completedMinutes,_that.remainingMinutes,_that.projectedPercentByWeekEnd,_that.currentPhase,_that.currentMilestone,_that.nextDeadline,_that.daysLeft,_that.onTrack,_that.streaks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double percentComplete,  int completedMinutes,  int remainingMinutes,  double projectedPercentByWeekEnd,  NamedRef? currentPhase,  NamedRef? currentMilestone,  NamedRef? nextDeadline,  int? daysLeft,  bool onTrack,  Streaks? streaks)  $default,) {final _that = this;
switch (_that) {
case _Progress():
return $default(_that.percentComplete,_that.completedMinutes,_that.remainingMinutes,_that.projectedPercentByWeekEnd,_that.currentPhase,_that.currentMilestone,_that.nextDeadline,_that.daysLeft,_that.onTrack,_that.streaks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double percentComplete,  int completedMinutes,  int remainingMinutes,  double projectedPercentByWeekEnd,  NamedRef? currentPhase,  NamedRef? currentMilestone,  NamedRef? nextDeadline,  int? daysLeft,  bool onTrack,  Streaks? streaks)?  $default,) {final _that = this;
switch (_that) {
case _Progress() when $default != null:
return $default(_that.percentComplete,_that.completedMinutes,_that.remainingMinutes,_that.projectedPercentByWeekEnd,_that.currentPhase,_that.currentMilestone,_that.nextDeadline,_that.daysLeft,_that.onTrack,_that.streaks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Progress extends Progress {
  const _Progress({this.percentComplete = 0, this.completedMinutes = 0, this.remainingMinutes = 0, this.projectedPercentByWeekEnd = 0, this.currentPhase, this.currentMilestone, this.nextDeadline, this.daysLeft, this.onTrack = true, this.streaks}): super._();
  factory _Progress.fromJson(Map<String, dynamic> json) => _$ProgressFromJson(json);

@override@JsonKey() final  double percentComplete;
@override@JsonKey() final  int completedMinutes;
@override@JsonKey() final  int remainingMinutes;
@override@JsonKey() final  double projectedPercentByWeekEnd;
@override final  NamedRef? currentPhase;
@override final  NamedRef? currentMilestone;
@override final  NamedRef? nextDeadline;
@override final  int? daysLeft;
@override@JsonKey() final  bool onTrack;
@override final  Streaks? streaks;

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressCopyWith<_Progress> get copyWith => __$ProgressCopyWithImpl<_Progress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Progress&&(identical(other.percentComplete, percentComplete) || other.percentComplete == percentComplete)&&(identical(other.completedMinutes, completedMinutes) || other.completedMinutes == completedMinutes)&&(identical(other.remainingMinutes, remainingMinutes) || other.remainingMinutes == remainingMinutes)&&(identical(other.projectedPercentByWeekEnd, projectedPercentByWeekEnd) || other.projectedPercentByWeekEnd == projectedPercentByWeekEnd)&&(identical(other.currentPhase, currentPhase) || other.currentPhase == currentPhase)&&(identical(other.currentMilestone, currentMilestone) || other.currentMilestone == currentMilestone)&&(identical(other.nextDeadline, nextDeadline) || other.nextDeadline == nextDeadline)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.onTrack, onTrack) || other.onTrack == onTrack)&&(identical(other.streaks, streaks) || other.streaks == streaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,percentComplete,completedMinutes,remainingMinutes,projectedPercentByWeekEnd,currentPhase,currentMilestone,nextDeadline,daysLeft,onTrack,streaks);
}

@override
String toString() {
    return 'Progress(percentComplete: $percentComplete, completedMinutes: $completedMinutes, remainingMinutes: $remainingMinutes, projectedPercentByWeekEnd: $projectedPercentByWeekEnd, currentPhase: $currentPhase, currentMilestone: $currentMilestone, nextDeadline: $nextDeadline, daysLeft: $daysLeft, onTrack: $onTrack, streaks: $streaks)';
}


}

/// @nodoc
abstract mixin class _$ProgressCopyWith<$Res> implements $ProgressCopyWith<$Res> {
  factory _$ProgressCopyWith(_Progress value, $Res Function(_Progress) _then) = __$ProgressCopyWithImpl;
@override @useResult
$Res call({
 double percentComplete, int completedMinutes, int remainingMinutes, double projectedPercentByWeekEnd, NamedRef? currentPhase, NamedRef? currentMilestone, NamedRef? nextDeadline, int? daysLeft, bool onTrack, Streaks? streaks
});


@override $NamedRefCopyWith<$Res>? get currentPhase;@override $NamedRefCopyWith<$Res>? get currentMilestone;@override $NamedRefCopyWith<$Res>? get nextDeadline;@override $StreaksCopyWith<$Res>? get streaks;

}
/// @nodoc
class __$ProgressCopyWithImpl<$Res>
    implements _$ProgressCopyWith<$Res> {
  __$ProgressCopyWithImpl(this._self, this._then);

  final _Progress _self;
  final $Res Function(_Progress) _then;

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? percentComplete = null,Object? completedMinutes = null,Object? remainingMinutes = null,Object? projectedPercentByWeekEnd = null,Object? currentPhase = freezed,Object? currentMilestone = freezed,Object? nextDeadline = freezed,Object? daysLeft = freezed,Object? onTrack = null,Object? streaks = freezed,}) {
  return _then(_Progress(
percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as double,completedMinutes: null == completedMinutes ? _self.completedMinutes : completedMinutes // ignore: cast_nullable_to_non_nullable
as int,remainingMinutes: null == remainingMinutes ? _self.remainingMinutes : remainingMinutes // ignore: cast_nullable_to_non_nullable
as int,projectedPercentByWeekEnd: null == projectedPercentByWeekEnd ? _self.projectedPercentByWeekEnd : projectedPercentByWeekEnd // ignore: cast_nullable_to_non_nullable
as double,currentPhase: freezed == currentPhase ? _self.currentPhase : currentPhase // ignore: cast_nullable_to_non_nullable
as NamedRef?,currentMilestone: freezed == currentMilestone ? _self.currentMilestone : currentMilestone // ignore: cast_nullable_to_non_nullable
as NamedRef?,nextDeadline: freezed == nextDeadline ? _self.nextDeadline : nextDeadline // ignore: cast_nullable_to_non_nullable
as NamedRef?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,onTrack: null == onTrack ? _self.onTrack : onTrack // ignore: cast_nullable_to_non_nullable
as bool,streaks: freezed == streaks ? _self.streaks : streaks // ignore: cast_nullable_to_non_nullable
as Streaks?,
  ));
}

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get currentPhase {
    if (_self.currentPhase == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.currentPhase!, (value) {
    return _then(_self.copyWith(currentPhase: value));
  });
}/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get currentMilestone {
    if (_self.currentMilestone == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.currentMilestone!, (value) {
    return _then(_self.copyWith(currentMilestone: value));
  });
}/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get nextDeadline {
    if (_self.nextDeadline == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.nextDeadline!, (value) {
    return _then(_self.copyWith(nextDeadline: value));
  });
}/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreaksCopyWith<$Res>? get streaks {
    if (_self.streaks == null) {
    return null;
  }

  return $StreaksCopyWith<$Res>(_self.streaks!, (value) {
    return _then(_self.copyWith(streaks: value));
  });
}
}


/// @nodoc
mixin _$Timeline {

 DateTime? get startDate; DateTime? get targetEndDate; List<TimelinePhase> get phases; int get completedMinutes; int get remainingMinutes; double get percentComplete; double get projectedPercentByWeekEnd; List<NamedRef> get upcomingDeadlines;
/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineCopyWith<Timeline> get copyWith => _$TimelineCopyWithImpl<Timeline>(this as Timeline, _$identity);

  /// Serializes this Timeline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Timeline;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timeline&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.targetEndDate, _this.targetEndDate) || other.targetEndDate == _this.targetEndDate)&&const DeepCollectionEquality().equals(other.phases, _this.phases)&&(identical(other.completedMinutes, _this.completedMinutes) || other.completedMinutes == _this.completedMinutes)&&(identical(other.remainingMinutes, _this.remainingMinutes) || other.remainingMinutes == _this.remainingMinutes)&&(identical(other.percentComplete, _this.percentComplete) || other.percentComplete == _this.percentComplete)&&(identical(other.projectedPercentByWeekEnd, _this.projectedPercentByWeekEnd) || other.projectedPercentByWeekEnd == _this.projectedPercentByWeekEnd)&&const DeepCollectionEquality().equals(other.upcomingDeadlines, _this.upcomingDeadlines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Timeline;
  return Object.hash(runtimeType,_this.startDate,_this.targetEndDate,const DeepCollectionEquality().hash(_this.phases),_this.completedMinutes,_this.remainingMinutes,_this.percentComplete,_this.projectedPercentByWeekEnd,const DeepCollectionEquality().hash(_this.upcomingDeadlines));
}

@override
String toString() {
  final _this = this as Timeline;
  return 'Timeline(startDate: ${_this.startDate}, targetEndDate: ${_this.targetEndDate}, phases: ${_this.phases}, completedMinutes: ${_this.completedMinutes}, remainingMinutes: ${_this.remainingMinutes}, percentComplete: ${_this.percentComplete}, projectedPercentByWeekEnd: ${_this.projectedPercentByWeekEnd}, upcomingDeadlines: ${_this.upcomingDeadlines})';
}


}

/// @nodoc
abstract mixin class $TimelineCopyWith<$Res>  {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) _then) = _$TimelineCopyWithImpl;
@useResult
$Res call({
 DateTime? startDate, DateTime? targetEndDate, List<TimelinePhase> phases, int completedMinutes, int remainingMinutes, double percentComplete, double projectedPercentByWeekEnd, List<NamedRef> upcomingDeadlines
});




}
/// @nodoc
class _$TimelineCopyWithImpl<$Res>
    implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._self, this._then);

  final Timeline _self;
  final $Res Function(Timeline) _then;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? targetEndDate = freezed,Object? phases = null,Object? completedMinutes = null,Object? remainingMinutes = null,Object? percentComplete = null,Object? projectedPercentByWeekEnd = null,Object? upcomingDeadlines = null,}) {
  return _then(Timeline(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,targetEndDate: freezed == targetEndDate ? _self.targetEndDate : targetEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<TimelinePhase>,completedMinutes: null == completedMinutes ? _self.completedMinutes : completedMinutes // ignore: cast_nullable_to_non_nullable
as int,remainingMinutes: null == remainingMinutes ? _self.remainingMinutes : remainingMinutes // ignore: cast_nullable_to_non_nullable
as int,percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as double,projectedPercentByWeekEnd: null == projectedPercentByWeekEnd ? _self.projectedPercentByWeekEnd : projectedPercentByWeekEnd // ignore: cast_nullable_to_non_nullable
as double,upcomingDeadlines: null == upcomingDeadlines ? _self.upcomingDeadlines : upcomingDeadlines // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,
  ));
}

}


/// Adds pattern-matching-related methods to [Timeline].
extension TimelinePatterns on Timeline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timeline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timeline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timeline value)  $default,){
final _that = this;
switch (_that) {
case _Timeline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timeline value)?  $default,){
final _that = this;
switch (_that) {
case _Timeline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? targetEndDate,  List<TimelinePhase> phases,  int completedMinutes,  int remainingMinutes,  double percentComplete,  double projectedPercentByWeekEnd,  List<NamedRef> upcomingDeadlines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timeline() when $default != null:
return $default(_that.startDate,_that.targetEndDate,_that.phases,_that.completedMinutes,_that.remainingMinutes,_that.percentComplete,_that.projectedPercentByWeekEnd,_that.upcomingDeadlines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? targetEndDate,  List<TimelinePhase> phases,  int completedMinutes,  int remainingMinutes,  double percentComplete,  double projectedPercentByWeekEnd,  List<NamedRef> upcomingDeadlines)  $default,) {final _that = this;
switch (_that) {
case _Timeline():
return $default(_that.startDate,_that.targetEndDate,_that.phases,_that.completedMinutes,_that.remainingMinutes,_that.percentComplete,_that.projectedPercentByWeekEnd,_that.upcomingDeadlines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? startDate,  DateTime? targetEndDate,  List<TimelinePhase> phases,  int completedMinutes,  int remainingMinutes,  double percentComplete,  double projectedPercentByWeekEnd,  List<NamedRef> upcomingDeadlines)?  $default,) {final _that = this;
switch (_that) {
case _Timeline() when $default != null:
return $default(_that.startDate,_that.targetEndDate,_that.phases,_that.completedMinutes,_that.remainingMinutes,_that.percentComplete,_that.projectedPercentByWeekEnd,_that.upcomingDeadlines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timeline implements Timeline {
  const _Timeline({this.startDate, this.targetEndDate,  List<TimelinePhase> phases = const <TimelinePhase>[], this.completedMinutes = 0, this.remainingMinutes = 0, this.percentComplete = 0, this.projectedPercentByWeekEnd = 0,  List<NamedRef> upcomingDeadlines = const <NamedRef>[]}): _phases = phases,_upcomingDeadlines = upcomingDeadlines;
  factory _Timeline.fromJson(Map<String, dynamic> json) => _$TimelineFromJson(json);

@override final  DateTime? startDate;
@override final  DateTime? targetEndDate;
 final  List<TimelinePhase> _phases;
@override@JsonKey() List<TimelinePhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}

@override@JsonKey() final  int completedMinutes;
@override@JsonKey() final  int remainingMinutes;
@override@JsonKey() final  double percentComplete;
@override@JsonKey() final  double projectedPercentByWeekEnd;
 final  List<NamedRef> _upcomingDeadlines;
@override@JsonKey() List<NamedRef> get upcomingDeadlines {
  if (_upcomingDeadlines is EqualUnmodifiableListView) return _upcomingDeadlines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingDeadlines);
}


/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineCopyWith<_Timeline> get copyWith => __$TimelineCopyWithImpl<_Timeline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timeline&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.targetEndDate, targetEndDate) || other.targetEndDate == targetEndDate)&&const DeepCollectionEquality().equals(other.phases, _phases)&&(identical(other.completedMinutes, completedMinutes) || other.completedMinutes == completedMinutes)&&(identical(other.remainingMinutes, remainingMinutes) || other.remainingMinutes == remainingMinutes)&&(identical(other.percentComplete, percentComplete) || other.percentComplete == percentComplete)&&(identical(other.projectedPercentByWeekEnd, projectedPercentByWeekEnd) || other.projectedPercentByWeekEnd == projectedPercentByWeekEnd)&&const DeepCollectionEquality().equals(other.upcomingDeadlines, _upcomingDeadlines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,startDate,targetEndDate,const DeepCollectionEquality().hash(_phases),completedMinutes,remainingMinutes,percentComplete,projectedPercentByWeekEnd,const DeepCollectionEquality().hash(_upcomingDeadlines));
}

@override
String toString() {
    return 'Timeline(startDate: $startDate, targetEndDate: $targetEndDate, phases: $phases, completedMinutes: $completedMinutes, remainingMinutes: $remainingMinutes, percentComplete: $percentComplete, projectedPercentByWeekEnd: $projectedPercentByWeekEnd, upcomingDeadlines: $upcomingDeadlines)';
}


}

/// @nodoc
abstract mixin class _$TimelineCopyWith<$Res> implements $TimelineCopyWith<$Res> {
  factory _$TimelineCopyWith(_Timeline value, $Res Function(_Timeline) _then) = __$TimelineCopyWithImpl;
@override @useResult
$Res call({
 DateTime? startDate, DateTime? targetEndDate, List<TimelinePhase> phases, int completedMinutes, int remainingMinutes, double percentComplete, double projectedPercentByWeekEnd, List<NamedRef> upcomingDeadlines
});




}
/// @nodoc
class __$TimelineCopyWithImpl<$Res>
    implements _$TimelineCopyWith<$Res> {
  __$TimelineCopyWithImpl(this._self, this._then);

  final _Timeline _self;
  final $Res Function(_Timeline) _then;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? targetEndDate = freezed,Object? phases = null,Object? completedMinutes = null,Object? remainingMinutes = null,Object? percentComplete = null,Object? projectedPercentByWeekEnd = null,Object? upcomingDeadlines = null,}) {
  return _then(_Timeline(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,targetEndDate: freezed == targetEndDate ? _self.targetEndDate : targetEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<TimelinePhase>,completedMinutes: null == completedMinutes ? _self.completedMinutes : completedMinutes // ignore: cast_nullable_to_non_nullable
as int,remainingMinutes: null == remainingMinutes ? _self.remainingMinutes : remainingMinutes // ignore: cast_nullable_to_non_nullable
as int,percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as double,projectedPercentByWeekEnd: null == projectedPercentByWeekEnd ? _self.projectedPercentByWeekEnd : projectedPercentByWeekEnd // ignore: cast_nullable_to_non_nullable
as double,upcomingDeadlines: null == upcomingDeadlines ? _self._upcomingDeadlines : upcomingDeadlines // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,
  ));
}


}


/// @nodoc
mixin _$TimelinePhase {

 String? get id; String get title; int get order; DateTime? get startDate; DateTime? get endDate;@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus get status; List<Milestone> get milestones;
/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelinePhaseCopyWith<TimelinePhase> get copyWith => _$TimelinePhaseCopyWithImpl<TimelinePhase>(this as TimelinePhase, _$identity);

  /// Serializes this TimelinePhase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimelinePhase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelinePhase&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.milestones, _this.milestones));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimelinePhase;
  return Object.hash(runtimeType,_this.id,_this.title,_this.order,_this.startDate,_this.endDate,_this.status,const DeepCollectionEquality().hash(_this.milestones));
}

@override
String toString() {
  final _this = this as TimelinePhase;
  return 'TimelinePhase(id: ${_this.id}, title: ${_this.title}, order: ${_this.order}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, status: ${_this.status}, milestones: ${_this.milestones})';
}


}

/// @nodoc
abstract mixin class $TimelinePhaseCopyWith<$Res>  {
  factory $TimelinePhaseCopyWith(TimelinePhase value, $Res Function(TimelinePhase) _then) = _$TimelinePhaseCopyWithImpl;
@useResult
$Res call({
 String? id, String title, int order, DateTime? startDate, DateTime? endDate,@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus status, List<Milestone> milestones
});




}
/// @nodoc
class _$TimelinePhaseCopyWithImpl<$Res>
    implements $TimelinePhaseCopyWith<$Res> {
  _$TimelinePhaseCopyWithImpl(this._self, this._then);

  final TimelinePhase _self;
  final $Res Function(TimelinePhase) _then;

/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? order = null,Object? startDate = freezed,Object? endDate = freezed,Object? status = null,Object? milestones = null,}) {
  return _then(TimelinePhase(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MilestoneStatus,milestones: null == milestones ? _self.milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelinePhase].
extension TimelinePhasePatterns on TimelinePhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelinePhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelinePhase value)  $default,){
final _that = this;
switch (_that) {
case _TimelinePhase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelinePhase value)?  $default,){
final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  int order,  DateTime? startDate,  DateTime? endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status,  List<Milestone> milestones)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
return $default(_that.id,_that.title,_that.order,_that.startDate,_that.endDate,_that.status,_that.milestones);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  int order,  DateTime? startDate,  DateTime? endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status,  List<Milestone> milestones)  $default,) {final _that = this;
switch (_that) {
case _TimelinePhase():
return $default(_that.id,_that.title,_that.order,_that.startDate,_that.endDate,_that.status,_that.milestones);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  int order,  DateTime? startDate,  DateTime? endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown)  MilestoneStatus status,  List<Milestone> milestones)?  $default,) {final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
return $default(_that.id,_that.title,_that.order,_that.startDate,_that.endDate,_that.status,_that.milestones);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelinePhase implements TimelinePhase {
  const _TimelinePhase({this.id, this.title = '', this.order = 0, this.startDate, this.endDate, @JsonKey(unknownEnumValue: MilestoneStatus.unknown) this.status = MilestoneStatus.upcoming,  List<Milestone> milestones = const <Milestone>[]}): _milestones = milestones;
  factory _TimelinePhase.fromJson(Map<String, dynamic> json) => _$TimelinePhaseFromJson(json);

@override final  String? id;
@override@JsonKey() final  String title;
@override@JsonKey() final  int order;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey(unknownEnumValue: MilestoneStatus.unknown) final  MilestoneStatus status;
 final  List<Milestone> _milestones;
@override@JsonKey() List<Milestone> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}


/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelinePhaseCopyWith<_TimelinePhase> get copyWith => __$TimelinePhaseCopyWithImpl<_TimelinePhase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelinePhaseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelinePhase&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.milestones, _milestones));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,order,startDate,endDate,status,const DeepCollectionEquality().hash(_milestones));
}

@override
String toString() {
    return 'TimelinePhase(id: $id, title: $title, order: $order, startDate: $startDate, endDate: $endDate, status: $status, milestones: $milestones)';
}


}

/// @nodoc
abstract mixin class _$TimelinePhaseCopyWith<$Res> implements $TimelinePhaseCopyWith<$Res> {
  factory _$TimelinePhaseCopyWith(_TimelinePhase value, $Res Function(_TimelinePhase) _then) = __$TimelinePhaseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, int order, DateTime? startDate, DateTime? endDate,@JsonKey(unknownEnumValue: MilestoneStatus.unknown) MilestoneStatus status, List<Milestone> milestones
});




}
/// @nodoc
class __$TimelinePhaseCopyWithImpl<$Res>
    implements _$TimelinePhaseCopyWith<$Res> {
  __$TimelinePhaseCopyWithImpl(this._self, this._then);

  final _TimelinePhase _self;
  final $Res Function(_TimelinePhase) _then;

/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? order = null,Object? startDate = freezed,Object? endDate = freezed,Object? status = null,Object? milestones = null,}) {
  return _then(_TimelinePhase(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MilestoneStatus,milestones: null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,
  ));
}


}


/// @nodoc
mixin _$CompleteTaskResult {

 List<Task> get currentTasks; Progress? get progress; List<BadgeAward> get newlyEarnedBadges; NamedRef? get milestoneCompleted; bool get projectCompleted; Streaks? get streaks; bool get promptJournal;
/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteTaskResultCopyWith<CompleteTaskResult> get copyWith => _$CompleteTaskResultCopyWithImpl<CompleteTaskResult>(this as CompleteTaskResult, _$identity);

  /// Serializes this CompleteTaskResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompleteTaskResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteTaskResult&&const DeepCollectionEquality().equals(other.currentTasks, _this.currentTasks)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&const DeepCollectionEquality().equals(other.newlyEarnedBadges, _this.newlyEarnedBadges)&&(identical(other.milestoneCompleted, _this.milestoneCompleted) || other.milestoneCompleted == _this.milestoneCompleted)&&(identical(other.projectCompleted, _this.projectCompleted) || other.projectCompleted == _this.projectCompleted)&&(identical(other.streaks, _this.streaks) || other.streaks == _this.streaks)&&(identical(other.promptJournal, _this.promptJournal) || other.promptJournal == _this.promptJournal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompleteTaskResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.currentTasks),_this.progress,const DeepCollectionEquality().hash(_this.newlyEarnedBadges),_this.milestoneCompleted,_this.projectCompleted,_this.streaks,_this.promptJournal);
}

@override
String toString() {
  final _this = this as CompleteTaskResult;
  return 'CompleteTaskResult(currentTasks: ${_this.currentTasks}, progress: ${_this.progress}, newlyEarnedBadges: ${_this.newlyEarnedBadges}, milestoneCompleted: ${_this.milestoneCompleted}, projectCompleted: ${_this.projectCompleted}, streaks: ${_this.streaks}, promptJournal: ${_this.promptJournal})';
}


}

/// @nodoc
abstract mixin class $CompleteTaskResultCopyWith<$Res>  {
  factory $CompleteTaskResultCopyWith(CompleteTaskResult value, $Res Function(CompleteTaskResult) _then) = _$CompleteTaskResultCopyWithImpl;
@useResult
$Res call({
 List<Task> currentTasks, Progress? progress, List<BadgeAward> newlyEarnedBadges, NamedRef? milestoneCompleted, bool projectCompleted, Streaks? streaks, bool promptJournal
});


$ProgressCopyWith<$Res>? get progress;$NamedRefCopyWith<$Res>? get milestoneCompleted;$StreaksCopyWith<$Res>? get streaks;

}
/// @nodoc
class _$CompleteTaskResultCopyWithImpl<$Res>
    implements $CompleteTaskResultCopyWith<$Res> {
  _$CompleteTaskResultCopyWithImpl(this._self, this._then);

  final CompleteTaskResult _self;
  final $Res Function(CompleteTaskResult) _then;

/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTasks = null,Object? progress = freezed,Object? newlyEarnedBadges = null,Object? milestoneCompleted = freezed,Object? projectCompleted = null,Object? streaks = freezed,Object? promptJournal = null,}) {
  return _then(CompleteTaskResult(
currentTasks: null == currentTasks ? _self.currentTasks : currentTasks // ignore: cast_nullable_to_non_nullable
as List<Task>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Progress?,newlyEarnedBadges: null == newlyEarnedBadges ? _self.newlyEarnedBadges : newlyEarnedBadges // ignore: cast_nullable_to_non_nullable
as List<BadgeAward>,milestoneCompleted: freezed == milestoneCompleted ? _self.milestoneCompleted : milestoneCompleted // ignore: cast_nullable_to_non_nullable
as NamedRef?,projectCompleted: null == projectCompleted ? _self.projectCompleted : projectCompleted // ignore: cast_nullable_to_non_nullable
as bool,streaks: freezed == streaks ? _self.streaks : streaks // ignore: cast_nullable_to_non_nullable
as Streaks?,promptJournal: null == promptJournal ? _self.promptJournal : promptJournal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $ProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get milestoneCompleted {
    if (_self.milestoneCompleted == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.milestoneCompleted!, (value) {
    return _then(_self.copyWith(milestoneCompleted: value));
  });
}/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreaksCopyWith<$Res>? get streaks {
    if (_self.streaks == null) {
    return null;
  }

  return $StreaksCopyWith<$Res>(_self.streaks!, (value) {
    return _then(_self.copyWith(streaks: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompleteTaskResult].
extension CompleteTaskResultPatterns on CompleteTaskResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompleteTaskResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompleteTaskResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompleteTaskResult value)  $default,){
final _that = this;
switch (_that) {
case _CompleteTaskResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompleteTaskResult value)?  $default,){
final _that = this;
switch (_that) {
case _CompleteTaskResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Task> currentTasks,  Progress? progress,  List<BadgeAward> newlyEarnedBadges,  NamedRef? milestoneCompleted,  bool projectCompleted,  Streaks? streaks,  bool promptJournal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompleteTaskResult() when $default != null:
return $default(_that.currentTasks,_that.progress,_that.newlyEarnedBadges,_that.milestoneCompleted,_that.projectCompleted,_that.streaks,_that.promptJournal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Task> currentTasks,  Progress? progress,  List<BadgeAward> newlyEarnedBadges,  NamedRef? milestoneCompleted,  bool projectCompleted,  Streaks? streaks,  bool promptJournal)  $default,) {final _that = this;
switch (_that) {
case _CompleteTaskResult():
return $default(_that.currentTasks,_that.progress,_that.newlyEarnedBadges,_that.milestoneCompleted,_that.projectCompleted,_that.streaks,_that.promptJournal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Task> currentTasks,  Progress? progress,  List<BadgeAward> newlyEarnedBadges,  NamedRef? milestoneCompleted,  bool projectCompleted,  Streaks? streaks,  bool promptJournal)?  $default,) {final _that = this;
switch (_that) {
case _CompleteTaskResult() when $default != null:
return $default(_that.currentTasks,_that.progress,_that.newlyEarnedBadges,_that.milestoneCompleted,_that.projectCompleted,_that.streaks,_that.promptJournal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompleteTaskResult implements CompleteTaskResult {
  const _CompleteTaskResult({ List<Task> currentTasks = const <Task>[], this.progress,  List<BadgeAward> newlyEarnedBadges = const <BadgeAward>[], this.milestoneCompleted, this.projectCompleted = false, this.streaks, this.promptJournal = true}): _currentTasks = currentTasks,_newlyEarnedBadges = newlyEarnedBadges;
  factory _CompleteTaskResult.fromJson(Map<String, dynamic> json) => _$CompleteTaskResultFromJson(json);

 final  List<Task> _currentTasks;
@override@JsonKey() List<Task> get currentTasks {
  if (_currentTasks is EqualUnmodifiableListView) return _currentTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentTasks);
}

@override final  Progress? progress;
 final  List<BadgeAward> _newlyEarnedBadges;
@override@JsonKey() List<BadgeAward> get newlyEarnedBadges {
  if (_newlyEarnedBadges is EqualUnmodifiableListView) return _newlyEarnedBadges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newlyEarnedBadges);
}

@override final  NamedRef? milestoneCompleted;
@override@JsonKey() final  bool projectCompleted;
@override final  Streaks? streaks;
@override@JsonKey() final  bool promptJournal;

/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteTaskResultCopyWith<_CompleteTaskResult> get copyWith => __$CompleteTaskResultCopyWithImpl<_CompleteTaskResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompleteTaskResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteTaskResult&&const DeepCollectionEquality().equals(other.currentTasks, _currentTasks)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.newlyEarnedBadges, _newlyEarnedBadges)&&(identical(other.milestoneCompleted, milestoneCompleted) || other.milestoneCompleted == milestoneCompleted)&&(identical(other.projectCompleted, projectCompleted) || other.projectCompleted == projectCompleted)&&(identical(other.streaks, streaks) || other.streaks == streaks)&&(identical(other.promptJournal, promptJournal) || other.promptJournal == promptJournal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_currentTasks),progress,const DeepCollectionEquality().hash(_newlyEarnedBadges),milestoneCompleted,projectCompleted,streaks,promptJournal);
}

@override
String toString() {
    return 'CompleteTaskResult(currentTasks: $currentTasks, progress: $progress, newlyEarnedBadges: $newlyEarnedBadges, milestoneCompleted: $milestoneCompleted, projectCompleted: $projectCompleted, streaks: $streaks, promptJournal: $promptJournal)';
}


}

/// @nodoc
abstract mixin class _$CompleteTaskResultCopyWith<$Res> implements $CompleteTaskResultCopyWith<$Res> {
  factory _$CompleteTaskResultCopyWith(_CompleteTaskResult value, $Res Function(_CompleteTaskResult) _then) = __$CompleteTaskResultCopyWithImpl;
@override @useResult
$Res call({
 List<Task> currentTasks, Progress? progress, List<BadgeAward> newlyEarnedBadges, NamedRef? milestoneCompleted, bool projectCompleted, Streaks? streaks, bool promptJournal
});


@override $ProgressCopyWith<$Res>? get progress;@override $NamedRefCopyWith<$Res>? get milestoneCompleted;@override $StreaksCopyWith<$Res>? get streaks;

}
/// @nodoc
class __$CompleteTaskResultCopyWithImpl<$Res>
    implements _$CompleteTaskResultCopyWith<$Res> {
  __$CompleteTaskResultCopyWithImpl(this._self, this._then);

  final _CompleteTaskResult _self;
  final $Res Function(_CompleteTaskResult) _then;

/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTasks = null,Object? progress = freezed,Object? newlyEarnedBadges = null,Object? milestoneCompleted = freezed,Object? projectCompleted = null,Object? streaks = freezed,Object? promptJournal = null,}) {
  return _then(_CompleteTaskResult(
currentTasks: null == currentTasks ? _self._currentTasks : currentTasks // ignore: cast_nullable_to_non_nullable
as List<Task>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Progress?,newlyEarnedBadges: null == newlyEarnedBadges ? _self._newlyEarnedBadges : newlyEarnedBadges // ignore: cast_nullable_to_non_nullable
as List<BadgeAward>,milestoneCompleted: freezed == milestoneCompleted ? _self.milestoneCompleted : milestoneCompleted // ignore: cast_nullable_to_non_nullable
as NamedRef?,projectCompleted: null == projectCompleted ? _self.projectCompleted : projectCompleted // ignore: cast_nullable_to_non_nullable
as bool,streaks: freezed == streaks ? _self.streaks : streaks // ignore: cast_nullable_to_non_nullable
as Streaks?,promptJournal: null == promptJournal ? _self.promptJournal : promptJournal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $ProgressCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedRefCopyWith<$Res>? get milestoneCompleted {
    if (_self.milestoneCompleted == null) {
    return null;
  }

  return $NamedRefCopyWith<$Res>(_self.milestoneCompleted!, (value) {
    return _then(_self.copyWith(milestoneCompleted: value));
  });
}/// Create a copy of CompleteTaskResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreaksCopyWith<$Res>? get streaks {
    if (_self.streaks == null) {
    return null;
  }

  return $StreaksCopyWith<$Res>(_self.streaks!, (value) {
    return _then(_self.copyWith(streaks: value));
  });
}
}


/// @nodoc
mixin _$ScopeCut {

 String? get id; String get title; String? get description; int? get minutesSaved;
/// Create a copy of ScopeCut
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScopeCutCopyWith<ScopeCut> get copyWith => _$ScopeCutCopyWithImpl<ScopeCut>(this as ScopeCut, _$identity);

  /// Serializes this ScopeCut to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScopeCut;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScopeCut&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.minutesSaved, _this.minutesSaved) || other.minutesSaved == _this.minutesSaved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScopeCut;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.minutesSaved);
}

@override
String toString() {
  final _this = this as ScopeCut;
  return 'ScopeCut(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, minutesSaved: ${_this.minutesSaved})';
}


}

/// @nodoc
abstract mixin class $ScopeCutCopyWith<$Res>  {
  factory $ScopeCutCopyWith(ScopeCut value, $Res Function(ScopeCut) _then) = _$ScopeCutCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String? description, int? minutesSaved
});




}
/// @nodoc
class _$ScopeCutCopyWithImpl<$Res>
    implements $ScopeCutCopyWith<$Res> {
  _$ScopeCutCopyWithImpl(this._self, this._then);

  final ScopeCut _self;
  final $Res Function(ScopeCut) _then;

/// Create a copy of ScopeCut
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? description = freezed,Object? minutesSaved = freezed,}) {
  return _then(ScopeCut(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,minutesSaved: freezed == minutesSaved ? _self.minutesSaved : minutesSaved // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScopeCut].
extension ScopeCutPatterns on ScopeCut {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScopeCut value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScopeCut() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScopeCut value)  $default,){
final _that = this;
switch (_that) {
case _ScopeCut():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScopeCut value)?  $default,){
final _that = this;
switch (_that) {
case _ScopeCut() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String title,  String? description,  int? minutesSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScopeCut() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.minutesSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String title,  String? description,  int? minutesSaved)  $default,) {final _that = this;
switch (_that) {
case _ScopeCut():
return $default(_that.id,_that.title,_that.description,_that.minutesSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String title,  String? description,  int? minutesSaved)?  $default,) {final _that = this;
switch (_that) {
case _ScopeCut() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.minutesSaved);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScopeCut implements ScopeCut {
  const _ScopeCut({this.id, this.title = '', this.description, this.minutesSaved});
  factory _ScopeCut.fromJson(Map<String, dynamic> json) => _$ScopeCutFromJson(json);

@override final  String? id;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  int? minutesSaved;

/// Create a copy of ScopeCut
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScopeCutCopyWith<_ScopeCut> get copyWith => __$ScopeCutCopyWithImpl<_ScopeCut>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScopeCutToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScopeCut&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.minutesSaved, minutesSaved) || other.minutesSaved == minutesSaved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,minutesSaved);
}

@override
String toString() {
    return 'ScopeCut(id: $id, title: $title, description: $description, minutesSaved: $minutesSaved)';
}


}

/// @nodoc
abstract mixin class _$ScopeCutCopyWith<$Res> implements $ScopeCutCopyWith<$Res> {
  factory _$ScopeCutCopyWith(_ScopeCut value, $Res Function(_ScopeCut) _then) = __$ScopeCutCopyWithImpl;
@override @useResult
$Res call({
 String? id, String title, String? description, int? minutesSaved
});




}
/// @nodoc
class __$ScopeCutCopyWithImpl<$Res>
    implements _$ScopeCutCopyWith<$Res> {
  __$ScopeCutCopyWithImpl(this._self, this._then);

  final _ScopeCut _self;
  final $Res Function(_ScopeCut) _then;

/// Create a copy of ScopeCut
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? description = freezed,Object? minutesSaved = freezed,}) {
  return _then(_ScopeCut(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,minutesSaved: freezed == minutesSaved ? _self.minutesSaved : minutesSaved // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$GeneratePlanResult {

 bool get feasible; int? get planVersion; DateTime? get suggestedEndDate; int? get extraMinutesPerWeekNeeded; List<ScopeCut> get scopeCuts; int? get capacityMinutes; int? get requiredMinutes; PlanPreview? get preview;
/// Create a copy of GeneratePlanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratePlanResultCopyWith<GeneratePlanResult> get copyWith => _$GeneratePlanResultCopyWithImpl<GeneratePlanResult>(this as GeneratePlanResult, _$identity);

  /// Serializes this GeneratePlanResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeneratePlanResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratePlanResult&&(identical(other.feasible, _this.feasible) || other.feasible == _this.feasible)&&(identical(other.planVersion, _this.planVersion) || other.planVersion == _this.planVersion)&&(identical(other.suggestedEndDate, _this.suggestedEndDate) || other.suggestedEndDate == _this.suggestedEndDate)&&(identical(other.extraMinutesPerWeekNeeded, _this.extraMinutesPerWeekNeeded) || other.extraMinutesPerWeekNeeded == _this.extraMinutesPerWeekNeeded)&&const DeepCollectionEquality().equals(other.scopeCuts, _this.scopeCuts)&&(identical(other.capacityMinutes, _this.capacityMinutes) || other.capacityMinutes == _this.capacityMinutes)&&(identical(other.requiredMinutes, _this.requiredMinutes) || other.requiredMinutes == _this.requiredMinutes)&&(identical(other.preview, _this.preview) || other.preview == _this.preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeneratePlanResult;
  return Object.hash(runtimeType,_this.feasible,_this.planVersion,_this.suggestedEndDate,_this.extraMinutesPerWeekNeeded,const DeepCollectionEquality().hash(_this.scopeCuts),_this.capacityMinutes,_this.requiredMinutes,_this.preview);
}

@override
String toString() {
  final _this = this as GeneratePlanResult;
  return 'GeneratePlanResult(feasible: ${_this.feasible}, planVersion: ${_this.planVersion}, suggestedEndDate: ${_this.suggestedEndDate}, extraMinutesPerWeekNeeded: ${_this.extraMinutesPerWeekNeeded}, scopeCuts: ${_this.scopeCuts}, capacityMinutes: ${_this.capacityMinutes}, requiredMinutes: ${_this.requiredMinutes}, preview: ${_this.preview})';
}


}

/// @nodoc
abstract mixin class $GeneratePlanResultCopyWith<$Res>  {
  factory $GeneratePlanResultCopyWith(GeneratePlanResult value, $Res Function(GeneratePlanResult) _then) = _$GeneratePlanResultCopyWithImpl;
@useResult
$Res call({
 bool feasible, int? planVersion, DateTime? suggestedEndDate, int? extraMinutesPerWeekNeeded, List<ScopeCut> scopeCuts, int? capacityMinutes, int? requiredMinutes, PlanPreview? preview
});


$PlanPreviewCopyWith<$Res>? get preview;

}
/// @nodoc
class _$GeneratePlanResultCopyWithImpl<$Res>
    implements $GeneratePlanResultCopyWith<$Res> {
  _$GeneratePlanResultCopyWithImpl(this._self, this._then);

  final GeneratePlanResult _self;
  final $Res Function(GeneratePlanResult) _then;

/// Create a copy of GeneratePlanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feasible = null,Object? planVersion = freezed,Object? suggestedEndDate = freezed,Object? extraMinutesPerWeekNeeded = freezed,Object? scopeCuts = null,Object? capacityMinutes = freezed,Object? requiredMinutes = freezed,Object? preview = freezed,}) {
  return _then(GeneratePlanResult(
feasible: null == feasible ? _self.feasible : feasible // ignore: cast_nullable_to_non_nullable
as bool,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,suggestedEndDate: freezed == suggestedEndDate ? _self.suggestedEndDate : suggestedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,extraMinutesPerWeekNeeded: freezed == extraMinutesPerWeekNeeded ? _self.extraMinutesPerWeekNeeded : extraMinutesPerWeekNeeded // ignore: cast_nullable_to_non_nullable
as int?,scopeCuts: null == scopeCuts ? _self.scopeCuts : scopeCuts // ignore: cast_nullable_to_non_nullable
as List<ScopeCut>,capacityMinutes: freezed == capacityMinutes ? _self.capacityMinutes : capacityMinutes // ignore: cast_nullable_to_non_nullable
as int?,requiredMinutes: freezed == requiredMinutes ? _self.requiredMinutes : requiredMinutes // ignore: cast_nullable_to_non_nullable
as int?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as PlanPreview?,
  ));
}
/// Create a copy of GeneratePlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanPreviewCopyWith<$Res>? get preview {
    if (_self.preview == null) {
    return null;
  }

  return $PlanPreviewCopyWith<$Res>(_self.preview!, (value) {
    return _then(_self.copyWith(preview: value));
  });
}
}


/// Adds pattern-matching-related methods to [GeneratePlanResult].
extension GeneratePlanResultPatterns on GeneratePlanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratePlanResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratePlanResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratePlanResult value)  $default,){
final _that = this;
switch (_that) {
case _GeneratePlanResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratePlanResult value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratePlanResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool feasible,  int? planVersion,  DateTime? suggestedEndDate,  int? extraMinutesPerWeekNeeded,  List<ScopeCut> scopeCuts,  int? capacityMinutes,  int? requiredMinutes,  PlanPreview? preview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratePlanResult() when $default != null:
return $default(_that.feasible,_that.planVersion,_that.suggestedEndDate,_that.extraMinutesPerWeekNeeded,_that.scopeCuts,_that.capacityMinutes,_that.requiredMinutes,_that.preview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool feasible,  int? planVersion,  DateTime? suggestedEndDate,  int? extraMinutesPerWeekNeeded,  List<ScopeCut> scopeCuts,  int? capacityMinutes,  int? requiredMinutes,  PlanPreview? preview)  $default,) {final _that = this;
switch (_that) {
case _GeneratePlanResult():
return $default(_that.feasible,_that.planVersion,_that.suggestedEndDate,_that.extraMinutesPerWeekNeeded,_that.scopeCuts,_that.capacityMinutes,_that.requiredMinutes,_that.preview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool feasible,  int? planVersion,  DateTime? suggestedEndDate,  int? extraMinutesPerWeekNeeded,  List<ScopeCut> scopeCuts,  int? capacityMinutes,  int? requiredMinutes,  PlanPreview? preview)?  $default,) {final _that = this;
switch (_that) {
case _GeneratePlanResult() when $default != null:
return $default(_that.feasible,_that.planVersion,_that.suggestedEndDate,_that.extraMinutesPerWeekNeeded,_that.scopeCuts,_that.capacityMinutes,_that.requiredMinutes,_that.preview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratePlanResult implements GeneratePlanResult {
  const _GeneratePlanResult({this.feasible = false, this.planVersion, this.suggestedEndDate, this.extraMinutesPerWeekNeeded,  List<ScopeCut> scopeCuts = const <ScopeCut>[], this.capacityMinutes, this.requiredMinutes, this.preview}): _scopeCuts = scopeCuts;
  factory _GeneratePlanResult.fromJson(Map<String, dynamic> json) => _$GeneratePlanResultFromJson(json);

@override@JsonKey() final  bool feasible;
@override final  int? planVersion;
@override final  DateTime? suggestedEndDate;
@override final  int? extraMinutesPerWeekNeeded;
 final  List<ScopeCut> _scopeCuts;
@override@JsonKey() List<ScopeCut> get scopeCuts {
  if (_scopeCuts is EqualUnmodifiableListView) return _scopeCuts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopeCuts);
}

@override final  int? capacityMinutes;
@override final  int? requiredMinutes;
@override final  PlanPreview? preview;

/// Create a copy of GeneratePlanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratePlanResultCopyWith<_GeneratePlanResult> get copyWith => __$GeneratePlanResultCopyWithImpl<_GeneratePlanResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratePlanResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratePlanResult&&(identical(other.feasible, feasible) || other.feasible == feasible)&&(identical(other.planVersion, planVersion) || other.planVersion == planVersion)&&(identical(other.suggestedEndDate, suggestedEndDate) || other.suggestedEndDate == suggestedEndDate)&&(identical(other.extraMinutesPerWeekNeeded, extraMinutesPerWeekNeeded) || other.extraMinutesPerWeekNeeded == extraMinutesPerWeekNeeded)&&const DeepCollectionEquality().equals(other.scopeCuts, _scopeCuts)&&(identical(other.capacityMinutes, capacityMinutes) || other.capacityMinutes == capacityMinutes)&&(identical(other.requiredMinutes, requiredMinutes) || other.requiredMinutes == requiredMinutes)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,feasible,planVersion,suggestedEndDate,extraMinutesPerWeekNeeded,const DeepCollectionEquality().hash(_scopeCuts),capacityMinutes,requiredMinutes,preview);
}

@override
String toString() {
    return 'GeneratePlanResult(feasible: $feasible, planVersion: $planVersion, suggestedEndDate: $suggestedEndDate, extraMinutesPerWeekNeeded: $extraMinutesPerWeekNeeded, scopeCuts: $scopeCuts, capacityMinutes: $capacityMinutes, requiredMinutes: $requiredMinutes, preview: $preview)';
}


}

/// @nodoc
abstract mixin class _$GeneratePlanResultCopyWith<$Res> implements $GeneratePlanResultCopyWith<$Res> {
  factory _$GeneratePlanResultCopyWith(_GeneratePlanResult value, $Res Function(_GeneratePlanResult) _then) = __$GeneratePlanResultCopyWithImpl;
@override @useResult
$Res call({
 bool feasible, int? planVersion, DateTime? suggestedEndDate, int? extraMinutesPerWeekNeeded, List<ScopeCut> scopeCuts, int? capacityMinutes, int? requiredMinutes, PlanPreview? preview
});


@override $PlanPreviewCopyWith<$Res>? get preview;

}
/// @nodoc
class __$GeneratePlanResultCopyWithImpl<$Res>
    implements _$GeneratePlanResultCopyWith<$Res> {
  __$GeneratePlanResultCopyWithImpl(this._self, this._then);

  final _GeneratePlanResult _self;
  final $Res Function(_GeneratePlanResult) _then;

/// Create a copy of GeneratePlanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feasible = null,Object? planVersion = freezed,Object? suggestedEndDate = freezed,Object? extraMinutesPerWeekNeeded = freezed,Object? scopeCuts = null,Object? capacityMinutes = freezed,Object? requiredMinutes = freezed,Object? preview = freezed,}) {
  return _then(_GeneratePlanResult(
feasible: null == feasible ? _self.feasible : feasible // ignore: cast_nullable_to_non_nullable
as bool,planVersion: freezed == planVersion ? _self.planVersion : planVersion // ignore: cast_nullable_to_non_nullable
as int?,suggestedEndDate: freezed == suggestedEndDate ? _self.suggestedEndDate : suggestedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,extraMinutesPerWeekNeeded: freezed == extraMinutesPerWeekNeeded ? _self.extraMinutesPerWeekNeeded : extraMinutesPerWeekNeeded // ignore: cast_nullable_to_non_nullable
as int?,scopeCuts: null == scopeCuts ? _self._scopeCuts : scopeCuts // ignore: cast_nullable_to_non_nullable
as List<ScopeCut>,capacityMinutes: freezed == capacityMinutes ? _self.capacityMinutes : capacityMinutes // ignore: cast_nullable_to_non_nullable
as int?,requiredMinutes: freezed == requiredMinutes ? _self.requiredMinutes : requiredMinutes // ignore: cast_nullable_to_non_nullable
as int?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as PlanPreview?,
  ));
}

/// Create a copy of GeneratePlanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanPreviewCopyWith<$Res>? get preview {
    if (_self.preview == null) {
    return null;
  }

  return $PlanPreviewCopyWith<$Res>(_self.preview!, (value) {
    return _then(_self.copyWith(preview: value));
  });
}
}

// dart format on
