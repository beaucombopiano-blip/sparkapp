// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recommendation {

 String get id; String get title; String get description; String get whyItMatches; String? get tangibleOutcome;@JsonKey(unknownEnumValue: Difficulty.stretch) Difficulty get difficulty; int? get estimatedTotalHours; String? get suggestedFirstStep; String? get audienceOrImpact; double? get matchScore; String? get catalogItemId; int get batch; String? get parentNote; DateTime? get createdAt;
/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationCopyWith<Recommendation> get copyWith => _$RecommendationCopyWithImpl<Recommendation>(this as Recommendation, _$identity);

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Recommendation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recommendation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.whyItMatches, _this.whyItMatches) || other.whyItMatches == _this.whyItMatches)&&(identical(other.tangibleOutcome, _this.tangibleOutcome) || other.tangibleOutcome == _this.tangibleOutcome)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.estimatedTotalHours, _this.estimatedTotalHours) || other.estimatedTotalHours == _this.estimatedTotalHours)&&(identical(other.suggestedFirstStep, _this.suggestedFirstStep) || other.suggestedFirstStep == _this.suggestedFirstStep)&&(identical(other.audienceOrImpact, _this.audienceOrImpact) || other.audienceOrImpact == _this.audienceOrImpact)&&(identical(other.matchScore, _this.matchScore) || other.matchScore == _this.matchScore)&&(identical(other.catalogItemId, _this.catalogItemId) || other.catalogItemId == _this.catalogItemId)&&(identical(other.batch, _this.batch) || other.batch == _this.batch)&&(identical(other.parentNote, _this.parentNote) || other.parentNote == _this.parentNote)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Recommendation;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.whyItMatches,_this.tangibleOutcome,_this.difficulty,_this.estimatedTotalHours,_this.suggestedFirstStep,_this.audienceOrImpact,_this.matchScore,_this.catalogItemId,_this.batch,_this.parentNote,_this.createdAt);
}

@override
String toString() {
  final _this = this as Recommendation;
  return 'Recommendation(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, whyItMatches: ${_this.whyItMatches}, tangibleOutcome: ${_this.tangibleOutcome}, difficulty: ${_this.difficulty}, estimatedTotalHours: ${_this.estimatedTotalHours}, suggestedFirstStep: ${_this.suggestedFirstStep}, audienceOrImpact: ${_this.audienceOrImpact}, matchScore: ${_this.matchScore}, catalogItemId: ${_this.catalogItemId}, batch: ${_this.batch}, parentNote: ${_this.parentNote}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $RecommendationCopyWith<$Res>  {
  factory $RecommendationCopyWith(Recommendation value, $Res Function(Recommendation) _then) = _$RecommendationCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String whyItMatches, String? tangibleOutcome,@JsonKey(unknownEnumValue: Difficulty.stretch) Difficulty difficulty, int? estimatedTotalHours, String? suggestedFirstStep, String? audienceOrImpact, double? matchScore, String? catalogItemId, int batch, String? parentNote, DateTime? createdAt
});




}
/// @nodoc
class _$RecommendationCopyWithImpl<$Res>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._self, this._then);

  final Recommendation _self;
  final $Res Function(Recommendation) _then;

