import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../core/firebase/firebase_providers.dart';
import '../firestore/error_mapping.dart';
import '../firestore/functions_client.dart';

part 'auth_repository.g.dart';

/// The signed-in user plus the custom claims the backend sets.
@immutable
class AuthSession {
  const AuthSession({
    required this.uid,
    this.email,
    this.displayName,
    this.profileComplete = false,
    this.ageBracket,
    this.plan,
    this.role,
  });

  final String uid;
  final String? email;
  final String? displayName;

  /// `profileComplete` custom claim: set once completeSignup succeeded.
  final bool profileComplete;
  final String? ageBracket;
  final String? plan;
  final String? role;

  @override
  bool operator ==(Object other) =>
      other is AuthSession &&
      other.uid == uid &&
      other.email == email &&
      other.displayName == displayName &&
      other.profileComplete == profileComplete &&
      other.ageBracket == ageBracket &&
      other.plan == plan &&
      other.role == role;

  @override
  int get hashCode => Object.hash(uid, email, displayName, profileComplete, ageBracket, plan, role);
}

/// The backend rejected signup because the user is under 13. The backend
/// deletes the account; the app shows a kind message and signs out.
class UnderageSignupException implements Exception {
  const UnderageSignupException(this.message);
  final String? message;
}

/// Email link was opened on a device that doesn't know which email it was
/// sent to; the UI asks for the email again.
class EmailNeededForLinkException implements Exception {
  const EmailNeededForLinkException();
}

class AuthRepository {
  AuthRepository(this._auth, this._functions, this._prefs);

  final FirebaseAuth _auth;
  final FunctionsClient _functions;
  final SharedPreferences _prefs;

  static const _pendingEmailKey = 'spark.pendingEmailLinkAddress';
  bool _googleInitialized = false;

  String? get currentUid => _auth.currentUser?.uid;

  /// Emits on sign-in, sign-out and every ID-token refresh (so claim changes
  /// after completeSignup or a plan change are picked up).
  Stream<AuthSession?> sessions() {
    return _auth.idTokenChanges().asyncMap((user) async {
      if (user == null) return null;
      Map<String, dynamic> claims = const <String, dynamic>{};
      try {
        claims = (await user.getIdTokenResult()).claims ?? const <String, dynamic>{};
      } on Object {
        // Offline: claims unavailable. Keep the session; claims refresh later.
      }
      return AuthSession(
        uid: user.uid,
        email: user.email,
        displayName: user.displayName,
        profileComplete: claims['profileComplete'] == true,
        ageBracket: claims['ageBracket'] as String?,
        plan: claims['plan'] as String?,
        role: claims['role'] as String?,
      );
    });
  }

