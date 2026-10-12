// Firebase configuration.
//
// Running `flutterfire configure` overwrites this file with values for your
// Firebase project. Until then the options are read from --dart-define values
// so CI and local builds can be configured without editing code:
//
//   SPARK_FIREBASE_PROJECT_ID, SPARK_FIREBASE_MESSAGING_SENDER_ID,
//   SPARK_FIREBASE_STORAGE_BUCKET, SPARK_FIREBASE_AUTH_DOMAIN,
//   SPARK_FIREBASE_ANDROID_API_KEY, SPARK_FIREBASE_ANDROID_APP_ID,
//   SPARK_FIREBASE_IOS_API_KEY, SPARK_FIREBASE_IOS_APP_ID,
//   SPARK_FIREBASE_WEB_API_KEY, SPARK_FIREBASE_WEB_APP_ID,
//   SPARK_FIREBASE_MEASUREMENT_ID
//
// When nothing is configured the app shows a "not configured" screen rather
// than crashing (see main.dart).
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

import 'core/config/app_config.dart';

class FirebaseNotConfiguredException implements Exception {
  const FirebaseNotConfiguredException(this.platform);
  final String platform;

  @override
  String toString() =>
      'Firebase is not configured for $platform. Run `flutterfire configure` '
      'or pass the SPARK_FIREBASE_* --dart-define values.';
}

abstract final class DefaultFirebaseOptions {
  static const String _projectId = String.fromEnvironment('SPARK_FIREBASE_PROJECT_ID');
  static const String _senderId = String.fromEnvironment('SPARK_FIREBASE_MESSAGING_SENDER_ID');
  static const String _storageBucket = String.fromEnvironment('SPARK_FIREBASE_STORAGE_BUCKET');
  static const String _authDomain = String.fromEnvironment('SPARK_FIREBASE_AUTH_DOMAIN');
  static const String _measurementId = String.fromEnvironment('SPARK_FIREBASE_MEASUREMENT_ID');

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return _build(
        platform: 'web',
        apiKey: const String.fromEnvironment('SPARK_FIREBASE_WEB_API_KEY'),
        appId: const String.fromEnvironment('SPARK_FIREBASE_WEB_APP_ID'),
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _build(
          platform: 'android',
          apiKey: const String.fromEnvironment('SPARK_FIREBASE_ANDROID_API_KEY'),
          appId: const String.fromEnvironment('SPARK_FIREBASE_ANDROID_APP_ID'),
        );
      case TargetPlatform.iOS:
        return _build(
          platform: 'ios',
          apiKey: const String.fromEnvironment('SPARK_FIREBASE_IOS_API_KEY'),
          appId: const String.fromEnvironment('SPARK_FIREBASE_IOS_APP_ID'),
          iosBundleId: AppConfig.iosBundleId,
        );
      default:
        throw FirebaseNotConfiguredException(defaultTargetPlatform.name);
    }
  }

  static FirebaseOptions _build({
    required String platform,
    required String apiKey,
    required String appId,
    String? iosBundleId,
  }) {
    if (apiKey.isEmpty || appId.isEmpty || _projectId.isEmpty) {
      throw FirebaseNotConfiguredException(platform);
    }
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: _senderId,
      projectId: _projectId,
      storageBucket: _storageBucket.isEmpty ? null : _storageBucket,
      authDomain: _authDomain.isEmpty ? null : _authDomain,
      measurementId: _measurementId.isEmpty ? null : _measurementId,
      iosBundleId: iosBundleId,
    );
  }
}
