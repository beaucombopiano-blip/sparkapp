import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';

enum SparkButtonVariant { primary, secondary, text, destructive }

/// The one button used across SPARK. While [loading] it shows a spinner,
/// keeps its size and ignores taps.
class SparkButton extends StatelessWidget {
  const SparkButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = SparkButtonVariant.primary,
    this.icon,
    this.loading = false,
    this.expand = false,
    this.semanticLabel,
  });

  const SparkButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.loading = false,
    this.expand = false,
    this.semanticLabel,
  }) : variant = SparkButtonVariant.secondary;

  const SparkButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.loading = false,
    this.expand = false,
    this.semanticLabel,
  }) : variant = SparkButtonVariant.text;

  const SparkButton.destructive({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.loading = false,
    this.expand = false,
    this.semanticLabel,
  }) : variant = SparkButtonVariant.destructive;

  final String label;
  final VoidCallback? onPressed;
  final SparkButtonVariant variant;
  final IconData? icon;
  final bool loading;
  final bool expand;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.spark;
    final onTap = loading ? null : onPressed;
    final spinnerColor = switch (variant) {
      SparkButtonVariant.primary => colors.onPrimary,
      SparkButtonVariant.destructive => colors.onDanger,
      _ => colors.primary,
    };
    final Widget rawContent = loading
        ? Semantics(
            label: context.l10n.loadingSemantics,
            child: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2.4, color: spinnerColor),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) ...<Widget>[Icon(icon, size: 20), const SizedBox(width: Space.s)],
              Flexible(child: Text(label, textAlign: TextAlign.center)),
            ],
          );
    final Widget content = semanticLabel == null
        ? rawContent
        : Semantics(label: semanticLabel, excludeSemantics: true, child: rawContent);

    final Widget button = switch (variant) {
      SparkButtonVariant.primary => FilledButton(onPressed: onTap, child: content),
      SparkButtonVariant.secondary => OutlinedButton(onPressed: onTap, child: content),
      SparkButtonVariant.text => TextButton(onPressed: onTap, child: content),
      SparkButtonVariant.destructive => FilledButton(
          onPressed: onTap,
          style: FilledButton.styleFrom(backgroundColor: colors.danger, foregroundColor: colors.onDanger),
          child: content,
        ),
    };

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
