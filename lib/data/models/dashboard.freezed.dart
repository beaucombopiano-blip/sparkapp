// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NextSessionInfo {

 WorkSession get session; Task? get firstTask;
/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextSessionInfoCopyWith<NextSessionInfo> get copyWith => _$NextSessionInfoCopyWithImpl<NextSessionInfo>(this as NextSessionInfo, _$identity);

  /// Serializes this NextSessionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NextSessionInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextSessionInfo&&(identical(other.session, _this.session) || other.session == _this.session)&&(identical(other.firstTask, _this.firstTask) || other.firstTask == _this.firstTask));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NextSessionInfo;
  return Object.hash(runtimeType,_this.session,_this.firstTask);
}

@override
String toString() {
  final _this = this as NextSessionInfo;
  return 'NextSessionInfo(session: ${_this.session}, firstTask: ${_this.firstTask})';
}


}

/// @nodoc
abstract mixin class $NextSessionInfoCopyWith<$Res>  {
  factory $NextSessionInfoCopyWith(NextSessionInfo value, $Res Function(NextSessionInfo) _then) = _$NextSessionInfoCopyWithImpl;
@useResult
$Res call({
 WorkSession session, Task? firstTask
});


$WorkSessionCopyWith<$Res> get session;$TaskCopyWith<$Res>? get firstTask;

}
/// @nodoc
class _$NextSessionInfoCopyWithImpl<$Res>
    implements $NextSessionInfoCopyWith<$Res> {
  _$NextSessionInfoCopyWithImpl(this._self, this._then);

  final NextSessionInfo _self;
  final $Res Function(NextSessionInfo) _then;

/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? firstTask = freezed,}) {
  return _then(NextSessionInfo(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkSession,firstTask: freezed == firstTask ? _self.firstTask : firstTask // ignore: cast_nullable_to_non_nullable
as Task?,
  ));
}
/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<$Res> get session {
  
  return $WorkSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res>? get firstTask {
    if (_self.firstTask == null) {
    return null;
  }

  return $TaskCopyWith<$Res>(_self.firstTask!, (value) {
    return _then(_self.copyWith(firstTask: value));
  });
}
}


/// Adds pattern-matching-related methods to [NextSessionInfo].
extension NextSessionInfoPatterns on NextSessionInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NextSessionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NextSessionInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NextSessionInfo value)  $default,){
final _that = this;
switch (_that) {
case _NextSessionInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NextSessionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _NextSessionInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkSession session,  Task? firstTask)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NextSessionInfo() when $default != null:
return $default(_that.session,_that.firstTask);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkSession session,  Task? firstTask)  $default,) {final _that = this;
switch (_that) {
case _NextSessionInfo():
return $default(_that.session,_that.firstTask);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkSession session,  Task? firstTask)?  $default,) {final _that = this;
switch (_that) {
case _NextSessionInfo() when $default != null:
return $default(_that.session,_that.firstTask);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NextSessionInfo implements NextSessionInfo {
  const _NextSessionInfo({required this.session, this.firstTask});
  factory _NextSessionInfo.fromJson(Map<String, dynamic> json) => _$NextSessionInfoFromJson(json);

@override final  WorkSession session;
@override final  Task? firstTask;

/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextSessionInfoCopyWith<_NextSessionInfo> get copyWith => __$NextSessionInfoCopyWithImpl<_NextSessionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NextSessionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextSessionInfo&&(identical(other.session, session) || other.session == session)&&(identical(other.firstTask, firstTask) || other.firstTask == firstTask));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,session,firstTask);
}

@override
String toString() {
    return 'NextSessionInfo(session: $session, firstTask: $firstTask)';
}


}

