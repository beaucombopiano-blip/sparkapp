import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/theme_providers.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_progress_bar.dart';
import '../../core/widgets/task_tile.dart';
import '../../data/models/project.dart';
import '../../data/models/user.dart';

/// Light / Dark / Match my phone with live preview cards.
class AppearancePicker extends ConsumerWidget {
  const AppearancePicker({super.key, required this.selected, required this.onSelected});

  final AppearanceMode selected;
  final ValueChanged<AppearanceMode> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final themes = ref.watch(sparkThemeProvider);
    final platformDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final options = <(AppearanceMode, String, IconData, ThemeData)>[
      (AppearanceMode.light, l10n.appearanceLight, Icons.light_mode_rounded, themes.light),
      (AppearanceMode.dark, l10n.appearanceDark, Icons.dark_mode_rounded, themes.dark),
      (AppearanceMode.system, l10n.appearanceSystem, Icons.smartphone_rounded, platformDark ? themes.dark : themes.light),
    ];
    final wide = MediaQuery.sizeOf(context).width >= Breakpoints.medium;

    final cards = <Widget>[
      for (final o in options)
        _PreviewCard(
          key: Key('appearance-${o.$1.name}'),
          label: o.$2,
          icon: o.$3,
          theme: o.$4,
          selected: selected == o.$1,
          onTap: () => onSelected(o.$1),
        ),
    ];
    if (wide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (final card in cards) Expanded(child: Padding(padding: const EdgeInsets.all(Space.xs), child: card)),
        ],
      );
    }
    return Column(
      children: <Widget>[
        for (final card in cards) Padding(padding: const EdgeInsets.only(bottom: Space.s), child: card),
      ],
    );
  }
}

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({
    super.key,
    required this.label,
    required this.icon,
    required this.theme,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final ThemeData theme;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final outer = context.spark;
    final l10n = context.l10n;
    return Semantics(
      selected: selected,
      button: true,
      label: label,
      child: SparkCard(
        onTap: onTap,
        tone: selected ? SparkCardTone.tinted : SparkCardTone.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: outer.primary),
                const SizedBox(width: Space.s),
                Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
                Icon(
                  selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                  color: selected ? outer.primary : outer.iconMuted,
                ),
              ],
            ),
            const SizedBox(height: Space.s),
            // Live preview rendered with the real theme.
            ExcludeSemantics(
              child: IgnorePointer(
                child: Theme(
                  data: theme,
                  child: Builder(
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(Space.s),
                      decoration: BoxDecoration(color: context.spark.background, borderRadius: Radii.buttonAll),
                      child: SparkCard(
                        padding: const EdgeInsets.all(Space.s),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SparkProgressBar(done: 0.42, projected: 0.55, showLabel: false, height: 8),
                            TaskTile(
                              dense: true,
                              task: Task(id: 'preview', title: l10n.appearancePreviewTask, estimatedMinutes: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
