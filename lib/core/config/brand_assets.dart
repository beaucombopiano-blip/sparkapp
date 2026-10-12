/// Brand asset switches.
///
/// The designed SPARK logo and celebration animations have not been delivered
/// yet, so the app draws a placeholder logo face with `CustomPainter`
/// (`SparkLogoFace`) and a palette-coloured confetti painter.
///
/// To use the real files, drop them into `assets/brand/` (and
/// `assets/celebrations/`) and set the paths below. That is the only change
/// needed: every logo and celebration in the app reads these constants.
abstract final class BrandAssets {
  /// Lottie JSON for the animated logo (blink, bounce, smile). Example:
  /// `'assets/brand/spark_logo_animated.json'`.
  static const String? animatedLogo = null;

  /// Static logo (SVG exported to PNG at 3x). Example:
  /// `'assets/brand/spark_logo.png'`.
  static const String? staticLogo = null;

  /// Optional Lottie JSON played behind the celebration overlay.
  static const String? celebrationAnimation = null;
}
