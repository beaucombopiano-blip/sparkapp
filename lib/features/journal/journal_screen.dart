import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/shell/shell_support.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/locked_feature_card.dart';
import '../../core/widgets/milestone_marker.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/journal.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/journal_repository.dart';
import '../billing/entitlements.dart';
import 'add_journal_entry.dart';
import 'journal_entry_screen.dart';
import 'journal_providers.dart';

/// Journal tab: chronological timeline grouped by month (newest first by
/// default) with milestone and badge markers inline, plus scrapbooks.
/// No download, export or share anywhere.
class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  String? _selectedEntryId;
  bool _requestingYear = false;

  Future<void> _requestYearInReview() async {
    setState(() => _requestingYear = true);
    try {
      await ref.read(journalRepositoryProvider).compileScrapbook(year: ref.read(userClockProvider).today().year);
      if (mounted) showInfoSnack(context, context.l10n.journalScrapbookRequested);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _requestYearInReview);
    } finally {
      if (mounted) setState(() => _requestingYear = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!ref.watch(hasFeatureProvider(Features.journal))) {
      return Padding(
        padding: const EdgeInsets.all(Space.gutter),
        child: LockedFeatureCard(title: l10n.tabJournal, benefit: l10n.journalLocked, onSeePlans: () => context.push(Routes.plans)),
      );
    }
    final wide = Breakpoints.of(context) == WindowSize.expanded;
    final timeline = ref.watch(journalTimelineProvider);
    final newestFirst = ref.watch(journalNewestFirstProvider);
    final hasProject = ref.watch(activeProjectIdProvider) != null;

    final list = RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(journalTimelineProvider);
        try {
          await ref.read(journalTimelineProvider.future);
        } on Object {
          // Error state renders below.
        }
      },
      child: ListView(
        controller: ref.watch(tabScrollControllerProvider(2)),
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: SparkButton(
                  key: const Key('journal-add'),
                  label: l10n.journalAddEntry,
                  icon: Icons.add_a_photo_rounded,
                  onPressed: hasProject ? () => showAddJournalEntrySheet(context) : null,
                ),
              ),
              const SizedBox(width: Space.s),
              SparkChip(
                label: newestFirst ? l10n.journalNewestFirst : l10n.journalOldestFirst,
                icon: newestFirst ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                onTap: () => ref.read(journalNewestFirstProvider.notifier).toggle(),
              ),
            ],
          ),
          _ScrapbookStrip(onYearInReview: _requestingYear ? null : _requestYearInReview),
          AsyncValueView<JournalTimeline?>(
            value: timeline,
            onRetry: () => ref.invalidate(journalTimelineProvider),
            data: (t) {
              final items = List<JournalTimelineItem>.of(t?.items ?? const <JournalTimelineItem>[])
                ..sort((a, b) {
                  final ad = a.date ?? DateTime(1970);
                  final bd = b.date ?? DateTime(1970);
                  return newestFirst ? bd.compareTo(ad) : ad.compareTo(bd);
                });
              if (items.isEmpty) {
                return EmptyState(
                  title: l10n.journalEmpty,
                  actionLabel: hasProject ? l10n.journalAddEntry : null,
                  onAction: hasProject ? () => showAddJournalEntrySheet(context) : null,
                );
              }
              return _Timeline(
                items: items,
                selectedId: _selectedEntryId,
                onEntryTap: (item) {
                  final id = item.entryId ?? item.id;
                  if (wide) {
                    setState(() => _selectedEntryId = id);
                  } else {
                    context.push(Routes.journalEntry(id));
                  }
                },
              );
            },
          ),
        ],
      ),
    );

    if (!wide) return list;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 440, child: list),
        VerticalDivider(width: 1, color: context.spark.border),
        Expanded(
          child: _selectedEntryId == null
              ? EmptyState(title: l10n.journalSelectEntry, icon: Icons.photo_rounded)
              : JournalEntryView(key: ValueKey<String>(_selectedEntryId!), entryId: _selectedEntryId!),
        ),
      ],
    );
  }
}

