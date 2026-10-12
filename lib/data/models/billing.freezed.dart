// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillingPlan {

 String get key; String get name; int get rank; int get trialDays; List<String> get features; bool get adsEnabled; String? get description;/// RevenueCat offering identifier for this plan (falls back to the
/// current offering's package whose identifier contains [key]).
 String? get offeringId;
/// Create a copy of BillingPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingPlanCopyWith<BillingPlan> get copyWith => _$BillingPlanCopyWithImpl<BillingPlan>(this as BillingPlan, _$identity);

  /// Serializes this BillingPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BillingPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingPlan&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.rank, _this.rank) || other.rank == _this.rank)&&(identical(other.trialDays, _this.trialDays) || other.trialDays == _this.trialDays)&&const DeepCollectionEquality().equals(other.features, _this.features)&&(identical(other.adsEnabled, _this.adsEnabled) || other.adsEnabled == _this.adsEnabled)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.offeringId, _this.offeringId) || other.offeringId == _this.offeringId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BillingPlan;
  return Object.hash(runtimeType,_this.key,_this.name,_this.rank,_this.trialDays,const DeepCollectionEquality().hash(_this.features),_this.adsEnabled,_this.description,_this.offeringId);
}

@override
String toString() {
  final _this = this as BillingPlan;
  return 'BillingPlan(key: ${_this.key}, name: ${_this.name}, rank: ${_this.rank}, trialDays: ${_this.trialDays}, features: ${_this.features}, adsEnabled: ${_this.adsEnabled}, description: ${_this.description}, offeringId: ${_this.offeringId})';
}


}

