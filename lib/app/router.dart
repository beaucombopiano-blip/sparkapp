import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/utils/user_clock.dart';
import '../features/agenda/agenda_screen.dart';
import '../features/auth/complete_signup_screen.dart';
import '../features/auth/email_link_screen.dart';
import '../features/auth/welcome_screen.dart';
import '../features/billing/plans_screen.dart';
import '../features/billing/subscription_screen.dart';
import '../features/checkins/weekly_checkin_screen.dart';
import '../features/community/community_screens.dart';
import '../features/companion/companion_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/focus/focus_screen.dart';
import '../features/gamification/badges_screen.dart';
import '../features/gamification/leaderboard_screen.dart';
import '../features/journal/journal_entry_screen.dart';
import '../features/journal/journal_screen.dart';
import '../features/journal/scrapbook_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/onboarding/plan_generation_screen.dart';
import '../features/opportunities/opportunities_screen.dart';
import '../features/profile/past_projects_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/project/adjust_plan_screen.dart';
import '../features/project/project_screen.dart';
import '../features/project/timeline_screen.dart';
import '../features/reflections/monthly_reflection_screen.dart';
import '../features/reflections/reflections_history_screen.dart';
import '../features/resources/resources_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/settings/settings_subpages.dart';
import '../features/splash_greeting/greeting_screen.dart';
import '../features/splash_greeting/splash_screen.dart';
import '../features/task/task_detail_screen.dart';
import 'routes.dart';
import 'session.dart';
import 'shell/app_shell.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(appSessionProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  final greeting = ref.read(greetingGateProvider);

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.dashboard,
    refreshListenable: refresh,
    redirect: (context, state) {
      final session = ref.read(appSessionProvider);
      var greetingPending = false;
      if (session is SessionReady) {
        greetingPending = greeting.pending;
        // Only the first ready route of a launch may show the greeting.
        greeting.consume();
      }
      return computeRedirect(session: session, location: state.uri, greetingPending: greetingPending);
    },
    routes: buildRoutes(),
  );
  ref.onDispose(router.dispose);
  return router;
}

Page<void> _fade(GoRouterState state, Widget child) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, _, child) => FadeTransition(opacity: animation, child: child),
    );