  Future<void> refreshToken() async {
    try {
      await _auth.currentUser?.getIdToken(true);
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  // ---------------------------------------------------------------- Apple

  Future<void> signInWithApple() async {
    try {
      if (kIsWeb) {
        await _auth.signInWithPopup(AppleAuthProvider()..addScope('email')..addScope('name'));
        return;
      }
      if (defaultTargetPlatform != TargetPlatform.iOS && defaultTargetPlatform != TargetPlatform.macOS) {
        await _auth.signInWithProvider(AppleAuthProvider()..addScope('email')..addScope('name'));
        return;
      }
      final rawNonce = _nonce();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
      final apple = await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
        nonce: hashedNonce,
      );
      final credential = OAuthProvider('apple.com').credential(
        idToken: apple.identityToken,
        rawNonce: rawNonce,
        accessToken: apple.authorizationCode,
      );
      final result = await _auth.signInWithCredential(credential);
      // Apple shares the name only on the first sign-in.
      final name = <String?>[apple.givenName, apple.familyName].whereType<String>().join(' ').trim();
      if (name.isNotEmpty && (result.user?.displayName ?? '').isEmpty) {
        await result.user?.updateDisplayName(name);
      }
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const AppException(kind: AppErrorKind.cancelled);
      }
      throw AppException(kind: AppErrorKind.unknown, code: e.code.name, cause: e, retryable: true);
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  // --------------------------------------------------------------- Google

  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        await _auth.signInWithPopup(GoogleAuthProvider());
        return;
      }
      final google = GoogleSignIn.instance;
      if (!_googleInitialized) {
        await google.initialize(
          clientId: AppConfig.googleIosClientId.isEmpty ? null : AppConfig.googleIosClientId,
          serverClientId: AppConfig.googleServerClientId.isEmpty ? null : AppConfig.googleServerClientId,
        );
        _googleInitialized = true;
      }
      final account = await google.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null) {
        throw const AppException(kind: AppErrorKind.notConfigured, code: 'google-no-id-token');
      }
      await _auth.signInWithCredential(GoogleAuthProvider.credential(idToken: idToken));
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled || e.code == GoogleSignInExceptionCode.interrupted) {
        throw const AppException(kind: AppErrorKind.cancelled);
      }
      throw AppException(
        kind: e.code == GoogleSignInExceptionCode.clientConfigurationError
            ? AppErrorKind.notConfigured
            : AppErrorKind.unknown,
        code: e.code.name,
        cause: e,
        retryable: true,
      );
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  // ----------------------------------------------------------- Email link

  Future<void> sendEmailLink(String email) async {
    if (AppConfig.emailLinkUrl.isEmpty) {
      throw const AppException(kind: AppErrorKind.notConfigured, code: 'email-link-url-missing');
    }
    try {
      await _auth.sendSignInLinkToEmail(
        email: email.trim(),
        actionCodeSettings: ActionCodeSettings(
          url: AppConfig.emailLinkUrl,
          handleCodeInApp: true,
          iOSBundleId: AppConfig.iosBundleId,
          androidPackageName: AppConfig.androidPackageName,
          androidInstallApp: true,
          androidMinimumVersion: '23',
          linkDomain: AppConfig.emailLinkDomain.isEmpty ? null : AppConfig.emailLinkDomain,
        ),
      );
      await _prefs.setString(_pendingEmailKey, email.trim());
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  String? get pendingEmail => _prefs.getString(_pendingEmailKey);

  bool isEmailSignInLink(String link) {
    try {
      return _auth.isSignInWithEmailLink(link);
    } on Object {
      return false;
    }
  }

  Future<void> completeEmailLink(String link, {String? email}) async {
    final address = email ?? pendingEmail;
    if (address == null || address.isEmpty) throw const EmailNeededForLinkException();
    try {
      await _auth.signInWithEmailLink(email: address, emailLink: link);
      await _prefs.remove(_pendingEmailKey);
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  // ------------------------------------------------------------- Signup

  /// Calls `completeSignup`. On success the profileComplete claim is set and
  /// the ID token is refreshed so rules allow the rest of the app.
  Future<void> completeSignup({
    required String displayName,
    required int birthYear,
    required String timezone,
  }) async {
    try {
      await _functions.call('completeSignup', <String, Object?>{
        'displayName': displayName.trim(),
        'birthYear': birthYear,
        'timezone': timezone,
      });
    } on AppException catch (e) {
      final code = e.code ?? '';
      if (code.contains('under') || code == 'age-restricted' || code == 'underage') {
        // The backend already deleted the account; clear local auth state.
        await signOut();
        throw UnderageSignupException(e.message);
      }
      rethrow;
    }
    await refreshToken();
  }

  Future<void> signOut() async {
    try {
      if (!kIsWeb && _googleInitialized) {
        await GoogleSignIn.instance.signOut();
      }
    } on Object {
      // Google session cleanup is best-effort.
    }
    try {
      await _auth.signOut();
    } on Object catch (e) {
      throw mapError(e);
    }
  }

  static String _nonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List<String>.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository(
      ref.watch(firebaseAuthProvider),
      ref.watch(functionsClientProvider),
      ref.watch(sharedPreferencesProvider),
    );
