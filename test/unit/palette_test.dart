import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:spark/app/theme/contrast.dart';
import 'package:spark/app/theme/spark_colors.dart';
import 'package:spark/app/theme/spark_palette.dart';
import 'package:spark/app/theme/theme_providers.dart';
import 'package:spark/data/models/catalog.dart';

void main() {
  group('hex parsing', () {
    test('accepts #RGB, #RRGGBB and #AARRGGBB', () {
      expect(parseHexColor('#172D59'), const Color(0xFF172D59));
      expect(parseHexColor('172d59'), const Color(0xFF172D59));
      expect(parseHexColor('#fff'), const Color(0xFFFFFFFF));
      expect(parseHexColor('#80172D59'), const Color(0x80172D59));
      expect(parseHexColor('#12'), isNull);
      expect(parseHexColor('#GGGGGG'), isNull);
      expect(parseHexColor(42), isNull);
      expect(toHex(const Color(0xFF65B4C1)), '#65B4C1');
    });

    test('palette maps fall back per token', () {
      final p = SparkPalette.fromMap(<String, Object?>{'teal': '#C9773B', 'navy': 'nope'});
      expect(p.teal, const Color(0xFFC9773B));
      expect(p.navy, SparkPalette.spark.navy);
    });
  });

  group('contrast', () {
    test('ratio matches WCAG reference values', () {
      expect(contrastRatio(const Color(0xFF000000), const Color(0xFFFFFFFF)), closeTo(21, 0.01));
      expect(contrastRatio(const Color(0xFF777777), const Color(0xFFFFFFFF)), closeTo(4.48, 0.02));
    });

    test('default palette passes AA for every text pair in light and dark', () {
      expect(findContrastIssues(SparkColors.light(SparkPalette.spark)), isEmpty);
      expect(findContrastIssues(SparkColors.dark(SparkPalette.spark)), isEmpty);
    });

    test('suggests the closest passing colour', () {
      const bg = Color(0xFFDAEFFF);
      const weak = Color(0xFF65B4C1);
      expect(passesAa(weak, bg), isFalse);
      final fixed = closestPassingColor(weak, bg);
      expect(passesAa(fixed, bg), isTrue);
    });
  });

  group('resolveSparkColors', () {
    const fall = ThemeDef(
      id: 'fall',
      name: 'Fall',
      palette: <String, Map<String, String>>{
        'light': <String, String>{'teal': '#C9773B'},
      },
    );

    test('applies the theme palette', () {
      final (light, _) = resolveSparkColors(theme: fall);
      expect(light.accent, const Color(0xFFC9773B));
    });

    test('custom role overrides apply only when the feature is unlocked', () {
      const custom = <String, Map<String, String>>{
        'light': <String, String>{'primary': '#8E3B8A', 'notARole': '#000000'},
      };
      final (locked, _) = resolveSparkColors(customPalette: custom);
      final (unlocked, _) = resolveSparkColors(customPalette: custom, allowCustom: true);
      expect(locked.primary, isNot(const Color(0xFF8E3B8A)));
      expect(unlocked.primary, const Color(0xFF8E3B8A));
    });

    test('unknown roles are ignored', () {
      expect(parseRoleOverrides(<String, String>{'bogus': '#000000'}), isEmpty);
    });
  });
}
