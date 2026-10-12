// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityProfile {

 String get id; String get pseudonym; String? get characterId; List<String> get interests; String? get projectType; String? get bio; String get visibility; String? get ageBracket; DateTime? get createdAt;
/// Create a copy of CommunityProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityProfileCopyWith<CommunityProfile> get copyWith => _$CommunityProfileCopyWithImpl<CommunityProfile>(this as CommunityProfile, _$identity);

  /// Serializes this CommunityProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommunityProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pseudonym, _this.pseudonym) || other.pseudonym == _this.pseudonym)&&(identical(other.characterId, _this.characterId) || other.characterId == _this.characterId)&&const DeepCollectionEquality().equals(other.interests, _this.interests)&&(identical(other.projectType, _this.projectType) || other.projectType == _this.projectType)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.visibility, _this.visibility) || other.visibility == _this.visibility)&&(identical(other.ageBracket, _this.ageBracket) || other.ageBracket == _this.ageBracket)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommunityProfile;
  return Object.hash(runtimeType,_this.id,_this.pseudonym,_this.characterId,const DeepCollectionEquality().hash(_this.interests),_this.projectType,_this.bio,_this.visibility,_this.ageBracket,_this.createdAt);
}

@override
String toString() {
  final _this = this as CommunityProfile;
  return 'CommunityProfile(id: ${_this.id}, pseudonym: ${_this.pseudonym}, characterId: ${_this.characterId}, interests: ${_this.interests}, projectType: ${_this.projectType}, bio: ${_this.bio}, visibility: ${_this.visibility}, ageBracket: ${_this.ageBracket}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CommunityProfileCopyWith<$Res>  {
  factory $CommunityProfileCopyWith(CommunityProfile value, $Res Function(CommunityProfile) _then) = _$CommunityProfileCopyWithImpl;
@useResult
$Res call({
 String id, String pseudonym, String? characterId, List<String> interests, String? projectType, String? bio, String visibility, String? ageBracket, DateTime? createdAt
});




}
/// @nodoc
class _$CommunityProfileCopyWithImpl<$Res>
    implements $CommunityProfileCopyWith<$Res> {
  _$CommunityProfileCopyWithImpl(this._self, this._then);

  final CommunityProfile _self;
  final $Res Function(CommunityProfile) _then;

/// Create a copy of CommunityProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pseudonym = null,Object? characterId = freezed,Object? interests = null,Object? projectType = freezed,Object? bio = freezed,Object? visibility = null,Object? ageBracket = freezed,Object? createdAt = freezed,}) {
  return _then(CommunityProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pseudonym: null == pseudonym ? _self.pseudonym : pseudonym // ignore: cast_nullable_to_non_nullable
as String,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,ageBracket: freezed == ageBracket ? _self.ageBracket : ageBracket // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityProfile].
extension CommunityProfilePatterns on CommunityProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityProfile value)  $default,){
final _that = this;
switch (_that) {
case _CommunityProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pseudonym,  String? characterId,  List<String> interests,  String? projectType,  String? bio,  String visibility,  String? ageBracket,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityProfile() when $default != null:
return $default(_that.id,_that.pseudonym,_that.characterId,_that.interests,_that.projectType,_that.bio,_that.visibility,_that.ageBracket,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pseudonym,  String? characterId,  List<String> interests,  String? projectType,  String? bio,  String visibility,  String? ageBracket,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityProfile():
return $default(_that.id,_that.pseudonym,_that.characterId,_that.interests,_that.projectType,_that.bio,_that.visibility,_that.ageBracket,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pseudonym,  String? characterId,  List<String> interests,  String? projectType,  String? bio,  String visibility,  String? ageBracket,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityProfile() when $default != null:
return $default(_that.id,_that.pseudonym,_that.characterId,_that.interests,_that.projectType,_that.bio,_that.visibility,_that.ageBracket,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityProfile implements CommunityProfile {
  const _CommunityProfile({required this.id, this.pseudonym = '', this.characterId,  List<String> interests = const <String>[], this.projectType, this.bio, this.visibility = 'private', this.ageBracket, this.createdAt}): _interests = interests;
  factory _CommunityProfile.fromJson(Map<String, dynamic> json) => _$CommunityProfileFromJson(json);

@override final  String id;
@override@JsonKey() final  String pseudonym;
@override final  String? characterId;
 final  List<String> _interests;
@override@JsonKey() List<String> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

@override final  String? projectType;
@override final  String? bio;
@override@JsonKey() final  String visibility;
@override final  String? ageBracket;
@override final  DateTime? createdAt;

/// Create a copy of CommunityProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityProfileCopyWith<_CommunityProfile> get copyWith => __$CommunityProfileCopyWithImpl<_CommunityProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.pseudonym, pseudonym) || other.pseudonym == pseudonym)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&const DeepCollectionEquality().equals(other.interests, _interests)&&(identical(other.projectType, projectType) || other.projectType == projectType)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.ageBracket, ageBracket) || other.ageBracket == ageBracket)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pseudonym,characterId,const DeepCollectionEquality().hash(_interests),projectType,bio,visibility,ageBracket,createdAt);
}

@override
String toString() {
    return 'CommunityProfile(id: $id, pseudonym: $pseudonym, characterId: $characterId, interests: $interests, projectType: $projectType, bio: $bio, visibility: $visibility, ageBracket: $ageBracket, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityProfileCopyWith<$Res> implements $CommunityProfileCopyWith<$Res> {
  factory _$CommunityProfileCopyWith(_CommunityProfile value, $Res Function(_CommunityProfile) _then) = __$CommunityProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String pseudonym, String? characterId, List<String> interests, String? projectType, String? bio, String visibility, String? ageBracket, DateTime? createdAt
});




}
/// @nodoc
class __$CommunityProfileCopyWithImpl<$Res>
    implements _$CommunityProfileCopyWith<$Res> {
  __$CommunityProfileCopyWithImpl(this._self, this._then);

  final _CommunityProfile _self;
  final $Res Function(_CommunityProfile) _then;

/// Create a copy of CommunityProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pseudonym = null,Object? characterId = freezed,Object? interests = null,Object? projectType = freezed,Object? bio = freezed,Object? visibility = null,Object? ageBracket = freezed,Object? createdAt = freezed,}) {
  return _then(_CommunityProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pseudonym: null == pseudonym ? _self.pseudonym : pseudonym // ignore: cast_nullable_to_non_nullable
as String,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,projectType: freezed == projectType ? _self.projectType : projectType // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,ageBracket: freezed == ageBracket ? _self.ageBracket : ageBracket // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CommunityPost {

 String get id; String get authorId; String get authorPseudonym; String? get authorCharacterId; String get title; String get body; String? get groupId; String get status; DateTime? get createdAt;
/// Create a copy of CommunityPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityPostCopyWith<CommunityPost> get copyWith => _$CommunityPostCopyWithImpl<CommunityPost>(this as CommunityPost, _$identity);

  /// Serializes this CommunityPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommunityPost;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityPost&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.authorId, _this.authorId) || other.authorId == _this.authorId)&&(identical(other.authorPseudonym, _this.authorPseudonym) || other.authorPseudonym == _this.authorPseudonym)&&(identical(other.authorCharacterId, _this.authorCharacterId) || other.authorCharacterId == _this.authorCharacterId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.groupId, _this.groupId) || other.groupId == _this.groupId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommunityPost;
  return Object.hash(runtimeType,_this.id,_this.authorId,_this.authorPseudonym,_this.authorCharacterId,_this.title,_this.body,_this.groupId,_this.status,_this.createdAt);
}

@override
String toString() {
  final _this = this as CommunityPost;
  return 'CommunityPost(id: ${_this.id}, authorId: ${_this.authorId}, authorPseudonym: ${_this.authorPseudonym}, authorCharacterId: ${_this.authorCharacterId}, title: ${_this.title}, body: ${_this.body}, groupId: ${_this.groupId}, status: ${_this.status}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CommunityPostCopyWith<$Res>  {
  factory $CommunityPostCopyWith(CommunityPost value, $Res Function(CommunityPost) _then) = _$CommunityPostCopyWithImpl;
@useResult
$Res call({
 String id, String authorId, String authorPseudonym, String? authorCharacterId, String title, String body, String? groupId, String status, DateTime? createdAt
});




}
/// @nodoc
class _$CommunityPostCopyWithImpl<$Res>
    implements $CommunityPostCopyWith<$Res> {
  _$CommunityPostCopyWithImpl(this._self, this._then);

  final CommunityPost _self;
  final $Res Function(CommunityPost) _then;

/// Create a copy of CommunityPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? authorPseudonym = null,Object? authorCharacterId = freezed,Object? title = null,Object? body = null,Object? groupId = freezed,Object? status = null,Object? createdAt = freezed,}) {
  return _then(CommunityPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorPseudonym: null == authorPseudonym ? _self.authorPseudonym : authorPseudonym // ignore: cast_nullable_to_non_nullable
as String,authorCharacterId: freezed == authorCharacterId ? _self.authorCharacterId : authorCharacterId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityPost].
extension CommunityPostPatterns on CommunityPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityPost value)  $default,){
final _that = this;
switch (_that) {
case _CommunityPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityPost value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorPseudonym,  String? authorCharacterId,  String title,  String body,  String? groupId,  String status,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityPost() when $default != null:
return $default(_that.id,_that.authorId,_that.authorPseudonym,_that.authorCharacterId,_that.title,_that.body,_that.groupId,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorId,  String authorPseudonym,  String? authorCharacterId,  String title,  String body,  String? groupId,  String status,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityPost():
return $default(_that.id,_that.authorId,_that.authorPseudonym,_that.authorCharacterId,_that.title,_that.body,_that.groupId,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorId,  String authorPseudonym,  String? authorCharacterId,  String title,  String body,  String? groupId,  String status,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityPost() when $default != null:
return $default(_that.id,_that.authorId,_that.authorPseudonym,_that.authorCharacterId,_that.title,_that.body,_that.groupId,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityPost implements CommunityPost {
  const _CommunityPost({required this.id, this.authorId = '', this.authorPseudonym = '', this.authorCharacterId, this.title = '', this.body = '', this.groupId, this.status = 'published', this.createdAt});
  factory _CommunityPost.fromJson(Map<String, dynamic> json) => _$CommunityPostFromJson(json);

@override final  String id;
@override@JsonKey() final  String authorId;
@override@JsonKey() final  String authorPseudonym;
@override final  String? authorCharacterId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
@override final  String? groupId;
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;

/// Create a copy of CommunityPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityPostCopyWith<_CommunityPost> get copyWith => __$CommunityPostCopyWithImpl<_CommunityPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityPostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityPost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorPseudonym, authorPseudonym) || other.authorPseudonym == authorPseudonym)&&(identical(other.authorCharacterId, authorCharacterId) || other.authorCharacterId == authorCharacterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,authorId,authorPseudonym,authorCharacterId,title,body,groupId,status,createdAt);
}

@override
String toString() {
    return 'CommunityPost(id: $id, authorId: $authorId, authorPseudonym: $authorPseudonym, authorCharacterId: $authorCharacterId, title: $title, body: $body, groupId: $groupId, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityPostCopyWith<$Res> implements $CommunityPostCopyWith<$Res> {
  factory _$CommunityPostCopyWith(_CommunityPost value, $Res Function(_CommunityPost) _then) = __$CommunityPostCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorId, String authorPseudonym, String? authorCharacterId, String title, String body, String? groupId, String status, DateTime? createdAt
});




}
/// @nodoc
class __$CommunityPostCopyWithImpl<$Res>
    implements _$CommunityPostCopyWith<$Res> {
  __$CommunityPostCopyWithImpl(this._self, this._then);

  final _CommunityPost _self;
  final $Res Function(_CommunityPost) _then;

/// Create a copy of CommunityPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? authorPseudonym = null,Object? authorCharacterId = freezed,Object? title = null,Object? body = null,Object? groupId = freezed,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_CommunityPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorPseudonym: null == authorPseudonym ? _self.authorPseudonym : authorPseudonym // ignore: cast_nullable_to_non_nullable
as String,authorCharacterId: freezed == authorCharacterId ? _self.authorCharacterId : authorCharacterId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CommunityGroup {

 String get id; String get name; String? get description; int get memberCount; bool get moderated; bool get isMember;
/// Create a copy of CommunityGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityGroupCopyWith<CommunityGroup> get copyWith => _$CommunityGroupCopyWithImpl<CommunityGroup>(this as CommunityGroup, _$identity);

  /// Serializes this CommunityGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommunityGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityGroup&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.memberCount, _this.memberCount) || other.memberCount == _this.memberCount)&&(identical(other.moderated, _this.moderated) || other.moderated == _this.moderated)&&(identical(other.isMember, _this.isMember) || other.isMember == _this.isMember));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommunityGroup;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.memberCount,_this.moderated,_this.isMember);
}

@override
String toString() {
  final _this = this as CommunityGroup;
  return 'CommunityGroup(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, memberCount: ${_this.memberCount}, moderated: ${_this.moderated}, isMember: ${_this.isMember})';
}


}

/// @nodoc
abstract mixin class $CommunityGroupCopyWith<$Res>  {
  factory $CommunityGroupCopyWith(CommunityGroup value, $Res Function(CommunityGroup) _then) = _$CommunityGroupCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, int memberCount, bool moderated, bool isMember
});




}
/// @nodoc
class _$CommunityGroupCopyWithImpl<$Res>
    implements $CommunityGroupCopyWith<$Res> {
  _$CommunityGroupCopyWithImpl(this._self, this._then);

  final CommunityGroup _self;
  final $Res Function(CommunityGroup) _then;

/// Create a copy of CommunityGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? memberCount = null,Object? moderated = null,Object? isMember = null,}) {
  return _then(CommunityGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,moderated: null == moderated ? _self.moderated : moderated // ignore: cast_nullable_to_non_nullable
as bool,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityGroup].
extension CommunityGroupPatterns on CommunityGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityGroup value)  $default,){
final _that = this;
switch (_that) {
case _CommunityGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityGroup value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int memberCount,  bool moderated,  bool isMember)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityGroup() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.memberCount,_that.moderated,_that.isMember);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int memberCount,  bool moderated,  bool isMember)  $default,) {final _that = this;
switch (_that) {
case _CommunityGroup():
return $default(_that.id,_that.name,_that.description,_that.memberCount,_that.moderated,_that.isMember);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  int memberCount,  bool moderated,  bool isMember)?  $default,) {final _that = this;
switch (_that) {
case _CommunityGroup() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.memberCount,_that.moderated,_that.isMember);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityGroup implements CommunityGroup {
  const _CommunityGroup({required this.id, this.name = '', this.description, this.memberCount = 0, this.moderated = false, this.isMember = false});
  factory _CommunityGroup.fromJson(Map<String, dynamic> json) => _$CommunityGroupFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override final  String? description;
@override@JsonKey() final  int memberCount;
@override@JsonKey() final  bool moderated;
@override@JsonKey() final  bool isMember;

/// Create a copy of CommunityGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityGroupCopyWith<_CommunityGroup> get copyWith => __$CommunityGroupCopyWithImpl<_CommunityGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityGroupToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.moderated, moderated) || other.moderated == moderated)&&(identical(other.isMember, isMember) || other.isMember == isMember));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,memberCount,moderated,isMember);
}

@override
String toString() {
    return 'CommunityGroup(id: $id, name: $name, description: $description, memberCount: $memberCount, moderated: $moderated, isMember: $isMember)';
}


}

/// @nodoc
abstract mixin class _$CommunityGroupCopyWith<$Res> implements $CommunityGroupCopyWith<$Res> {
  factory _$CommunityGroupCopyWith(_CommunityGroup value, $Res Function(_CommunityGroup) _then) = __$CommunityGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, int memberCount, bool moderated, bool isMember
});




}
/// @nodoc
class __$CommunityGroupCopyWithImpl<$Res>
    implements _$CommunityGroupCopyWith<$Res> {
  __$CommunityGroupCopyWithImpl(this._self, this._then);

  final _CommunityGroup _self;
  final $Res Function(_CommunityGroup) _then;

/// Create a copy of CommunityGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? memberCount = null,Object? moderated = null,Object? isMember = null,}) {
  return _then(_CommunityGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,moderated: null == moderated ? _self.moderated : moderated // ignore: cast_nullable_to_non_nullable
as bool,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CommunityConnection {

 String get id; List<String> get members; String get requesterId; String get status; Map<String, String> get pseudonyms; DateTime? get createdAt;
/// Create a copy of CommunityConnection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityConnectionCopyWith<CommunityConnection> get copyWith => _$CommunityConnectionCopyWithImpl<CommunityConnection>(this as CommunityConnection, _$identity);

  /// Serializes this CommunityConnection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommunityConnection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityConnection&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.members, _this.members)&&(identical(other.requesterId, _this.requesterId) || other.requesterId == _this.requesterId)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.pseudonyms, _this.pseudonyms)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommunityConnection;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.members),_this.requesterId,_this.status,const DeepCollectionEquality().hash(_this.pseudonyms),_this.createdAt);
}

@override
String toString() {
  final _this = this as CommunityConnection;
  return 'CommunityConnection(id: ${_this.id}, members: ${_this.members}, requesterId: ${_this.requesterId}, status: ${_this.status}, pseudonyms: ${_this.pseudonyms}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CommunityConnectionCopyWith<$Res>  {
  factory $CommunityConnectionCopyWith(CommunityConnection value, $Res Function(CommunityConnection) _then) = _$CommunityConnectionCopyWithImpl;
@useResult
$Res call({
 String id, List<String> members, String requesterId, String status, Map<String, String> pseudonyms, DateTime? createdAt
});




}
/// @nodoc
class _$CommunityConnectionCopyWithImpl<$Res>
    implements $CommunityConnectionCopyWith<$Res> {
  _$CommunityConnectionCopyWithImpl(this._self, this._then);

  final CommunityConnection _self;
  final $Res Function(CommunityConnection) _then;

/// Create a copy of CommunityConnection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? members = null,Object? requesterId = null,Object? status = null,Object? pseudonyms = null,Object? createdAt = freezed,}) {
  return _then(CommunityConnection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<String>,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pseudonyms: null == pseudonyms ? _self.pseudonyms : pseudonyms // ignore: cast_nullable_to_non_nullable
as Map<String, String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityConnection].
extension CommunityConnectionPatterns on CommunityConnection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityConnection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityConnection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityConnection value)  $default,){
final _that = this;
switch (_that) {
case _CommunityConnection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityConnection value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityConnection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> members,  String requesterId,  String status,  Map<String, String> pseudonyms,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityConnection() when $default != null:
return $default(_that.id,_that.members,_that.requesterId,_that.status,_that.pseudonyms,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> members,  String requesterId,  String status,  Map<String, String> pseudonyms,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityConnection():
return $default(_that.id,_that.members,_that.requesterId,_that.status,_that.pseudonyms,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> members,  String requesterId,  String status,  Map<String, String> pseudonyms,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityConnection() when $default != null:
return $default(_that.id,_that.members,_that.requesterId,_that.status,_that.pseudonyms,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityConnection implements CommunityConnection {
  const _CommunityConnection({required this.id,  List<String> members = const <String>[], this.requesterId = '', this.status = 'pending',  Map<String, String> pseudonyms = const <String, String>{}, this.createdAt}): _members = members,_pseudonyms = pseudonyms;
  factory _CommunityConnection.fromJson(Map<String, dynamic> json) => _$CommunityConnectionFromJson(json);

@override final  String id;
 final  List<String> _members;
@override@JsonKey() List<String> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override@JsonKey() final  String requesterId;
@override@JsonKey() final  String status;
 final  Map<String, String> _pseudonyms;
@override@JsonKey() Map<String, String> get pseudonyms {
  if (_pseudonyms is EqualUnmodifiableMapView) return _pseudonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pseudonyms);
}

@override final  DateTime? createdAt;

/// Create a copy of CommunityConnection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityConnectionCopyWith<_CommunityConnection> get copyWith => __$CommunityConnectionCopyWithImpl<_CommunityConnection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityConnectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityConnection&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.members, _members)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pseudonyms, _pseudonyms)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_members),requesterId,status,const DeepCollectionEquality().hash(_pseudonyms),createdAt);
}

@override
String toString() {
    return 'CommunityConnection(id: $id, members: $members, requesterId: $requesterId, status: $status, pseudonyms: $pseudonyms, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityConnectionCopyWith<$Res> implements $CommunityConnectionCopyWith<$Res> {
  factory _$CommunityConnectionCopyWith(_CommunityConnection value, $Res Function(_CommunityConnection) _then) = __$CommunityConnectionCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> members, String requesterId, String status, Map<String, String> pseudonyms, DateTime? createdAt
});




}
/// @nodoc
class __$CommunityConnectionCopyWithImpl<$Res>
    implements _$CommunityConnectionCopyWith<$Res> {
  __$CommunityConnectionCopyWithImpl(this._self, this._then);

  final _CommunityConnection _self;
  final $Res Function(_CommunityConnection) _then;

/// Create a copy of CommunityConnection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? members = null,Object? requesterId = null,Object? status = null,Object? pseudonyms = null,Object? createdAt = freezed,}) {
  return _then(_CommunityConnection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<String>,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pseudonyms: null == pseudonyms ? _self._pseudonyms : pseudonyms // ignore: cast_nullable_to_non_nullable
as Map<String, String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CommunityMessage {

 String get id; String get senderId; String get text; String get status; DateTime? get createdAt;
/// Create a copy of CommunityMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityMessageCopyWith<CommunityMessage> get copyWith => _$CommunityMessageCopyWithImpl<CommunityMessage>(this as CommunityMessage, _$identity);

  /// Serializes this CommunityMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommunityMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityMessage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.senderId, _this.senderId) || other.senderId == _this.senderId)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommunityMessage;
  return Object.hash(runtimeType,_this.id,_this.senderId,_this.text,_this.status,_this.createdAt);
}

@override
String toString() {
  final _this = this as CommunityMessage;
  return 'CommunityMessage(id: ${_this.id}, senderId: ${_this.senderId}, text: ${_this.text}, status: ${_this.status}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CommunityMessageCopyWith<$Res>  {
  factory $CommunityMessageCopyWith(CommunityMessage value, $Res Function(CommunityMessage) _then) = _$CommunityMessageCopyWithImpl;
@useResult
$Res call({
 String id, String senderId, String text, String status, DateTime? createdAt
});




}
/// @nodoc
class _$CommunityMessageCopyWithImpl<$Res>
    implements $CommunityMessageCopyWith<$Res> {
  _$CommunityMessageCopyWithImpl(this._self, this._then);

  final CommunityMessage _self;
  final $Res Function(CommunityMessage) _then;

/// Create a copy of CommunityMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = null,Object? text = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(CommunityMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityMessage].
extension CommunityMessagePatterns on CommunityMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityMessage value)  $default,){
final _that = this;
switch (_that) {
case _CommunityMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityMessage value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderId,  String text,  String status,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityMessage() when $default != null:
return $default(_that.id,_that.senderId,_that.text,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderId,  String text,  String status,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityMessage():
return $default(_that.id,_that.senderId,_that.text,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderId,  String text,  String status,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityMessage() when $default != null:
return $default(_that.id,_that.senderId,_that.text,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityMessage implements CommunityMessage {
  const _CommunityMessage({required this.id, this.senderId = '', this.text = '', this.status = 'published', this.createdAt});
  factory _CommunityMessage.fromJson(Map<String, dynamic> json) => _$CommunityMessageFromJson(json);

@override final  String id;
@override@JsonKey() final  String senderId;
@override@JsonKey() final  String text;
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;

/// Create a copy of CommunityMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityMessageCopyWith<_CommunityMessage> get copyWith => __$CommunityMessageCopyWithImpl<_CommunityMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.text, text) || other.text == text)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,senderId,text,status,createdAt);
}

@override
String toString() {
    return 'CommunityMessage(id: $id, senderId: $senderId, text: $text, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityMessageCopyWith<$Res> implements $CommunityMessageCopyWith<$Res> {
  factory _$CommunityMessageCopyWith(_CommunityMessage value, $Res Function(_CommunityMessage) _then) = __$CommunityMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, String text, String status, DateTime? createdAt
});




}
/// @nodoc
class __$CommunityMessageCopyWithImpl<$Res>
    implements _$CommunityMessageCopyWith<$Res> {
  __$CommunityMessageCopyWithImpl(this._self, this._then);

  final _CommunityMessage _self;
  final $Res Function(_CommunityMessage) _then;

/// Create a copy of CommunityMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? text = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_CommunityMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CommunityMatch {

 CommunityProfile get profile; double? get similarity; List<String> get sharedInterests;
/// Create a copy of CommunityMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityMatchCopyWith<CommunityMatch> get copyWith => _$CommunityMatchCopyWithImpl<CommunityMatch>(this as CommunityMatch, _$identity);

  /// Serializes this CommunityMatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CommunityMatch;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityMatch&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.similarity, _this.similarity) || other.similarity == _this.similarity)&&const DeepCollectionEquality().equals(other.sharedInterests, _this.sharedInterests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CommunityMatch;
  return Object.hash(runtimeType,_this.profile,_this.similarity,const DeepCollectionEquality().hash(_this.sharedInterests));
}

@override
String toString() {
  final _this = this as CommunityMatch;
  return 'CommunityMatch(profile: ${_this.profile}, similarity: ${_this.similarity}, sharedInterests: ${_this.sharedInterests})';
}


}

/// @nodoc
abstract mixin class $CommunityMatchCopyWith<$Res>  {
  factory $CommunityMatchCopyWith(CommunityMatch value, $Res Function(CommunityMatch) _then) = _$CommunityMatchCopyWithImpl;
@useResult
$Res call({
 CommunityProfile profile, double? similarity, List<String> sharedInterests
});


$CommunityProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$CommunityMatchCopyWithImpl<$Res>
    implements $CommunityMatchCopyWith<$Res> {
  _$CommunityMatchCopyWithImpl(this._self, this._then);

  final CommunityMatch _self;
  final $Res Function(CommunityMatch) _then;

/// Create a copy of CommunityMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? similarity = freezed,Object? sharedInterests = null,}) {
  return _then(CommunityMatch(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CommunityProfile,similarity: freezed == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double?,sharedInterests: null == sharedInterests ? _self.sharedInterests : sharedInterests // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of CommunityMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityProfileCopyWith<$Res> get profile {
  
  return $CommunityProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommunityMatch].
extension CommunityMatchPatterns on CommunityMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityMatch value)  $default,){
final _that = this;
switch (_that) {
case _CommunityMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityMatch value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommunityProfile profile,  double? similarity,  List<String> sharedInterests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityMatch() when $default != null:
return $default(_that.profile,_that.similarity,_that.sharedInterests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommunityProfile profile,  double? similarity,  List<String> sharedInterests)  $default,) {final _that = this;
switch (_that) {
case _CommunityMatch():
return $default(_that.profile,_that.similarity,_that.sharedInterests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommunityProfile profile,  double? similarity,  List<String> sharedInterests)?  $default,) {final _that = this;
switch (_that) {
case _CommunityMatch() when $default != null:
return $default(_that.profile,_that.similarity,_that.sharedInterests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityMatch implements CommunityMatch {
  const _CommunityMatch({required this.profile, this.similarity,  List<String> sharedInterests = const <String>[]}): _sharedInterests = sharedInterests;
  factory _CommunityMatch.fromJson(Map<String, dynamic> json) => _$CommunityMatchFromJson(json);

@override final  CommunityProfile profile;
@override final  double? similarity;
 final  List<String> _sharedInterests;
@override@JsonKey() List<String> get sharedInterests {
  if (_sharedInterests is EqualUnmodifiableListView) return _sharedInterests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sharedInterests);
}


/// Create a copy of CommunityMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityMatchCopyWith<_CommunityMatch> get copyWith => __$CommunityMatchCopyWithImpl<_CommunityMatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityMatchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityMatch&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&const DeepCollectionEquality().equals(other.sharedInterests, _sharedInterests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,profile,similarity,const DeepCollectionEquality().hash(_sharedInterests));
}

@override
String toString() {
    return 'CommunityMatch(profile: $profile, similarity: $similarity, sharedInterests: $sharedInterests)';
}


}

/// @nodoc
abstract mixin class _$CommunityMatchCopyWith<$Res> implements $CommunityMatchCopyWith<$Res> {
  factory _$CommunityMatchCopyWith(_CommunityMatch value, $Res Function(_CommunityMatch) _then) = __$CommunityMatchCopyWithImpl;
@override @useResult
$Res call({
 CommunityProfile profile, double? similarity, List<String> sharedInterests
});


@override $CommunityProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$CommunityMatchCopyWithImpl<$Res>
    implements _$CommunityMatchCopyWith<$Res> {
  __$CommunityMatchCopyWithImpl(this._self, this._then);

  final _CommunityMatch _self;
  final $Res Function(_CommunityMatch) _then;

/// Create a copy of CommunityMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? similarity = freezed,Object? sharedInterests = null,}) {
  return _then(_CommunityMatch(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CommunityProfile,similarity: freezed == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double?,sharedInterests: null == sharedInterests ? _self._sharedInterests : sharedInterests // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of CommunityMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityProfileCopyWith<$Res> get profile {
  
  return $CommunityProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
