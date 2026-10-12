import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/shell/shell_support.dart';
import '../../app/theme/seasonal.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/theme_providers.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_progress_bar.dart';
import '../../core/widgets/states.dart';
import '../../data/models/dashboard.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/user_repository.dart';
import '../billing/entitlements.dart';
import '../gamification/celebration_queue.dart';
import '../onboarding/tutorial_overlay.dart';
import '../project/project_providers.dart';
import '../project/proposal_sheet.dart';
import '../splash_greeting/greeting_screen.dart';
import '../task/live_task_list.dart';

/// Home: greeting, project progress, next session, today's tasks, streaks,
/// the companion card and any banners. Pull to refresh.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  Future<void> _refresh(WidgetRef ref) async {
    ref.invalidate(homeDashboardProvider);
    ref.invalidate(activeProgressProvider);
    try {
      await ref.read(homeDashboardProvider.future);
    } on Object {
      // The error state renders below; nothing else to do.
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(activeProjectProvider);
    final l10n = context.l10n;

    // Queue celebrations the backend recorded while the app was closed.
    ref.listen<AsyncValue<HomeDashboard>>(homeDashboardProvider, (prev, next) {
      final celebrations = next.value?.unreadCelebrations;
      if (celebrations != null && celebrations.isNotEmpty) {
        ref.read(celebrationQueueProvider.notifier).addServerCelebrations(celebrations, l10n);
      }
    });

    if (project.hasError && !project.hasValue) {
      return ErrorState(error: project.error!, onRetry: () => ref.invalidate(activeProjectProvider));
    }
    if (!project.hasValue) return const SkeletonList(itemCount: 5, itemHeight: 96);
    final p = project.requireValue;
    if (p == null) return const _NoProject();

    final controller = ref.watch(tabScrollControllerProvider(0));
    final wide = Breakpoints.of(context) != WindowSize.compact;

    final main = <Widget>[
      const _Banners(),
      _ProjectCard(project: p),
      const SizedBox(height: Space.m),
      const _NextSessionCard(),
      SectionHeader(
        title: l10n.dashboardTodaysTasks,
        actionLabel: l10n.dashboardSeeAgenda,
        onAction: () => context.go(Routes.agendaFor(view: 'week')),
      ),
      const _TodaysTasks(),
    ];
    final side = <Widget>[
      const SizedBox(height: Space.m),
      const _StreakRow(),
      if (ref.watch(hasFeatureProvider(Features.aiCompanion))) ...<Widget>[
        const SizedBox(height: Space.m),
        const _CompanionCard(),
      ],
      const SizedBox(height: 96), // room for the companion button
    ];

    return RefreshIndicator(
      onRefresh: () => _refresh(ref),
      child: ListView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.s, Space.gutter, Space.m),
        children: <Widget>[
          const _GreetingHeader(),
          const SizedBox(height: Space.m),
          if (wide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: main)),
                const SizedBox(width: Space.l),
                Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: side)),
              ],
            )
          else ...<Widget>[...main, ...side],
        ],
      ),
    );
  }
}

class _GreetingHeader extends ConsumerWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final name = ref.watch(userProfileProvider.select((p) => p.value?.firstName)) ?? '';
    final now = ref.watch(userClockProvider).now();
    final character = ref.watch(selectedCharacterProvider);
    final season = ref.watch(sparkThemeProvider.select((t) => t.decoration));
    return Row(
      children: <Widget>[
        CharacterAvatar(character: character, size: 52),
        const SizedBox(width: Space.m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Semantics(
                header: true,
                child: Text(greetingLine(l10n, name, now.hour, sparkle: false), style: text.headlineSmall),
              ),
              Text(context.fmt.fullDay(now), style: text.bodyMedium),
            ],
          ),
        ),
        SeasonalDecoration(season: season),
      ],
    );
  }
}

class _Banners extends ConsumerWidget {
  const _Banners();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final proposals = ref.watch(pendingProposalsProvider).value ?? const [];
    final dashboard = ref.watch(homeDashboardProvider).value;
    final atRisk = ref.watch(activeProjectProvider.select((p) => p.value?.scheduleAtRisk ?? false));
    final downgrade = ref.watch(entitlementsProvider.select((e) => e.value?.downgradeNotice));

