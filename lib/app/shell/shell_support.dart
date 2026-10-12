import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/l10n.dart';
import '../routes.dart';

part 'shell_support.g.dart';

/// Title shown in the top bar for a location inside the shell.
String shellTitleFor(String path, AppLocalizations l10n) {
  if (path == Routes.dashboard) return l10n.tabDashboard;
  if (path == Routes.project) return l10n.tabProject;
  if (path == Routes.agenda) return l10n.titleAgenda;
  if (path.startsWith('/project/task/')) return l10n.titleTask;
  if (path == Routes.timeline) return l10n.titleTimeline;
  if (path == Routes.resources) return l10n.titleResources;
  if (path == Routes.opportunities) return l10n.titleOpportunities;
  if (path == Routes.adjustPlan) return l10n.titleAdjustPlan;
  if (path == Routes.journal) return l10n.tabJournal;
  if (path.startsWith('/journal/entry/')) return l10n.titleJournalEntry;
  if (path.startsWith('/journal/scrapbook/')) return l10n.titleScrapbook;
  if (path == Routes.profile) return l10n.tabProfile;
  if (path == Routes.badges) return l10n.titleBadges;
  if (path == Routes.leaderboard) return l10n.titleLeaderboard;
  if (path == Routes.reflections) return l10n.titleReflections;
  if (path == Routes.subscription) return l10n.titleSubscription;
  if (path == Routes.pastProjects) return l10n.titlePastProjects;
  if (path.startsWith(Routes.community)) return l10n.titleCommunity;
  if (path.startsWith('/project')) return l10n.tabProject;
  if (path.startsWith('/journal')) return l10n.tabJournal;
  if (path.startsWith('/profile')) return l10n.tabProfile;
  return l10n.tabDashboard;
}

/// The floating companion button appears on Dashboard, Project, Agenda and
/// Task screens.
bool companionVisibleOn(String path) =>
    path == Routes.dashboard || path == Routes.project || path == Routes.agenda || path.startsWith('/project/task/');

/// Index of the tab that owns [path].
int tabIndexFor(String path) {
  if (path.startsWith('/project')) return 1;
  if (path.startsWith('/journal')) return 2;
  if (path.startsWith('/profile')) return 3;
  return 0;
}

/// One scroll controller per tab root, so re-tapping the active tab scrolls
/// to the top.
@Riverpod(keepAlive: true)
ScrollController tabScrollController(Ref ref, int tabIndex) {
  final controller = ScrollController();
  ref.onDispose(controller.dispose);
  return controller;
}

Future<void> scrollTabToTop(ScrollController controller) async {
  if (!controller.hasClients) return;
  await controller.animateTo(0, duration: const Duration(milliseconds: 350), curve: Curves.easeOutCubic);
}

/// Live connectivity (true when any network is available).
@Riverpod(keepAlive: true)
Stream<bool> isOnline(Ref ref) async* {
  final connectivity = Connectivity();
  try {
    final initial = await connectivity.checkConnectivity();
    yield !initial.contains(ConnectivityResult.none) || initial.isEmpty;
  } on Object {
    yield true;
  }
  yield* connectivity.onConnectivityChanged.map((r) => !r.contains(ConnectivityResult.none));
}