/// @nodoc
abstract mixin class _$NextSessionInfoCopyWith<$Res> implements $NextSessionInfoCopyWith<$Res> {
  factory _$NextSessionInfoCopyWith(_NextSessionInfo value, $Res Function(_NextSessionInfo) _then) = __$NextSessionInfoCopyWithImpl;
@override @useResult
$Res call({
 WorkSession session, Task? firstTask
});


@override $WorkSessionCopyWith<$Res> get session;@override $TaskCopyWith<$Res>? get firstTask;

}
/// @nodoc
class __$NextSessionInfoCopyWithImpl<$Res>
    implements _$NextSessionInfoCopyWith<$Res> {
  __$NextSessionInfoCopyWithImpl(this._self, this._then);

  final _NextSessionInfo _self;
  final $Res Function(_NextSessionInfo) _then;

/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? firstTask = freezed,}) {
  return _then(_NextSessionInfo(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkSession,firstTask: freezed == firstTask ? _self.firstTask : firstTask // ignore: cast_nullable_to_non_nullable
as Task?,
  ));
}

/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkSessionCopyWith<$Res> get session {
  
  return $WorkSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of NextSessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res>? get firstTask {
    if (_self.firstTask == null) {
    return null;
  }

  return $TaskCopyWith<$Res>(_self.firstTask!, (value) {
    return _then(_self.copyWith(firstTask: value));
  });
}
}


/// @nodoc
mixin _$HomeDashboard {

 String get displayName; String? get characterId; Project? get activeProject; NamedRef? get currentMilestone; Progress? get progress; NextSessionInfo? get nextSession; List<Task> get currentTasks; Streaks? get streaks; List<Celebration> get unreadCelebrations; bool get checkinReady; bool get monthlyReflectionReady; String? get quote; String? get quoteAuthor;
/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDashboardCopyWith<HomeDashboard> get copyWith => _$HomeDashboardCopyWithImpl<HomeDashboard>(this as HomeDashboard, _$identity);

  /// Serializes this HomeDashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeDashboard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDashboard&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.characterId, _this.characterId) || other.characterId == _this.characterId)&&(identical(other.activeProject, _this.activeProject) || other.activeProject == _this.activeProject)&&(identical(other.currentMilestone, _this.currentMilestone) || other.currentMilestone == _this.currentMilestone)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.nextSession, _this.nextSession) || other.nextSession == _this.nextSession)&&const DeepCollectionEquality().equals(other.currentTasks, _this.currentTasks)&&(identical(other.streaks, _this.streaks) || other.streaks == _this.streaks)&&const DeepCollectionEquality().equals(other.unreadCelebrations, _this.unreadCelebrations)&&(identical(other.checkinReady, _this.checkinReady) || other.checkinReady == _this.checkinReady)&&(identical(other.monthlyReflectionReady, _this.monthlyReflectionReady) || other.monthlyReflectionReady == _this.monthlyReflectionReady)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&(identical(other.quoteAuthor, _this.quoteAuthor) || other.quoteAuthor == _this.quoteAuthor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeDashboard;
  return Object.hash(runtimeType,_this.displayName,_this.characterId,_this.activeProject,_this.currentMilestone,_this.progress,_this.nextSession,const DeepCollectionEquality().hash(_this.currentTasks),_this.streaks,const DeepCollectionEquality().hash(_this.unreadCelebrations),_this.checkinReady,_this.monthlyReflectionReady,_this.quote,_this.quoteAuthor);
}

@override
String toString() {
  final _this = this as HomeDashboard;
  return 'HomeDashboard(displayName: ${_this.displayName}, characterId: ${_this.characterId}, activeProject: ${_this.activeProject}, currentMilestone: ${_this.currentMilestone}, progress: ${_this.progress}, nextSession: ${_this.nextSession}, currentTasks: ${_this.currentTasks}, streaks: ${_this.streaks}, unreadCelebrations: ${_this.unreadCelebrations}, checkinReady: ${_this.checkinReady}, monthlyReflectionReady: ${_this.monthlyReflectionReady}, quote: ${_this.quote}, quoteAuthor: ${_this.quoteAuthor})';
}


}

