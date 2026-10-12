import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';
part 'catalog.g.dart';

/// `characters/{key}`.
@freezed
abstract class CharacterDef with _$CharacterDef {
  const factory CharacterDef({
    required String id,
    @Default('') String name,

    /// Short personality line.
    @Default('') String description,

    /// Example notification in the character's voice (onboarding preview).
    String? sampleNotification,
    String? assetKey,
    @Default(false) bool isPremium,
    String? unlockRule,

    /// Accent colour token name (e.g. "teal") or hex for the placeholder avatar.
    String? color,
    @Default(0) int order,
  }) = _CharacterDef;

  factory CharacterDef.fromJson(Map<String, dynamic> json) => _$CharacterDefFromJson(json);
}

enum ThemeKind { defaultTheme, preset, seasonal, earned, unknown }

enum ThemeAvailability { free, premium, earned, unknown }

/// `themes/{key}`.
@freezed
abstract class ThemeDef with _$ThemeDef {
  const ThemeDef._();

  const factory ThemeDef({
    required String id,
    @Default('') String name,
    @Default('preset') String kind,

    /// `{light: {token: hex}, dark: {token: hex}}`.
    @Default(<String, Map<String, String>>{}) Map<String, Map<String, String>> palette,
    @Default('free') String availability,

    /// "MM-DD" season window for seasonal themes.
    String? seasonStart,
    String? seasonEnd,

    /// fall | winter | spring | summer — selects the corner decoration.
    String? decoration,
    @Default(0) int order,
  }) = _ThemeDef;

  factory ThemeDef.fromJson(Map<String, dynamic> json) => _$ThemeDefFromJson(json);

  bool get isSeasonal => kind == 'seasonal';
  bool get isPremium => availability == 'premium';
  bool get isEarned => availability == 'earned';

  /// The seasonal decoration key, defaulting to the theme key for seasonal themes.
  String? get decorationKey => decoration ?? (isSeasonal ? id : null);
}
