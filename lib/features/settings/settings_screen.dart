import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/shell/page_scaffold.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../billing/entitlements.dart';

/// Settings (gear, upper right): grouped list of every preference.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final customColors = ref.watch(hasFeatureProvider(Features.colorCustomization));

    Widget tile(IconData icon, String title, String route, {String? subtitle, Widget? trailing}) => ListTile(
          leading: Icon(icon, color: c.secondary),
          title: Text(title),
          subtitle: subtitle == null ? null : Text(subtitle),
          trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
          onTap: () => context.push(route),
        );

    return SparkPageScaffold(
      title: l10n.titleSettings,
      showSettings: false,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
            children: <Widget>[
              SparkCard(
                padding: const EdgeInsets.symmetric(vertical: Space.xs),
                child: Column(
                  children: <Widget>[
                    tile(Icons.palette_rounded, l10n.settingsAppearance, Routes.settingsAppearance, subtitle: l10n.settingsAppearanceBody),
                    tile(
                      Icons.color_lens_rounded,
                      l10n.settingsCustomColors,
                      Routes.settingsColors,
                      subtitle: l10n.settingsCustomColorsBody,
                      trailing: customColors
                          ? null
                          : SparkChip(label: l10n.commonPremium, icon: Icons.star_rounded, tone: SparkChipTone.accent),
                    ),
                    tile(Icons.face_rounded, l10n.settingsCharacter, Routes.settingsCharacter),
                  ],
                ),
              ),
              const SizedBox(height: Space.m),
              SparkCard(
                padding: const EdgeInsets.symmetric(vertical: Space.xs),
                child: Column(
                  children: <Widget>[
                    tile(Icons.notifications_rounded, l10n.settingsNotifications, Routes.settingsNotifications,
                        subtitle: l10n.settingsNotificationsBody),
                    tile(Icons.event_rounded, l10n.settingsSchedule, Routes.settingsSchedule, subtitle: l10n.settingsScheduleBody),
                    tile(Icons.shield_rounded, l10n.settingsPrivacy, Routes.settingsPrivacy, subtitle: l10n.settingsPrivacyBody),
                  ],
                ),
              ),
              const SizedBox(height: Space.m),
              SparkCard(
                padding: const EdgeInsets.symmetric(vertical: Space.xs),
                child: Column(
                  children: <Widget>[
                    tile(Icons.account_circle_rounded, l10n.settingsAccount, Routes.settingsAccount),
                    tile(Icons.help_rounded, l10n.settingsHelp, Routes.settingsHelp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
