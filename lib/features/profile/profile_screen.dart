import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/shell/shell_support.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/gamification.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';
import '../billing/ad_banner.dart';
import '../billing/entitlements.dart';
import '../gamification/gamification_providers.dart';
import '../project/project_providers.dart';

/// Human-readable plan name.
String planDisplayName(AppLocalizations l10n, String? plan, {required bool allPremium}) {
  if (allPremium) return l10n.planNameLaunch;
  return switch (plan) {
    'premium' => l10n.planNamePremium,
    'standard' => l10n.planNameStandard,
    _ => l10n.planNameBasic,
  };
}

/// Profile tab: avatar, name, plan, stats, badges, points, challenges,
/// leaderboard, reflections, past projects, subscription and community.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final profile = ref.watch(userProfileProvider);
    return AsyncValueView(
      value: profile,
      onRetry: () => ref.invalidate(userProfileProvider),
      data: (p) {
        if (p == null) return const SkeletonList();
        final gamification = ref.watch(hasFeatureProvider(Features.gamification));
        final community = ref.watch(appFlagsProvider.select((f) => f.value?.communityEnabled ?? false)) &&
            ref.watch(hasFeatureProvider(Features.community));
        return ListView(
          controller: ref.watch(tabScrollControllerProvider(3)),
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
          children: <Widget>[
            const _Header(),
            const SizedBox(height: Space.m),
            const _Stats(),
            if (gamification) ...<Widget>[
              SectionHeader(title: l10n.profileBadges, actionLabel: l10n.commonSeeAll, onAction: () => context.push(Routes.badges)),
              const _BadgePreview(),
              SectionHeader(title: l10n.profileChallenges),
              const _Challenges(),
            ],
            const SizedBox(height: Space.l),
            SparkCard(
              padding: const EdgeInsets.symmetric(vertical: Space.xs),
              child: Column(
                children: <Widget>[
                  if (gamification) const _LeaderboardRow(),
                  _NavRow(icon: Icons.auto_stories_rounded, label: l10n.profileReflections, route: Routes.reflections),
                  _NavRow(icon: Icons.inventory_2_rounded, label: l10n.profilePastProjects, route: Routes.pastProjects),
                  const _SubscriptionRow(),
                  if (community) _NavRow(icon: Icons.diversity_3_rounded, label: l10n.profileCommunity, route: Routes.community),
                ],
              ),
            ),
            const SparkAdBanner(),
          ],
        );
      },
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final profile = ref.watch(userProfileProvider).value;
    final character = ref.watch(selectedCharacterProvider);
    final allPremium = ref.watch(allPremiumModeProvider);
    final plan = ref.watch(entitlementsProvider.select((e) => e.value?.plan));
    final clock = ref.watch(userClockProvider);
    return Row(
      children: <Widget>[
        Semantics(
          button: true,
          label: l10n.profileChangeCharacter,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => context.push(Routes.settingsCharacter),
            child: Stack(
              children: <Widget>[
                CharacterAvatar(character: character, size: 76),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: context.spark.primary,
                    child: Icon(Icons.edit_rounded, size: 14, color: context.spark.onPrimary),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: Space.m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Semantics(header: true, child: Text(profile?.displayName ?? '', style: text.headlineSmall)),
              if (profile?.createdAt != null)
                Text(l10n.profileMemberSince(context.fmt.monthYear(clock.toWallClock(profile!.createdAt!))), style: text.bodySmall),
              const SizedBox(height: Space.xs),
              SparkChip(
                label: planDisplayName(l10n, plan, allPremium: allPremium),
                icon: Icons.star_rounded,
                tone: SparkChipTone.accent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Stats extends ConsumerWidget {
  const _Stats();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final stats = ref.watch(profileStatsProvider);
    final streaks = ref.watch(activeProgressProvider).value?.streaks ?? ref.watch(activeProjectProvider).value?.streak;
    final hours = stats.minutes / 60;
    final items = <(IconData, String, String)>[
      (Icons.task_alt_rounded, '${stats.tasks}', l10n.profileStatTasks),
      (Icons.schedule_rounded, l10n.profileHoursValue(hours >= 10 ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1)), l10n.profileStatHours),
      (Icons.local_fire_department_rounded, '${streaks?.daily ?? 0}', l10n.profileStatStreak),
      (Icons.calendar_view_week_rounded, '${streaks?.weekly ?? 0}', l10n.profileStatWeekStreak),
      (Icons.diamond_rounded, '${stats.milestones}', l10n.profileStatMilestones),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(l10n.profileStatsTitle, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: <Widget>[
            for (final (icon, value, label) in items)
              SizedBox(
                width: 110,
                child: Semantics(
                  label: '$value $label',
                  excludeSemantics: true,
                  child: SparkCard(
                    padding: const EdgeInsets.all(Space.s),
                    child: Column(
                      children: <Widget>[
                        Icon(icon, color: context.spark.secondary),
                        Text(value, style: Theme.of(context).textTheme.headlineSmall),
                        Text(label, style: Theme.of(context).textTheme.labelSmall, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _BadgePreview extends ConsumerWidget {
  const _BadgePreview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final catalog = ref.watch(badgeCatalogProvider).value ?? const <BadgeDef>[];
    final earned = {for (final b in ref.watch(earnedBadgesProvider).value ?? const <EarnedBadge>[]) b.id: b};
    final points = ref.watch(totalPointsProvider).value;
    final shown = <BadgeDef>[
      ...catalog.where((b) => earned.containsKey(b.id)),
      ...catalog.where((b) => !earned.containsKey(b.id)),
    ].take(8).toList();
    return SparkCard(
      onTap: () => context.push(Routes.badges),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (points != null) SparkChip(label: l10n.profilePoints(points), icon: Icons.bolt_rounded, tone: SparkChipTone.accent),
          const SizedBox(height: Space.s),
          if (shown.isEmpty)
            Text(l10n.badgesEmpty)
          else
            Wrap(
              spacing: Space.s,
              runSpacing: Space.s,
              children: <Widget>[for (final b in shown) BadgeIcon(badge: b, earned: earned.containsKey(b.id), size: 44)],
            ),
        ],
      ),
    );
  }
}

/// A badge in colour when earned, outlined when locked.
class BadgeIcon extends StatelessWidget {
  const BadgeIcon({super.key, required this.badge, required this.earned, this.size = 56});

  final BadgeDef badge;
  final bool earned;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    return Tooltip(
      message: badge.name,
      child: Semantics(
        label: '${badge.name}, ${earned ? l10n.profileBadges : l10n.badgesLocked}',
        excludeSemantics: true,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: earned ? LinearGradient(colors: <Color>[c.accent, c.primary]) : null,
            border: earned ? null : Border.all(color: c.iconMuted, width: 2),
          ),
          child: Icon(
            earned ? Icons.emoji_events_rounded : Icons.lock_outline_rounded,
            size: size * 0.5,
            color: earned ? c.onPrimary : c.iconMuted,
          ),
        ),
      ),
    );
  }
}

class _Challenges extends ConsumerWidget {
  const _Challenges();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final challenges = ref.watch(challengesProvider);
    final joined = {for (final p in ref.watch(challengeParticipationProvider).value ?? const <ChallengeParticipation>[]) p.id: p};
    return AsyncValueView<List<Challenge>>(
      value: challenges,
      compact: true,
      onRetry: () => ref.invalidate(challengesProvider),
      data: (list) {
        if (list.isEmpty) return Text(l10n.profileNoChallenges, style: Theme.of(context).textTheme.bodyMedium);
        return Column(
          children: <Widget>[
            for (final ch in list)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.s),
                child: SparkCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text(ch.title, style: Theme.of(context).textTheme.titleMedium)),
                          if (joined.containsKey(ch.id))
                            SparkChip(label: l10n.profileChallengeJoined, icon: Icons.check_rounded, tone: SparkChipTone.success)
                          else
                            _JoinButton(challengeId: ch.id),
                        ],
                      ),
                      Text(ch.description, style: Theme.of(context).textTheme.bodyMedium),
                      if (ch.reward != null) Text('🏅 ${ch.reward}', style: Theme.of(context).textTheme.bodySmall),
                      if (ch.endsAt != null)
                        Text(l10n.profileChallengeEnds(fmt.shortDate(clock.toWallClock(ch.endsAt!))), style: Theme.of(context).textTheme.bodySmall),
                      if (joined[ch.id] != null) ...<Widget>[
                        const SizedBox(height: Space.xs),
                        LinearProgressIndicator(value: joined[ch.id]!.progress.clamp(0, 1)),
                        Text(l10n.profileChallengeProgress(fmt.percent(joined[ch.id]!.progress.clamp(0, 1))), style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _JoinButton extends ConsumerStatefulWidget {
  const _JoinButton({required this.challengeId});
  final String challengeId;

  @override
  ConsumerState<_JoinButton> createState() => _JoinButtonState();
}

class _JoinButtonState extends ConsumerState<_JoinButton> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _busy
          ? null
          : () async {
              setState(() => _busy = true);
              try {
                await ref.read(engagementRepositoryProvider).joinChallenge(widget.challengeId);
              } on Object catch (e) {
                if (context.mounted) showErrorSnack(context, e);
              } finally {
                if (mounted) setState(() => _busy = false);
              }
            },
      child: _busy ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2)) : Text(context.l10n.profileChallengeJoin),
    );
  }
}

class _LeaderboardRow extends ConsumerWidget {
  const _LeaderboardRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final on = ref.watch(userSettingsProvider.select((s) => s.value?.privacy.leaderboardOptIn ?? false));
    return ListTile(
      leading: Icon(Icons.leaderboard_rounded, color: context.spark.secondary),
      title: Text(l10n.profileLeaderboard),
      subtitle: Text(on ? l10n.profileLeaderboardOn : l10n.profileLeaderboardOff),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => context.push(Routes.leaderboard),
    );
  }
}

class _SubscriptionRow extends ConsumerWidget {
  const _SubscriptionRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final allPremium = ref.watch(allPremiumModeProvider);
    final plan = ref.watch(entitlementsProvider.select((e) => e.value?.plan));
    return ListTile(
      leading: Icon(Icons.workspace_premium_rounded, color: context.spark.secondary),
      title: Text(l10n.profileSubscription),
      subtitle: Text(planDisplayName(l10n, plan, allPremium: allPremium)),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => context.push(Routes.subscription),
    );
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({required this.icon, required this.label, required this.route});
  final IconData icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Icon(icon, color: context.spark.secondary),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => context.push(route),
      );
}
