import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';

/// Progress bar with a completed segment and a lightly highlighted
/// "projected" segment (what's done by Sunday if the plan is followed).
class SparkProgressBar extends StatelessWidget {
  const SparkProgressBar({
    super.key,
    required this.done,
    this.projected,
    this.showLabel = true,
    this.height = 12,
    this.label,
  });

  /// 0–1.
  final double done;

  /// 0–1, at least [done]. Null hides the projected segment.
  final double? projected;
  final bool showLabel;
  final double height;

  /// Overrides the default label.
  final String? label;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final fmt = context.fmt;
    final d = done.clamp(0.0, 1.0);
    final p = projected?.clamp(d, 1.0);
    final donePct = fmt.percent(d);
    final projectedPct = p == null ? null : fmt.percent(p);
    final semantics = projectedPct == null
        ? l10n.progressSemanticsSimple(donePct)
        : l10n.progressSemantics(donePct, projectedPct);
    final text = label ??
        (projectedPct == null ? l10n.progressLabelSimple(donePct) : l10n.progressLabel(donePct, projectedPct));

    return Semantics(
      label: semantics,
      value: donePct,
      excludeSemantics: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(height),
            child: SizedBox(
              height: height,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth;
                  return Stack(
                    children: <Widget>[
                      Positioned.fill(child: ColoredBox(color: c.progressTrack)),
                      if (p != null)
                        AnimatedPositioned(
                          duration: Motion.slow,
                          curve: Motion.curve,
                          left: 0,
                          top: 0,
                          bottom: 0,
                          width: w * p,
                          child: _ProjectedSegment(color: c.progressProjected),
                        ),
                      AnimatedPositioned(
                        duration: Motion.slow,
                        curve: Motion.curve,
                        left: 0,
                        top: 0,
                        bottom: 0,
                        width: w * d,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: c.progressDone,
                            borderRadius: BorderRadius.circular(height),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          if (showLabel) ...<Widget>[
            const SizedBox(height: Space.s),
            Row(
              children: <Widget>[
                _Legend(color: c.progressDone),
                const SizedBox(width: Space.xs),
                if (p != null) ...<Widget>[
                  _Legend(color: c.progressProjected, striped: true),
                  const SizedBox(width: Space.s),
                ],
                Expanded(
                  child: Text(text, style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Diagonal stripes so the projected segment is distinguishable without color.
class _ProjectedSegment extends StatelessWidget {
  const _ProjectedSegment({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _StripePainter(color));
  }
}

class _StripePainter extends CustomPainter {
  _StripePainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = color.withValues(alpha: 0.45));
    final stripe = Paint()
      ..color = color.withValues(alpha: 0.85)
      ..strokeWidth = 2;
    for (double x = -size.height; x < size.width; x += 7) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), stripe);
    }
  }

  @override
  bool shouldRepaint(_StripePainter old) => old.color != color;
}

class _Legend extends StatelessWidget {
  const _Legend({required this.color, this.striped = false});
  final Color color;
  final bool striped;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: SizedBox.square(
          dimension: 10,
          child: striped ? CustomPaint(painter: _StripePainter(color)) : ColoredBox(color: color),
        ),
      ),
    );
  }
}
