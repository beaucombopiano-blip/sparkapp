import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';

enum SparkChipTone { neutral, accent, success, warning, danger, primary }

/// Compact label chip. Interactive when [onTap] is set (48dp target).
class SparkChip extends StatelessWidget {
  const SparkChip({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.selected = false,
    this.tone = SparkChipTone.neutral,
    this.semanticLabel,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool selected;
  final SparkChipTone tone;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final (Color bg, Color fg) = selected
        ? (c.primary, c.onPrimary)
        : switch (tone) {
            SparkChipTone.neutral => (c.surfaceAlt, c.textPrimary),
            SparkChipTone.accent => (c.accent.withValues(alpha: 0.25), c.textPrimary),
            SparkChipTone.success => (c.success.withValues(alpha: 0.15), c.success),
            SparkChipTone.warning => (c.warning.withValues(alpha: 0.15), c.warning),
            SparkChipTone.danger => (c.danger.withValues(alpha: 0.12), c.danger),
            SparkChipTone.primary => (c.primary.withValues(alpha: 0.12), c.textPrimary),
          };
    final text = Theme.of(context).textTheme.labelMedium?.copyWith(color: fg);
    final chip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: Radii.chipAll),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[Icon(icon, size: 16, color: fg), const SizedBox(width: 6)],
          Flexible(child: Text(label, style: text, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
    if (onTap == null) {
      return Semantics(label: semanticLabel, child: chip);
    }
    return Semantics(
      button: true,
      selected: selected,
      label: semanticLabel,
      child: InkWell(
        onTap: onTap,
        borderRadius: Radii.chipAll,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: Space.minTouch),
          child: Center(widthFactor: 1, child: chip),
        ),
      ),
    );
  }
}
