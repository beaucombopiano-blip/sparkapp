import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../data/providers/session_providers.dart';
import '../../features/billing/entitlements.dart';
import '../../features/onboarding/tutorial_overlay.dart';
import '../routes.dart';
import '../theme/spark_colors.dart';
import '../theme/tokens.dart';
import 'shell_support.dart';
import 'spark_top_bar.dart';

/// The main app shell: SparkTopBar, four-tab bottom bar (navigation rail on
/// wide screens) and the floating companion button.
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell, required this.location});

  final StatefulNavigationShell navigationShell;
  final Uri location;

  void _onTabSelected(WidgetRef ref, int index) {
    if (index == navigationShell.currentIndex) {
      // Re-tapping the active tab pops to its root and scrolls to top.
      navigationShell.goBranch(index, initialLocation: true);
      scrollTabToTop(ref.read(tabScrollControllerProvider(index)));
    } else {
      navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final path = location.path;
    final wide = Breakpoints.of(context) == WindowSize.expanded;
    final isTabRoot = Routes.tabRoots.contains(path);
    final companionAllowed = ref.watch(hasFeatureProvider(Features.aiCompanion));
    final showCompanion = companionAllowed && companionVisibleOn(path);
    final keys = ref.watch(tutorialKeysProvider);

    final destinations = <(IconData, IconData, String, GlobalKey)>[
      (Icons.home_outlined, Icons.home_rounded, l10n.tabDashboard, keys.tabDashboard),
      (Icons.rocket_launch_outlined, Icons.rocket_launch_rounded, l10n.tabProject, keys.tabProject),
      (Icons.photo_album_outlined, Icons.photo_album_rounded, l10n.tabJournal, keys.tabJournal),
      (Icons.person_outline_rounded, Icons.person_rounded, l10n.tabProfile, keys.tabProfile),
    ];

    final body = Column(
      children: <Widget>[
        const OfflineBanner(),
        Expanded(child: navigationShell),
      ],
    );

    final scaffold = Scaffold(
      appBar: SparkTopBar(
        title: shellTitleFor(path, l10n),
        onLogoTap: () => navigationShell.goBranch(0, initialLocation: true),
        onSettingsTap: () => context.push(Routes.settings),
        onBack: isTabRoot ? null : () => context.pop(),
        settingsKey: keys.settingsGear,
      ),
      body: wide
          ? Row(
              children: <Widget>[
                NavigationRail(
                  key: keys.navigation,
                  selectedIndex: navigationShell.currentIndex,
                  onDestinationSelected: (i) => _onTabSelected(ref, i),
                  destinations: <NavigationRailDestination>[
                    for (final d in destinations)
                      NavigationRailDestination(
                        icon: Icon(d.$1, key: d.$4),
                        selectedIcon: Icon(d.$2),
                        label: Text(d.$3),
                      ),
                  ],
                ),
                VerticalDivider(width: 1, color: context.spark.border),
                Expanded(child: body),
              ],
            )
          : body,
      bottomNavigationBar: wide
          ? null
          : NavigationBar(
              key: keys.navigation,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (i) => _onTabSelected(ref, i),
              destinations: <NavigationDestination>[
                for (final d in destinations)
                  NavigationDestination(
                    icon: Icon(d.$1, key: d.$4),
                    selectedIcon: Icon(d.$2),
                    label: d.$3,
                    tooltip: d.$3,
                  ),
              ],
            ),
      floatingActionButton: showCompanion
          ? CompanionButton(key: keys.companionButton, onPressed: () => context.push(Routes.companion()))
          : null,
    );

    return TutorialHost(navigationShell: navigationShell, child: scaffold);
  }
}

/// Small round button with the user's character (bottom right, above the
/// home bar).
class CompanionButton extends ConsumerWidget {
  const CompanionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(selectedCharacterProvider);
    return Tooltip(
      message: context.l10n.companionButtonSemantics,
      child: FloatingActionButton(
        heroTag: 'companion-fab',
        onPressed: onPressed,
        child: Semantics(
          label: context.l10n.companionButtonSemantics,
          excludeSemantics: true,
          child: CharacterAvatar(character: character, size: 40),
        ),
      ),
    );
  }
}

/// Shown while offline; cached Firestore data stays readable.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final online = ref.watch(isOnlineProvider).value ?? true;
    final c = context.spark;
    return AnimatedSize(
      duration: Motion.medium,
      child: online
          ? const SizedBox(width: double.infinity)
          : Semantics(
              liveRegion: true,
              child: Container(
                width: double.infinity,
                color: c.warning.withValues(alpha: 0.15),
                padding: const EdgeInsets.symmetric(horizontal: Space.m, vertical: Space.s),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.cloud_off_rounded, size: 18, color: c.warning),
                    const SizedBox(width: Space.s),
                    Expanded(
                      child: Text(
                        context.l10n.offlineBanner,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: c.textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
