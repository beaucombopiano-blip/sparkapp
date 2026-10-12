import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import 'app/app.dart';
import 'app/theme/spark_colors.dart';
import 'app/theme/spark_palette.dart';
import 'app/theme/spark_theme.dart';
import 'core/config/app_config.dart';
import 'core/firebase/firebase_providers.dart';
import 'core/utils/l10n.dart';
import 'core/widgets/character_avatar.dart';
import 'core/widgets/spark_logo.dart';
import 'firebase_options.dart';

/// Handles data messages while the app is in the background (FCM requires a
/// top-level function). Notification messages are shown by the OS.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureFonts();
  _registerFontLicenses();

  tz_data.initializeTimeZones();
  try {
    final zone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(zone.identifier));
  } on Object {
    // Unknown zone identifier: the timezone package falls back to UTC.
  }

  final prefs = await SharedPreferences.getInstance();
  try {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    BundledAssets.register(manifest.listAssets());
  } on Object {
    BundledAssets.register(const <String>[]);
  }

  final FirebaseOptions options;
  try {
    options = DefaultFirebaseOptions.currentPlatform;
  } on FirebaseNotConfiguredException {
    runApp(const NotConfiguredApp());
    return;
  }

  await Firebase.initializeApp(options: options);
  await _activateAppCheck();
  if (AppConfig.useEmulators) await _connectEmulators();
  _configureCrashReporting();

  // Offline cache so cached data stays readable without a connection.
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  if (!kIsWeb) FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      // Failures surface as error states with an explicit Retry button.
      retry: (_, _) => null,
      child: const SparkApp(),
    ),
  );
}

Future<void> _activateAppCheck() async {
  try {
    await FirebaseAppCheck.instance.activate(
      providerAndroid: AppConfig.appCheckDebug || kDebugMode
          ? const AndroidDebugProvider()
          : const AndroidPlayIntegrityProvider(),
      providerApple: AppConfig.appCheckDebug || kDebugMode
          ? const AppleDebugProvider()
          : const AppleAppAttestWithDeviceCheckFallbackProvider(),
      providerWeb: AppConfig.appCheckWebSiteKey.isEmpty
          ? null
          : ReCaptchaEnterpriseProvider(AppConfig.appCheckWebSiteKey),
    );
  } on Object catch (e, st) {
    // App Check failures must not block start-up; the backend enforces it.
    debugPrint('App Check activation failed: $e\n$st');
  }
}

Future<void> _connectEmulators() async {
  final host = emulatorHost();
  await FirebaseAuth.instance.useAuthEmulator(host, 9099);
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  FirebaseFunctions.instanceFor(region: AppConfig.functionsRegion).useFunctionsEmulator(host, 5001);
  await FirebaseStorage.instance.useStorageEmulator(host, 9199);
}

void _configureCrashReporting() {
  if (kIsWeb) return;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

void _registerFontLicenses() {
  LicenseRegistry.addLicense(() async* {
    yield const LicenseEntryWithLineBreaks(
      <String>['google_fonts'],
      'Nunito and Inter are licensed under the SIL Open Font License, Version 1.1. '
      'https://openfontlicense.org',
    );
  });
}

/// Shown when the build has no Firebase configuration, instead of crashing.
class NotConfiguredApp extends StatelessWidget {
  const NotConfiguredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildSparkTheme(SparkColors.light(SparkPalette.spark)),
      darkTheme: buildSparkTheme(SparkColors.dark(SparkPalette.spark)),
      localizationsDelegates: <LocalizationsDelegate<Object?>>[
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SparkLogoFace(size: 96),
                    const SizedBox(height: 24),
                    Text(
                      context.l10n.notConfiguredTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(context.l10n.notConfiguredBody, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