    final banners = <Widget>[
      if (proposals.isNotEmpty)
        _Banner(
          icon: Icons.event_repeat_rounded,
          message: proposals.first.type == 'missedSessions' ? l10n.bannerProposal : (proposals.first.summary ?? l10n.bannerProposalGeneric),
          action: l10n.bannerProposalAction,
          onTap: () => showProposalSheet(context, proposals.first),
        ),
      if (dashboard?.checkinReady ?? false)
        _Banner(
          icon: Icons.forum_rounded,
          message: l10n.bannerCheckin,
          action: l10n.bannerCheckinAction,
          onTap: () => context.push(Routes.weeklyCheckin),
        ),
      if (dashboard?.monthlyReflectionReady ?? false)
        _Banner(
          icon: Icons.auto_stories_rounded,
          message: l10n.bannerReflection,
          action: l10n.bannerReflectionAction,
          onTap: () => context.push(Routes.monthlyReflection),
        ),
      if (atRisk && proposals.isEmpty)
        _Banner(
          icon: Icons.warning_amber_rounded,
          message: l10n.bannerAtRisk,
          action: l10n.bannerAtRiskAction,
          onTap: () => context.go(Routes.adjustPlan),
          warning: true,
        ),
      if (downgrade != null && !downgrade.dismissed)
        _Banner(
          icon: Icons.info_outline_rounded,
          message: downgrade.message ?? l10n.bannerDowngrade,
          action: l10n.bannerDowngradeAction,
          onTap: () => context.go(Routes.subscription),
        ),
    ];
    if (banners.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.m),
      child: Column(
        children: <Widget>[
          for (final b in banners) Padding(padding: const EdgeInsets.only(bottom: Space.s), child: b),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    required this.icon,
    required this.message,
    required this.action,
    required this.onTap,
    this.warning = false,
  });

  final IconData icon;
  final String message;
  final String action;
  final VoidCallback onTap;
  final bool warning;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return SparkCard(
      tone: SparkCardTone.accent,
      padding: const EdgeInsets.fromLTRB(Space.m, Space.s, Space.xs, Space.s),
      child: Row(
        children: <Widget>[
          Icon(icon, color: warning ? c.warning : c.primary),
          const SizedBox(width: Space.s),
          Expanded(child: Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.textPrimary))),
          TextButton(onPressed: onTap, child: Text(action)),
        ],
      ),
    );
  }
}

