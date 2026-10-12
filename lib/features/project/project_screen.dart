import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/shell/shell_support.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../core/widgets/locked_feature_card.dart';
import '../../core/widgets/milestone_marker.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_progress_bar.dart';
import '../../core/widgets/states.dart';
import '../../data/models/project.dart';
import '../../data/models/resources.dart';
import '../../data/providers/session_providers.dart';
import '../agenda/agenda_views.dart';
import '../billing/entitlements.dart';
import '../onboarding/plan_generation_screen.dart' show PlanPreviewCard;
import '../onboarding/tutorial_overlay.dart';
import '../resources/resources_providers.dart';
import '../task/live_task_list.dart';
import 'adjust_plan_screen.dart' show PlanAction;
import 'project_providers.dart';
import 'spark_calendar.dart';

/// Project tab: monthly calendar pinned at the top (collapses to a week
/// strip on scroll), then header, progress, current tasks, timeline preview,
/// resources/companion and plan actions. Two panes on wide screens.
class ProjectScreen extends ConsumerStatefulWidget {
  const ProjectScreen({super.key});

  @override
  ConsumerState<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends ConsumerState<ProjectScreen> {
  bool? _collapsed;
  LocalDay? _selected;

  bool _onScroll(ScrollNotification n) {
    if (n.depth == 0 && n is ScrollUpdateNotification && n.metrics.pixels > 40 && _collapsed != true) {
      setState(() => _collapsed = true);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final project = ref.watch(activeProjectProvider);
    final l10n = context.l10n;

    if (project.hasError && !project.hasValue) {
      return ErrorState(error: project.error!, onRetry: () => ref.invalidate(activeProjectProvider));
    }
    if (!project.hasValue) return const SkeletonList(itemCount: 5);
    final p = project.requireValue;
    if (p == null) {
      return EmptyState(
        title: l10n.dashboardEmptyTitle,
        body: l10n.dashboardEmptyBody,
        actionLabel: l10n.tabDashboard,
        onAction: () => context.go(Routes.dashboard),
      );
    }
    if (!p.hasPlan) {
      return EmptyState(title: l10n.projectNoPlanTitle, body: l10n.projectNoPlanBody, icon: Icons.hourglass_top_rounded);
    }
    if (!ref.watch(hasFeatureProvider(Features.fullPlan))) return _PreviewOnly(project: p);

    final keys = ref.watch(tutorialKeysProvider);
    final size = MediaQuery.sizeOf(context);
    final wide = Breakpoints.of(context) == WindowSize.expanded;
    final collapsed = _collapsed ??
        (size.height < 640 || MediaQuery.textScalerOf(context).scale(1) > 1.5);
    final today = ref.watch(userClockProvider).today();

    final details = NotificationListener<ScrollNotification>(
      onNotification: wide ? null : _onScroll,
      child: ListView(
        controller: ref.watch(tabScrollControllerProvider(1)),
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, 96),
        children: <Widget>[
          _ProjectHeader(project: p),
          const SizedBox(height: Space.m),
          _ProgressSection(project: p),
          SectionHeader(
            title: l10n.projectCurrentTasks,
            actionLabel: l10n.dashboardSeeAgenda,
            onAction: () => context.push(Routes.agendaFor(view: 'week')),
          ),
          const _CurrentTasks(),
          SectionHeader(
            title: l10n.projectTimelinePreview,
            actionLabel: l10n.projectOpenTimeline,
            onAction: () => context.push(Routes.timeline),
          ),
          const _TimelinePreview(),
          SectionHeader(title: l10n.projectHelpSection),
          const _HelpSection(),
          SectionHeader(title: l10n.projectPlanActions),
          const _PlanActions(),
        ],
      ),
    );

    if (wide) {
      final selected = _selected ?? today;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 420,
            child: Column(
              children: <Widget>[
                KeyedSubtree(
                  key: keys.calendar,
                  child: SparkCalendar(
                    selectedDay: selected,
                    onDaySelected: (d) => setState(() => _selected = d),
                  ),
                ),
                const Divider(height: 1),
                Expanded(child: AgendaDayList(day: selected)),
              ],
            ),
          ),
          VerticalDivider(width: 1, color: context.spark.border),
          Expanded(child: details),
        ],
      );
    }

    return Column(
      children: <Widget>[
        KeyedSubtree(
          key: keys.calendar,
          child: SparkCalendar(
            selectedDay: _selected,
            collapsed: collapsed,
            onExpand: () => setState(() => _collapsed = false),
            onDaySelected: (d) {
              setState(() => _selected = d);
              context.push(Routes.agendaFor(date: d.toIso(), view: 'day'));
            },
          ),
        ),
        if (!collapsed)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: Space.s),
              child: TextButton.icon(
                key: const Key('view-agenda'),
                onPressed: () => context.push(Routes.agendaFor(date: today.toIso(), view: 'day')),
                icon: const Icon(Icons.view_agenda_rounded),
                label: Text(l10n.projectViewAgenda),
              ),
            ),
          ),
        const Divider(height: 1),
        Expanded(child: details),
      ],
    );
  }
}

