// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  displayName: json['displayName'] as String? ?? '',
  birthYear: (json['birthYear'] as num?)?.toInt(),
  ageBracket: $enumDecodeNullable(
    _$AgeBracketEnumMap,
    json['ageBracket'],
    unknownValue: AgeBracket.unknown,
  ),
  timezone: json['timezone'] as String?,
  locationCity: json['locationCity'] as String?,
  locationRegion: json['locationRegion'] as String?,
  locationCountry: json['locationCountry'] as String?,
  characterId: json['characterId'] as String?,
  appearanceMode:
      $enumDecodeNullable(
        _$AppearanceModeEnumMap,
        json['appearanceMode'],
        unknownValue: AppearanceMode.system,
      ) ??
      AppearanceMode.system,
  themeId: json['themeId'] as String?,
  customPalette:
      (json['customPalette'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ) ??
      const <String, Map<String, String>>{},
  onboardingPath: $enumDecodeNullable(
    _$OnboardingPathEnumMap,
    json['onboardingPath'],
    unknownValue: OnboardingPath.unknown,
  ),
  onboardingStep: json['onboardingStep'] as String? ?? 'welcome',
  onboardingAnswers:
      json['onboardingAnswers'] as Map<String, dynamic>? ??
      const <String, dynamic>{},
  activeProjectId: json['activeProjectId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'birthYear': ?instance.birthYear,
      'ageBracket': ?_$AgeBracketEnumMap[instance.ageBracket],
      'timezone': ?instance.timezone,
      'locationCity': ?instance.locationCity,
      'locationRegion': ?instance.locationRegion,
      'locationCountry': ?instance.locationCountry,
      'characterId': ?instance.characterId,
      'appearanceMode': _$AppearanceModeEnumMap[instance.appearanceMode]!,
      'themeId': ?instance.themeId,
      'customPalette': instance.customPalette,
      'onboardingPath': ?_$OnboardingPathEnumMap[instance.onboardingPath],
      'onboardingStep': instance.onboardingStep,
      'onboardingAnswers': instance.onboardingAnswers,
      'activeProjectId': ?instance.activeProjectId,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

const _$AgeBracketEnumMap = {
  AgeBracket.teen: 'teen',
  AgeBracket.adult: 'adult',
  AgeBracket.unknown: 'unknown',
};

const _$AppearanceModeEnumMap = {
  AppearanceMode.light: 'light',
  AppearanceMode.dark: 'dark',
  AppearanceMode.system: 'system',
};

const _$OnboardingPathEnumMap = {
  OnboardingPath.hasIdea: 'hasIdea',
  OnboardingPath.findIdea: 'findIdea',
  OnboardingPath.unknown: 'unknown',
};

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      notifications: json['notifications'] == null
          ? const NotificationPrefs()
          : NotificationPrefs.fromJson(
              json['notifications'] as Map<String, dynamic>,
            ),
      privacy: json['privacy'] == null
          ? const PrivacySettings()
          : PrivacySettings.fromJson(json['privacy'] as Map<String, dynamic>),
      calendar: json['calendar'] == null
          ? const CalendarSettings()
          : CalendarSettings.fromJson(json['calendar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'notifications': instance.notifications.toJson(),
      'privacy': instance.privacy.toJson(),
      'calendar': instance.calendar.toJson(),
    };

_NotificationPrefs _$NotificationPrefsFromJson(Map<String, dynamic> json) =>
    _NotificationPrefs(
      dailyQuote: json['dailyQuote'] as bool? ?? true,
      sessionReminder: json['sessionReminder'] as bool? ?? true,
      sessionReminderLeadMinutes:
          (json['sessionReminderLeadMinutes'] as num?)?.toInt() ?? 10,
      taskDeadlineReminders: json['taskDeadlineReminders'] as bool? ?? true,
      weeklyCheckin: json['weeklyCheckin'] as bool? ?? true,
      monthlyReflection: json['monthlyReflection'] as bool? ?? true,
      celebrations: json['celebrations'] as bool? ?? true,
      quietHoursStart: json['quietHoursStart'] as String?,
      quietHoursEnd: json['quietHoursEnd'] as String?,
      maxPerDay: (json['maxPerDay'] as num?)?.toInt() ?? 4,
      osPermission: json['osPermission'] as String? ?? 'unknown',
    );

Map<String, dynamic> _$NotificationPrefsToJson(_NotificationPrefs instance) =>
    <String, dynamic>{
      'dailyQuote': instance.dailyQuote,
      'sessionReminder': instance.sessionReminder,
      'sessionReminderLeadMinutes': instance.sessionReminderLeadMinutes,
      'taskDeadlineReminders': instance.taskDeadlineReminders,
      'weeklyCheckin': instance.weeklyCheckin,
      'monthlyReflection': instance.monthlyReflection,
      'celebrations': instance.celebrations,
      'quietHoursStart': ?instance.quietHoursStart,
      'quietHoursEnd': ?instance.quietHoursEnd,
      'maxPerDay': instance.maxPerDay,
      'osPermission': instance.osPermission,
    };

_PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) =>
    _PrivacySettings(
      leaderboardOptIn: json['leaderboardOptIn'] as bool? ?? false,
      communityOptIn: json['communityOptIn'] as bool? ?? false,
      communityVisibility: json['communityVisibility'] as String? ?? 'private',
      shareLocationForOpportunities:
          json['shareLocationForOpportunities'] as bool? ?? false,
    );

Map<String, dynamic> _$PrivacySettingsToJson(_PrivacySettings instance) =>
    <String, dynamic>{
      'leaderboardOptIn': instance.leaderboardOptIn,
      'communityOptIn': instance.communityOptIn,
      'communityVisibility': instance.communityVisibility,
      'shareLocationForOpportunities': instance.shareLocationForOpportunities,
    };

_CalendarSettings _$CalendarSettingsFromJson(Map<String, dynamic> json) =>
    _CalendarSettings(
      connected: json['connected'] as bool? ?? false,
      googleEmail: json['googleEmail'] as String?,
      syncSessionsToGoogle: json['syncSessionsToGoogle'] as bool? ?? true,
      targetCalendarId: json['targetCalendarId'] as String?,
      targetCalendarName: json['targetCalendarName'] as String?,
      respectBusyTimes: json['respectBusyTimes'] as bool? ?? true,
      syncState:
          $enumDecodeNullable(
            _$CalendarSyncStateEnumMap,
            json['syncState'],
            unknownValue: CalendarSyncState.idle,
          ) ??
          CalendarSyncState.disconnected,
      lastSyncAt: json['lastSyncAt'] == null
          ? null
          : DateTime.parse(json['lastSyncAt'] as String),
      lastError: json['lastError'] as String?,
    );

Map<String, dynamic> _$CalendarSettingsToJson(_CalendarSettings instance) =>
    <String, dynamic>{
      'connected': instance.connected,
      'googleEmail': ?instance.googleEmail,
      'syncSessionsToGoogle': instance.syncSessionsToGoogle,
      'targetCalendarId': ?instance.targetCalendarId,
      'targetCalendarName': ?instance.targetCalendarName,
      'respectBusyTimes': instance.respectBusyTimes,
      'syncState': _$CalendarSyncStateEnumMap[instance.syncState]!,
      'lastSyncAt': ?instance.lastSyncAt?.toIso8601String(),
      'lastError': ?instance.lastError,
    };

const _$CalendarSyncStateEnumMap = {
  CalendarSyncState.idle: 'idle',
  CalendarSyncState.syncing: 'syncing',
  CalendarSyncState.ok: 'ok',
  CalendarSyncState.error: 'error',
  CalendarSyncState.disconnected: 'disconnected',
};

_AppFlags _$AppFlagsFromJson(Map<String, dynamic> json) => _AppFlags(
  entitlementsMode: json['entitlementsMode'] as String? ?? 'all_premium',
  communityEnabled: json['communityEnabled'] as bool? ?? false,
  supportEmail: json['supportEmail'] as String?,
  termsUrl: json['termsUrl'] as String?,
  privacyUrl: json['privacyUrl'] as String?,
);

Map<String, dynamic> _$AppFlagsToJson(_AppFlags instance) => <String, dynamic>{
  'entitlementsMode': instance.entitlementsMode,
  'communityEnabled': instance.communityEnabled,
  'supportEmail': ?instance.supportEmail,
  'termsUrl': ?instance.termsUrl,
  'privacyUrl': ?instance.privacyUrl,
};

_Entitlements _$EntitlementsFromJson(Map<String, dynamic> json) =>
    _Entitlements(
      plan: json['plan'] as String? ?? 'basic',
      features:
          (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      source: json['source'] as String?,
      trialEndsAt: json['trialEndsAt'] == null
          ? null
          : DateTime.parse(json['trialEndsAt'] as String),
      renewsAt: json['renewsAt'] == null
          ? null
          : DateTime.parse(json['renewsAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      willRenew: json['willRenew'] as bool? ?? false,
      grants:
          (json['grants'] as List<dynamic>?)
              ?.map((e) => EntitlementGrant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EntitlementGrant>[],
      adsEnabled: json['adsEnabled'] as bool? ?? false,
      downgradeNotice: json['downgradeNotice'] == null
          ? null
          : DowngradeNotice.fromJson(
              json['downgradeNotice'] as Map<String, dynamic>,
            ),
      mode: json['mode'] as String?,
      store: json['store'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EntitlementsToJson(_Entitlements instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'features': instance.features,
      'source': ?instance.source,
      'trialEndsAt': ?instance.trialEndsAt?.toIso8601String(),
      'renewsAt': ?instance.renewsAt?.toIso8601String(),
      'expiresAt': ?instance.expiresAt?.toIso8601String(),
      'willRenew': instance.willRenew,
      'grants': instance.grants.map((e) => e.toJson()).toList(),
      'adsEnabled': instance.adsEnabled,
      'downgradeNotice': ?instance.downgradeNotice?.toJson(),
      'mode': ?instance.mode,
      'store': ?instance.store,
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

_EntitlementGrant _$EntitlementGrantFromJson(Map<String, dynamic> json) =>
    _EntitlementGrant(
      planKey: json['planKey'] as String,
      source: json['source'] as String?,
      startsAt: json['startsAt'] == null
          ? null
          : DateTime.parse(json['startsAt'] as String),
      endsAt: json['endsAt'] == null
          ? null
          : DateTime.parse(json['endsAt'] as String),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$EntitlementGrantToJson(_EntitlementGrant instance) =>
    <String, dynamic>{
      'planKey': instance.planKey,
      'source': ?instance.source,
      'startsAt': ?instance.startsAt?.toIso8601String(),
      'endsAt': ?instance.endsAt?.toIso8601String(),
      'reason': ?instance.reason,
    };

_DowngradeNotice _$DowngradeNoticeFromJson(Map<String, dynamic> json) =>
    _DowngradeNotice(
      message: json['message'] as String?,
      fromPlan: json['fromPlan'] as String?,
      toPlan: json['toPlan'] as String?,
      lockedFeatures:
          (json['lockedFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      changedAt: json['changedAt'] == null
          ? null
          : DateTime.parse(json['changedAt'] as String),
      dismissed: json['dismissed'] as bool? ?? false,
    );

Map<String, dynamic> _$DowngradeNoticeToJson(_DowngradeNotice instance) =>
    <String, dynamic>{
      'message': ?instance.message,
      'fromPlan': ?instance.fromPlan,
      'toPlan': ?instance.toPlan,
      'lockedFeatures': instance.lockedFeatures,
      'changedAt': ?instance.changedAt?.toIso8601String(),
      'dismissed': instance.dismissed,
    };
