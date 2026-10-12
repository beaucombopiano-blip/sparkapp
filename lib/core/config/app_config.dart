/// Build-time configuration supplied with `--dart-define` (or
/// `--dart-define-from-file`). Nothing here is secret: Firebase web API keys,
/// RevenueCat public SDK keys and OAuth client IDs are designed to ship in apps.
///
/// Every value is documented in docs/FRONTEND_DECISIONS.md → Configuration.
abstract final class AppConfig {
  /// Connect Auth, Firestore, Functions and Storage to the local emulators.
  static const bool useEmulators = bool.fromEnvironment('SPARK_USE_EMULATORS');

  /// Emulator host. Empty means `10.0.2.2` on Android emulators and
  /// `localhost` everywhere else.
  static const String emulatorHost = String.fromEnvironment('SPARK_EMULATOR_HOST');

  /// Cloud Functions region (the backend sets one region globally).
  static const String functionsRegion =
      String.fromEnvironment('SPARK_FUNCTIONS_REGION', defaultValue: 'us-east1');

  /// Optional override for the HTTPS functions base URL used by streaming
  /// endpoints (e.g. a custom domain). Empty means
  /// `https://<region>-<projectId>.cloudfunctions.net`.
  static const String functionsBaseUrl = String.fromEnvironment('SPARK_FUNCTIONS_BASE_URL');

  /// The continue URL embedded in sign-in emails. It must be on an authorised
  /// domain and be handled by the app as a universal / app link.
  static const String emailLinkUrl = String.fromEnvironment('SPARK_EMAIL_LINK_URL');

  /// Firebase Hosting domain that opens the app for email links
  /// (ActionCodeSettings.linkDomain).
  static const String emailLinkDomain = String.fromEnvironment('SPARK_EMAIL_LINK_DOMAIN');

  static const String iosBundleId =
      String.fromEnvironment('SPARK_IOS_BUNDLE_ID', defaultValue: 'app.sparkteens.spark');
  static const String androidPackageName =
      String.fromEnvironment('SPARK_ANDROID_PACKAGE', defaultValue: 'app.sparkteens.spark');

  /// Web OAuth client ID used as `serverClientId` by google_sign_in on Android.
  static const String googleServerClientId =
      String.fromEnvironment('SPARK_GOOGLE_SERVER_CLIENT_ID');

  /// iOS OAuth client ID (optional when GoogleService-Info.plist provides it).
  static const String googleIosClientId = String.fromEnvironment('SPARK_GOOGLE_IOS_CLIENT_ID');

  /// reCAPTCHA Enterprise site key for App Check on web.
  static const String appCheckWebSiteKey = String.fromEnvironment('SPARK_APP_CHECK_WEB_SITE_KEY');

  /// Use App Check debug providers (development builds only).
  static const bool appCheckDebug = bool.fromEnvironment('SPARK_APP_CHECK_DEBUG');

  static const String revenueCatAppleKey = String.fromEnvironment('SPARK_REVENUECAT_APPLE_KEY');
  static const String revenueCatGoogleKey = String.fromEnvironment('SPARK_REVENUECAT_GOOGLE_KEY');
  static const String revenueCatWebKey = String.fromEnvironment('SPARK_REVENUECAT_WEB_KEY');

  /// AdMob banner unit IDs. Ads only ever load for plans with adsEnabled.
  static const String admobBannerAndroid = String.fromEnvironment('SPARK_ADMOB_BANNER_ANDROID');
  static const String admobBannerIos = String.fromEnvironment('SPARK_ADMOB_BANNER_IOS');

  static const String supportEmail = String.fromEnvironment('SPARK_SUPPORT_EMAIL');
  static const String termsUrl = String.fromEnvironment('SPARK_TERMS_URL');
  static const String privacyUrl = String.fromEnvironment('SPARK_PRIVACY_URL');

  /// Custom URL scheme used for OAuth returns (Google Calendar) and
  /// notification deep links.
  static const String urlScheme = String.fromEnvironment('SPARK_URL_SCHEME', defaultValue: 'spark');
}
