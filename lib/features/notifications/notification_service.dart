import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../app/router.dart';
import '../../app/session.dart';
import '../../core/firebase/firebase_providers.dart';
import '../../data/models/notifications.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';
import '../../data/repositories/user_repository.dart';

part 'notification_service.g.dart';

/// OS permission state.
enum PushPermission { granted, denied, unknown }

/// Whether the user's preferences allow a locally scheduled item. Applied on
/// the device so toggles take effect instantly (the server filters too).
bool allowedByPrefs(String type, NotificationPrefs prefs) => switch (type) {
      'dailyQuote' => prefs.dailyQuote,
      'sessionReminder' => prefs.sessionReminder,
      'taskReminder' || 'deadlineReminder' => prefs.taskDeadlineReminders,
      'weeklyCheckin' => prefs.weeklyCheckin,
      'monthlyReflection' => prefs.monthlyReflection,
      'celebration' => prefs.celebrations,
      _ => true,
    };

/// Stable 31-bit id for a plan item (local notification ids are ints).
int notificationIdFor(String itemId) {
  var hash = 0x811C9DC5;
  for (final unit in itemId.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0x7FFFFFFF;
  }
  return hash & 0x7FFFFFFF;
}

/// FCM registration, local scheduling of the notification plan, and routing
/// of notification taps.
class NotificationService {
  NotificationService({
    required this._messaging,
    required this._engagement,
    required this._openRoute,
  });

  final FirebaseMessaging _messaging;
  final EngagementRepository _engagement;
  final void Function(String route) _openRoute;
  final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  StreamSubscription<String>? _tokenSub;
  final List<StreamSubscription<RemoteMessage>> _messageSubs = <StreamSubscription<RemoteMessage>>[];

  static const _maxPending = 60; // iOS allows 64 pending local notifications.

  bool get _supported => !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);

  String get _platform => kIsWeb ? 'web' : defaultTargetPlatform.name;

  void _route(String? route) {
    if (route != null && route.startsWith('/')) _openRoute(route);
  }

  Future<void> init() async {
    if (_initialized || !_supported) return;
    _initialized = true;
    await _local.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
      onDidReceiveNotificationResponse: (response) => _route(response.payload),
    );
    // Default channel for server pushes (see AndroidManifest.xml).
    await _local
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel('spark_push', 'SPARK', importance: Importance.high),
        );
    final launch = await _local.getNotificationAppLaunchDetails();
    if (launch?.didNotificationLaunchApp ?? false) _route(launch!.notificationResponse?.payload);

    _messageSubs
      ..add(FirebaseMessaging.onMessage.listen(_showForeground))
      ..add(FirebaseMessaging.onMessageOpenedApp.listen((m) => _route(m.data['route'] as String?)));
    final initial = await _messaging.getInitialMessage();
    if (initial != null) _route(initial.data['route'] as String?);
  }

  Future<PushPermission> permission() async {
    if (!_supported) return PushPermission.unknown;
    final settings = await _messaging.getNotificationSettings();
    return switch (settings.authorizationStatus) {
      AuthorizationStatus.authorized || AuthorizationStatus.provisional => PushPermission.granted,
      AuthorizationStatus.notDetermined => PushPermission.unknown,
      _ => PushPermission.denied,
    };
  }

  /// Shows the OS prompt (once; the OS ignores repeat requests).
  Future<PushPermission> requestPermission() async {
    if (!_supported) return PushPermission.unknown;
    await init();
    final settings = await _messaging.requestPermission();
    final granted = settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
    if (granted) await registerToken();
    return granted ? PushPermission.granted : PushPermission.denied;
  }

  Future<void> registerToken() async {
    if (!_supported) return;
    final token = await _messaging.getToken();
    if (token != null) await _engagement.registerPushToken(token, _platform);
    _tokenSub ??= _messaging.onTokenRefresh.listen((t) => _engagement.registerPushToken(t, _platform).ignore());
  }

  NotificationDetails _details(String type) => NotificationDetails(
        android: AndroidNotificationDetails(
          'spark_$type',
          switch (type) {
            'sessionReminder' => 'Work session reminders',
            'dailyQuote' => 'Daily quote',
            _ => 'SPARK',
          },
          importance: type == 'sessionReminder' ? Importance.high : Importance.defaultImportance,
          priority: type == 'sessionReminder' ? Priority.high : Priority.defaultPriority,
        ),
        iOS: const DarwinNotificationDetails(),
      );

  Future<void> _showForeground(RemoteMessage message) async {
    final n = message.notification;
    if (n == null) return;
    final type = message.data['type'] as String? ?? 'push';
    await _local.show(
      id: notificationIdFor(message.messageId ?? '${DateTime.now().millisecondsSinceEpoch}'),
      title: n.title,
      body: n.body,
      notificationDetails: _details(type),
      payload: message.data['route'] as String?,
    );
  }

  /// Fetches `getNotificationPlan` (next 14 days) and replaces every
  /// previously scheduled local notification.
  Future<void> syncSchedule(NotificationPrefs prefs) async {
    if (!_supported) return;
    await init();
    if (await permission() != PushPermission.granted) return;
    final NotificationPlan plan = await _engagement.getNotificationPlan();
    await _local.cancelAllPendingNotifications();

    var exact = false;
    if (defaultTargetPlatform == TargetPlatform.android) {
      exact = await _local
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.canScheduleExactNotifications() ??
          false;
    }
    final now = DateTime.now().toUtc();
    final items = plan.items
        .where((i) => i.fireAt.isAfter(now) && allowedByPrefs(i.type, prefs))
        .toList()
      ..sort((a, b) => a.fireAt.compareTo(b.fireAt));
    for (final item in items.take(_maxPending)) {
      await _local.zonedSchedule(
        id: notificationIdFor(item.id),
        scheduledDate: tz.TZDateTime.from(item.fireAt, tz.local),
        notificationDetails: _details(item.type),
        androidScheduleMode: exact && item.type == 'sessionReminder'
            ? AndroidScheduleMode.exactAllowWhileIdle
            : AndroidScheduleMode.inexactAllowWhileIdle,
        title: item.title,
        body: item.body,
        payload: item.route,
      );
    }
  }

  Future<void> cancelAll() async {
    if (!_supported) return;
    await _local.cancelAllPendingNotifications();
  }

  void dispose() {
    _tokenSub?.cancel();
    for (final s in _messageSubs) {
      s.cancel();
    }
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) {
  final service = NotificationService(
    messaging: ref.watch(firebaseMessagingProvider),
    engagement: ref.watch(engagementRepositoryProvider),
    openRoute: (route) => ref.read(routerProvider).go(route),
  );
  ref.onDispose(service.dispose);
  return service;
}

