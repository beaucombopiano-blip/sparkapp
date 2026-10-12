import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';

part 'firebase_providers.g.dart';

/// Firebase SDK singletons. Only repositories read these; tests override them.

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(Ref ref) => FirebaseFirestore.instance;

@Riverpod(keepAlive: true)
FirebaseFunctions firebaseFunctions(Ref ref) =>
    FirebaseFunctions.instanceFor(region: AppConfig.functionsRegion);

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(Ref ref) => FirebaseStorage.instance;

@Riverpod(keepAlive: true)
FirebaseMessaging firebaseMessaging(Ref ref) => FirebaseMessaging.instance;

@Riverpod(keepAlive: true)
FirebaseAppCheck firebaseAppCheck(Ref ref) => FirebaseAppCheck.instance;

@Riverpod(keepAlive: true)
FirebaseAnalytics firebaseAnalytics(Ref ref) => FirebaseAnalytics.instance;

/// Device-local preferences (UI conveniences only). Overridden in main.dart
/// with the instance loaded before runApp.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) =>
    throw UnimplementedError('sharedPreferencesProvider must be overridden in main()');

/// Base URL for HTTPS (streaming) functions.
@Riverpod(keepAlive: true)
String functionsBaseUrl(Ref ref) {
  final projectId = Firebase.app().options.projectId;
  if (AppConfig.useEmulators) {
    return 'http://${emulatorHost()}:5001/$projectId/${AppConfig.functionsRegion}';
  }
  if (AppConfig.functionsBaseUrl.isNotEmpty) return AppConfig.functionsBaseUrl;
  return 'https://${AppConfig.functionsRegion}-$projectId.cloudfunctions.net';
}

/// Emulator host: explicit define, else 10.0.2.2 on Android emulators.
String emulatorHost() {
  if (AppConfig.emulatorHost.isNotEmpty) return AppConfig.emulatorHost;
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) return '10.0.2.2';
  return 'localhost';
}