/// @nodoc
abstract mixin class $BillingPlanCopyWith<$Res>  {
  factory $BillingPlanCopyWith(BillingPlan value, $Res Function(BillingPlan) _then) = _$BillingPlanCopyWithImpl;
@useResult
$Res call({
 String key, String name, int rank, int trialDays, List<String> features, bool adsEnabled, String? description, String? offeringId
});




}
/// @nodoc
class _$BillingPlanCopyWithImpl<$Res>
    implements $BillingPlanCopyWith<$Res> {
  _$BillingPlanCopyWithImpl(this._self, this._then);

  final BillingPlan _self;
  final $Res Function(BillingPlan) _then;

/// Create a copy of BillingPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? rank = null,Object? trialDays = null,Object? features = null,Object? adsEnabled = null,Object? description = freezed,Object? offeringId = freezed,}) {
  return _then(BillingPlan(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,trialDays: null == trialDays ? _self.trialDays : trialDays // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,adsEnabled: null == adsEnabled ? _self.adsEnabled : adsEnabled // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,offeringId: freezed == offeringId ? _self.offeringId : offeringId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BillingPlan].
extension BillingPlanPatterns on BillingPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingPlan value)  $default,){
final _that = this;
switch (_that) {
case _BillingPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingPlan value)?  $default,){
final _that = this;
switch (_that) {
case _BillingPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  int rank,  int trialDays,  List<String> features,  bool adsEnabled,  String? description,  String? offeringId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingPlan() when $default != null:
return $default(_that.key,_that.name,_that.rank,_that.trialDays,_that.features,_that.adsEnabled,_that.description,_that.offeringId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  int rank,  int trialDays,  List<String> features,  bool adsEnabled,  String? description,  String? offeringId)  $default,) {final _that = this;
switch (_that) {
case _BillingPlan():
return $default(_that.key,_that.name,_that.rank,_that.trialDays,_that.features,_that.adsEnabled,_that.description,_that.offeringId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  int rank,  int trialDays,  List<String> features,  bool adsEnabled,  String? description,  String? offeringId)?  $default,) {final _that = this;
switch (_that) {
case _BillingPlan() when $default != null:
return $default(_that.key,_that.name,_that.rank,_that.trialDays,_that.features,_that.adsEnabled,_that.description,_that.offeringId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillingPlan implements BillingPlan {
  const _BillingPlan({required this.key, this.name = '', this.rank = 0, this.trialDays = 0,  List<String> features = const <String>[], this.adsEnabled = false, this.description, this.offeringId}): _features = features;
  factory _BillingPlan.fromJson(Map<String, dynamic> json) => _$BillingPlanFromJson(json);

@override final  String key;
@override@JsonKey() final  String name;
@override@JsonKey() final  int rank;
@override@JsonKey() final  int trialDays;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override@JsonKey() final  bool adsEnabled;
@override final  String? description;
/// RevenueCat offering identifier for this plan (falls back to the
/// current offering's package whose identifier contains [key]).
@override final  String? offeringId;

/// Create a copy of BillingPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingPlanCopyWith<_BillingPlan> get copyWith => __$BillingPlanCopyWithImpl<_BillingPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillingPlanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingPlan&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.trialDays, trialDays) || other.trialDays == trialDays)&&const DeepCollectionEquality().equals(other.features, _features)&&(identical(other.adsEnabled, adsEnabled) || other.adsEnabled == adsEnabled)&&(identical(other.description, description) || other.description == description)&&(identical(other.offeringId, offeringId) || other.offeringId == offeringId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,name,rank,trialDays,const DeepCollectionEquality().hash(_features),adsEnabled,description,offeringId);
}

@override
String toString() {
    return 'BillingPlan(key: $key, name: $name, rank: $rank, trialDays: $trialDays, features: $features, adsEnabled: $adsEnabled, description: $description, offeringId: $offeringId)';
}


}

/// @nodoc
abstract mixin class _$BillingPlanCopyWith<$Res> implements $BillingPlanCopyWith<$Res> {
  factory _$BillingPlanCopyWith(_BillingPlan value, $Res Function(_BillingPlan) _then) = __$BillingPlanCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, int rank, int trialDays, List<String> features, bool adsEnabled, String? description, String? offeringId
});




}
/// @nodoc
class __$BillingPlanCopyWithImpl<$Res>
    implements _$BillingPlanCopyWith<$Res> {
  __$BillingPlanCopyWithImpl(this._self, this._then);

  final _BillingPlan _self;
  final $Res Function(_BillingPlan) _then;

/// Create a copy of BillingPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? rank = null,Object? trialDays = null,Object? features = null,Object? adsEnabled = null,Object? description = freezed,Object? offeringId = freezed,}) {
  return _then(_BillingPlan(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,trialDays: null == trialDays ? _self.trialDays : trialDays // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,adsEnabled: null == adsEnabled ? _self.adsEnabled : adsEnabled // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,offeringId: freezed == offeringId ? _self.offeringId : offeringId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BillingFeature {

 String get key; String get name; String? get description;
/// Create a copy of BillingFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingFeatureCopyWith<BillingFeature> get copyWith => _$BillingFeatureCopyWithImpl<BillingFeature>(this as BillingFeature, _$identity);

  /// Serializes this BillingFeature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BillingFeature;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingFeature&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BillingFeature;
  return Object.hash(runtimeType,_this.key,_this.name,_this.description);
}

@override
String toString() {
  final _this = this as BillingFeature;
  return 'BillingFeature(key: ${_this.key}, name: ${_this.name}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $BillingFeatureCopyWith<$Res>  {
  factory $BillingFeatureCopyWith(BillingFeature value, $Res Function(BillingFeature) _then) = _$BillingFeatureCopyWithImpl;
@useResult
$Res call({
 String key, String name, String? description
});




}
/// @nodoc
class _$BillingFeatureCopyWithImpl<$Res>
    implements $BillingFeatureCopyWith<$Res> {
  _$BillingFeatureCopyWithImpl(this._self, this._then);

  final BillingFeature _self;
  final $Res Function(BillingFeature) _then;

/// Create a copy of BillingFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? description = freezed,}) {
  return _then(BillingFeature(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BillingFeature].
extension BillingFeaturePatterns on BillingFeature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillingFeature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillingFeature() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillingFeature value)  $default,){
final _that = this;
switch (_that) {
case _BillingFeature():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillingFeature value)?  $default,){
final _that = this;
switch (_that) {
case _BillingFeature() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillingFeature() when $default != null:
return $default(_that.key,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _BillingFeature():
return $default(_that.key,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _BillingFeature() when $default != null:
return $default(_that.key,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillingFeature implements BillingFeature {
  const _BillingFeature({required this.key, this.name = '', this.description});
  factory _BillingFeature.fromJson(Map<String, dynamic> json) => _$BillingFeatureFromJson(json);

@override final  String key;
@override@JsonKey() final  String name;
@override final  String? description;

/// Create a copy of BillingFeature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillingFeatureCopyWith<_BillingFeature> get copyWith => __$BillingFeatureCopyWithImpl<_BillingFeature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillingFeatureToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillingFeature&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,name,description);
}

@override
String toString() {
    return 'BillingFeature(key: $key, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BillingFeatureCopyWith<$Res> implements $BillingFeatureCopyWith<$Res> {
  factory _$BillingFeatureCopyWith(_BillingFeature value, $Res Function(_BillingFeature) _then) = __$BillingFeatureCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String? description
});




}
/// @nodoc
class __$BillingFeatureCopyWithImpl<$Res>
    implements _$BillingFeatureCopyWith<$Res> {
  __$BillingFeatureCopyWithImpl(this._self, this._then);

  final _BillingFeature _self;
  final $Res Function(_BillingFeature) _then;

/// Create a copy of BillingFeature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? description = freezed,}) {
  return _then(_BillingFeature(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlanCatalog {

 List<BillingPlan> get plans; List<BillingFeature> get features; String? get cancellationTerms;
/// Create a copy of PlanCatalog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCatalogCopyWith<PlanCatalog> get copyWith => _$PlanCatalogCopyWithImpl<PlanCatalog>(this as PlanCatalog, _$identity);

  /// Serializes this PlanCatalog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanCatalog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanCatalog&&const DeepCollectionEquality().equals(other.plans, _this.plans)&&const DeepCollectionEquality().equals(other.features, _this.features)&&(identical(other.cancellationTerms, _this.cancellationTerms) || other.cancellationTerms == _this.cancellationTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanCatalog;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.plans),const DeepCollectionEquality().hash(_this.features),_this.cancellationTerms);
}

@override
String toString() {
  final _this = this as PlanCatalog;
  return 'PlanCatalog(plans: ${_this.plans}, features: ${_this.features}, cancellationTerms: ${_this.cancellationTerms})';
}


}

/// @nodoc
abstract mixin class $PlanCatalogCopyWith<$Res>  {
  factory $PlanCatalogCopyWith(PlanCatalog value, $Res Function(PlanCatalog) _then) = _$PlanCatalogCopyWithImpl;
@useResult
$Res call({
 List<BillingPlan> plans, List<BillingFeature> features, String? cancellationTerms
});




}
/// @nodoc
class _$PlanCatalogCopyWithImpl<$Res>
    implements $PlanCatalogCopyWith<$Res> {
  _$PlanCatalogCopyWithImpl(this._self, this._then);

  final PlanCatalog _self;
  final $Res Function(PlanCatalog) _then;

/// Create a copy of PlanCatalog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plans = null,Object? features = null,Object? cancellationTerms = freezed,}) {
  return _then(PlanCatalog(
plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<BillingPlan>,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<BillingFeature>,cancellationTerms: freezed == cancellationTerms ? _self.cancellationTerms : cancellationTerms // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanCatalog].
extension PlanCatalogPatterns on PlanCatalog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanCatalog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanCatalog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanCatalog value)  $default,){
final _that = this;
switch (_that) {
case _PlanCatalog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanCatalog value)?  $default,){
final _that = this;
switch (_that) {
case _PlanCatalog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BillingPlan> plans,  List<BillingFeature> features,  String? cancellationTerms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanCatalog() when $default != null:
return $default(_that.plans,_that.features,_that.cancellationTerms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BillingPlan> plans,  List<BillingFeature> features,  String? cancellationTerms)  $default,) {final _that = this;
switch (_that) {
case _PlanCatalog():
return $default(_that.plans,_that.features,_that.cancellationTerms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BillingPlan> plans,  List<BillingFeature> features,  String? cancellationTerms)?  $default,) {final _that = this;
switch (_that) {
case _PlanCatalog() when $default != null:
return $default(_that.plans,_that.features,_that.cancellationTerms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanCatalog implements PlanCatalog {
  const _PlanCatalog({ List<BillingPlan> plans = const <BillingPlan>[],  List<BillingFeature> features = const <BillingFeature>[], this.cancellationTerms}): _plans = plans,_features = features;
  factory _PlanCatalog.fromJson(Map<String, dynamic> json) => _$PlanCatalogFromJson(json);

 final  List<BillingPlan> _plans;
@override@JsonKey() List<BillingPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

 final  List<BillingFeature> _features;
@override@JsonKey() List<BillingFeature> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

@override final  String? cancellationTerms;

/// Create a copy of PlanCatalog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanCatalogCopyWith<_PlanCatalog> get copyWith => __$PlanCatalogCopyWithImpl<_PlanCatalog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanCatalogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanCatalog&&const DeepCollectionEquality().equals(other.plans, _plans)&&const DeepCollectionEquality().equals(other.features, _features)&&(identical(other.cancellationTerms, cancellationTerms) || other.cancellationTerms == cancellationTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_plans),const DeepCollectionEquality().hash(_features),cancellationTerms);
}

@override
String toString() {
    return 'PlanCatalog(plans: $plans, features: $features, cancellationTerms: $cancellationTerms)';
}


}

/// @nodoc
abstract mixin class _$PlanCatalogCopyWith<$Res> implements $PlanCatalogCopyWith<$Res> {
  factory _$PlanCatalogCopyWith(_PlanCatalog value, $Res Function(_PlanCatalog) _then) = __$PlanCatalogCopyWithImpl;
@override @useResult
$Res call({
 List<BillingPlan> plans, List<BillingFeature> features, String? cancellationTerms
});




}
/// @nodoc
class __$PlanCatalogCopyWithImpl<$Res>
    implements _$PlanCatalogCopyWith<$Res> {
  __$PlanCatalogCopyWithImpl(this._self, this._then);

  final _PlanCatalog _self;
  final $Res Function(_PlanCatalog) _then;

/// Create a copy of PlanCatalog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plans = null,Object? features = null,Object? cancellationTerms = freezed,}) {
  return _then(_PlanCatalog(
plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<BillingPlan>,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<BillingFeature>,cancellationTerms: freezed == cancellationTerms ? _self.cancellationTerms : cancellationTerms // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
