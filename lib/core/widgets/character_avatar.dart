import 'package:material_ui/material_ui.dart';

import '../../app/theme/contrast.dart';
import '../../app/theme/spark_colors.dart';
import '../../data/models/catalog.dart';
import 'spark_logo.dart';

/// Asset keys known to be bundled (filled from the asset manifest at startup).
/// Characters without a bundled image get a painted placeholder.
class BundledAssets {
  BundledAssets._();

  static Set<String> _assets = <String>{};

  static void register(Iterable<String> assets) => _assets = assets.toSet();

  static String? characterImage(String? assetKey) {
    if (assetKey == null) return null;
    for (final ext in <String>['png', 'webp']) {
      final path = 'assets/characters/$assetKey.$ext';
      if (_assets.contains(path)) return path;
    }
    return null;
  }
}

/// The user's companion character. Uses `assets/characters/<assetKey>.png`
/// when bundled, otherwise a friendly painted placeholder tinted per character.
class CharacterAvatar extends StatelessWidget {
  const CharacterAvatar({super.key, this.character, this.size = 40, this.semanticLabel});

  final CharacterDef? character;
  final double size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final image = BundledAssets.characterImage(character?.assetKey ?? character?.id);
    final Widget child;
    if (image != null) {
      child = ClipOval(child: Image.asset(image, width: size, height: size, fit: BoxFit.cover));
    } else if (character == null) {
      child = SparkLogoFace(size: size);
    } else {
      final palette = c.celebration;
      final index = character!.id.codeUnits.fold<int>(0, (a, b) => a + b) % palette.length;
      final tint = palette[index];
      child = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.lerp(tint, c.surface, 0.55),
          border: Border.all(color: tint, width: size * 0.05),
        ),
        alignment: Alignment.center,
        child: CustomPaint(
          size: Size.square(size * 0.82),
          painter: SparkFacePainter(
            fill: tint,
            fillEnd: c.secondary,
            face: _faceColorFor(tint, c),
            cheek: c.surfaceAlt,
            state: const FaceState(),
          ),
        ),
      );
    }
    return Semantics(
      label: semanticLabel ?? character?.name,
      image: true,
      excludeSemantics: true,
      child: SizedBox.square(dimension: size, child: child),
    );
  }
}

/// The theme colour that reads best on [tint] (the face must stay visible on
/// both light and dark character tints).
Color _faceColorFor(Color tint, SparkColors c) {
  final candidates = <Color>[c.onAccent, c.onPrimary, c.textPrimary, c.surface];
  return candidates.reduce((best, next) => contrastRatio(next, tint) > contrastRatio(best, tint) ? next : best);
}
