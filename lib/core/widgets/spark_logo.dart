import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../config/brand_assets.dart';

/// Expression drawn on the placeholder logo face.
@immutable
class FaceState {
  const FaceState({this.eyeOpen = 1, this.smile = 1, this.lookUp = 0});

  /// 0 = closed, 1 = open.
  final double eyeOpen;

  /// 0 = neutral, 1 = big smile.
  final double smile;

  /// -1..1 vertical gaze (used by the "thinking" loader).
  final double lookUp;
}

/// The SPARK logo character: a rounded spark with a friendly face. No arms,
/// no legs, never speaks. Drawn with [CustomPainter] until the designed file
/// is delivered (see [BrandAssets]).
class SparkLogoFace extends StatelessWidget {
  const SparkLogoFace({super.key, this.size = 40, this.face = const FaceState(), this.semanticLabel});

  final double size;
  final FaceState face;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.spark;
    const staticLogo = BrandAssets.staticLogo;
    final Widget child = staticLogo != null
        ? Image.asset(staticLogo, width: size, height: size)
        : CustomPaint(
            size: Size.square(size),
            painter: SparkFacePainter(
              fill: colors.accent,
              fillEnd: colors.secondary,
              face: colors.onAccent,
              cheek: colors.surfaceAlt,
              state: face,
            ),
          );
    return Semantics(
      label: semanticLabel,
      image: semanticLabel != null,
      excludeSemantics: true,
      child: SizedBox.square(dimension: size, child: child),
    );
  }
}

class SparkFacePainter extends CustomPainter {
  SparkFacePainter({
    required this.fill,
    required this.fillEnd,
    required this.face,
    required this.cheek,
    required this.state,
  });

  final Color fill;
  final Color fillEnd;
  final Color face;
  final Color cheek;
  final FaceState state;

  /// A puffy four-point spark: concave sides with rounded tips.
  static Path sparkPath(Size size) {
    final w = size.width;
    final h = size.height;
    final cx = w / 2;
    final cy = h / 2;
    final r = math.min(w, h) / 2 * 0.94;
    final k = r * 0.36; // how far the sides bow in
    final tip = r * 0.10; // tip rounding
    final path = Path()..moveTo(cx - tip, cy - r + tip * 0.6);
    // top → right
    path.quadraticBezierTo(cx, cy - r - tip * 0.2, cx + tip, cy - r + tip * 0.6);
    path.cubicTo(cx + k * 0.55, cy - k * 1.05, cx + k * 1.05, cy - k * 0.55, cx + r - tip * 0.6, cy - tip);
    path.quadraticBezierTo(cx + r + tip * 0.2, cy, cx + r - tip * 0.6, cy + tip);
    // right → bottom
    path.cubicTo(cx + k * 1.05, cy + k * 0.55, cx + k * 0.55, cy + k * 1.05, cx + tip, cy + r - tip * 0.6);
    path.quadraticBezierTo(cx, cy + r + tip * 0.2, cx - tip, cy + r - tip * 0.6);
    // bottom → left
    path.cubicTo(cx - k * 0.55, cy + k * 1.05, cx - k * 1.05, cy + k * 0.55, cx - r + tip * 0.6, cy + tip);
    path.quadraticBezierTo(cx - r - tip * 0.2, cy, cx - r + tip * 0.6, cy - tip);
    // left → top
    path.cubicTo(cx - k * 1.05, cy - k * 0.55, cx - k * 0.55, cy - k * 1.05, cx - tip, cy - r + tip * 0.6);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final body = sparkPath(size);
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[fill, Color.lerp(fill, fillEnd, 0.55)!],
      ).createShader(rect)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawPath(body, paint);
    // soften the outline
    canvas.drawPath(
      body,
      Paint()
        ..color = fill
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.03
        ..strokeJoin = StrokeJoin.round,
    );

    final w = size.width;
    final cx = w / 2;
    final cy = size.height / 2 + state.lookUp * -w * 0.02;
    final facePaint = Paint()
      ..color = face
      ..isAntiAlias = true;