/// @nodoc
abstract mixin class $HomeDashboardCopyWith<$Res>  {
  factory $HomeDashboardCopyWith(HomeDashboard value, $Res Function(HomeDashboard) _then) = _$HomeDashboardCopyWithImpl;
@useResult
$Res call({
 String displayName, String? characterId, Project? activeProject, NamedRef? currentMilestone, Progress? progress, NextSessionInfo? nextSession, List<Task> currentTasks, Streaks? streaks, List<Celebration> unreadCelebrations, bool checkinReady, bool monthlyReflectionReady, String? quote, String? quoteAuthor
});


$ProjectCopyWith<$Res>? get activeProject;$NamedRefCopyWith<$Res>? get currentMilestone;$ProgressCopyWith<$Res>? get progress;$NextSessionInfoCopyWith<$Res>? get nextSession;$StreaksCopyWith<$Res>? get streaks;

}
/// @nodoc
class _$HomeDashboardCopyWithImpl<$Res>
    implements $HomeDashboardCopyWith<$Res> {
  _$HomeDashboardCopyWithImpl(this._self, this._then);

  final HomeDashboard _self;
  final $Res Function(HomeDashboard) _then;

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? characterId = freezed,Object? activeProject = freezed,Object? currentMilestone = freezed,Object? progress = freezed,Object? nextSession = freezed,Object? currentTasks = null,Object? streaks = freezed,Object? unreadCelebrations = null,Object? checkinReady = null,Object? monthlyReflectionReady = null,Object? quote = freezed,Object? quoteAuthor = freezed,}) {
  return _then(HomeDashboard(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,activeProject: freezed == activeProject ? _self.activeProject : activeProject // ignore: cast_nullable_to_non_nullable
as Project?,currentMilestone: freezed == currentMilestone ? _self.currentMilestone : currentMilestone // ignore: cast_nullable_to_non_nullable
as NamedRef?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Progress?,nextSession: freezed == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as NextSessionInfo?,currentTasks: null == currentTasks ? _self.currentTasks : currentTasks // ignore: cast_nullable_to_non_nullable
as List<Task>,streaks: freezed == streaks ? _self.streaks : streaks // ignore: cast_nullable_to_non_nullable
as Streaks?,unreadCelebrations: null == unreadCelebrations ? _self.unreadCelebrations : unreadCelebrations // ignore: cast_nullable_to_non_nullable
as List<Celebration>,checkinReady: null == checkinReady ? _self.checkinReady : checkinReady // ignore: cast_nullable_to_non_nullable
as bool,monthlyReflectionReady: null == monthlyReflectionReady ? _self.monthlyReflectionReady : monthlyReflectionReady // ignore: cast_nullable_to_non_nullable
as bool,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,quoteAuthor: freezed == quoteAuthor ? _self.quoteAuthor : quoteAuthor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res>? get activeProject {
    if (_self.activeProject == null) {
    return null;
  }

  return $ProjectCopyWith<$Res>(_self.activeProject!, (value) {
    return _then(_self.copyWith(activeProject: value));
  });
}/// Create a copy of HomeDashboard
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
}/// Create a copy of HomeDashboard
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
}/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextSessionInfoCopyWith<$Res>? get nextSession {
    if (_self.nextSession == null) {
    return null;
  }

  return $NextSessionInfoCopyWith<$Res>(_self.nextSession!, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}/// Create a copy of HomeDashboard
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


/// Adds pattern-matching-related methods to [HomeDashboard].
extension HomeDashboardPatterns on HomeDashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeDashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeDashboard value)  $default,){
final _that = this;
switch (_that) {
case _HomeDashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeDashboard value)?  $default,){
final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  String? characterId,  Project? activeProject,  NamedRef? currentMilestone,  Progress? progress,  NextSessionInfo? nextSession,  List<Task> currentTasks,  Streaks? streaks,  List<Celebration> unreadCelebrations,  bool checkinReady,  bool monthlyReflectionReady,  String? quote,  String? quoteAuthor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
return $default(_that.displayName,_that.characterId,_that.activeProject,_that.currentMilestone,_that.progress,_that.nextSession,_that.currentTasks,_that.streaks,_that.unreadCelebrations,_that.checkinReady,_that.monthlyReflectionReady,_that.quote,_that.quoteAuthor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  String? characterId,  Project? activeProject,  NamedRef? currentMilestone,  Progress? progress,  NextSessionInfo? nextSession,  List<Task> currentTasks,  Streaks? streaks,  List<Celebration> unreadCelebrations,  bool checkinReady,  bool monthlyReflectionReady,  String? quote,  String? quoteAuthor)  $default,) {final _that = this;
switch (_that) {
case _HomeDashboard():
return $default(_that.displayName,_that.characterId,_that.activeProject,_that.currentMilestone,_that.progress,_that.nextSession,_that.currentTasks,_that.streaks,_that.unreadCelebrations,_that.checkinReady,_that.monthlyReflectionReady,_that.quote,_that.quoteAuthor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  String? characterId,  Project? activeProject,  NamedRef? currentMilestone,  Progress? progress,  NextSessionInfo? nextSession,  List<Task> currentTasks,  Streaks? streaks,  List<Celebration> unreadCelebrations,  bool checkinReady,  bool monthlyReflectionReady,  String? quote,  String? quoteAuthor)?  $default,) {final _that = this;
switch (_that) {
case _HomeDashboard() when $default != null:
return $default(_that.displayName,_that.characterId,_that.activeProject,_that.currentMilestone,_that.progress,_that.nextSession,_that.currentTasks,_that.streaks,_that.unreadCelebrations,_that.checkinReady,_that.monthlyReflectionReady,_that.quote,_that.quoteAuthor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeDashboard implements HomeDashboard {
  const _HomeDashboard({this.displayName = '', this.characterId, this.activeProject, this.currentMilestone, this.progress, this.nextSession,  List<Task> currentTasks = const <Task>[], this.streaks,  List<Celebration> unreadCelebrations = const <Celebration>[], this.checkinReady = false, this.monthlyReflectionReady = false, this.quote, this.quoteAuthor}): _currentTasks = currentTasks,_unreadCelebrations = unreadCelebrations;
  factory _HomeDashboard.fromJson(Map<String, dynamic> json) => _$HomeDashboardFromJson(json);

@override@JsonKey() final  String displayName;
@override final  String? characterId;
@override final  Project? activeProject;
@override final  NamedRef? currentMilestone;
@override final  Progress? progress;
@override final  NextSessionInfo? nextSession;
 final  List<Task> _currentTasks;
@override@JsonKey() List<Task> get currentTasks {
  if (_currentTasks is EqualUnmodifiableListView) return _currentTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentTasks);
}

@override final  Streaks? streaks;
 final  List<Celebration> _unreadCelebrations;
@override@JsonKey() List<Celebration> get unreadCelebrations {
  if (_unreadCelebrations is EqualUnmodifiableListView) return _unreadCelebrations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unreadCelebrations);
}

@override@JsonKey() final  bool checkinReady;
@override@JsonKey() final  bool monthlyReflectionReady;
@override final  String? quote;
@override final  String? quoteAuthor;

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDashboardCopyWith<_HomeDashboard> get copyWith => __$HomeDashboardCopyWithImpl<_HomeDashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeDashboardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeDashboard&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.activeProject, activeProject) || other.activeProject == activeProject)&&(identical(other.currentMilestone, currentMilestone) || other.currentMilestone == currentMilestone)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&const DeepCollectionEquality().equals(other.currentTasks, _currentTasks)&&(identical(other.streaks, streaks) || other.streaks == streaks)&&const DeepCollectionEquality().equals(other.unreadCelebrations, _unreadCelebrations)&&(identical(other.checkinReady, checkinReady) || other.checkinReady == checkinReady)&&(identical(other.monthlyReflectionReady, monthlyReflectionReady) || other.monthlyReflectionReady == monthlyReflectionReady)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.quoteAuthor, quoteAuthor) || other.quoteAuthor == quoteAuthor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,displayName,characterId,activeProject,currentMilestone,progress,nextSession,const DeepCollectionEquality().hash(_currentTasks),streaks,const DeepCollectionEquality().hash(_unreadCelebrations),checkinReady,monthlyReflectionReady,quote,quoteAuthor);
}

