import 'package:material_ui/material_ui.dart';

import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_logo.dart';
import '../theme/spark_colors.dart';
import '../theme/tokens.dart';

/// The SPARK top bar, identical on every tab and pushed screen:
/// logo (upper left, taps to Dashboard) · back arrow (pushed screens) ·
/// title (cross-fades) · settings gear (upper right).
class SparkTopBar extends StatelessWidget implements PreferredSizeWidget {
  const SparkTopBar({
    super.key,
    required this.title,
    required this.onLogoTap,
    required this.onSettingsTap,
    this.onBack,
    this.trailing,
    this.backgroundColor,
    this.settingsKey,
  });

  static const double height = 64;

  final String title;
  final VoidCallback onLogoTap;
  final VoidCallback? onSettingsTap;

  /// Shown just to the right of the logo when non-null.
  final VoidCallback? onBack;

  /// Extra action shown before the gear (e.g. history on the companion).
  final Widget? trailing;
  final Color? backgroundColor;

  /// Key on the gear (used by the coach-mark tutorial).
  final GlobalKey? settingsKey;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Material(
      color: backgroundColor ?? c.background,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Space.xs),
            child: Row(
              children: <Widget>[
                Semantics(
                  button: true,
                  label: l10n.logoSemantics,
                  excludeSemantics: true,
                  child: InkResponse(
                    key: const Key('topbar-logo'),
                    onTap: onLogoTap,
                    radius: 28,
                    child: const SizedBox.square(
                      dimension: Space.minTouch,
                      child: Center(child: SparkLogoFace(size: 36)),
                    ),
                  ),
                ),
                if (onBack != null)
                  IconButton(
                    key: const Key('topbar-back'),
                    onPressed: onBack,
                    tooltip: l10n.backTooltip,
                    icon: Icon(Icons.arrow_back_rounded, color: c.topBarForeground),
                  ),
                const SizedBox(width: Space.xs),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: reduceMotion ? Duration.zero : Motion.medium,
                    layoutBuilder: (current, previous) => Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[...previous, ?current],
                    ),
                    child: Semantics(
                      key: ValueKey<String>(title),
                      header: true,
                      child: Text(
                        title,
                        key: const Key('topbar-title'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: text.titleLarge?.copyWith(color: c.topBarForeground, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                ?trailing,
                if (onSettingsTap != null)
                  KeyedSubtree(
                    key: settingsKey,
                    child: IconButton(
                      key: const Key('topbar-settings'),
                      onPressed: onSettingsTap,
                      tooltip: l10n.settingsTooltip,
                      icon: Icon(Icons.settings_rounded, color: c.topBarForeground),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