/// Keeps push registration and the local schedule in sync for the signed-in
/// user: on launch, after any schedule change, and instantly when settings
/// change.
@Riverpod(keepAlive: true)
Future<void> notificationBootstrap(Ref ref) async {
  final session = ref.watch(appSessionProvider);
  final enabled = switch (session) {
    SessionReady() => true,
    SessionOnboarding(:final step) => step.index > OnboardingStep.notifications.index,
    _ => false,
  };
  final service = ref.read(notificationServiceProvider);
  if (!enabled) return;

  Timer? debounce;
  Future<void> sync() async {
    try {
      final prefs = ref.read(userSettingsProvider).value?.notifications ?? const NotificationPrefs();
      await service.syncSchedule(prefs);
    } on Object catch (e) {
      debugPrint('Notification sync failed: $e');
    }
  }

  void scheduleSync() {
    debounce?.cancel();
    debounce = Timer(const Duration(seconds: 2), sync);
  }

  ref.onDispose(() => debounce?.cancel());

  ref.listen(userSettingsProvider.select((s) => s.value?.notifications), (_, _) => scheduleSync());
  ref.listen(
    activeProjectProvider.select((p) => (p.value?.activePlanVersion, p.value?.nextSessionAt, p.value?.targetEndDate)),
    (_, _) => scheduleSync(),
  );

  try {
    await service.init();
    final permission = await service.permission();
    final uid = ref.read(currentUidProvider);
    if (uid != null) {
      final prefs = ref.read(userSettingsProvider).value?.notifications;
      // Report the real OS state so the server skips pushes it can't deliver.
      if (prefs != null && prefs.osPermission != permission.name) {
        await ref.read(userRepositoryProvider).updateNotificationPrefs(uid, prefs.copyWith(osPermission: permission.name));
      }
    }
    if (permission == PushPermission.granted) {
      await service.registerToken();
      await sync();
    }
  } on Object catch (e) {
    debugPrint('Notification bootstrap failed: $e');
  }
}
