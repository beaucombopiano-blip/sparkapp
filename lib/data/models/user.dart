import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum AppearanceMode { light, dark, system }

enum OnboardingPath { hasIdea, findIdea, unknown }

enum AgeBracket { teen, adult, unknown }

/// Server onboarding state machine (forward-only, enforced by
/// `advanceOnboarding`).
enum OnboardingStep {
  welcome,
  pathChoice,
  discovery,
  recommendations,
  projectSelected,
  deadline,
  availability,
  character,
  notifications,
  appearance,
  tutorial,
  complete;

  static OnboardingStep parse(String? value) =>
      OnboardingStep.values.firstWhere((s) => s.name == value, orElse: () => OnboardingStep.welcome);
}

/// `users/{uid}`
@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String id,
    @Default('') String displayName,
    int? birthYear,
    @JsonKey(unknownEnumValue: AgeBracket.unknown) AgeBracket? ageBracket,
    String? timezone,
    String? locationCity,
    String? locationRegion,
    String? locationCountry,
    String? characterId,
    @JsonKey(unknownEnumValue: AppearanceMode.system) @Default(AppearanceMode.system) AppearanceMode appearanceMode,
    String? themeId,

    /// `{ "light": {role: "#RRGGBB"}, "dark": {role: "#RRGGBB"} }`
    @Default(<String, Map<String, String>>{}) Map<String, Map<String, String>> customPalette,
    @JsonKey(unknownEnumValue: OnboardingPath.unknown) OnboardingPath? onboardingPath,
    @Default('welcome') String onboardingStep,
    @Default(<String, dynamic>{}) Map<String, dynamic> onboardingAnswers,
    String? activeProjectId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  OnboardingStep get step => OnboardingStep.parse(onboardingStep);
  bool get onboardingComplete => step == OnboardingStep.complete;
  String get firstName => displayName.trim().split(RegExp(r'\s+')).first;
}

/// `users/{uid}/private/settings`
@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default(NotificationPrefs()) NotificationPrefs notifications,
    @Default(PrivacySettings()) PrivacySettings privacy,
    @Default(CalendarSettings()) CalendarSettings calendar,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);
}

@freezed
abstract class NotificationPrefs with _$NotificationPrefs {
  const factory NotificationPrefs({
    @Default(true) bool dailyQuote,
    @Default(true) bool sessionReminder,
    @Default(10) int sessionReminderLeadMinutes,
    @Default(true) bool taskDeadlineReminders,
    @Default(true) bool weeklyCheckin,
    @Default(true) bool monthlyReflection,
    @Default(true) bool celebrations,

    /// Local "HH:mm"; null means no quiet hours.
    String? quietHoursStart,
    String? quietHoursEnd,
    @Default(4) int maxPerDay,

    /// Last known OS permission state reported by the app: granted | denied | unknown.
    @Default('unknown') String osPermission,
  }) = _NotificationPrefs;

  factory NotificationPrefs.fromJson(Map<String, dynamic> json) => _$NotificationPrefsFromJson(json);
}

@freezed
abstract class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @Default(false) bool leaderboardOptIn,
    @Default(false) bool communityOptIn,
    @Default('private') String communityVisibility,
    @Default(false) bool shareLocationForOpportunities,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) => _$PrivacySettingsFromJson(json);
}

enum CalendarSyncState { idle, syncing, ok, error, disconnected }

@freezed
abstract class CalendarSettings with _$CalendarSettings {
  const factory CalendarSettings({
    @Default(false) bool connected,
    String? googleEmail,
    @Default(true) bool syncSessionsToGoogle,
    String? targetCalendarId,
    String? targetCalendarName,
    @Default(true) bool respectBusyTimes,
    @JsonKey(unknownEnumValue: CalendarSyncState.idle)
    @Default(CalendarSyncState.disconnected)
    CalendarSyncState syncState,
    DateTime? lastSyncAt,
    String? lastError,
  }) = _CalendarSettings;

  factory CalendarSettings.fromJson(Map<String, dynamic> json) => _$CalendarSettingsFromJson(json);
}

/// `config/app` — runtime flags shared by every client.
@freezed
abstract class AppFlags with _$AppFlags {
  const AppFlags._();

  const factory AppFlags({
    /// `all_premium` (launch default) or `enforced`.
    @Default('all_premium') String entitlementsMode,
    @Default(false) bool communityEnabled,
    String? supportEmail,
    String? termsUrl,
    String? privacyUrl,
  }) = _AppFlags;

  factory AppFlags.fromJson(Map<String, dynamic> json) => _$AppFlagsFromJson(json);

  bool get entitlementsEnforced => entitlementsMode == 'enforced';
}

/// `users/{uid}/private/entitlements` (server-written).
@freezed
abstract class Entitlements with _$Entitlements {
  const Entitlements._();

  const factory Entitlements({
    @Default('basic') String plan,
    @Default(<String>[]) List<String> features,
    String? source,
    DateTime? trialEndsAt,
    DateTime? renewsAt,
    DateTime? expiresAt,
    @Default(false) bool willRenew,
    @Default(<EntitlementGrant>[]) List<EntitlementGrant> grants,
    @Default(false) bool adsEnabled,
    DowngradeNotice? downgradeNotice,
    String? mode,
    String? store,
    DateTime? updatedAt,
  }) = _Entitlements;

  factory Entitlements.fromJson(Map<String, dynamic> json) => _$EntitlementsFromJson(json);

  bool get inTrial => trialEndsAt != null && trialEndsAt!.isAfter(DateTime.now().toUtc());
}

@freezed
abstract class EntitlementGrant with _$EntitlementGrant {
  const factory EntitlementGrant({
    required String planKey,
    String? source,
    DateTime? startsAt,
    DateTime? endsAt,
    String? reason,
  }) = _EntitlementGrant;

  factory EntitlementGrant.fromJson(Map<String, dynamic> json) => _$EntitlementGrantFromJson(json);
}

@freezed
abstract class DowngradeNotice with _$DowngradeNotice {
  const factory DowngradeNotice({
    String? message,
    String? fromPlan,
    String? toPlan,
    @Default(<String>[]) List<String> lockedFeatures,
    DateTime? changedAt,
    @Default(false) bool dismissed,
  }) = _DowngradeNotice;

  factory DowngradeNotice.fromJson(Map<String, dynamic> json) => _$DowngradeNoticeFromJson(json);
}
