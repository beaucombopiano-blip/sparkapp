import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/catalog.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../features/billing/entitlements.dart';
import 'spark_colors.dart';
import 'spark_palette.dart';
import 'spark_theme.dart';

part 'theme_providers.g.dart';

/// Light and dark themes for the user's palette, plus the seasonal
/// decoration key (if a seasonal theme is active).
@immutable
class SparkThemeBundle {
  const SparkThemeBundle({required this.light, required this.dark, required this.mode, this.decoration});

  final ThemeData light;
  final ThemeData dark;
  final ThemeMode mode;
  final String? decoration;
}

ThemeMode themeModeFor(AppearanceMode mode) => switch (mode) {
      AppearanceMode.light => ThemeMode.light,
      AppearanceMode.dark => ThemeMode.dark,
      AppearanceMode.system => ThemeMode.system,
    };

/// Converts `{role: '#hex'}` into role overrides, ignoring unknown roles.
Map<SparkRole, Color> parseRoleOverrides(Map<String, String>? raw) {
  if (raw == null) return const <SparkRole, Color>{};
  final result = <SparkRole, Color>{};
  for (final entry in raw.entries) {
    final role = SparkRole.values.where((r) => r.name == entry.key).firstOrNull;
    final color = parseHexColor(entry.value);
    if (role != null && color != null) result[role] = color;
  }
  return result;
}

/// Builds the SparkColors for a theme definition and optional custom palette.
(SparkColors light, SparkColors dark) resolveSparkColors({
  ThemeDef? theme,
  Map<String, Map<String, String>> customPalette = const <String, Map<String, String>>{},
  bool allowCustom = false,
}) {
  final lightPalette = SparkPalette.fromMap(theme?.palette['light']);
  final darkPalette = SparkPalette.fromMap(theme?.palette['dark'], fallback: lightPalette);
  var light = SparkColors.light(lightPalette);
  var dark = SparkColors.dark(darkPalette);
  if (allowCustom) {
    light = light.withOverrides(parseRoleOverrides(customPalette['light']));
    dark = dark.withOverrides(parseRoleOverrides(customPalette['dark']));
  }
  return (light, dark);
}

@Riverpod(keepAlive: true)
SparkThemeBundle sparkTheme(Ref ref) {
  final profile = ref.watch(userProfileProvider).value;
  final themes = ref.watch(themesProvider).value ?? const <ThemeDef>[];
  final canCustomize = ref.watch(hasFeatureProvider(Features.colorCustomization));
  final canPremiumThemes = ref.watch(hasFeatureProvider(Features.premiumThemes));
  final canChooseMode = ref.watch(hasFeatureProvider(Features.appearanceMode));

  ThemeDef? active;
  final themeId = profile?.themeId;
  if (themeId != null) {
    active = themes.where((t) => t.id == themeId).firstOrNull;
    if (active != null && active.isPremium && !canPremiumThemes) active = null;
  }

  final (light, dark) = resolveSparkColors(
    theme: active,
    customPalette: profile?.customPalette ?? const <String, Map<String, String>>{},
    allowCustom: canCustomize,
  );

  return SparkThemeBundle(
    light: buildSparkTheme(light),
    dark: buildSparkTheme(dark),
    mode: canChooseMode ? themeModeFor(profile?.appearanceMode ?? AppearanceMode.system) : ThemeMode.system,
    decoration: active?.decorationKey,
  );
}
