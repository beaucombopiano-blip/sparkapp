import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import 'spark_colors.dart';

/// Small corner illustration for seasonal themes (fall, winter, spring,
/// summer). Purely decorative: it never covers content or sits behind text,
/// and is hidden when the OS asks for reduced motion.
class SeasonalDecoration extends StatelessWidget {
  const SeasonalDecoration({super.key, required this.season, this.size = 44});

  final String? season;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (season == null || MediaQuery.disableAnimationsOf(context)) return const SizedBox.shrink();
    final c = context.spark;
    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(painter: _SeasonPainter(season!, c.accent, c.secondary)),
      ),
    );
  }
}

class _SeasonPainter extends CustomPainter {
  _SeasonPainter(this.season, this.primary, this.secondary);
  final String season;
  final Color primary;
  final Color secondary;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2 * 0.8;
    final fill = Paint()..color = primary;
    final stroke = Paint()
      ..color = secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round;
    switch (season) {
      case 'fall':
        final leaf = Path()
          ..moveTo(c.dx, c.dy - r)
          ..quadraticBezierTo(c.dx + r, c.dy - r * 0.2, c.dx, c.dy + r * 0.8)
          ..quadraticBezierTo(c.dx - r, c.dy - r * 0.2, c.dx, c.dy - r);
        canvas.drawPath(leaf, fill);
        canvas.drawLine(Offset(c.dx, c.dy - r * 0.6), Offset(c.dx, c.dy + r), stroke);
      case 'winter':
        for (var i = 0; i < 6; i++) {
          final a = i * math.pi / 3;
          final end = c + Offset(math.cos(a), math.sin(a)) * r;
          canvas.drawLine(c, end, stroke..color = primary);
          final mid = c + Offset(math.cos(a), math.sin(a)) * r * 0.6;
          for (final d in <double>[-0.5, 0.5]) {
            canvas.drawLine(mid, mid + Offset(math.cos(a + d), math.sin(a + d)) * r * 0.3, stroke);
          }
        }
      case 'spring':
        for (var i = 0; i < 5; i++) {
          final a = i * 2 * math.pi / 5;
          canvas.drawCircle(c + Offset(math.cos(a), math.sin(a)) * r * 0.5, r * 0.38, fill);
        }
        canvas.drawCircle(c, r * 0.3, Paint()..color = secondary);
      case 'summer':
        canvas.drawCircle(c, r * 0.5, fill);
        for (var i = 0; i < 8; i++) {
          final a = i * math.pi / 4;
          canvas.drawLine(
            c + Offset(math.cos(a), math.sin(a)) * r * 0.7,
            c + Offset(math.cos(a), math.sin(a)) * r,
            stroke..color = primary,
          );
        }
    }
  }

  @override
  bool shouldRepaint(_SeasonPainter old) => old.season != season || old.primary != primary;
}