class _ProjectHeader extends ConsumerWidget {
  const _ProjectHeader({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final progress = ref.watch(activeProgressProvider).value;
    final start = project.startDate == null ? null : clock.toWallClock(project.startDate!);
    final end = project.targetEndDate == null ? null : clock.toWallClock(project.targetEndDate!);
    final daysLeft = progress?.daysLeft ??
        (project.targetEndDate == null ? null : clock.dayOf(project.targetEndDate!).differenceInDays(clock.today()));
    final onTrack = (progress?.onTrack ?? true) && !project.scheduleAtRisk;
    final phase = progress?.currentPhase?.title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Semantics(header: true, child: Text(project.title, style: text.headlineSmall)),
        if (phase != null) Text(l10n.projectPhase(phase), style: text.bodyMedium),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            if (start != null && end != null)
              SparkChip(
                label: l10n.projectDates(fmt.monthDay(start), fmt.monthDay(end)),
                icon: Icons.date_range_rounded,
              ),
            if (daysLeft != null)
              SparkChip(label: l10n.projectDaysLeft(daysLeft < 0 ? 0 : daysLeft), icon: Icons.hourglass_bottom_rounded),
            SparkChip(
              label: onTrack ? l10n.projectOnTrack : l10n.projectAtRisk,
              icon: onTrack ? Icons.check_circle_rounded : Icons.warning_amber_rounded,
              tone: onTrack ? SparkChipTone.success : SparkChipTone.warning,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProgressSection extends ConsumerWidget {
  const _ProgressSection({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final fmt = context.fmt;
    final progress = ref.watch(activeProgressProvider);
    final p = progress.value;
    final done = p?.completedMinutes ?? project.completedMinutes;
    final left = p?.remainingMinutes ?? project.remainingMinutes;
    return SparkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.projectProgress, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Space.s),
          SparkProgressBar(done: p?.doneFraction ?? project.fractionComplete, projected: p?.projectedFraction),
          const SizedBox(height: Space.xs),
          Text(l10n.projectTimeSummary(fmt.duration(done), fmt.duration(left)), style: Theme.of(context).textTheme.bodySmall),
          if (progress.hasError)
            ErrorState(error: progress.error!, compact: true, onRetry: () => ref.invalidate(activeProgressProvider)),
        ],
      ),
    );
  }
}

class _CurrentTasks extends ConsumerWidget {
  const _CurrentTasks();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return SparkCard(
      padding: const EdgeInsets.fromLTRB(Space.s, Space.xs, Space.xs, Space.xs),
      child: AsyncValueView(
        value: ref.watch(currentTasksProvider),
        compact: true,
        onRetry: () => ref.invalidate(currentTasksProvider),
        data: (tasks) => LiveTaskList(
          tasks: tasks,
          empty: EmptyState(compact: true, icon: Icons.task_alt_rounded, title: l10n.dashboardNoTasks, body: l10n.dashboardNoTasksBody),
        ),
      ),
    );
  }
}