/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? whyItMatches = null,Object? tangibleOutcome = freezed,Object? difficulty = null,Object? estimatedTotalHours = freezed,Object? suggestedFirstStep = freezed,Object? audienceOrImpact = freezed,Object? matchScore = freezed,Object? catalogItemId = freezed,Object? batch = null,Object? parentNote = freezed,Object? createdAt = freezed,}) {
  return _then(Recommendation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,whyItMatches: null == whyItMatches ? _self.whyItMatches : whyItMatches // ignore: cast_nullable_to_non_nullable
as String,tangibleOutcome: freezed == tangibleOutcome ? _self.tangibleOutcome : tangibleOutcome // ignore: cast_nullable_to_non_nullable
as String?,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,estimatedTotalHours: freezed == estimatedTotalHours ? _self.estimatedTotalHours : estimatedTotalHours // ignore: cast_nullable_to_non_nullable
as int?,suggestedFirstStep: freezed == suggestedFirstStep ? _self.suggestedFirstStep : suggestedFirstStep // ignore: cast_nullable_to_non_nullable
as String?,audienceOrImpact: freezed == audienceOrImpact ? _self.audienceOrImpact : audienceOrImpact // ignore: cast_nullable_to_non_nullable
as String?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as double?,catalogItemId: freezed == catalogItemId ? _self.catalogItemId : catalogItemId // ignore: cast_nullable_to_non_nullable
as String?,batch: null == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int,parentNote: freezed == parentNote ? _self.parentNote : parentNote // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Recommendation].
extension RecommendationPatterns on Recommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recommendation value)  $default,){
final _that = this;
switch (_that) {
case _Recommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recommendation value)?  $default,){
final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String whyItMatches,  String? tangibleOutcome, @JsonKey(unknownEnumValue: Difficulty.stretch)  Difficulty difficulty,  int? estimatedTotalHours,  String? suggestedFirstStep,  String? audienceOrImpact,  double? matchScore,  String? catalogItemId,  int batch,  String? parentNote,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.whyItMatches,_that.tangibleOutcome,_that.difficulty,_that.estimatedTotalHours,_that.suggestedFirstStep,_that.audienceOrImpact,_that.matchScore,_that.catalogItemId,_that.batch,_that.parentNote,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String whyItMatches,  String? tangibleOutcome, @JsonKey(unknownEnumValue: Difficulty.stretch)  Difficulty difficulty,  int? estimatedTotalHours,  String? suggestedFirstStep,  String? audienceOrImpact,  double? matchScore,  String? catalogItemId,  int batch,  String? parentNote,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Recommendation():
return $default(_that.id,_that.title,_that.description,_that.whyItMatches,_that.tangibleOutcome,_that.difficulty,_that.estimatedTotalHours,_that.suggestedFirstStep,_that.audienceOrImpact,_that.matchScore,_that.catalogItemId,_that.batch,_that.parentNote,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String whyItMatches,  String? tangibleOutcome, @JsonKey(unknownEnumValue: Difficulty.stretch)  Difficulty difficulty,  int? estimatedTotalHours,  String? suggestedFirstStep,  String? audienceOrImpact,  double? matchScore,  String? catalogItemId,  int batch,  String? parentNote,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Recommendation() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.whyItMatches,_that.tangibleOutcome,_that.difficulty,_that.estimatedTotalHours,_that.suggestedFirstStep,_that.audienceOrImpact,_that.matchScore,_that.catalogItemId,_that.batch,_that.parentNote,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recommendation implements Recommendation {
  const _Recommendation({required this.id, this.title = '', this.description = '', this.whyItMatches = '', this.tangibleOutcome, @JsonKey(unknownEnumValue: Difficulty.stretch) this.difficulty = Difficulty.starter, this.estimatedTotalHours, this.suggestedFirstStep, this.audienceOrImpact, this.matchScore, this.catalogItemId, this.batch = 1, this.parentNote, this.createdAt});
  factory _Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String whyItMatches;
@override final  String? tangibleOutcome;
@override@JsonKey(unknownEnumValue: Difficulty.stretch) final  Difficulty difficulty;
@override final  int? estimatedTotalHours;
@override final  String? suggestedFirstStep;
@override final  String? audienceOrImpact;
@override final  double? matchScore;
@override final  String? catalogItemId;
@override@JsonKey() final  int batch;
@override final  String? parentNote;
@override final  DateTime? createdAt;

/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationCopyWith<_Recommendation> get copyWith => __$RecommendationCopyWithImpl<_Recommendation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recommendation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.whyItMatches, whyItMatches) || other.whyItMatches == whyItMatches)&&(identical(other.tangibleOutcome, tangibleOutcome) || other.tangibleOutcome == tangibleOutcome)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.estimatedTotalHours, estimatedTotalHours) || other.estimatedTotalHours == estimatedTotalHours)&&(identical(other.suggestedFirstStep, suggestedFirstStep) || other.suggestedFirstStep == suggestedFirstStep)&&(identical(other.audienceOrImpact, audienceOrImpact) || other.audienceOrImpact == audienceOrImpact)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.catalogItemId, catalogItemId) || other.catalogItemId == catalogItemId)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.parentNote, parentNote) || other.parentNote == parentNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,whyItMatches,tangibleOutcome,difficulty,estimatedTotalHours,suggestedFirstStep,audienceOrImpact,matchScore,catalogItemId,batch,parentNote,createdAt);
}