    // Eyes (blink by squashing vertically).
    final eyeW = w * 0.075;
    final eyeH = w * 0.11 * state.eyeOpen.clamp(0.08, 1.0);
    for (final dx in <double>[-0.13, 0.13]) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx + dx * w, cy - w * 0.06), width: eyeW, height: eyeH),
        facePaint,
      );
    }

    // Cheeks.
    final cheekPaint = Paint()..color = cheek.withValues(alpha: 0.55);
    for (final dx in <double>[-0.2, 0.2]) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx + dx * w, cy + w * 0.05), width: w * 0.08, height: w * 0.045),
        cheekPaint,
      );
    }

    // Smile.
    final smileWidth = w * (0.16 + 0.06 * state.smile);
    final depth = w * (0.025 + 0.06 * state.smile);
    final top = cy + w * 0.06;
    final smile = Path()
      ..moveTo(cx - smileWidth / 2, top)
      ..quadraticBezierTo(cx, top + depth * 2, cx + smileWidth / 2, top);
    canvas.drawPath(
      smile,
      Paint()
        ..color = face
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * 0.035
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(SparkFacePainter old) =>
      old.fill != fill ||
      old.face != face ||
      old.state.eyeOpen != state.eyeOpen ||
      old.state.smile != state.smile ||
      old.state.lookUp != state.lookUp;
}

/// The animated logo used by the daily greeting and loaders: blinks, gives a
/// small bounce and smiles. Shows a static smiling logo when the OS asks for
/// reduced motion. Uses the delivered Lottie file when [BrandAssets.animatedLogo]
/// is set.
class AnimatedSparkLogo extends StatefulWidget {
  const AnimatedSparkLogo({
    super.key,
    this.size = 120,
    this.loop = false,
    this.thinking = false,
    this.semanticLabel,
  });

  final double size;

  /// Loop forever (loading screens) instead of playing once (greeting).
  final bool loop;

  /// Eyes glance upward as if thinking.
  final bool thinking;
  final String? semanticLabel;

  @override
  State<AnimatedSparkLogo> createState() => _AnimatedSparkLogoState();
}

class _AnimatedSparkLogoState extends State<AnimatedSparkLogo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  bool _reduceMotion = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (_reduceMotion) {
      _controller.stop();
      _controller.value = 1;
    } else if (!_controller.isAnimating) {
      if (widget.loop) {
        _controller.repeat();
      } else {
        _controller.forward(from: 0);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  FaceState _faceAt(double t) {
    // Blinks at ~28% and ~72%.
    double eye = 1;
    for (final center in <double>[0.28, 0.72]) {
      final d = (t - center).abs();
      if (d < 0.04) eye = math.min(eye, d / 0.04);
    }
    final smile = widget.loop ? 0.6 + 0.4 * math.sin(t * math.pi * 2).abs() : Curves.easeOut.transform((t / 0.5).clamp(0, 1));
    final lookUp = widget.thinking ? math.sin(t * math.pi * 2) : 0.0;
    return FaceState(eyeOpen: eye, smile: smile, lookUp: lookUp);
  }

  double _bounceAt(double t) {
    if (t > 0.5 && !widget.loop) return 0;
    final phase = widget.loop ? t : t / 0.5;
    return -math.sin(phase * math.pi * (widget.loop ? 2 : 1)).abs() * widget.size * 0.08;
  }

  @override
  Widget build(BuildContext context) {
    const lottie = BrandAssets.animatedLogo;
    if (lottie != null && !_reduceMotion) {
      return Semantics(
        label: widget.semanticLabel,
        image: true,
        child: Lottie.asset(lottie, width: widget.size, height: widget.size, repeat: widget.loop),
      );
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        return Transform.translate(
          offset: Offset(0, _reduceMotion ? 0 : _bounceAt(t)),
          child: SparkLogoFace(
            size: widget.size,
            face: _reduceMotion ? const FaceState() : _faceAt(t),
            semanticLabel: widget.semanticLabel,
          ),
        );
      },
    );
  }
}

/// Small haptic helpers (no-ops where unsupported).
abstract final class Haptics {
  static Future<void> success() => HapticFeedback.mediumImpact();
  static Future<void> celebrate() => HapticFeedback.heavyImpact();
  static Future<void> tap() => HapticFeedback.selectionClick();
}
