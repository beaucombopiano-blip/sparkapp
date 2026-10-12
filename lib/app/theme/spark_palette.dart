import 'package:material_ui/material_ui.dart';

/// The eight brand tokens. Every colour in the app is derived from a palette
/// through [SparkColors] semantic roles; widgets never use hex values.
@immutable
class SparkPalette {
  const SparkPalette({
    required this.navy,
    required this.blueDark,
    required this.blueMedium,
    required this.blueMuted,
    required this.gray,
    required this.teal,
    required this.blueLight,
    required this.blueVeryLight,
  });

  /// SPARK default palette.
  static const SparkPalette spark = SparkPalette(
    navy: Color(0xFF172D59),
    blueDark: Color(0xFF274489),
    blueMedium: Color(0xFF376D9F),
    blueMuted: Color(0xFF5786B2),
    gray: Color(0xFF5B5B5B),
    teal: Color(0xFF65B4C1),
    blueLight: Color(0xFFC2E1F8),
    blueVeryLight: Color(0xFFDAEFFF),
  );

  /// Top bar text/icons, primary navigation, headings in light mode.
  final Color navy;

  /// Primary buttons, selected tab, progress fill.
  final Color blueDark;

  /// Secondary actions, links, calendar session markers.
  final Color blueMedium;

  /// Inactive icons, borders, secondary progress.
  final Color blueMuted;

  /// Body text (light mode), captions.
  final Color gray;

  /// Highlights, celebrations, streak chip, projected progress segment.
  final Color teal;

  /// Cards, chips, selected calendar day background.
  final Color blueLight;

  /// Screen backgrounds (light mode).
  final Color blueVeryLight;

  static const List<String> tokenNames = <String>[
    'navy',
    'blueDark',
    'blueMedium',
    'blueMuted',
    'gray',
    'teal',
    'blueLight',
    'blueVeryLight',
  ];

  Map<String, Color> toMap() => <String, Color>{
        'navy': navy,
        'blueDark': blueDark,
        'blueMedium': blueMedium,
        'blueMuted': blueMuted,
        'gray': gray,
        'teal': teal,
        'blueLight': blueLight,
        'blueVeryLight': blueVeryLight,
      };

  /// Builds a palette from a `{token: '#RRGGBB'}` map (theme documents in
  /// Firestore). Missing or malformed tokens fall back to [fallback].
  factory SparkPalette.fromMap(Map<String, Object?>? map, {SparkPalette fallback = spark}) {
    if (map == null) return fallback;
    Color pick(String key, Color fb) => parseHexColor(map[key]) ?? fb;
    return SparkPalette(
      navy: pick('navy', fallback.navy),
      blueDark: pick('blueDark', fallback.blueDark),
      blueMedium: pick('blueMedium', fallback.blueMedium),
      blueMuted: pick('blueMuted', fallback.blueMuted),
      gray: pick('gray', fallback.gray),
      teal: pick('teal', fallback.teal),
      blueLight: pick('blueLight', fallback.blueLight),
      blueVeryLight: pick('blueVeryLight', fallback.blueVeryLight),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is SparkPalette &&
      other.navy == navy &&
      other.blueDark == blueDark &&
      other.blueMedium == blueMedium &&
      other.blueMuted == blueMuted &&
      other.gray == gray &&
      other.teal == teal &&
      other.blueLight == blueLight &&
      other.blueVeryLight == blueVeryLight;

  @override
  int get hashCode =>
      Object.hash(navy, blueDark, blueMedium, blueMuted, gray, teal, blueLight, blueVeryLight);
}

/// Fixed semantic status colours (not brand tokens) used for success,
/// warnings and errors. Kept here so widgets still never hardcode hex.
abstract final class SparkStatusColors {
  static const Color successLight = Color(0xFF1F7A55);
  static const Color warningLight = Color(0xFF8A5300);
  static const Color dangerLight = Color(0xFFB3261E);
  static const Color successDark = Color(0xFF7FD8A8);
  static const Color warningDark = Color(0xFFF4C66A);
  static const Color dangerDark = Color(0xFFFF9C92);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

/// Parses `#RGB`, `#RRGGBB` or `#AARRGGBB` (leading `#` optional).
Color? parseHexColor(Object? value) {
  if (value is! String) return null;
  var hex = value.trim().replaceFirst('#', '');
  if (hex.length == 3) {
    hex = hex.split('').map((c) => '$c$c').join();
  }
  if (hex.length == 6) hex = 'FF$hex';
  if (hex.length != 8) return null;
  final parsed = int.tryParse(hex, radix: 16);
  return parsed == null ? null : Color(parsed);
}

/// Formats a colour as `#RRGGBB`.
String toHex(Color color) {
  final argb = color.toARGB32();
  return '#${(argb & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}
