import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/gamification.dart';
import '../../data/providers/session_providers.dart';
import '../profile/profile_screen.dart' show BadgeIcon;
import 'gamification_providers.dart';

/// Badges grid: earned in colour (with date), locked in outline with
/// how-to-earn text, plus total points.
class BadgesScreen extends ConsumerWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final catalog = ref.watch(badgeCatalogProvider);
    final earned = {for (final b in ref.watch(earnedBadgesProvider).value ?? const <EarnedBadge>[]) b.id: b};
    final points = ref.watch(totalPointsProvider).value;
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= Breakpoints.expanded ? 4 : (width >= Breakpoints.medium ? 3 : 2);

    return AsyncValueView<List<BadgeDef>>(
      value: catalog,
      onRetry: () => ref.invalidate(badgeCatalogProvider),
      data: (list) {
        if (list.isEmpty) return EmptyState(title: l10n.badgesEmpty, icon: Icons.emoji_events_outlined);
        final sorted = <BadgeDef>[
          ...list.where((b) => earned.containsKey(b.id)),
          ...list.where((b) => !earned.containsKey(b.id)),
        ];
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
          children: <Widget>[
            if (points != null)
              Align(
                alignment: Alignment.centerLeft,
                child: SparkChip(label: l10n.profilePoints(points), icon: Icons.bolt_rounded, tone: SparkChipTone.accent),
              ),
            const SizedBox(height: Space.m),
            LayoutBuilder(
              builder: (context, box) {
                final itemWidth = (box.maxWidth - Space.s * (columns - 1)) / columns;
                return Wrap(
                  spacing: Space.s,
                  runSpacing: Space.s,
                  children: <Widget>[
                    for (final b in sorted)
                      SizedBox(
                        width: itemWidth,
                        child: SparkCard(
                          tone: earned.containsKey(b.id) ? SparkCardTone.tinted : SparkCardTone.outlined,
                          child: Column(
                            children: <Widget>[
                              BadgeIcon(badge: b, earned: earned.containsKey(b.id)),
                              const SizedBox(height: Space.s),
                              Text(b.name, style: text.titleSmall, textAlign: TextAlign.center),
                              const SizedBox(height: Space.xs),
                              if (earned[b.id]?.earnedAt != null)
                                Text(
                                  l10n.badgesEarned(fmt.shortDate(clock.toWallClock(earned[b.id]!.earnedAt!))),
                                  style: text.bodySmall,
                                  textAlign: TextAlign.center,
                                )
                              else ...<Widget>[
                                Text(l10n.badgesLocked, style: text.labelSmall),
                                Text(
                                  l10n.badgesHowTo(b.howToEarn ?? b.description),
                                  style: text.bodySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
