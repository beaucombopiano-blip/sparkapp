import 'package:material_ui/material_ui.dart';

import 'spark_palette.dart';

/// Semantic colour roles. Custom palettes (Premium) assign colours to these
/// roles, so every screen updates consistently.
enum SparkRole {
  background,
  surface,
  surfaceAlt,
  card,
  primary,
  onPrimary,
  secondary,
  accent,
  onAccent,
  textPrimary,
  textSecondary,
  iconMuted,
  border,
  link,
  success,
  warning,
  danger,
  onDanger,
  progressDone,
  progressProjected,
  progressTrack,
  navSelected,
  navIndicator,
  navUnselected,
  topBarForeground,
  shadow,
}

/// Roles a user can customise in Settings → Custom colours. The rest are
/// derived (e.g. borders) or fixed for accessibility (status colours).
const List<SparkRole> customizableRoles = <SparkRole>[
  SparkRole.background,
  SparkRole.surface,
  SparkRole.card,
  SparkRole.primary,
  SparkRole.onPrimary,
  SparkRole.accent,
  SparkRole.textPrimary,
  SparkRole.textSecondary,
  SparkRole.progressDone,
  SparkRole.progressProjected,
];

/// Text/background pairs that must meet WCAG AA (4.5:1). Used by the custom
/// palette editor before saving (the backend validates again).
const List<(SparkRole, SparkRole)> contrastPairs = <(SparkRole, SparkRole)>[
  (SparkRole.textPrimary, SparkRole.background),
  (SparkRole.textPrimary, SparkRole.surface),
  (SparkRole.textPrimary, SparkRole.card),
  (SparkRole.textSecondary, SparkRole.background),
  (SparkRole.textSecondary, SparkRole.card),
  (SparkRole.onPrimary, SparkRole.primary),
];

/// The SPARK theme extension: semantic colours derived from a [SparkPalette].
@immutable
class SparkColors extends ThemeExtension<SparkColors> {
  const SparkColors._(this.brightness, this._roles, this.celebration);

  /// Light-mode roles from a palette.
  factory SparkColors.light(SparkPalette p) {
    final roles = <SparkRole, Color>{
      SparkRole.background: p.blueVeryLight,
      SparkRole.surface: SparkStatusColors.white,
      SparkRole.surfaceAlt: p.blueLight,
      SparkRole.card: SparkStatusColors.white,
      SparkRole.primary: p.blueDark,
      SparkRole.onPrimary: SparkStatusColors.white,
      SparkRole.secondary: p.blueMedium,
      SparkRole.accent: p.teal,
      SparkRole.onAccent: p.navy,
      SparkRole.textPrimary: p.navy,
      SparkRole.textSecondary: p.gray,
      SparkRole.iconMuted: p.blueMuted,
      SparkRole.border: p.blueMuted.withValues(alpha: 0.35),
      SparkRole.link: p.blueMedium,
      SparkRole.success: SparkStatusColors.successLight,
      SparkRole.warning: SparkStatusColors.warningLight,
      SparkRole.danger: SparkStatusColors.dangerLight,
      SparkRole.onDanger: SparkStatusColors.white,
      SparkRole.progressDone: p.blueDark,
      SparkRole.progressProjected: p.teal,
      SparkRole.progressTrack: p.blueLight,
      SparkRole.navSelected: p.blueDark,
      SparkRole.navIndicator: p.blueLight,
      SparkRole.navUnselected: p.blueMuted,
      SparkRole.topBarForeground: p.navy,
      SparkRole.shadow: p.navy.withValues(alpha: 0.10),
    };
    return SparkColors._(
      Brightness.light,
      roles,
      <Color>[p.teal, p.blueDark, p.blueMedium, p.blueLight, p.navy, p.blueMuted],
    );
  }