@override
String toString() {
    return 'Recommendation(id: $id, title: $title, description: $description, whyItMatches: $whyItMatches, tangibleOutcome: $tangibleOutcome, difficulty: $difficulty, estimatedTotalHours: $estimatedTotalHours, suggestedFirstStep: $suggestedFirstStep, audienceOrImpact: $audienceOrImpact, matchScore: $matchScore, catalogItemId: $catalogItemId, batch: $batch, parentNote: $parentNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RecommendationCopyWith<$Res> implements $RecommendationCopyWith<$Res> {
  factory _$RecommendationCopyWith(_Recommendation value, $Res Function(_Recommendation) _then) = __$RecommendationCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String whyItMatches, String? tangibleOutcome,@JsonKey(unknownEnumValue: Difficulty.stretch) Difficulty difficulty, int? estimatedTotalHours, String? suggestedFirstStep, String? audienceOrImpact, double? matchScore, String? catalogItemId, int batch, String? parentNote, DateTime? createdAt
});




}
/// @nodoc
class __$RecommendationCopyWithImpl<$Res>
    implements _$RecommendationCopyWith<$Res> {
  __$RecommendationCopyWithImpl(this._self, this._then);

  final _Recommendation _self;
  final $Res Function(_Recommendation) _then;

/// Create a copy of Recommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? whyItMatches = null,Object? tangibleOutcome = freezed,Object? difficulty = null,Object? estimatedTotalHours = freezed,Object? suggestedFirstStep = freezed,Object? audienceOrImpact = freezed,Object? matchScore = freezed,Object? catalogItemId = freezed,Object? batch = null,Object? parentNote = freezed,Object? createdAt = freezed,}) {
  return _then(_Recommendation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,whyItMatches: null == whyItMatches ? _self.whyItMatches : whyItMatches // ignore: cast_nullable_to_non_nullable
as String,tangibleOutcome: freezed == tangibleOutcome ? _self.tangibleOutcome : tangibleOutcome // ignore: cast_nullable_to_non_nullable
as String?,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,estimatedTotalHours: freezed == estimatedTotalHours ? _self.estimatedTotalHours : estimatedTotalHours // ignore: cast_nullable_to_non_nullable
as int?,suggestedFirstStep: freezed == suggestedFirstStep ? _self.suggestedFirstStep : suggestedFirstStep // ignore: cast_nullable_to_non_nullable
as String?,audienceOrImpact: freezed == audienceOrImpact ? _self.audienceOrImpact : audienceOrImpact // ignore: cast_nullable_to_non_nullable
as String?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as double?,catalogItemId: freezed == catalogItemId ? _self.catalogItemId : catalogItemId // ignore: cast_nullable_to_non_nullable
as String?,batch: null == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int,parentNote: freezed == parentNote ? _self.parentNote : parentNote // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$AssessmentQuestion {

 String get id; String get text; String? get facet;
/// Create a copy of AssessmentQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessmentQuestionCopyWith<AssessmentQuestion> get copyWith => _$AssessmentQuestionCopyWithImpl<AssessmentQuestion>(this as AssessmentQuestion, _$identity);

  /// Serializes this AssessmentQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssessmentQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessmentQuestion&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.facet, _this.facet) || other.facet == _this.facet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssessmentQuestion;
  return Object.hash(runtimeType,_this.id,_this.text,_this.facet);
}

@override
String toString() {
  final _this = this as AssessmentQuestion;
  return 'AssessmentQuestion(id: ${_this.id}, text: ${_this.text}, facet: ${_this.facet})';
}


}