class _ProjectCard extends ConsumerWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final progress = ref.watch(activeProgressProvider);
    final keys = ref.watch(tutorialKeysProvider);
    final milestone = progress.value?.currentMilestone?.title;

    return SparkCard(
      semanticLabel: l10n.dashboardProjectCardSemantics,
      onTap: () => context.go(Routes.project),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(project.title, style: text.titleLarge),
          if (milestone != null) ...<Widget>[
            const SizedBox(height: Space.xs),
            Text(l10n.dashboardCurrentMilestone(milestone), style: text.bodyMedium),
          ],
          const SizedBox(height: Space.m),
          KeyedSubtree(
            key: keys.progressBar,
            child: progress.when(
              data: (p) => SparkProgressBar(
                done: p?.doneFraction ?? project.fractionComplete,
                projected: p?.projectedFraction,
              ),
              loading: () => SparkProgressBar(done: project.fractionComplete),
              error: (e, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SparkProgressBar(done: project.fractionComplete),
                  ErrorState(error: e, compact: true, onRetry: () => ref.invalidate(activeProgressProvider)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextSessionCard extends ConsumerWidget {
  const _NextSessionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final session = ref.watch(nextSessionProvider);

    return AsyncValueView(
      value: session,
      compact: true,
      onRetry: () => ref.invalidate(nextSessionProvider),
      data: (s) {
        if (s == null) {
          return SparkCard(
            child: Row(
              children: <Widget>[
                Icon(Icons.event_available_rounded, color: c.iconMuted),
                const SizedBox(width: Space.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.dashboardNextSessionNone, style: text.titleMedium),
                      Text(l10n.dashboardNextSessionNoneBody, style: text.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        final start = clock.toWallClock(s.startsAt);
        final end = clock.toWallClock(s.end);
        final day = fmt.dayLabel(clock.dayOf(s.startsAt), clock.today());
        final tasks = ref.watch(tasksByIdsProvider(s.taskIds.join(','))).value ?? const <Task>[];
        final first = tasks.where((t) => t.isOpen).firstOrNull;
        return SparkCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(l10n.dashboardNextSession, style: text.labelLarge),
              const SizedBox(height: Space.xs),
              Row(
                children: <Widget>[
                  Icon(Icons.access_time_filled_rounded, color: c.secondary),
                  const SizedBox(width: Space.s),
                  Expanded(
                    child: Text(l10n.sessionWhen(day, fmt.timeRange(start, end)), style: text.titleMedium),
                  ),
                  SparkChip(label: fmt.duration(s.durationMinutes)),
                ],
              ),
              if (first != null) ...<Widget>[
                const SizedBox(height: Space.s),
                Text(l10n.dashboardFirstTask(first.title), style: text.bodyMedium),
              ],
              const SizedBox(height: Space.m),
              SparkButton(
                key: const Key('start-session'),
                label: l10n.sessionStart,
                icon: Icons.play_arrow_rounded,
                onPressed: () => context.push(Routes.focus(s.id)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TodaysTasks extends ConsumerWidget {
  const _TodaysTasks();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final tasks = ref.watch(currentTasksProvider);
    final keys = ref.watch(tutorialKeysProvider);
    return KeyedSubtree(
      key: keys.checklist,
      child: SparkCard(
        padding: const EdgeInsets.fromLTRB(Space.s, Space.xs, Space.xs, Space.xs),
        child: AsyncValueView(
          value: tasks,
          compact: true,
          onRetry: () => ref.invalidate(currentTasksProvider),
          data: (list) => LiveTaskList(
            tasks: list,
            empty: EmptyState(
              compact: true,
              icon: Icons.task_alt_rounded,
              title: l10n.dashboardNoTasks,
              body: l10n.dashboardNoTasksBody,
            ),
          ),
        ),
      ),
    );
  }
}

class _StreakRow extends ConsumerWidget {
  const _StreakRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final progress = ref.watch(activeProgressProvider).value;
    final dashboard = ref.watch(homeDashboardProvider).value;
    final project = ref.watch(activeProjectProvider).value;
    final streaks = progress?.streaks ?? dashboard?.streaks ?? project?.streak;
    final daily = streaks?.daily ?? 0;
    final weekly = streaks?.weekly ?? 0;
    return Semantics(
      button: true,
      label: l10n.streakSemantics(daily, weekly),
      excludeSemantics: true,
      child: SparkCard(
        tone: SparkCardTone.accent,
        onTap: () => context.go(Routes.badges),
        child: Row(
          children: <Widget>[
            Icon(Icons.local_fire_department_rounded, color: c.accent, size: 32),
            const SizedBox(width: Space.s),
            Expanded(
              child: Wrap(
                spacing: Space.s,
                runSpacing: Space.xs,
                children: <Widget>[
                  SparkChip(label: l10n.streakDaily(daily), icon: Icons.bolt_rounded, tone: SparkChipTone.accent),
                  SparkChip(label: l10n.streakWeekly(weekly), icon: Icons.calendar_view_week_rounded, tone: SparkChipTone.accent),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: c.iconMuted),
          ],
        ),
      ),
    );
  }
}

class _CompanionCard extends ConsumerWidget {
  const _CompanionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final character = ref.watch(selectedCharacterProvider);
    final prompts = <String>[l10n.companionPromptToday, l10n.companionPromptStuck, l10n.companionPromptBehind];
    return SparkCard(
      onTap: () => context.push(Routes.companion()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CharacterAvatar(character: character, size: 40),
              const SizedBox(width: Space.s),
              Expanded(
                child: Text(
                  character == null ? l10n.companionCardTitleDefault : l10n.companionCardTitle(character.name),
                  style: text.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.s),
          Wrap(
            spacing: Space.s,
            runSpacing: Space.xs,
            children: <Widget>[
              for (final p in prompts)
                SparkChip(
                  label: p,
                  icon: Icons.chat_bubble_outline_rounded,
                  onTap: () => context.push(Routes.companion(prompt: p)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NoProject extends ConsumerStatefulWidget {
  const _NoProject();

  @override
  ConsumerState<_NoProject> createState() => _NoProjectState();
}

class _NoProjectState extends ConsumerState<_NoProject> {
  bool _busy = false;

  Future<void> _start() async {
    setState(() => _busy = true);
    try {
      await ref.read(userRepositoryProvider).startNewProject();
      // The router follows the new onboarding step.
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _start);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return EmptyState(
      title: l10n.dashboardEmptyTitle,
      body: l10n.dashboardEmptyBody,
      actionLabel: _busy ? l10n.commonLoading : l10n.dashboardEmptyAction,
      onAction: _busy ? null : _start,
    );
  }
}
