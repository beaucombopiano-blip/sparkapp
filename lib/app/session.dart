import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/firebase/firebase_providers.dart';
import '../core/utils/user_clock.dart';
import '../data/models/user.dart';
import '../data/providers/session_providers.dart';
import '../data/repositories/auth_repository.dart';
import 'routes.dart';

part 'session.g.dart';

/// What the router needs to know about the user.
@immutable
sealed class AppSession {
  const AppSession();
}

class SessionLoading extends AppSession {
  const SessionLoading();
}

class SessionFailed extends AppSession {
  const SessionFailed(this.error);
  final Object error;
}

class SessionSignedOut extends AppSession {
  const SessionSignedOut();
}

class SessionNeedsSignup extends AppSession {
  const SessionNeedsSignup(this.auth);
  final AuthSession auth;
}

class SessionOnboarding extends AppSession {
  const SessionOnboarding({required this.auth, required this.profile, required this.hasPlan});
  final AuthSession auth;
  final UserProfile profile;
  final bool hasPlan;

  OnboardingStep get step => profile.step;
}

class SessionReady extends AppSession {
  const SessionReady({required this.auth, required this.profile});
  final AuthSession auth;
  final UserProfile profile;
}

@Riverpod(keepAlive: true)
AppSession appSession(Ref ref) {
  final auth = ref.watch(authSessionProvider);
  if (auth.hasError && !auth.hasValue) return SessionFailed(auth.error!);
  if (!auth.hasValue) return const SessionLoading();
  final session = auth.requireValue;
  if (session == null) return const SessionSignedOut();
  if (!session.profileComplete) return SessionNeedsSignup(session);

  final profile = ref.watch(userProfileProvider);
  if (profile.hasError && !profile.hasValue) return SessionFailed(profile.error!);
  if (!profile.hasValue) return const SessionLoading();
  final p = profile.requireValue;
  if (p == null) return SessionNeedsSignup(session);
  if (p.onboardingComplete) return SessionReady(auth: session, profile: p);

  var hasPlan = false;
  if (p.step == OnboardingStep.tutorial) {
    final project = ref.watch(activeProjectProvider);
    if (!project.hasValue) return const SessionLoading();
    hasPlan = project.requireValue?.hasPlan ?? false;
  }
  return SessionOnboarding(auth: session, profile: p, hasPlan: hasPlan);
}

/// Daily greeting: shown on the first open of each day, only when the app
/// lands on the Dashboard (deep links are never delayed).
class GreetingGate {
  GreetingGate(this._prefs, this._clock);

  final SharedPreferences _prefs;
  final UserClock Function() _clock;
  static const _key = 'spark.lastGreetingDay';

  bool _consumed = false;

  /// True once per launch when today's greeting hasn't been shown.
  bool get pending => !_consumed && _prefs.getString(_key) != _clock().today().toIso();

  /// The first ready route of this launch was decided; never greet later in
  /// this launch (avoids interrupting the user mid-session).
  void consume() => _consumed = true;

  Future<void> markShown() async {
    _consumed = true;
    await _prefs.setString(_key, _clock().today().toIso());
  }
}

@Riverpod(keepAlive: true)
GreetingGate greetingGate(Ref ref) =>
    GreetingGate(ref.watch(sharedPreferencesProvider), () => ref.read(userClockProvider));

/// Pure redirect logic (unit tested).
///
/// [greetingPending] is evaluated only when the session is ready.
String? computeRedirect({
  required AppSession session,
  required Uri location,
  bool greetingPending = false,
}) {
  final path = location.path;
  final onSplash = path == Routes.splash;
  final onAuth = path == Routes.auth || path.startsWith('${Routes.auth}/');
  final onOnboarding = path.startsWith('${Routes.onboardingBase}/');

  String splashFor() {
    if (onSplash) return location.toString() == path ? Routes.splash : location.toString();
    return Uri(path: Routes.splash, queryParameters: <String, String>{'from': location.toString()}).toString();
  }

  String? fromSplash() => onSplash ? location.queryParameters['from'] : null;

  switch (session) {
    case SessionLoading():
    case SessionFailed():
      return onSplash ? null : splashFor();

    case SessionSignedOut():
      if (path == Routes.auth || path == Routes.authEmailLink) return null;
      // Keep an incoming email sign-in link through the redirect.
      if (location.queryParameters.containsKey('oobCode') || location.queryParameters.containsKey('link')) {
        return Uri(path: Routes.authEmailLink, queryParameters: <String, String>{'link': location.toString()})
            .toString();
      }
      return Routes.auth;

    case SessionNeedsSignup():
      return path == Routes.completeSignup ? null : Routes.completeSignup;

    case SessionOnboarding(:final step, :final hasPlan):
      if (step == OnboardingStep.tutorial) {
        if (!hasPlan) return path == Routes.onboardingPlan ? null : Routes.onboardingPlan;
        // Plan exists: the tutorial runs over the real shell.
        if (path == Routes.onboardingPlan) return null;
        if (onSplash || onAuth || onOnboarding || path == Routes.greeting) return Routes.dashboard;
        return null;
      }
      final target = Routes.onboarding(step.name);
      if (path == target) return null;
      // Billing screens are reachable from onboarding when enforced.
      if (path == Routes.plans) return null;
      return target;

    case SessionReady():
      final target = fromSplash();
      if (onSplash || onAuth || onOnboarding) {
        final next = (target == null || target.startsWith(Routes.splash)) ? Routes.dashboard : target;
        if (greetingPending && next == Routes.dashboard) return Routes.greeting;
        return next;
      }
      if (greetingPending && path == Routes.dashboard) return Routes.greeting;
      return null;
  }
}