  /// Dark-mode roles: navy is the background base, blues are lightened for
  /// contrast.
  factory SparkColors.dark(SparkPalette p) {
    const white = SparkStatusColors.white;
    const black = SparkStatusColors.black;
    final background = Color.lerp(p.navy, black, 0.35)!;
    final roles = <SparkRole, Color>{
      SparkRole.background: background,
      SparkRole.surface: p.navy,
      SparkRole.surfaceAlt: Color.lerp(p.navy, p.blueDark, 0.55)!,
      SparkRole.card: Color.lerp(p.navy, p.blueDark, 0.25)!,
      SparkRole.primary: Color.lerp(p.blueMedium, white, 0.40)!,
      SparkRole.onPrimary: background,
      SparkRole.secondary: p.blueLight,
      SparkRole.accent: p.teal,
      SparkRole.onAccent: background,
      SparkRole.textPrimary: Color.lerp(p.blueVeryLight, white, 0.55)!,
      SparkRole.textSecondary: Color.lerp(p.blueLight, white, 0.20)!,
      SparkRole.iconMuted: Color.lerp(p.blueMuted, white, 0.30)!,
      SparkRole.border: p.blueMuted.withValues(alpha: 0.45),
      SparkRole.link: p.blueLight,
      SparkRole.success: SparkStatusColors.successDark,
      SparkRole.warning: SparkStatusColors.warningDark,
      SparkRole.danger: SparkStatusColors.dangerDark,
      SparkRole.onDanger: background,
      SparkRole.progressDone: Color.lerp(p.blueMedium, white, 0.45)!,
      SparkRole.progressProjected: p.teal,
      SparkRole.progressTrack: Color.lerp(p.navy, p.blueMuted, 0.35)!,
      SparkRole.navSelected: p.blueLight,
      SparkRole.navIndicator: Color.lerp(p.navy, p.blueDark, 0.85)!,
      SparkRole.navUnselected: Color.lerp(p.blueMuted, white, 0.20)!,
      SparkRole.topBarForeground: Color.lerp(p.blueVeryLight, white, 0.55)!,
      SparkRole.shadow: black.withValues(alpha: 0.30),
    };
    return SparkColors._(
      Brightness.dark,
      roles,
      <Color>[p.teal, p.blueLight, Color.lerp(p.blueMedium, white, 0.4)!, p.blueVeryLight, p.blueMuted],
    );
  }

  final Brightness brightness;
  final Map<SparkRole, Color> _roles;

  /// Confetti / celebration colours.
  final List<Color> celebration;

  Color role(SparkRole role) => _roles[role]!;
  Map<SparkRole, Color> get roles => Map.unmodifiable(_roles);

  bool get isDark => brightness == Brightness.dark;

  Color get background => role(SparkRole.background);
  Color get surface => role(SparkRole.surface);
  Color get surfaceAlt => role(SparkRole.surfaceAlt);
  Color get card => role(SparkRole.card);
  Color get primary => role(SparkRole.primary);
  Color get onPrimary => role(SparkRole.onPrimary);
  Color get secondary => role(SparkRole.secondary);
  Color get accent => role(SparkRole.accent);
  Color get onAccent => role(SparkRole.onAccent);
  Color get textPrimary => role(SparkRole.textPrimary);
  Color get textSecondary => role(SparkRole.textSecondary);
  Color get iconMuted => role(SparkRole.iconMuted);
  Color get border => role(SparkRole.border);
  Color get link => role(SparkRole.link);
  Color get success => role(SparkRole.success);
  Color get warning => role(SparkRole.warning);
  Color get danger => role(SparkRole.danger);
  Color get onDanger => role(SparkRole.onDanger);
  Color get progressDone => role(SparkRole.progressDone);
  Color get progressProjected => role(SparkRole.progressProjected);
  Color get progressTrack => role(SparkRole.progressTrack);
  Color get navSelected => role(SparkRole.navSelected);
  Color get navIndicator => role(SparkRole.navIndicator);
  Color get navUnselected => role(SparkRole.navUnselected);
  Color get topBarForeground => role(SparkRole.topBarForeground);
  Color get shadow => role(SparkRole.shadow);

  /// Applies user overrides (custom palette) on top of the derived roles.
  SparkColors withOverrides(Map<SparkRole, Color> overrides) {
    if (overrides.isEmpty) return this;
    final merged = Map<SparkRole, Color>.of(_roles)..addAll(overrides);
    // Keep navigation consistent with a customised primary/text colour.
    final primary = overrides[SparkRole.primary];
    if (primary != null && !overrides.containsKey(SparkRole.navSelected) && !isDark) {
      merged[SparkRole.navSelected] = primary;
    }
    final text = overrides[SparkRole.textPrimary];
    if (text != null && !overrides.containsKey(SparkRole.topBarForeground)) {
      merged[SparkRole.topBarForeground] = text;
    }
    return SparkColors._(brightness, merged, celebration);
  }

  @override
  SparkColors copyWith({Map<SparkRole, Color>? roles, List<Color>? celebration}) {
    return SparkColors._(
      brightness,
      roles == null ? _roles : (Map<SparkRole, Color>.of(_roles)..addAll(roles)),
      celebration ?? this.celebration,
    );
  }

  @override
  SparkColors lerp(covariant ThemeExtension<SparkColors>? other, double t) {
    if (other is! SparkColors) return this;
    final lerped = <SparkRole, Color>{
      for (final r in SparkRole.values) r: Color.lerp(role(r), other.role(r), t)!,
    };
    return SparkColors._(
      t < 0.5 ? brightness : other.brightness,
      lerped,
      t < 0.5 ? celebration : other.celebration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! SparkColors || other.brightness != brightness) return false;
    for (final r in SparkRole.values) {
      if (other.role(r) != role(r)) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(brightness, Object.hashAll(SparkRole.values.map(role)));
}

extension SparkColorsContext on BuildContext {
  /// The active SPARK colours.
  SparkColors get spark => Theme.of(this).extension<SparkColors>()!;
}