class _ScrapbookStrip extends ConsumerWidget {
  const _ScrapbookStrip({required this.onYearInReview});
  final VoidCallback? onYearInReview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final allowed = ref.watch(hasFeatureProvider(Features.scrapbook));
    final books = ref.watch(scrapbooksProvider).value ?? const <Scrapbook>[];
    if (!allowed) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SectionHeader(
          title: l10n.journalScrapbooks,
          actionLabel: l10n.journalMakeYearInReview,
          onAction: onYearInReview,
        ),
        if (books.isNotEmpty)
          SizedBox(
            height: 120 * MediaQuery.textScalerOf(context).scale(1).clamp(1.0, 1.8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              separatorBuilder: (_, _) => const SizedBox(width: Space.s),
              itemBuilder: (context, i) {
                final b = books[i];
                final ready = b.status == 'ready';
                return SizedBox(
                  width: 180,
                  child: SparkCard(
                    tone: SparkCardTone.tinted,
                    onTap: ready ? () => context.push(Routes.scrapbook(b.id)) : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.auto_stories_rounded, color: c.primary),
                        const SizedBox(height: Space.xs),
                        Text(
                          b.kind == 'yearInReview' && b.year != null ? l10n.scrapbookYearTitle(b.year!) : b.title,
                          style: text.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (!ready)
                          Text(b.status == 'failed' ? l10n.scrapbookFailed : l10n.journalScrapbookCompiling, style: text.bodySmall),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _Timeline extends ConsumerWidget {
  const _Timeline({required this.items, required this.onEntryTap, this.selectedId});

  final List<JournalTimelineItem> items;
  final void Function(JournalTimelineItem item) onEntryTap;
  final String? selectedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final text = Theme.of(context).textTheme;
    final children = <Widget>[];
    String? currentMonth;
    for (final item in items) {
      final wall = item.date == null ? null : clock.toWallClock(item.date!);
      final month = wall == null ? '' : fmt.monthYear(wall);
      if (month != currentMonth) {
        currentMonth = month;
        children.add(Padding(
          padding: const EdgeInsets.only(top: Space.l, bottom: Space.s),
          child: Semantics(header: true, child: Text(month, style: text.titleMedium)),
        ));
      }
      children.add(Padding(
        padding: const EdgeInsets.only(bottom: Space.s),
        child: switch (item.kind) {
          TimelineItemKind.milestone => _MarkerRow(
              icon: const MilestoneMarker(status: MilestoneStatus.done),
              label: context.l10n.journalMilestoneMarker(item.title ?? item.milestoneTitle ?? ''),
              date: wall,
            ),
          TimelineItemKind.badge => _MarkerRow(
              icon: Icon(Icons.emoji_events_rounded, color: context.spark.accent),
              label: context.l10n.journalBadgeMarker(item.title ?? ''),
              date: wall,
            ),
          _ => _EntryTile(item: item, selected: (item.entryId ?? item.id) == selectedId, onTap: () => onEntryTap(item)),
        },
      ));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children);
  }
}

class _MarkerRow extends StatelessWidget {
  const _MarkerRow({required this.icon, required this.label, this.date});
  final Widget icon;
  final String label;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return SparkCard(
      tone: SparkCardTone.accent,
      padding: const EdgeInsets.symmetric(horizontal: Space.m, vertical: Space.s),
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(width: Space.s),
          Expanded(child: Text(label, style: Theme.of(context).textTheme.titleSmall)),
          if (date != null) Text(context.fmt.monthDay(date!), style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _EntryTile extends ConsumerWidget {
  const _EntryTile({required this.item, required this.onTap, this.selected = false});

  final JournalTimelineItem item;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final clock = ref.watch(userClockProvider);
    final url = item.thumbnailUrl ?? item.mediaUrl;
    final processing = item.status == JournalEntryStatus.processing || item.status == JournalEntryStatus.pendingUpload;
    final failed = item.status == JournalEntryStatus.failed;

    return SparkCard(
      onTap: onTap,
      tone: selected ? SparkCardTone.tinted : SparkCardTone.normal,
      padding: const EdgeInsets.all(Space.s),
      semanticLabel: l10n.journalImageSemantics(item.caption ?? ''),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: Radii.smallAll,
            child: SizedBox(
              width: 88,
              height: 88,
              child: url == null
                  ? ColoredBox(
                      color: c.surfaceAlt,
                      child: Icon(
                        item.mediaType == JournalMediaType.pdf ? Icons.picture_as_pdf_rounded : Icons.photo_rounded,
                        color: c.iconMuted,
                      ),
                    )
                  : SignedImage(url: url, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: Space.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (item.caption != null && item.caption!.isNotEmpty)
                  Text(item.caption!, style: text.bodyLarge, maxLines: 3, overflow: TextOverflow.ellipsis),
                if (item.date != null) Text(context.fmt.shortDate(clock.toWallClock(item.date!)), style: text.bodySmall),
                if (item.taskTitle != null) Text(l10n.journalLinkedTask(item.taskTitle!), style: text.bodySmall),
                if (item.milestoneTitle != null)
                  Row(
                    children: <Widget>[
                      const MilestoneMarker(status: MilestoneStatus.inProgress, size: 12),
                      const SizedBox(width: Space.xs),
                      Expanded(child: Text(item.milestoneTitle!, style: text.bodySmall)),
                    ],
                  ),
                if (item.mediaType == JournalMediaType.pdf) SparkChip(label: l10n.journalPdf, icon: Icons.picture_as_pdf_rounded),
                if (processing) SparkChip(label: l10n.journalProcessing, icon: Icons.hourglass_top_rounded),
                if (failed) SparkChip(label: l10n.journalFailed, icon: Icons.error_outline_rounded, tone: SparkChipTone.danger),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
