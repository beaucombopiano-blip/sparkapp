import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../data/models/project.dart';
import '../utils/l10n.dart';

/// Diamond marker for a milestone: filled with a check when done, half
/// filled when in progress, outlined when upcoming.
class MilestoneMarker extends StatelessWidget {
  const MilestoneMarker({super.key, required this.status, this.size = 20});

  final MilestoneStatus status;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final label = switch (status) {
      MilestoneStatus.done => l10n.milestoneDone,
      MilestoneStatus.inProgress => l10n.milestoneInProgress,
      _ => l10n.milestoneUpcoming,
    };
    return Semantics(
      label: label,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _DiamondPainter(
            status: status,
            color: status == MilestoneStatus.done ? c.accent : c.secondary,
            check: c.onAccent,
          ),
        ),
      ),
    );
  }
}

class _DiamondPainter extends CustomPainter {
  _DiamondPainter({required this.status, required this.color, required this.check});
  final MilestoneStatus status;
  final Color color;
  final Color check;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w / 2, 1)
      ..lineTo(w - 1, h / 2)
      ..lineTo(w / 2, h - 1)
      ..lineTo(1, h / 2)
      ..close();
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;
    switch (status) {
      case MilestoneStatus.done:
        canvas.drawPath(path, Paint()..color = color);
        final tick = Path()
          ..moveTo(w * 0.32, h * 0.52)
          ..lineTo(w * 0.45, h * 0.64)
          ..lineTo(w * 0.68, h * 0.38);
        canvas.drawPath(
          tick,
          Paint()
            ..color = check
            ..style = PaintingStyle.stroke
            ..strokeWidth = w * 0.1
            ..strokeCap = StrokeCap.round,
        );
      case MilestoneStatus.inProgress:
        canvas.save();
        canvas.clipRect(Rect.fromLTWH(0, h / 2, w, h / 2));
        canvas.drawPath(path, Paint()..color = color);
        canvas.restore();
        canvas.drawPath(path, stroke);
      case MilestoneStatus.upcoming:
      case MilestoneStatus.unknown:
        canvas.drawPath(path, stroke);
    }
  }

  @override
  bool shouldRepaint(_DiamondPainter old) => old.status != status || old.color != color;
}