/// @nodoc
abstract mixin class $AssessmentQuestionCopyWith<$Res>  {
  factory $AssessmentQuestionCopyWith(AssessmentQuestion value, $Res Function(AssessmentQuestion) _then) = _$AssessmentQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String text, String? facet
});




}
/// @nodoc
class _$AssessmentQuestionCopyWithImpl<$Res>
    implements $AssessmentQuestionCopyWith<$Res> {
  _$AssessmentQuestionCopyWithImpl(this._self, this._then);

  final AssessmentQuestion _self;
  final $Res Function(AssessmentQuestion) _then;

/// Create a copy of AssessmentQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? facet = freezed,}) {
  return _then(AssessmentQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,facet: freezed == facet ? _self.facet : facet // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssessmentQuestion].
extension AssessmentQuestionPatterns on AssessmentQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssessmentQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssessmentQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssessmentQuestion value)  $default,){
final _that = this;
switch (_that) {
case _AssessmentQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssessmentQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _AssessmentQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String? facet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssessmentQuestion() when $default != null:
return $default(_that.id,_that.text,_that.facet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String? facet)  $default,) {final _that = this;
switch (_that) {
case _AssessmentQuestion():
return $default(_that.id,_that.text,_that.facet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String? facet)?  $default,) {final _that = this;
switch (_that) {
case _AssessmentQuestion() when $default != null:
return $default(_that.id,_that.text,_that.facet);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssessmentQuestion implements AssessmentQuestion {
  const _AssessmentQuestion({required this.id, this.text = '', this.facet});
  factory _AssessmentQuestion.fromJson(Map<String, dynamic> json) => _$AssessmentQuestionFromJson(json);

@override final  String id;
@override@JsonKey() final  String text;
@override final  String? facet;

/// Create a copy of AssessmentQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessmentQuestionCopyWith<_AssessmentQuestion> get copyWith => __$AssessmentQuestionCopyWithImpl<_AssessmentQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessmentQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessmentQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.facet, facet) || other.facet == facet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,text,facet);
}

@override
String toString() {
    return 'AssessmentQuestion(id: $id, text: $text, facet: $facet)';
}


}

/// @nodoc
abstract mixin class _$AssessmentQuestionCopyWith<$Res> implements $AssessmentQuestionCopyWith<$Res> {
  factory _$AssessmentQuestionCopyWith(_AssessmentQuestion value, $Res Function(_AssessmentQuestion) _then) = __$AssessmentQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String? facet
});




}
/// @nodoc
class __$AssessmentQuestionCopyWithImpl<$Res>
    implements _$AssessmentQuestionCopyWith<$Res> {
  __$AssessmentQuestionCopyWithImpl(this._self, this._then);

  final _AssessmentQuestion _self;
  final $Res Function(_AssessmentQuestion) _then;

/// Create a copy of AssessmentQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? facet = freezed,}) {
  return _then(_AssessmentQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,facet: freezed == facet ? _self.facet : facet // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AssessmentStep {

 String get sessionId; bool get done; AssessmentQuestion? get question;/// 1-based position of [question].
 int get index; int get total;/// The previously saved answer for [question], when resuming.
 int? get previousAnswer;
/// Create a copy of AssessmentStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssessmentStepCopyWith<AssessmentStep> get copyWith => _$AssessmentStepCopyWithImpl<AssessmentStep>(this as AssessmentStep, _$identity);

  /// Serializes this AssessmentStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssessmentStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssessmentStep&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.question, _this.question) || other.question == _this.question)&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.previousAnswer, _this.previousAnswer) || other.previousAnswer == _this.previousAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssessmentStep;
  return Object.hash(runtimeType,_this.sessionId,_this.done,_this.question,_this.index,_this.total,_this.previousAnswer);
}

@override
String toString() {
  final _this = this as AssessmentStep;
  return 'AssessmentStep(sessionId: ${_this.sessionId}, done: ${_this.done}, question: ${_this.question}, index: ${_this.index}, total: ${_this.total}, previousAnswer: ${_this.previousAnswer})';
}


}

/// @nodoc
abstract mixin class $AssessmentStepCopyWith<$Res>  {
  factory $AssessmentStepCopyWith(AssessmentStep value, $Res Function(AssessmentStep) _then) = _$AssessmentStepCopyWithImpl;
@useResult
$Res call({
 String sessionId, bool done, AssessmentQuestion? question, int index, int total, int? previousAnswer
});


$AssessmentQuestionCopyWith<$Res>? get question;

}
/// @nodoc
class _$AssessmentStepCopyWithImpl<$Res>
    implements $AssessmentStepCopyWith<$Res> {
  _$AssessmentStepCopyWithImpl(this._self, this._then);

  final AssessmentStep _self;
  final $Res Function(AssessmentStep) _then;

/// Create a copy of AssessmentStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? done = null,Object? question = freezed,Object? index = null,Object? total = null,Object? previousAnswer = freezed,}) {
  return _then(AssessmentStep(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as AssessmentQuestion?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,previousAnswer: freezed == previousAnswer ? _self.previousAnswer : previousAnswer // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AssessmentStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssessmentQuestionCopyWith<$Res>? get question {
    if (_self.question == null) {
    return null;
  }

  return $AssessmentQuestionCopyWith<$Res>(_self.question!, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssessmentStep].
extension AssessmentStepPatterns on AssessmentStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssessmentStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssessmentStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssessmentStep value)  $default,){
final _that = this;
switch (_that) {
case _AssessmentStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssessmentStep value)?  $default,){
final _that = this;
switch (_that) {
case _AssessmentStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  bool done,  AssessmentQuestion? question,  int index,  int total,  int? previousAnswer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssessmentStep() when $default != null:
return $default(_that.sessionId,_that.done,_that.question,_that.index,_that.total,_that.previousAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  bool done,  AssessmentQuestion? question,  int index,  int total,  int? previousAnswer)  $default,) {final _that = this;
switch (_that) {
case _AssessmentStep():
return $default(_that.sessionId,_that.done,_that.question,_that.index,_that.total,_that.previousAnswer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  bool done,  AssessmentQuestion? question,  int index,  int total,  int? previousAnswer)?  $default,) {final _that = this;
switch (_that) {
case _AssessmentStep() when $default != null:
return $default(_that.sessionId,_that.done,_that.question,_that.index,_that.total,_that.previousAnswer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssessmentStep implements AssessmentStep {
  const _AssessmentStep({required this.sessionId, this.done = false, this.question, this.index = 1, this.total = 30, this.previousAnswer});
  factory _AssessmentStep.fromJson(Map<String, dynamic> json) => _$AssessmentStepFromJson(json);

@override final  String sessionId;
@override@JsonKey() final  bool done;
@override final  AssessmentQuestion? question;
/// 1-based position of [question].
@override@JsonKey() final  int index;
@override@JsonKey() final  int total;
/// The previously saved answer for [question], when resuming.
@override final  int? previousAnswer;

/// Create a copy of AssessmentStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssessmentStepCopyWith<_AssessmentStep> get copyWith => __$AssessmentStepCopyWithImpl<_AssessmentStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssessmentStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssessmentStep&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.done, done) || other.done == done)&&(identical(other.question, question) || other.question == question)&&(identical(other.index, index) || other.index == index)&&(identical(other.total, total) || other.total == total)&&(identical(other.previousAnswer, previousAnswer) || other.previousAnswer == previousAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sessionId,done,question,index,total,previousAnswer);
}

@override
String toString() {
    return 'AssessmentStep(sessionId: $sessionId, done: $done, question: $question, index: $index, total: $total, previousAnswer: $previousAnswer)';
}


}

/// @nodoc
abstract mixin class _$AssessmentStepCopyWith<$Res> implements $AssessmentStepCopyWith<$Res> {
  factory _$AssessmentStepCopyWith(_AssessmentStep value, $Res Function(_AssessmentStep) _then) = __$AssessmentStepCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, bool done, AssessmentQuestion? question, int index, int total, int? previousAnswer
});


@override $AssessmentQuestionCopyWith<$Res>? get question;

}
/// @nodoc
class __$AssessmentStepCopyWithImpl<$Res>
    implements _$AssessmentStepCopyWith<$Res> {
  __$AssessmentStepCopyWithImpl(this._self, this._then);

  final _AssessmentStep _self;
  final $Res Function(_AssessmentStep) _then;

/// Create a copy of AssessmentStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? done = null,Object? question = freezed,Object? index = null,Object? total = null,Object? previousAnswer = freezed,}) {
  return _then(_AssessmentStep(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as AssessmentQuestion?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,previousAnswer: freezed == previousAnswer ? _self.previousAnswer : previousAnswer // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AssessmentStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssessmentQuestionCopyWith<$Res>? get question {
    if (_self.question == null) {
    return null;
  }

  return $AssessmentQuestionCopyWith<$Res>(_self.question!, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}


/// @nodoc
mixin _$IdeaInterview {

 String get id; String get status; ProjectProfile? get profileSoFar; List<String> get missingFields; List<String> get assumedFields; List<InterviewMessage> get transcript; String? get nextQuestion; DateTime? get updatedAt;
/// Create a copy of IdeaInterview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdeaInterviewCopyWith<IdeaInterview> get copyWith => _$IdeaInterviewCopyWithImpl<IdeaInterview>(this as IdeaInterview, _$identity);

  /// Serializes this IdeaInterview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IdeaInterview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdeaInterview&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.profileSoFar, _this.profileSoFar) || other.profileSoFar == _this.profileSoFar)&&const DeepCollectionEquality().equals(other.missingFields, _this.missingFields)&&const DeepCollectionEquality().equals(other.assumedFields, _this.assumedFields)&&const DeepCollectionEquality().equals(other.transcript, _this.transcript)&&(identical(other.nextQuestion, _this.nextQuestion) || other.nextQuestion == _this.nextQuestion)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IdeaInterview;
  return Object.hash(runtimeType,_this.id,_this.status,_this.profileSoFar,const DeepCollectionEquality().hash(_this.missingFields),const DeepCollectionEquality().hash(_this.assumedFields),const DeepCollectionEquality().hash(_this.transcript),_this.nextQuestion,_this.updatedAt);
}

@override
String toString() {
  final _this = this as IdeaInterview;
  return 'IdeaInterview(id: ${_this.id}, status: ${_this.status}, profileSoFar: ${_this.profileSoFar}, missingFields: ${_this.missingFields}, assumedFields: ${_this.assumedFields}, transcript: ${_this.transcript}, nextQuestion: ${_this.nextQuestion}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $IdeaInterviewCopyWith<$Res>  {
  factory $IdeaInterviewCopyWith(IdeaInterview value, $Res Function(IdeaInterview) _then) = _$IdeaInterviewCopyWithImpl;
@useResult
$Res call({
 String id, String status, ProjectProfile? profileSoFar, List<String> missingFields, List<String> assumedFields, List<InterviewMessage> transcript, String? nextQuestion, DateTime? updatedAt
});


$ProjectProfileCopyWith<$Res>? get profileSoFar;

}
/// @nodoc
class _$IdeaInterviewCopyWithImpl<$Res>
    implements $IdeaInterviewCopyWith<$Res> {
  _$IdeaInterviewCopyWithImpl(this._self, this._then);

  final IdeaInterview _self;
  final $Res Function(IdeaInterview) _then;

/// Create a copy of IdeaInterview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? profileSoFar = freezed,Object? missingFields = null,Object? assumedFields = null,Object? transcript = null,Object? nextQuestion = freezed,Object? updatedAt = freezed,}) {
  return _then(IdeaInterview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,profileSoFar: freezed == profileSoFar ? _self.profileSoFar : profileSoFar // ignore: cast_nullable_to_non_nullable
as ProjectProfile?,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,assumedFields: null == assumedFields ? _self.assumedFields : assumedFields // ignore: cast_nullable_to_non_nullable
as List<String>,transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as List<InterviewMessage>,nextQuestion: freezed == nextQuestion ? _self.nextQuestion : nextQuestion // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of IdeaInterview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectProfileCopyWith<$Res>? get profileSoFar {
    if (_self.profileSoFar == null) {
    return null;
  }

  return $ProjectProfileCopyWith<$Res>(_self.profileSoFar!, (value) {
    return _then(_self.copyWith(profileSoFar: value));
  });
}
}


/// Adds pattern-matching-related methods to [IdeaInterview].
extension IdeaInterviewPatterns on IdeaInterview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdeaInterview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdeaInterview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdeaInterview value)  $default,){
final _that = this;
switch (_that) {
case _IdeaInterview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdeaInterview value)?  $default,){
final _that = this;
switch (_that) {
case _IdeaInterview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  ProjectProfile? profileSoFar,  List<String> missingFields,  List<String> assumedFields,  List<InterviewMessage> transcript,  String? nextQuestion,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdeaInterview() when $default != null:
return $default(_that.id,_that.status,_that.profileSoFar,_that.missingFields,_that.assumedFields,_that.transcript,_that.nextQuestion,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  ProjectProfile? profileSoFar,  List<String> missingFields,  List<String> assumedFields,  List<InterviewMessage> transcript,  String? nextQuestion,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _IdeaInterview():
return $default(_that.id,_that.status,_that.profileSoFar,_that.missingFields,_that.assumedFields,_that.transcript,_that.nextQuestion,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  ProjectProfile? profileSoFar,  List<String> missingFields,  List<String> assumedFields,  List<InterviewMessage> transcript,  String? nextQuestion,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _IdeaInterview() when $default != null:
return $default(_that.id,_that.status,_that.profileSoFar,_that.missingFields,_that.assumedFields,_that.transcript,_that.nextQuestion,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdeaInterview implements IdeaInterview {
  const _IdeaInterview({required this.id, this.status = 'active', this.profileSoFar,  List<String> missingFields = const <String>[],  List<String> assumedFields = const <String>[],  List<InterviewMessage> transcript = const <InterviewMessage>[], this.nextQuestion, this.updatedAt}): _missingFields = missingFields,_assumedFields = assumedFields,_transcript = transcript;
  factory _IdeaInterview.fromJson(Map<String, dynamic> json) => _$IdeaInterviewFromJson(json);

@override final  String id;
@override@JsonKey() final  String status;
@override final  ProjectProfile? profileSoFar;
 final  List<String> _missingFields;
@override@JsonKey() List<String> get missingFields {
  if (_missingFields is EqualUnmodifiableListView) return _missingFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingFields);
}

 final  List<String> _assumedFields;
@override@JsonKey() List<String> get assumedFields {
  if (_assumedFields is EqualUnmodifiableListView) return _assumedFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assumedFields);
}

 final  List<InterviewMessage> _transcript;
@override@JsonKey() List<InterviewMessage> get transcript {
  if (_transcript is EqualUnmodifiableListView) return _transcript;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transcript);
}

@override final  String? nextQuestion;
@override final  DateTime? updatedAt;

/// Create a copy of IdeaInterview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdeaInterviewCopyWith<_IdeaInterview> get copyWith => __$IdeaInterviewCopyWithImpl<_IdeaInterview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdeaInterviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdeaInterview&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.profileSoFar, profileSoFar) || other.profileSoFar == profileSoFar)&&const DeepCollectionEquality().equals(other.missingFields, _missingFields)&&const DeepCollectionEquality().equals(other.assumedFields, _assumedFields)&&const DeepCollectionEquality().equals(other.transcript, _transcript)&&(identical(other.nextQuestion, nextQuestion) || other.nextQuestion == nextQuestion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status,profileSoFar,const DeepCollectionEquality().hash(_missingFields),const DeepCollectionEquality().hash(_assumedFields),const DeepCollectionEquality().hash(_transcript),nextQuestion,updatedAt);
}

@override
String toString() {
    return 'IdeaInterview(id: $id, status: $status, profileSoFar: $profileSoFar, missingFields: $missingFields, assumedFields: $assumedFields, transcript: $transcript, nextQuestion: $nextQuestion, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IdeaInterviewCopyWith<$Res> implements $IdeaInterviewCopyWith<$Res> {
  factory _$IdeaInterviewCopyWith(_IdeaInterview value, $Res Function(_IdeaInterview) _then) = __$IdeaInterviewCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, ProjectProfile? profileSoFar, List<String> missingFields, List<String> assumedFields, List<InterviewMessage> transcript, String? nextQuestion, DateTime? updatedAt
});


@override $ProjectProfileCopyWith<$Res>? get profileSoFar;

}
/// @nodoc
class __$IdeaInterviewCopyWithImpl<$Res>
    implements _$IdeaInterviewCopyWith<$Res> {
  __$IdeaInterviewCopyWithImpl(this._self, this._then);

  final _IdeaInterview _self;
  final $Res Function(_IdeaInterview) _then;

/// Create a copy of IdeaInterview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? profileSoFar = freezed,Object? missingFields = null,Object? assumedFields = null,Object? transcript = null,Object? nextQuestion = freezed,Object? updatedAt = freezed,}) {
  return _then(_IdeaInterview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,profileSoFar: freezed == profileSoFar ? _self.profileSoFar : profileSoFar // ignore: cast_nullable_to_non_nullable
as ProjectProfile?,missingFields: null == missingFields ? _self._missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,assumedFields: null == assumedFields ? _self._assumedFields : assumedFields // ignore: cast_nullable_to_non_nullable
as List<String>,transcript: null == transcript ? _self._transcript : transcript // ignore: cast_nullable_to_non_nullable
as List<InterviewMessage>,nextQuestion: freezed == nextQuestion ? _self.nextQuestion : nextQuestion // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of IdeaInterview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectProfileCopyWith<$Res>? get profileSoFar {
    if (_self.profileSoFar == null) {
    return null;
  }

  return $ProjectProfileCopyWith<$Res>(_self.profileSoFar!, (value) {
    return _then(_self.copyWith(profileSoFar: value));
  });
}
}


/// @nodoc
mixin _$InterviewMessage {

 String get role; String get content;
/// Create a copy of InterviewMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewMessageCopyWith<InterviewMessage> get copyWith => _$InterviewMessageCopyWithImpl<InterviewMessage>(this as InterviewMessage, _$identity);

  /// Serializes this InterviewMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InterviewMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewMessage&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.content, _this.content) || other.content == _this.content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InterviewMessage;
  return Object.hash(runtimeType,_this.role,_this.content);
}

@override
String toString() {
  final _this = this as InterviewMessage;
  return 'InterviewMessage(role: ${_this.role}, content: ${_this.content})';
}


}

/// @nodoc
abstract mixin class $InterviewMessageCopyWith<$Res>  {
  factory $InterviewMessageCopyWith(InterviewMessage value, $Res Function(InterviewMessage) _then) = _$InterviewMessageCopyWithImpl;
@useResult
$Res call({
 String role, String content
});




}
/// @nodoc
class _$InterviewMessageCopyWithImpl<$Res>
    implements $InterviewMessageCopyWith<$Res> {
  _$InterviewMessageCopyWithImpl(this._self, this._then);

  final InterviewMessage _self;
  final $Res Function(InterviewMessage) _then;

/// Create a copy of InterviewMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,}) {
  return _then(InterviewMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewMessage].
extension InterviewMessagePatterns on InterviewMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewMessage value)  $default,){
final _that = this;
switch (_that) {
case _InterviewMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewMessage value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewMessage() when $default != null:
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String content)  $default,) {final _that = this;
switch (_that) {
case _InterviewMessage():
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String content)?  $default,) {final _that = this;
switch (_that) {
case _InterviewMessage() when $default != null:
return $default(_that.role,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewMessage implements InterviewMessage {
  const _InterviewMessage({this.role = 'user', this.content = ''});
  factory _InterviewMessage.fromJson(Map<String, dynamic> json) => _$InterviewMessageFromJson(json);

@override@JsonKey() final  String role;
@override@JsonKey() final  String content;

/// Create a copy of InterviewMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewMessageCopyWith<_InterviewMessage> get copyWith => __$InterviewMessageCopyWithImpl<_InterviewMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,role,content);
}

@override
String toString() {
    return 'InterviewMessage(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$InterviewMessageCopyWith<$Res> implements $InterviewMessageCopyWith<$Res> {
  factory _$InterviewMessageCopyWith(_InterviewMessage value, $Res Function(_InterviewMessage) _then) = __$InterviewMessageCopyWithImpl;
@override @useResult
$Res call({
 String role, String content
});




}
/// @nodoc
class __$InterviewMessageCopyWithImpl<$Res>
    implements _$InterviewMessageCopyWith<$Res> {
  __$InterviewMessageCopyWithImpl(this._self, this._then);

  final _InterviewMessage _self;
  final $Res Function(_InterviewMessage) _then;

/// Create a copy of InterviewMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,}) {
  return _then(_InterviewMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SelectProjectResult {

 Project get project; List<BadgeAward> get newlyEarnedBadges;
/// Create a copy of SelectProjectResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectProjectResultCopyWith<SelectProjectResult> get copyWith => _$SelectProjectResultCopyWithImpl<SelectProjectResult>(this as SelectProjectResult, _$identity);

  /// Serializes this SelectProjectResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SelectProjectResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectProjectResult&&(identical(other.project, _this.project) || other.project == _this.project)&&const DeepCollectionEquality().equals(other.newlyEarnedBadges, _this.newlyEarnedBadges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SelectProjectResult;
  return Object.hash(runtimeType,_this.project,const DeepCollectionEquality().hash(_this.newlyEarnedBadges));
}

@override
String toString() {
  final _this = this as SelectProjectResult;
  return 'SelectProjectResult(project: ${_this.project}, newlyEarnedBadges: ${_this.newlyEarnedBadges})';
}


}

/// @nodoc
abstract mixin class $SelectProjectResultCopyWith<$Res>  {
  factory $SelectProjectResultCopyWith(SelectProjectResult value, $Res Function(SelectProjectResult) _then) = _$SelectProjectResultCopyWithImpl;
@useResult
$Res call({
 Project project, List<BadgeAward> newlyEarnedBadges
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$SelectProjectResultCopyWithImpl<$Res>
    implements $SelectProjectResultCopyWith<$Res> {
  _$SelectProjectResultCopyWithImpl(this._self, this._then);

  final SelectProjectResult _self;
  final $Res Function(SelectProjectResult) _then;

/// Create a copy of SelectProjectResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? project = null,Object? newlyEarnedBadges = null,}) {
  return _then(SelectProjectResult(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,newlyEarnedBadges: null == newlyEarnedBadges ? _self.newlyEarnedBadges : newlyEarnedBadges // ignore: cast_nullable_to_non_nullable
as List<BadgeAward>,
  ));
}
/// Create a copy of SelectProjectResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectProjectResult].
extension SelectProjectResultPatterns on SelectProjectResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectProjectResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectProjectResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectProjectResult value)  $default,){
final _that = this;
switch (_that) {
case _SelectProjectResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectProjectResult value)?  $default,){
final _that = this;
switch (_that) {
case _SelectProjectResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Project project,  List<BadgeAward> newlyEarnedBadges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectProjectResult() when $default != null:
return $default(_that.project,_that.newlyEarnedBadges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Project project,  List<BadgeAward> newlyEarnedBadges)  $default,) {final _that = this;
switch (_that) {
case _SelectProjectResult():
return $default(_that.project,_that.newlyEarnedBadges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Project project,  List<BadgeAward> newlyEarnedBadges)?  $default,) {final _that = this;
switch (_that) {
case _SelectProjectResult() when $default != null:
return $default(_that.project,_that.newlyEarnedBadges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectProjectResult implements SelectProjectResult {
  const _SelectProjectResult({required this.project,  List<BadgeAward> newlyEarnedBadges = const <BadgeAward>[]}): _newlyEarnedBadges = newlyEarnedBadges;
  factory _SelectProjectResult.fromJson(Map<String, dynamic> json) => _$SelectProjectResultFromJson(json);

@override final  Project project;
 final  List<BadgeAward> _newlyEarnedBadges;
@override@JsonKey() List<BadgeAward> get newlyEarnedBadges {
  if (_newlyEarnedBadges is EqualUnmodifiableListView) return _newlyEarnedBadges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newlyEarnedBadges);
}


/// Create a copy of SelectProjectResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectProjectResultCopyWith<_SelectProjectResult> get copyWith => __$SelectProjectResultCopyWithImpl<_SelectProjectResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectProjectResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectProjectResult&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other.newlyEarnedBadges, _newlyEarnedBadges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,project,const DeepCollectionEquality().hash(_newlyEarnedBadges));
}

@override
String toString() {
    return 'SelectProjectResult(project: $project, newlyEarnedBadges: $newlyEarnedBadges)';
}


}

/// @nodoc
abstract mixin class _$SelectProjectResultCopyWith<$Res> implements $SelectProjectResultCopyWith<$Res> {
  factory _$SelectProjectResultCopyWith(_SelectProjectResult value, $Res Function(_SelectProjectResult) _then) = __$SelectProjectResultCopyWithImpl;
@override @useResult
$Res call({
 Project project, List<BadgeAward> newlyEarnedBadges
});


@override $ProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$SelectProjectResultCopyWithImpl<$Res>
    implements _$SelectProjectResultCopyWith<$Res> {
  __$SelectProjectResultCopyWithImpl(this._self, this._then);

  final _SelectProjectResult _self;
  final $Res Function(_SelectProjectResult) _then;

/// Create a copy of SelectProjectResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? newlyEarnedBadges = null,}) {
  return _then(_SelectProjectResult(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,newlyEarnedBadges: null == newlyEarnedBadges ? _self._newlyEarnedBadges : newlyEarnedBadges // ignore: cast_nullable_to_non_nullable
as List<BadgeAward>,
  ));
}

/// Create a copy of SelectProjectResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on
