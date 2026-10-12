import 'package:flutter_test/flutter_test.dart';
import 'package:spark/app/routes.dart';
import 'package:spark/app/session.dart';
import 'package:spark/data/models/user.dart';
import 'package:spark/data/repositories/auth_repository.dart';

void main() {
  const auth = AuthSession(uid: 'u1', profileComplete: true);
  UserProfile profile(String step) => UserProfile(id: 'u1', onboardingStep: step);

  String? redirect(AppSession session, String location, {bool greeting = false}) =>
      computeRedirect(session: session, location: Uri.parse(location), greetingPending: greeting);

  group('loading', () {
    test('holds every route on the splash and remembers the target', () {
      expect(redirect(const SessionLoading(), Routes.splash), isNull);
      expect(redirect(const SessionLoading(), '/project/task/t1'), '/splash?from=%2Fproject%2Ftask%2Ft1');
    });

    test('a failed session also waits on the splash (which offers retry)', () {
      expect(redirect(SessionFailed(Exception('x')), Routes.dashboard), startsWith(Routes.splash));
    });
  });

  group('signed out', () {
    test('goes to auth', () {
      expect(redirect(const SessionSignedOut(), Routes.dashboard), Routes.auth);
      expect(redirect(const SessionSignedOut(), Routes.auth), isNull);
    });

    test('keeps an email sign-in link', () {
      final target = redirect(const SessionSignedOut(), '/?oobCode=abc&mode=signIn');
      expect(target, startsWith(Routes.authEmailLink));
      expect(Uri.parse(target!).queryParameters['link'], contains('oobCode=abc'));
    });
  });

  test('a signed-in user without a profile completes signup', () {
    const s = SessionNeedsSignup(AuthSession(uid: 'u1'));
    expect(redirect(s, Routes.dashboard), Routes.completeSignup);
    expect(redirect(s, Routes.completeSignup), isNull);
  });

  group('onboarding', () {
    test('resumes at the saved step', () {
      final s = SessionOnboarding(auth: auth, profile: profile('deadline'), hasPlan: false);
      expect(redirect(s, Routes.dashboard), '/onboarding/deadline');
      expect(redirect(s, '/onboarding/deadline'), isNull);
      expect(redirect(s, '/onboarding/welcome'), '/onboarding/deadline');
    });

    test('plans screen stays reachable during onboarding', () {
      final s = SessionOnboarding(auth: auth, profile: profile('character'), hasPlan: false);
      expect(redirect(s, Routes.plans), isNull);
    });

    test('tutorial without a plan shows plan generation', () {
      final s = SessionOnboarding(auth: auth, profile: profile('tutorial'), hasPlan: false);
      expect(redirect(s, Routes.dashboard), Routes.onboardingPlan);
      expect(redirect(s, Routes.onboardingPlan), isNull);
    });

    test('tutorial with a plan runs over the real shell', () {
      final s = SessionOnboarding(auth: auth, profile: profile('tutorial'), hasPlan: true);
      expect(redirect(s, Routes.splash), Routes.dashboard);
      expect(redirect(s, Routes.project), isNull);
      expect(redirect(s, Routes.onboardingPlan), isNull);
    });
  });

  group('ready', () {
    final ready = SessionReady(auth: auth, profile: profile('complete'));

    test('leaves the splash for the dashboard', () {
      expect(redirect(ready, Routes.splash), Routes.dashboard);
      expect(redirect(ready, Routes.auth), Routes.dashboard);
      expect(redirect(ready, '/onboarding/welcome'), Routes.dashboard);
    });

    test('restores a deep link held on the splash', () {
      expect(redirect(ready, '/splash?from=%2Fproject%2Ftask%2Ft1'), '/project/task/t1');
    });

    test('daily greeting only interrupts the dashboard', () {
      expect(redirect(ready, Routes.splash, greeting: true), Routes.greeting);
      expect(redirect(ready, Routes.dashboard, greeting: true), Routes.greeting);
      expect(redirect(ready, '/splash?from=%2Fjournal', greeting: true), Routes.journal);
      expect(redirect(ready, Routes.journal, greeting: true), isNull);
    });

    test('normal navigation is untouched', () {
      expect(redirect(ready, Routes.project), isNull);
      expect(redirect(ready, Routes.settings), isNull);
    });
  });
}
