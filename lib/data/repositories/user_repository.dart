import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';
import '../firestore/json.dart';
import '../models/user.dart';

part 'user_repository.g.dart';

/// Profile, settings, entitlements and onboarding. Clients write only simple
/// preference fields (validated by Security Rules); everything else goes
/// through callables.
class UserRepository {
  UserRepository(this._db, this._functions);

  final FirebaseFirestore _db;
  final FunctionsClient _functions;

  DocumentReference<Map<String, dynamic>> _userDoc(String uid) => _db.collection('users').doc(uid);
  DocumentReference<Map<String, dynamic>> _settingsDoc(String uid) =>
      _userDoc(uid).collection('private').doc('settings');

  Stream<UserProfile?> watchProfile(String uid) => typedDoc(_userDoc(uid), UserProfile.fromJson)
      .snapshots()
      .map((s) => s.exists ? s.data() : null)
      .handleError((Object e) => throw mapError(e));

  Stream<UserSettings> watchSettings(String uid) => _settingsDoc(uid)
      .snapshots()
      .map((s) => s.exists ? UserSettings.fromJson(normalizeMap(s.data())) : const UserSettings())
      .handleError((Object e) => throw mapError(e));

  Stream<Entitlements?> watchEntitlements(String uid) => _userDoc(uid)
      .collection('private')
      .doc('entitlements')
      .snapshots()
      .map((s) => s.exists ? Entitlements.fromJson(normalizeMap(s.data())) : null)
      .handleError((Object e) => throw mapError(e));

  Stream<AppFlags> watchAppFlags() => _db
      .collection('config')
      .doc('app')
      .snapshots()
      .map((s) => s.exists ? AppFlags.fromJson(normalizeMap(s.data())) : const AppFlags())
      .handleError((Object e) => throw mapError(e));

  // --- Client-writable preference fields -------------------------------

  Future<void> _updateUser(String uid, Map<String, Object?> fields) async {
    try {
      await _userDoc(uid).update(<String, Object?>{...fields, 'updatedAt': FieldValue.serverTimestamp()});
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  Future<void> setAppearanceMode(String uid, AppearanceMode mode) =>
      _updateUser(uid, <String, Object?>{'appearanceMode': mode.name});

  Future<void> setTheme(String uid, String? themeId) => _updateUser(uid, <String, Object?>{'themeId': themeId});

  Future<void> setDisplayName(String uid, String name) =>
      _updateUser(uid, <String, Object?>{'displayName': name.trim()});

  Future<void> setTimezone(String uid, String timezone) =>
      _updateUser(uid, <String, Object?>{'timezone': timezone});

  /// City/region only (typed by the user); never precise location.
  Future<void> setLocation(String uid, {String? city, String? region, String? country}) => _updateUser(
        uid,
        <String, Object?>{'locationCity': city, 'locationRegion': region, 'locationCountry': country},
      );

  Future<void> updateNotificationPrefs(String uid, NotificationPrefs prefs) async {
    try {
      await _settingsDoc(uid).set(
        <String, Object?>{'notifications': prefs.toJson()},
        SetOptions(merge: true),
      );
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  Future<void> updateCalendarPrefs(
    String uid, {
    bool? syncSessionsToGoogle,
    bool? respectBusyTimes,
  }) async {
    try {
      await _settingsDoc(uid).set(
        <String, Object?>{
          'calendar': <String, Object?>{
            'syncSessionsToGoogle': ?syncSessionsToGoogle,
            'respectBusyTimes': ?respectBusyTimes,
          },
        },
        SetOptions(merge: true),
      );
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  Future<void> updatePrivacy(String uid, {String? communityVisibility}) async {
    try {
      await _settingsDoc(uid).set(
        <String, Object?>{
          'privacy': <String, Object?>{'communityVisibility': ?communityVisibility},
        },
        SetOptions(merge: true),
      );
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  // --- Callables ---------------------------------------------------------

  /// Saves the answers for [step] and moves the server state machine
  /// forward. Returns the new step.
  Future<OnboardingStep> advanceOnboarding(OnboardingStep step, [Map<String, Object?> payload = const {}]) async {
    final result = await _functions.call('advanceOnboarding', <String, Object?>{
      'step': step.name,
      'payload': payload,
    });
    return OnboardingStep.parse(result['onboardingStep'] as String?);
  }

  Future<void> setCharacter(String characterId) =>
      _functions.call('setCharacter', <String, Object?>{'characterId': characterId});

  /// Premium. The backend re-validates WCAG AA contrast and may reject with a
  /// helpful message (and the closest passing colour in `details`).
  Future<void> setCustomPalette(Map<String, Map<String, String>>? palette) =>
      _functions.call('setCustomPalette', <String, Object?>{'palette': palette});

  /// Records a consent (leaderboard, community, location, calendar…).
  Future<void> setConsent(String type, {required bool granted}) =>
      _functions.call('setConsent', <String, Object?>{'type': type, 'granted': granted});

  /// Starts discovery for a new project when the user has no active project
  /// (previous one completed or abandoned). The backend moves onboarding back
  /// to `pathChoice`, keeping character, notification and appearance choices.
  Future<void> startNewProject() => _functions.call('startNewProject');

  Future<void> deleteAccount() => _functions.call('deleteAccount', const <String, Object?>{}, const Duration(minutes: 3));
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) =>
    UserRepository(ref.watch(firestoreProvider), ref.watch(functionsClientProvider));
