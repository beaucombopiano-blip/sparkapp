import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_progress_bar.dart';
import '../../core/widgets/states.dart';
import '../../data/models/journal.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../gamification/gamification_providers.dart';
import '../journal/journal_providers.dart';

/// Past (completed, paused, set-aside) projects. Their work stays viewable.
class PastProjectsScreen extends ConsumerWidget {
  const PastProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final activeId = ref.watch(activeProjectIdProvider);
    final scrapbooks = ref.watch(scrapbooksProvider).value ?? const <Scrapbook>[];

    return AsyncValueView<List<Project>>(
      value: ref.watch(allProjectsProvider),
      onRetry: () => ref.invalidate(allProjectsProvider),
      data: (projects) {
        final past = projects.where((p) => p.id != activeId).toList();
        if (past.isEmpty) return EmptyState(title: l10n.pastProjectsEmpty, icon: Icons.inventory_2_outlined);
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
          children: <Widget>[
            for (final p in past)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.s),
                child: SparkCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text(p.title, style: text.titleMedium)),
                          SparkChip(
                            label: switch (p.status) {
                              ProjectStatus.completed => l10n.pastProjectStatusCompleted,
                              ProjectStatus.paused => l10n.pastProjectStatusPaused,
                              ProjectStatus.abandoned => l10n.pastProjectStatusAbandoned,
                              _ => l10n.pastProjectStatusActive,
                            },
                            tone: p.status == ProjectStatus.completed ? SparkChipTone.success : SparkChipTone.neutral,
                          ),
                        ],
                      ),
                      if (p.completedAt != null)
                        Text(l10n.pastProjectCompletedOn(fmt.longDate(clock.toWallClock(p.completedAt!))), style: text.bodySmall),
                      const SizedBox(height: Space.s),
                      SparkProgressBar(done: p.fractionComplete),
                      for (final s in scrapbooks.where((s) => s.projectId == p.id && s.status == 'ready'))
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: () => context.go(Routes.scrapbook(s.id)),
                            icon: const Icon(Icons.auto_stories_rounded),
                            label: Text(l10n.pastProjectOpenScrapbook),
                          ),
                        ),
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
