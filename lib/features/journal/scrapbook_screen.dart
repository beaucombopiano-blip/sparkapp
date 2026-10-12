import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/secure_screen.dart';
import '../../core/widgets/milestone_marker.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/journal.dart';
import '../../data/models/project.dart';
import 'journal_providers.dart';

/// Palette token → active colour (scrapbook accents follow the theme).
Color tokenColor(SparkColors c, String? token) => switch (token) {
      'navy' => c.textPrimary,
      'blueDark' => c.primary,
      'blueMedium' => c.secondary,
      'blueMuted' => c.iconMuted,
      'gray' => c.textSecondary,
      'blueLight' => c.surfaceAlt,
      'blueVeryLight' => c.background,
      _ => c.accent,
    };

/// Project / year-in-review scrapbook: narrative plus a collage rendered from
/// the backend's layout JSON. Rendered in-app only (no export); Android
/// blocks screenshots here with FLAG_SECURE.
class ScrapbookScreen extends ConsumerWidget {
  const ScrapbookScreen({super.key, required this.scrapbookId});

  final String scrapbookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(scrapbookViewProvider(scrapbookId));
    return SecureScreenScope(
      child: AsyncValueView<ScrapbookView>(
        value: view,
        onRetry: () => ref.invalidate(scrapbookViewProvider(scrapbookId)),
        data: (v) => _ScrapbookBody(
          view: v,
          onExpired: () {
            if (ref.read(signedUrlRefreshProvider.notifier).tryAcquire()) ref.invalidate(scrapbookViewProvider(scrapbookId));
          },
        ),
      ),
    );
  }
}

class _ScrapbookBody extends StatelessWidget {
  const _ScrapbookBody({required this.view, required this.onExpired});

  final ScrapbookView view;
  final VoidCallback onExpired;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final s = view.scrapbook;
    final pages = s.layout?.pages ?? const <CollagePage>[];
    final h = s.highlights;
    final title = s.kind == 'yearInReview' && s.year != null ? l10n.scrapbookYearTitle(s.year!) : s.title;

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        Semantics(header: true, child: Text(title, style: text.headlineMedium)),
        const SizedBox(height: Space.m),
        if (s.narrative != null && s.narrative!.isNotEmpty)
          SparkCard(
            tone: SparkCardTone.tinted,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.scrapbookNarrative, style: text.titleMedium),
                const SizedBox(height: Space.s),
                Text(s.narrative!, style: text.bodyLarge?.copyWith(height: 1.6)),
              ],
            ),
          ),
        if (h != null) ...<Widget>[
          const SizedBox(height: Space.m),
          Text(l10n.scrapbookHighlights, style: text.titleMedium),
          const SizedBox(height: Space.s),
          Wrap(
            spacing: Space.s,
            runSpacing: Space.xs,
            children: <Widget>[
              for (final m in h.milestones) SparkChip(label: m, icon: Icons.diamond_rounded, tone: SparkChipTone.accent),
              for (final b in h.badges) SparkChip(label: b, icon: Icons.emoji_events_rounded),
              if (h.tasksCompleted != null)
                SparkChip(label: l10n.focusSummaryTasks(h.tasksCompleted!), icon: Icons.task_alt_rounded),
              if (h.minutesWorked != null) SparkChip(label: context.fmt.duration(h.minutesWorked!), icon: Icons.schedule_rounded),
            ],
          ),
        ],
        const SizedBox(height: Space.l),
        for (var i = 0; i < pages.length; i++) ...<Widget>[
          Semantics(
            label: l10n.scrapbookPage(i + 1, pages.length),
            child: _CollagePageView(page: pages[i], mediaUrls: view.mediaUrls, onExpired: onExpired),
          ),
          const SizedBox(height: Space.l),
        ],
        Text(l10n.scrapbookNoScreenshotNote, style: text.bodySmall, textAlign: TextAlign.center),
      ],
    );
  }
}

class _CollagePageView extends StatelessWidget {
  const _CollagePageView({required this.page, required this.mediaUrls, required this.onExpired});

  final CollagePage page;
  final Map<String, String> mediaUrls;
  final VoidCallback onExpired;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final items = List<CollageItem>.of(page.items)..sort((a, b) => a.z.compareTo(b.z));
    return AspectRatio(
      aspectRatio: page.aspectRatio <= 0 ? 0.75 : page.aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: Radii.cardAll,
          boxShadow: c.isDark ? null : <BoxShadow>[BoxShadow(color: c.shadow, blurRadius: 18)],
          border: c.isDark ? Border.all(color: c.border) : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: LayoutBuilder(
          builder: (context, box) => Stack(
            children: <Widget>[
              for (final item in items)
                Positioned(
                  left: item.x * box.maxWidth,
                  top: item.y * box.maxHeight,
                  width: math.max(1, item.w * box.maxWidth),
                  height: math.max(1, item.h * box.maxHeight),
                  child: Transform.rotate(
                    angle: item.rotation * math.pi / 180,
                    child: _CollageItemView(item: item, mediaUrls: mediaUrls, onExpired: onExpired, text: text, c: c),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CollageItemView extends StatelessWidget {
  const _CollageItemView({
    required this.item,
    required this.mediaUrls,
    required this.onExpired,
    required this.text,
    required this.c,
  });

  final CollageItem item;
  final Map<String, String> mediaUrls;
  final VoidCallback onExpired;
  final TextTheme text;
  final SparkColors c;

  @override
  Widget build(BuildContext context) {
    switch (item.type) {
      case CollageItemType.photo:
        final url = item.mediaPath == null ? null : mediaUrls[item.mediaPath];
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: c.card,
            boxShadow: <BoxShadow>[BoxShadow(color: c.shadow, blurRadius: 8, offset: const Offset(0, 3))],
          ),
          child: url == null
              ? ColoredBox(color: c.surfaceAlt)
              : Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => onExpired());
                    return ColoredBox(color: c.surfaceAlt);
                  },
                ),
        );
      case CollageItemType.tape:
        return DecoratedBox(
          decoration: BoxDecoration(
            color: tokenColor(c, item.colorToken).withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      case CollageItemType.caption:
      case CollageItemType.title:
        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.topLeft,
          child: Text(
            item.text ?? '',
            style: (item.type == CollageItemType.title ? text.headlineSmall : text.bodyMedium)
                ?.copyWith(color: tokenColor(c, item.colorToken ?? 'navy')),
          ),
        );
      case CollageItemType.badge:
        return FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.emoji_events_rounded, color: c.accent),
              const SizedBox(width: 4),
              Text(item.text ?? '', style: text.labelLarge),
            ],
          ),
        );
      case CollageItemType.milestone:
        return FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const MilestoneMarker(status: MilestoneStatus.done, size: 16),
              const SizedBox(width: 4),
              Text(item.text ?? '', style: text.labelLarge),
            ],
          ),
        );
      case CollageItemType.unknown:
        return const SizedBox.shrink();
    }
  }
}
