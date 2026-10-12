import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';

enum SparkCardTone { normal, tinted, accent, outlined }

/// Rounded card (16–20 px radius) with a soft shadow in light mode and a
/// subtle border in dark mode.
class SparkCard extends StatelessWidget {
  const SparkCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(Space.m),
    this.tone = SparkCardTone.normal,
    this.semanticLabel,
    this.margin,
    this.dashed = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final SparkCardTone tone;
  final String? semanticLabel;
  final EdgeInsetsGeometry? margin;

  /// Dashed border (used to visually separate AI suggestions).
  final bool dashed;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final background = switch (tone) {
      SparkCardTone.normal => c.card,
      SparkCardTone.tinted => c.surfaceAlt,
      SparkCardTone.accent => c.accent.withValues(alpha: c.isDark ? 0.22 : 0.18),
      SparkCardTone.outlined => c.background,
    };
    final border = c.isDark || tone == SparkCardTone.outlined ? Border.all(color: c.border) : null;
    final shadows = c.isDark || tone == SparkCardTone.outlined
        ? const <BoxShadow>[]
        : <BoxShadow>[BoxShadow(color: c.shadow, blurRadius: 16, offset: const Offset(0, 4))];

    Widget content = Padding(padding: padding, child: child);
    if (onTap != null) {
      content = InkWell(onTap: onTap, borderRadius: Radii.cardAll, child: content);
    }
    Widget card = Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: background,
          borderRadius: Radii.cardAll,
          border: dashed ? null : border,
          boxShadow: dashed ? const <BoxShadow>[] : shadows,
        ),
        child: content,
      ),
    );
    if (dashed) {
      card = CustomPaint(foregroundPainter: _DashedBorderPainter(color: c.iconMuted), child: card);
    }
    if (semanticLabel != null) {
      card = Semantics(label: semanticLabel, button: onTap != null, container: true, child: card);
    }
    if (margin != null) card = Padding(padding: margin!, child: card);
    return card;
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(1),
      const Radius.circular(Radii.card),
    );
    final path = Path()..addRRect(rrect);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + 7;
        canvas.drawPath(metric.extractPath(distance, next.clamp(0, metric.length)), paint);
        distance = next + 5;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) => old.color != color;
}
