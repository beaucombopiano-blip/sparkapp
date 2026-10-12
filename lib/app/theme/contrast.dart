import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import 'spark_colors.dart';

/// WCAG 2.x contrast ratio between two opaque colours (1.0 – 21.0).
double contrastRatio(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final lighter = math.max(la, lb);
  final darker = math.min(la, lb);
  return (lighter + 0.05) / (darker + 0.05);
}

/// WCAG AA for normal text.
const double kWcagAaText = 4.5;

bool passesAa(Color foreground, Color background) =>
    contrastRatio(foreground, background) >= kWcagAaText;

/// A failing text/background pair in a palette.
@immutable
class ContrastIssue {
  const ContrastIssue(this.foreground, this.background, this.ratio);
  final SparkRole foreground;
  final SparkRole background;
  final double ratio;
}

/// Checks every pair in [contrastPairs] and returns the failures.
List<ContrastIssue> findContrastIssues(SparkColors colors) {
  final issues = <ContrastIssue>[];
  for (final (fg, bg) in contrastPairs) {
    final ratio = contrastRatio(colors.role(fg), colors.role(bg));
    if (ratio < kWcagAaText) issues.add(ContrastIssue(fg, bg, ratio));
  }
  return issues;
}

/// The closest colour to [color] (same hue) that passes AA against
/// [background], found by darkening or lightening in small steps.
Color closestPassingColor(Color color, Color background) {
  if (passesAa(color, background)) return color;
  final darken = background.computeLuminance() > 0.4;
  final target = darken ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  for (var t = 0.05; t <= 1.0; t += 0.05) {
    final candidate = Color.lerp(color, target, t)!;
    if (passesAa(candidate, background)) return candidate;
  }
  return target;
}