class _TimelinePreview extends ConsumerWidget {
  const _TimelinePreview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phases = ref.watch(activePhasesProvider);
    final milestones = ref.watch(activeMilestonesProvider).value ?? const <Milestone>[];
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    return AsyncValueView<List<Phase>>(
      value: phases,
      compact: true,
      onRetry: () => ref.invalidate(activePhasesProvider),
      data: (list) {
        if (list.isEmpty) return EmptyState(compact: true, title: context.l10n.timelineEmpty, icon: Icons.timeline_rounded);
        return SizedBox(
          height: 132 * MediaQuery.textScalerOf(context).scale(1).clamp(1.0, 2.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            separatorBuilder: (_, _) => Center(child: Icon(Icons.arrow_forward_rounded, color: c.iconMuted)),
            itemBuilder: (context, i) {
              final phase = list[i];
              final ms = milestones.where((m) => m.phaseId == phase.id).toList();
              return SizedBox(
                width: 200,
                child: SparkCard(
                  tone: phase.status == MilestoneStatus.inProgress ? SparkCardTone.tinted : SparkCardTone.normal,
                  onTap: () => context.push(Routes.timeline),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(phase.title, style: text.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: Space.s),
                      Wrap(
                        spacing: Space.xs,
                        runSpacing: Space.xs,
                        children: <Widget>[for (final m in ms) Tooltip(message: m.title, child: MilestoneMarker(status: m.status))],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _HelpSection extends ConsumerWidget {
  const _HelpSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final hasCompanion = ref.watch(hasFeatureProvider(Features.aiCompanion));
    final hasResources = ref.watch(hasFeatureProvider(Features.resourceCenter));
    final hasOpportunities = ref.watch(hasFeatureProvider(Features.opportunities));
    final categories = ref.watch(resourceCategoriesProvider).value ?? const <ResourceCategory>[];
    final saved = ref.watch(savedResourcesProvider).value?.length ?? 0;
    final project = ref.watch(activeProjectProvider).value;

    if (!hasCompanion && !hasResources && !hasOpportunities) {
      return LockedFeatureCard(
        title: l10n.projectHelpSection,
        benefit: l10n.lockedResourcesBenefit,
        onSeePlans: () => context.push(Routes.plans),
      );
    }

    return SparkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (hasCompanion)
            SparkButton(
              label: l10n.projectAskCompanion,
              icon: Icons.chat_rounded,
              onPressed: () => context.push(Routes.companion()),
            ),
          if (hasResources) ...<Widget>[
            const SizedBox(height: Space.m),
            Wrap(
              spacing: Space.s,
              runSpacing: Space.xs,
              children: <Widget>[
                for (final cat in categories.take(4))
                  SparkChip(
                    label: resourceCategoryName(cat, project?.projectType, l10n),
                    icon: Icons.category_rounded,
                    onTap: () => context.push(Uri(path: Routes.resources, queryParameters: <String, String>{'category': cat.id}).toString()),
                  ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.bookmarks_rounded, color: c.secondary),
              title: Text(l10n.projectBrowseResources),
              subtitle: Text(l10n.projectSavedResources(saved)),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(Routes.resources),
            ),
          ],
          if (hasOpportunities)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.travel_explore_rounded, color: c.secondary),
              title: Text(l10n.projectOpportunities),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push(Routes.opportunities),
            ),
        ],
      ),
    );
  }
}

/// Category name with the project type filled into "How to complete a […]".
String resourceCategoryName(ResourceCategory category, String? projectType, AppLocalizations l10n) {
  final name = category.name;
  if (name.contains('[') && name.contains(']')) {
    return name.replaceAll(RegExp(r'\[[^\]]*\]'), projectType ?? l10n.resourceProjectTypeFallback);
  }
  return name;
}

class _PlanActions extends StatelessWidget {
  const _PlanActions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    Widget tile(IconData icon, String label, PlanAction action) => ListTile(
          leading: Icon(icon, color: c.secondary),
          title: Text(label),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () => context.push(Uri(path: Routes.adjustPlan, queryParameters: <String, String>{'action': action.name}).toString()),
        );
    return SparkCard(
      padding: const EdgeInsets.symmetric(vertical: Space.xs),
      child: Column(
        children: <Widget>[
          tile(Icons.tune_rounded, l10n.planActionAdjust, PlanAction.adjust),
          tile(Icons.event_available_rounded, l10n.planActionAvailability, PlanAction.availability),
          tile(Icons.flag_rounded, l10n.planActionDeadline, PlanAction.deadline),
          tile(Icons.autorenew_rounded, l10n.planActionRegenerate, PlanAction.regenerate),
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.s),
            child: Text(l10n.planActionsNote, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}

/// Basic plan: preview with the rest blurred, plus "See plans".
class _PreviewOnly extends StatelessWidget {
  const _PreviewOnly({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.all(Space.gutter),
      children: <Widget>[
        Text(project.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: Space.m),
        if (project.preview != null) PlanPreviewCard(preview: project.preview!),
        const SizedBox(height: Space.m),
        LockedFeatureCard(
          title: l10n.previewLockedTitle,
          benefit: l10n.previewLockedBody,
          onSeePlans: () => context.push(Routes.plans),
        ),
      ],
    );
  }
}
