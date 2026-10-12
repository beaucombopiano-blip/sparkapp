import 'dart:math' as math;

import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../data/models/catalog.dart';
import '../config/brand_assets.dart';
import '../utils/l10n.dart';
import 'character_avatar.dart';
import 'spark_button.dart';
import 'spark_logo.dart';

/// Full-screen celebration: confetti in palette colours, the character (or
/// logo) smiling, an optional badge flying in, and one line of text.
class CelebrationOverlay extends StatelessWidget {
  const CelebrationOverlay({
    super.key,
    required this.title,
    this.message,
    this.badgeName,
    this.character,
    required this.onContinue,
    this.continueLabel,
  });

  final String title;
  final String? message;
  final String? badgeName;
  final CharacterDef? character;
  final VoidCallback onContinue;
  final String? continueLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    Widget animateIn(Widget w, {int delayMs = 0}) => reduceMotion
        ? w
        : w
            .animate(delay: Duration(milliseconds: delayMs))
            .fadeIn(duration: Motion.slow)
            .slideY(begin: 0.3, end: 0, curve: Curves.easeOutBack, duration: 600.ms);

    return Material(
      color: c.background.withValues(alpha: 0.96),
      child: Stack(
        children: <Widget>[
          if (!reduceMotion) Positioned.fill(child: ConfettiBurst(colors: c.celebration)),
          if (!reduceMotion && BrandAssets.celebrationAnimation != null)
            Positioned.fill(child: IgnorePointer(child: Lottie.asset(BrandAssets.celebrationAnimation!, repeat: false))),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Space.l),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const AnimatedSparkLogo(size: 96),
                          if (character != null) ...<Widget>[
                            const SizedBox(width: Space.m),
                            CharacterAvatar(character: character, size: 72),
                          ],
                        ],
                      ),
                      if (badgeName != null) ...<Widget>[
                        const SizedBox(height: Space.l),
                        animateIn(_BadgeMedal(name: badgeName!), delayMs: 250),
                      ],
                      const SizedBox(height: Space.l),
                      Semantics(
                        liveRegion: true,
                        header: true,
                        child: animateIn(
                          Text(title, style: text.headlineMedium, textAlign: TextAlign.center),
                        ),
                      ),
                      if (message != null) ...<Widget>[
                        const SizedBox(height: Space.s),
                        animateIn(Text(message!, style: text.bodyLarge, textAlign: TextAlign.center), delayMs: 120),
                      ],
                      const SizedBox(height: Space.xl),
                      SparkButton(
                        label: continueLabel ?? context.l10n.celebrationContinue,
                        onPressed: onContinue,
                        expand: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeMedal extends StatelessWidget {
  const _BadgeMedal({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return Column(
      children: <Widget>[
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: <Color>[c.accent, c.primary]),
            boxShadow: <BoxShadow>[BoxShadow(color: c.shadow, blurRadius: 18)],
          ),
          child: Icon(Icons.emoji_events_rounded, size: 44, color: c.onPrimary),
        ),
        const SizedBox(height: Space.s),
        Text(name, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
      ],
    );
  }
}

/// One-shot confetti burst drawn with a particle painter so it always uses
/// the active palette.
class ConfettiBurst extends StatefulWidget {
  const ConfettiBurst({super.key, required this.colors, this.particleCount = 90});

  final List<Color> colors;
  final int particleCount;

  @override
  State<ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<ConfettiBurst> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 2600))..forward();
  late final List<_Particle> _particles = _generate();

  List<_Particle> _generate() {
    final rnd = math.Random(7);
    return List<_Particle>.generate(widget.particleCount, (i) {
      final angle = -math.pi / 2 + (rnd.nextDouble() - 0.5) * math.pi * 0.9;
      final speed = 0.6 + rnd.nextDouble() * 0.7;
      return _Particle(
        color: widget.colors[i % widget.colors.length],
        vx: math.cos(angle) * speed,
        vy: math.sin(angle) * speed,
        spin: (rnd.nextDouble() - 0.5) * 12,
        size: 6 + rnd.nextDouble() * 6,
        circle: rnd.nextBool(),
        originX: 0.3 + rnd.nextDouble() * 0.4,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ExcludeSemantics(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => CustomPaint(painter: _ConfettiPainter(_particles, _controller.value)),
        ),
      ),
    );
  }
}

class _Particle {
  _Particle({
    required this.color,
    required this.vx,
    required this.vy,
    required this.spin,
    required this.size,
    required this.circle,
    required this.originX,
  });

  final Color color;
  final double vx;
  final double vy;
  final double spin;
  final double size;
  final bool circle;
  final double originX;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter(this.particles, this.t);
  final List<_Particle> particles;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    const gravity = 1.6;
    final opacity = (1 - math.max(0, t - 0.75) / 0.25).clamp(0.0, 1.0);
    for (final p in particles) {
      final x = size.width * (p.originX + p.vx * t * 0.6);
      final y = size.height * (0.55 + p.vy * t * 0.9 + gravity * t * t * 0.5);
      final paint = Paint()..color = p.color.withValues(alpha: opacity);
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.spin * t);
      if (p.circle) {
        canvas.drawCircle(Offset.zero, p.size / 2, paint);
      } else {
        canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.5), paint);
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.t != t;
}
