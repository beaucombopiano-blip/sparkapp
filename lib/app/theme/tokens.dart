import 'package:material_ui/material_ui.dart';

/// 8-point spacing grid.
abstract final class Space {
  static const double xxs = 2;
  static const double xs = 4;
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Screen gutters.
  static const double gutter = 16;

  /// Minimum touch target (48×48 dp).
  static const double minTouch = 48;
}

abstract final class Radii {
  static const double card = 20;
  static const double sheet = 24;
  static const double button = 16;
  static const double chip = 12;
  static const double small = 8;
  static const double pill = 999;

  static const BorderRadius cardAll = BorderRadius.all(Radius.circular(card));
  static const BorderRadius buttonAll = BorderRadius.all(Radius.circular(button));
  static const BorderRadius chipAll = BorderRadius.all(Radius.circular(chip));
  static const BorderRadius smallAll = BorderRadius.all(Radius.circular(small));
}

abstract final class Motion {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);
  static const Curve curve = Curves.easeOutCubic;
}

/// Material 3 window-size classes.
enum WindowSize { compact, medium, expanded }

abstract final class Breakpoints {
  static const double medium = 600;
  static const double expanded = 840;

  static WindowSize of(BuildContext context) => forWidth(MediaQuery.sizeOf(context).width);

  static WindowSize forWidth(double width) {
    if (width >= expanded) return WindowSize.expanded;
    if (width >= medium) return WindowSize.medium;
    return WindowSize.compact;
  }
}

/// Max content width for readable single-column screens on tablets/web.
const double kMaxContentWidth = 720;
