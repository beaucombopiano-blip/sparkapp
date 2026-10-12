/// Route paths. Use these constants instead of string literals.
abstract final class Routes {
  static const splash = '/splash';
  static const greeting = '/greeting';

  static const auth = '/auth';
  static const authEmailLink = '/auth/email-link';
  static const completeSignup = '/auth/complete-signup';

  static const onboardingBase = '/onboarding';
  static String onboarding(String step) => '/onboarding/$step';
  static const onboardingPlan = '/onboarding/plan';

  static const plans = '/plans';

  static const dashboard = '/dashboard';

  static const project = '/project';
  static const agenda = '/project/agenda';
  static const timeline = '/project/timeline';
  static const resources = '/project/resources';
  static const opportunities = '/project/opportunities';
  static const adjustPlan = '/project/adjust';
  static String task(String taskId) => '/project/task/$taskId';
  static String agendaFor({String? date, String? view}) {
    final params = <String, String>{'date': ?date, 'view': ?view};
    return Uri(path: agenda, queryParameters: params.isEmpty ? null : params).toString();
  }

  static const journal = '/journal';
  static String journalEntry(String entryId) => '/journal/entry/$entryId';
  static String scrapbook(String id) => '/journal/scrapbook/$id';

  static const profile = '/profile';
  static const badges = '/profile/badges';
  static const leaderboard = '/profile/leaderboard';
  static const reflections = '/profile/reflections';
  static const subscription = '/profile/subscription';
  static const pastProjects = '/profile/projects';
  static const community = '/profile/community';

  static const companionPath = '/companion';
  static String companion({String? conversationId, String? taskId, String? prompt}) {
    final params = <String, String>{
      'conversationId': ?conversationId,
      'taskId': ?taskId,
      'prompt': ?prompt,
    };
    return Uri(path: companionPath, queryParameters: params.isEmpty ? null : params).toString();
  }

  static const focusPath = '/focus';
  static String focus(String sessionId) => '/focus?sessionId=$sessionId';
  static String focusTask(String taskId) => '/focus?taskId=$taskId';

  static const settings = '/settings';
  static const settingsAppearance = '/settings/appearance';
  static const settingsColors = '/settings/colors';
  static const settingsCharacter = '/settings/character';
  static const settingsNotifications = '/settings/notifications';
  static const settingsSchedule = '/settings/schedule';
  static const settingsPrivacy = '/settings/privacy';
  static const settingsAccount = '/settings/account';
  static const settingsHelp = '/settings/help';

  static const weeklyCheckin = '/checkin/weekly';
  static const monthlyReflection = '/reflection/monthly';

  /// The four tab roots, in bottom-bar order.
  static const tabRoots = <String>[dashboard, project, journal, profile];
}