@override
String toString() {
    return 'HomeDashboard(displayName: $displayName, characterId: $characterId, activeProject: $activeProject, currentMilestone: $currentMilestone, progress: $progress, nextSession: $nextSession, currentTasks: $currentTasks, streaks: $streaks, unreadCelebrations: $unreadCelebrations, checkinReady: $checkinReady, monthlyReflectionReady: $monthlyReflectionReady, quote: $quote, quoteAuthor: $quoteAuthor)';
}


}

/// @nodoc
abstract mixin class _$HomeDashboardCopyWith<$Res> implements $HomeDashboardCopyWith<$Res> {
  factory _$HomeDashboardCopyWith(_HomeDashboard value, $Res Function(_HomeDashboard) _then) = __$HomeDashboardCopyWithImpl;
@override @useResult
$Res call({
 String displayName, String? characterId, Project? activeProject, NamedRef? currentMilestone, Progress? progress, NextSessionInfo? nextSession, List<Task> currentTasks, Streaks? streaks, List<Celebration> unreadCelebrations, bool checkinReady, bool monthlyReflectionReady, String? quote, String? quoteAuthor
});


@override $ProjectCopyWith<$Res>? get activeProject;@override $NamedRefCopyWith<$Res>? get currentMilestone;@override $ProgressCopyWith<$Res>? get progress;@override $NextSessionInfoCopyWith<$Res>? get nextSession;@override $StreaksCopyWith<$Res>? get streaks;

}
/// @nodoc
class __$HomeDashboardCopyWithImpl<$Res>
    implements _$HomeDashboardCopyWith<$Res> {
  __$HomeDashboardCopyWithImpl(this._self, this._then);

  final _HomeDashboard _self;
  final $Res Function(_HomeDashboard) _then;

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? characterId = freezed,Object? activeProject = freezed,Object? currentMilestone = freezed,Object? progress = freezed,Object? nextSession = freezed,Object? currentTasks = null,Object? streaks = freezed,Object? unreadCelebrations = null,Object? checkinReady = null,Object? monthlyReflectionReady = null,Object? quote = freezed,Object? quoteAuthor = freezed,}) {
  return _then(_HomeDashboard(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as String?,activeProject: freezed == activeProject ? _self.activeProject : activeProject // ignore: cast_nullable_to_non_nullable
as Project?,currentMilestone: freezed == currentMilestone ? _self.currentMilestone : currentMilestone // ignore: cast_nullable_to_non_nullable
as NamedRef?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Progress?,nextSession: freezed == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as NextSessionInfo?,currentTasks: null == currentTasks ? _self._currentTasks : currentTasks // ignore: cast_nullable_to_non_nullable
as List<Task>,streaks: freezed == streaks ? _self.streaks : streaks // ignore: cast_nullable_to_non_nullable
as Streaks?,unreadCelebrations: null == unreadCelebrations ? _self._unreadCelebrations : unreadCelebrations // ignore: cast_nullable_to_non_nullable
as List<Celebration>,checkinReady: null == checkinReady ? _self.checkinReady : checkinReady // ignore: cast_nullable_to_non_nullable
as bool,monthlyReflectionReady: null == monthlyReflectionReady ? _self.monthlyReflectionReady : monthlyReflectionReady // ignore: cast_nullable_to_non_nullable
as bool,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,quoteAuthor: freezed == quoteAuthor ? _self.quoteAuthor : quoteAuthor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res>? get activeProject {
    if (_self.activeProject == null) {
    return null;
  }

  return $ProjectCopyWith<$Res>(_self.activeProject!, (value) {
    return _then(_self.copyWith(activeProject: value));
  });
}/// Create a copy of HomeDashboard
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
}/// Create a copy of HomeDashboard
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
}/// Create a copy of HomeDashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextSessionInfoCopyWith<$Res>? get nextSession {
    if (_self.nextSession == null) {
    return null;
  }

  return $NextSessionInfoCopyWith<$Res>(_self.nextSession!, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}/// Create a copy of HomeDashboard
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

// dart format on
