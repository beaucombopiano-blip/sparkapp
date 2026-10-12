import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';

part 'entitlements.g.dart';

/// Feature keys from `billingFeatures` (backend section 15).
abstract final class Features {
  static const fullPlan = 'full_plan';
  static const checklists = 'checklists';
  static const timeline = 'timeline';
  static const progressTracking = 'progress_tracking';
  static const calendarViews = 'calendar_views';
  static const sessionReminders = 'session_reminders';
  static const notifications = 'notifications';
  static const weeklyCheckin = 'weekly_checkin';
  static const monthlyReflection = 'monthly_reflection';
  static const appearanceMode = 'appearance_mode';
  static const freeCharacters = 'free_characters';
  static const gamification = 'gamification';
  static const googleCalendar = 'google_calendar';
  static const resourceCenter = 'resource_center';
  static const aiCompanion = 'ai_companion';
  static const colorCustomization = 'color_customization';
  static const premiumCharacters = 'premium_characters';
  static const premiumThemes = 'premium_themes';
  static const journal = 'journal';
  static const scrapbook = 'scrapbook';
  static const opportunities = 'opportunities';
  static const community = 'community';
  static const planComparison = 'plan_comparison';
  static const ads = 'ads';
}

/// Streams `users/{uid}/private/entitlements`. Whenever it changes the ID
/// token is refreshed so Firestore/Storage rules see the new plan claim.
@Riverpod(keepAlive: true)
Stream<Entitlements?> entitlements(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<Entitlements?>.value(null);
  Entitlements? last;
  return ref.watch(userRepositoryProvider).watchEntitlements(uid).asyncMap((e) async {
    if (last != null && e != null && (e.plan != last!.plan || e.updatedAt != last!.updatedAt)) {
      try {
        await ref.read(authRepositoryProvider).refreshToken();
      } on Object {
        // Token refresh retries on the next change or app start.
      }
    }
    last = e;
    return e;
  });
}

/// True while every feature is unlocked (launch default `all_premium`).
@Riverpod(keepAlive: true)
bool allPremiumMode(Ref ref) {
  final flags = ref.watch(appFlagsProvider).value;
  final ent = ref.watch(entitlementsProvider).value;
  if (ent?.mode != null) return ent!.mode == 'all_premium';
  return !(flags?.entitlementsEnforced ?? false);
}

/// The one entry point for plan checks in the UI.
@riverpod
bool hasFeature(Ref ref, String feature) {
  if (ref.watch(allPremiumModeProvider)) return feature != Features.ads;
  final ent = ref.watch(entitlementsProvider).value;
  if (ent == null) return false;
  if (feature == Features.ads) return ent.adsEnabled;
  return ent.features.contains(feature);
}

/// Ads only for plans with adsEnabled, never in all_premium mode.
@riverpod
bool adsEnabled(Ref ref) => ref.watch(hasFeatureProvider(Features.ads));