List<RouteBase> buildRoutes() => <RouteBase>[
      GoRoute(path: Routes.splash, pageBuilder: (context, state) => _fade(state, const SplashScreen())),
      GoRoute(path: Routes.greeting, pageBuilder: (context, state) => _fade(state, const GreetingScreen())),
      GoRoute(
        path: Routes.auth,
        pageBuilder: (context, state) => _fade(state, const WelcomeScreen()),
        routes: <RouteBase>[
          GoRoute(
            path: 'email-link',
            builder: (context, state) => EmailLinkScreen(incomingLink: state.uri.queryParameters['link']),
          ),
          GoRoute(path: 'complete-signup', builder: (context, state) => const CompleteSignupScreen()),
        ],
      ),
      GoRoute(
        path: Routes.onboardingPlan,
        pageBuilder: (context, state) => _fade(state, const PlanGenerationScreen()),
      ),
      GoRoute(
        path: '/onboarding/:step',
        pageBuilder: (context, state) => _fade(
          state,
          OnboardingScreen(
            step: state.pathParameters['step']!,
            paused: state.uri.queryParameters['paused'] == '1',
          ),
        ),
      ),
      GoRoute(path: Routes.plans, builder: (context, state) => const PlansScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell, location: state.uri),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(path: Routes.dashboard, builder: (context, state) => const DashboardScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.project,
                builder: (context, state) => const ProjectScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'agenda',
                    builder: (context, state) => AgendaScreen(
                      initialDay: LocalDay.tryParse(state.uri.queryParameters['date']),
                      initialView: AgendaView.parse(state.uri.queryParameters['view']),
                    ),
                  ),
                  GoRoute(
                    path: 'task/:taskId',
                    builder: (context, state) => TaskDetailScreen(taskId: state.pathParameters['taskId']!),
                  ),
                  GoRoute(path: 'timeline', builder: (context, state) => const TimelineScreen()),
                  GoRoute(
                    path: 'resources',
                    builder: (context, state) => ResourcesScreen(
                      initialQuery: state.uri.queryParameters['q'],
                      initialCategoryId: state.uri.queryParameters['category'],
                    ),
                  ),
                  GoRoute(path: 'opportunities', builder: (context, state) => const OpportunitiesScreen()),
                  GoRoute(
                    path: 'adjust',
                    builder: (context, state) =>
                        AdjustPlanScreen(initialAction: PlanAction.parse(state.uri.queryParameters['action'])),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.journal,
                builder: (context, state) => const JournalScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'entry/:entryId',
                    builder: (context, state) => JournalEntryScreen(entryId: state.pathParameters['entryId']!),
                  ),
                  GoRoute(
                    path: 'scrapbook/:id',
                    builder: (context, state) => ScrapbookScreen(scrapbookId: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => const ProfileScreen(),
                routes: <RouteBase>[
                  GoRoute(path: 'badges', builder: (context, state) => const BadgesScreen()),
                  GoRoute(path: 'leaderboard', builder: (context, state) => const LeaderboardScreen()),
                  GoRoute(path: 'reflections', builder: (context, state) => const ReflectionsHistoryScreen()),
                  GoRoute(path: 'subscription', builder: (context, state) => const SubscriptionScreen()),
                  GoRoute(path: 'projects', builder: (context, state) => const PastProjectsScreen()),
                  GoRoute(
                    path: 'community',
                    builder: (context, state) => const CommunityHomeScreen(),
                    routes: <RouteBase>[
                      GoRoute(path: 'setup', builder: (context, state) => const CommunityProfileSetupScreen()),
                      GoRoute(
                        path: 'person/:uid',
                        builder: (context, state) => CommunityPersonScreen(uid: state.pathParameters['uid']!),
                      ),
                      GoRoute(
                        path: 'group/:groupId',
                        builder: (context, state) => CommunityGroupScreen(groupId: state.pathParameters['groupId']!),
                      ),
                      GoRoute(
                        path: 'chat/:connectionId',
                        builder: (context, state) =>
                            CommunityChatScreen(connectionId: state.pathParameters['connectionId']!),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.companionPath,
        builder: (context, state) => CompanionScreen(
          conversationId: state.uri.queryParameters['conversationId'],
          taskId: state.uri.queryParameters['taskId'],
          initialPrompt: state.uri.queryParameters['prompt'],
        ),
      ),
      GoRoute(
        path: Routes.focusPath,
        pageBuilder: (context, state) =>
            _fade(
              state,
              FocusScreen(sessionId: state.uri.queryParameters['sessionId'], taskId: state.uri.queryParameters['taskId']),
            ),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsScreen(),
        routes: <RouteBase>[
          GoRoute(path: 'appearance', builder: (context, state) => const AppearanceSettingsScreen()),
          GoRoute(path: 'colors', builder: (context, state) => const CustomColorsScreen()),
          GoRoute(path: 'character', builder: (context, state) => const CharacterSettingsScreen()),
          GoRoute(path: 'notifications', builder: (context, state) => const NotificationSettingsScreen()),
          GoRoute(path: 'schedule', builder: (context, state) => const ScheduleSettingsScreen()),
          GoRoute(path: 'privacy', builder: (context, state) => const PrivacySettingsScreen()),
          GoRoute(path: 'account', builder: (context, state) => const AccountSettingsScreen()),
          GoRoute(path: 'help', builder: (context, state) => const HelpSettingsScreen()),
        ],
      ),
      GoRoute(path: Routes.weeklyCheckin, builder: (context, state) => const WeeklyCheckinScreen()),
      GoRoute(
        path: Routes.monthlyReflection,
        builder: (context, state) => MonthlyReflectionScreen(month: state.uri.queryParameters['month']),
      ),
    ];
