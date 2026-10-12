import 'dart:async';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/routes.dart';
import '../../app/shell/page_scaffold.dart';
import '../../app/theme/contrast.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/spark_palette.dart';
import '../../app/theme/spark_theme.dart';
import '../../app/theme/theme_providers.dart';
import '../../app/theme/tokens.dart';
import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/system_settings.dart';
import '../../core/widgets/confirm_sheet.dart';
import '../../core/widgets/locked_feature_card.dart';
import '../../core/widgets/resource_card.dart' show openExternalUrl;
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_progress_bar.dart';
import '../../core/widgets/states.dart';
import '../../core/widgets/task_tile.dart';
import '../../data/models/catalog.dart';
import '../../data/models/project.dart';
import '../../data/models/schedule.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/integrations_repository.dart';
import '../../data/repositories/schedule_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../billing/entitlements.dart';
import '../characters/character_picker.dart';
import '../gamification/gamification_providers.dart';
import '../notifications/notification_prefs_editor.dart';
import '../notifications/notification_service.dart';
import '../onboarding/steps/availability_editor.dart';
import '../onboarding/tutorial_overlay.dart';
import '../project/adjust_plan_screen.dart' show PlanAction;
import '../project/project_providers.dart';
import '../project/proposal_sheet.dart';
import 'appearance_picker.dart';

// ---------------------------------------------------------------- Appearance

class AppearanceSettingsScreen extends ConsumerWidget {
  const AppearanceSettingsScreen({super.key});

  Future<void> _set(BuildContext context, WidgetRef ref, Future<void> Function(UserRepository repo, String uid) action) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    try {
      await action(ref.read(userRepositoryProvider), uid);
    } on Object catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final profile = ref.watch(userProfileProvider).value;
    final themes = ref.watch(themesProvider);
    final premiumThemes = ref.watch(hasFeatureProvider(Features.premiumThemes));
    final modeAllowed = ref.watch(hasFeatureProvider(Features.appearanceMode));
    final unlocked = {for (final u in ref.watch(unlocksProvider).value ?? const []) if (u.kind == 'theme') u.key};

    return SparkPageScaffold(
      title: l10n.settingsAppearance,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          if (modeAllowed)
            AppearancePicker(
              selected: profile?.appearanceMode ?? AppearanceMode.system,
              onSelected: (m) => _set(context, ref, (repo, uid) => repo.setAppearanceMode(uid, m)),
            )
          else
            LockedFeatureCard(title: l10n.settingsAppearance, benefit: l10n.previewLockedBody, onSeePlans: () => context.push(Routes.plans)),
          SectionHeader(title: l10n.settingsThemes),
          AsyncValueView<List<ThemeDef>>(
            value: themes,
            compact: true,
            onRetry: () => ref.invalidate(themesProvider),
            data: (list) => Column(
              children: <Widget>[
                _ThemeTile(
                  name: l10n.settingsThemeDefault,
                  palette: SparkPalette.spark,
                  selected: profile?.themeId == null,
                  onTap: () => _set(context, ref, (repo, uid) => repo.setTheme(uid, null)),
                ),
                for (final t in list)
                  _ThemeTile(
                    name: t.name,
                    palette: SparkPalette.fromMap(t.palette['light']),
                    selected: profile?.themeId == t.id,
                    badge: t.isSeasonal ? l10n.settingsThemeSeasonal : (t.isEarned ? l10n.settingsThemeEarned : (t.isPremium ? l10n.commonPremium : null)),
                    locked: (t.isPremium && !premiumThemes) || (t.isEarned && !unlocked.contains(t.id)),
                    lockedHint: t.isEarned ? l10n.settingsThemeLockedEarned : null,
                    onTap: () => _set(context, ref, (repo, uid) => repo.setTheme(uid, t.id)),
                    onLockedTap: t.isEarned ? null : () => context.push(Routes.plans),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({
    required this.name,
    required this.palette,
    required this.selected,
    required this.onTap,
    this.badge,
    this.locked = false,
    this.lockedHint,
    this.onLockedTap,
  });

  final String name;
  final SparkPalette palette;
  final bool selected;
  final VoidCallback onTap;
  final String? badge;
  final bool locked;
  final String? lockedHint;
  final VoidCallback? onLockedTap;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.s),
      child: SparkCard(
        tone: selected ? SparkCardTone.tinted : SparkCardTone.normal,
        onTap: locked ? onLockedTap : onTap,
        semanticLabel: name,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(child: Text(name, style: Theme.of(context).textTheme.titleMedium)),
                      if (badge != null) ...<Widget>[const SizedBox(width: Space.s), SparkChip(label: badge!)],
                    ],
                  ),
                  const SizedBox(height: Space.s),
                  ExcludeSemantics(
                    child: Row(
                      children: <Widget>[
                        for (final color in palette.toMap().values)
                          Container(
                            width: 22,
                            height: 22,
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: c.border)),
                          ),
                      ],
                    ),
                  ),
                  if (locked && lockedHint != null) Text(lockedHint!, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            Icon(
              locked ? Icons.lock_rounded : (selected ? Icons.check_circle_rounded : Icons.circle_outlined),
              color: selected ? c.primary : c.iconMuted,
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------- Custom colours

String roleLabel(AppLocalizations l10n, SparkRole role) => switch (role) {
      SparkRole.background => l10n.roleBackground,
      SparkRole.surface => l10n.roleSurface,
      SparkRole.card => l10n.roleCard,
      SparkRole.primary => l10n.rolePrimary,
      SparkRole.onPrimary => l10n.roleOnPrimary,
      SparkRole.accent => l10n.roleAccent,
      SparkRole.textPrimary => l10n.roleTextPrimary,
      SparkRole.textSecondary => l10n.roleTextSecondary,
      SparkRole.progressDone => l10n.roleProgressDone,
      SparkRole.progressProjected => l10n.roleProgressProjected,
      _ => role.name,
    };

/// Custom palette editor (Premium): colour pickers per role, live preview,
/// WCAG AA contrast warnings before saving, reset to default. The backend
/// validates again.
class CustomColorsScreen extends ConsumerStatefulWidget {
  const CustomColorsScreen({super.key});

  @override
  ConsumerState<CustomColorsScreen> createState() => _CustomColorsScreenState();
}

class _CustomColorsScreenState extends ConsumerState<CustomColorsScreen> {
  Brightness _mode = Brightness.light;
  Map<String, Map<SparkRole, Color>>? _overrides;
  bool _saving = false;

  Map<SparkRole, Color> get _current => _overrides![_mode == Brightness.light ? 'light' : 'dark']!;

  SparkColors _colorsFor(Brightness mode) {
    final profile = ref.read(userProfileProvider).value;
    final theme = ref.read(themesProvider).value?.where((t) => t.id == profile?.themeId).firstOrNull;
    final (light, dark) = resolveSparkColors(theme: theme);
    final base = mode == Brightness.light ? light : dark;
    return base.withOverrides(_overrides![mode == Brightness.light ? 'light' : 'dark']!);
  }

  Future<void> _pick(SparkRole role) async {
    final l10n = context.l10n;
    final colors = _colorsFor(_mode);
    final picked = await showColorPickerDialog(
      context,
      colors.role(role),
      title: Text(l10n.colorsPick(roleLabel(l10n, role))),
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.primary: true,
        ColorPickerType.accent: false,
        ColorPickerType.wheel: true,
      },
      enableShadesSelection: true,
      showColorCode: true,
    );
    setState(() => _current[role] = picked);
  }

  Future<void> _save() async {
    final colors = _colorsFor(Brightness.light);
    final dark = _colorsFor(Brightness.dark);
    if (findContrastIssues(colors).isNotEmpty || findContrastIssues(dark).isNotEmpty) return;
    setState(() => _saving = true);
    try {
      await ref.read(userRepositoryProvider).setCustomPalette(<String, Map<String, String>>{
        for (final entry in _overrides!.entries)
          entry.key: <String, String>{for (final r in entry.value.entries) r.key.name: toHex(r.value)},
      });
      if (mounted) showInfoSnack(context, context.l10n.settingsSaved);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _save);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _reset() async {
    setState(() => _saving = true);
    try {
      await ref.read(userRepositoryProvider).setCustomPalette(null);
      if (!mounted) return;
      setState(() => _overrides = <String, Map<SparkRole, Color>>{'light': <SparkRole, Color>{}, 'dark': <SparkRole, Color>{}});
      showInfoSnack(context, context.l10n.colorsResetDone);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    if (!ref.watch(hasFeatureProvider(Features.colorCustomization))) {
      return SparkPageScaffold(
        title: l10n.settingsCustomColors,
        showSettings: false,
        body: Padding(
          padding: const EdgeInsets.all(Space.gutter),
          child: LockedFeatureCard(title: l10n.settingsCustomColors, benefit: l10n.colorsLocked, onSeePlans: () => context.push(Routes.plans)),
        ),
      );
    }
    final profile = ref.watch(userProfileProvider).value;
    ref.watch(themesProvider);
    _overrides ??= <String, Map<SparkRole, Color>>{
      'light': Map<SparkRole, Color>.of(parseRoleOverrides(profile?.customPalette['light'])),
      'dark': Map<SparkRole, Color>.of(parseRoleOverrides(profile?.customPalette['dark'])),
    };
    final colors = _colorsFor(_mode);
    final issues = <ContrastIssue>[
      ...findContrastIssues(_colorsFor(Brightness.light)),
      ...findContrastIssues(_colorsFor(Brightness.dark)),
    ];
    final currentIssues = findContrastIssues(colors);

    return SparkPageScaffold(
      title: l10n.settingsCustomColors,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          Text(l10n.colorsIntro, style: text.bodyMedium),
          const SizedBox(height: Space.m),
          SegmentedButton<Brightness>(
            segments: <ButtonSegment<Brightness>>[
              ButtonSegment<Brightness>(value: Brightness.light, label: Text(l10n.colorsLightMode), icon: const Icon(Icons.light_mode_rounded)),
              ButtonSegment<Brightness>(value: Brightness.dark, label: Text(l10n.colorsDarkMode), icon: const Icon(Icons.dark_mode_rounded)),
            ],
            selected: <Brightness>{_mode},
            onSelectionChanged: (s) => setState(() => _mode = s.first),
          ),
          const SizedBox(height: Space.m),
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                for (final role in customizableRoles)
                  ListTile(
                    leading: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(color: colors.role(role), shape: BoxShape.circle, border: Border.all(color: c.border)),
                    ),
                    title: Text(roleLabel(l10n, role)),
                    subtitle: Text(toHex(colors.role(role))),
                    trailing: const Icon(Icons.edit_rounded),
                    onTap: () => _pick(role),
                  ),
              ],
            ),
          ),
          const SizedBox(height: Space.m),
          Text(l10n.colorsPreview, style: text.titleMedium),
          const SizedBox(height: Space.s),
          ExcludeSemantics(
            child: IgnorePointer(
              child: Theme(
              data: buildSparkTheme(colors),
              child: Builder(
                builder: (context) => Container(
                  padding: const EdgeInsets.all(Space.m),
                  decoration: BoxDecoration(color: context.spark.background, borderRadius: Radii.cardAll),
                  child: SparkCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(l10n.tabDashboard, style: Theme.of(context).textTheme.titleLarge),
                        Text(l10n.appSlogan, style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: Space.s),
                        const SparkProgressBar(done: 0.42, projected: 0.55),
                        TaskTile(task: Task(id: 'preview', title: l10n.appearancePreviewTask)),
                        SparkButton(label: l10n.sessionStart, onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ),
          ),
          const SizedBox(height: Space.m),
          if (issues.isEmpty)
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_rounded, color: c.success),
                const SizedBox(width: Space.s),
                Expanded(child: Text(l10n.colorsAllGood, style: text.bodyMedium)),
              ],
            )
          else
            for (final issue in currentIssues)
              SparkCard(
                tone: SparkCardTone.accent,
                margin: const EdgeInsets.only(bottom: Space.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.warning_amber_rounded, color: c.warning),
                        const SizedBox(width: Space.s),
                        Expanded(
                          child: Text(
                            l10n.colorsContrastWarning(
                              roleLabel(l10n, issue.foreground),
                              roleLabel(l10n, issue.background),
                              issue.ratio.toStringAsFixed(1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        _current[issue.foreground] =
                            closestPassingColor(colors.role(issue.foreground), colors.role(issue.background));
                      }),
                      child: Text(l10n.colorsUseSuggested),
                    ),
                  ],
                ),
              ),
          const SizedBox(height: Space.m),
          SparkButton(
            key: const Key('colors-save'),
            label: l10n.colorsSave,
            loading: _saving,
            expand: true,
            onPressed: issues.isEmpty ? _save : null,
          ),
          SparkButton.text(label: l10n.colorsReset, expand: true, onPressed: _saving ? null : _reset),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------ Character

class CharacterSettingsScreen extends ConsumerStatefulWidget {
  const CharacterSettingsScreen({super.key});

  @override
  ConsumerState<CharacterSettingsScreen> createState() => _CharacterSettingsScreenState();
}

class _CharacterSettingsScreenState extends ConsumerState<CharacterSettingsScreen> {
  String? _saving;

  Future<void> _select(CharacterDef c) async {
    setState(() => _saving = c.id);
    try {
      await ref.read(userRepositoryProvider).setCharacter(c.id);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: () => _select(c));
    } finally {
      if (mounted) setState(() => _saving = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selected = ref.watch(userProfileProvider.select((p) => p.value?.characterId));
    return SparkPageScaffold(
      title: l10n.settingsCharacter,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          if (_saving != null) const LinearProgressIndicator(),
          CharacterPicker(
            selectedId: selected,
            onSelected: _select,
            onLockedTap: () => context.push(Routes.plans),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------- Notifications

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends ConsumerState<NotificationSettingsScreen> with WidgetsBindingObserver {
  NotificationPrefs? _prefs;
  Timer? _debounce;
  PushPermission? _permission;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _checkPermission();
  }

  Future<void> _checkPermission() async {
    final p = await ref.read(notificationServiceProvider).permission();
    if (mounted) setState(() => _permission = p);
  }

  void _changed(NotificationPrefs prefs) {
    setState(() => _prefs = prefs);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final uid = ref.read(currentUidProvider);
      if (uid == null) return;
      try {
        await ref.read(userRepositoryProvider).updateNotificationPrefs(uid, prefs);
      } on Object catch (e) {
        if (mounted) showErrorSnack(context, e, onRetry: () => _changed(prefs));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final settings = ref.watch(userSettingsProvider);
    final prefs = _prefs ?? settings.value?.notifications;
    return SparkPageScaffold(
      title: l10n.settingsNotifications,
      showSettings: false,
      body: prefs == null
          ? AsyncValueView(value: settings, onRetry: () => ref.invalidate(userSettingsProvider), data: (_) => const SkeletonList())
          : ListView(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
              children: <Widget>[
                if (_permission != null && _permission != PushPermission.granted)
                  SparkCard(
                    tone: SparkCardTone.accent,
                    margin: const EdgeInsets.only(bottom: Space.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.notifications_off_rounded, color: c.warning),
                            const SizedBox(width: Space.s),
                            Expanded(child: Text(l10n.settingsNotifPermissionOff)),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            if (_permission == PushPermission.unknown) {
                              final p = await ref.read(notificationServiceProvider).requestPermission();
                              if (mounted) setState(() => _permission = p);
                            } else {
                              await openNotificationSettings();
                            }
                          },
                          child: Text(_permission == PushPermission.unknown ? l10n.notifTurnOn : l10n.settingsOpenSystemSettings),
                        ),
                      ],
                    ),
                  ),
                NotificationPrefsEditor(prefs: prefs, onChanged: _changed, showAdvanced: true),
              ],
            ),
    );
  }
}

// -------------------------------------------------------------------- Schedule

class ScheduleSettingsScreen extends ConsumerStatefulWidget {
  const ScheduleSettingsScreen({super.key});

  @override
  ConsumerState<ScheduleSettingsScreen> createState() => _ScheduleSettingsScreenState();
}

class _ScheduleSettingsScreenState extends ConsumerState<ScheduleSettingsScreen> {
  List<AvailabilitySlot>? _slots;
  bool _savingSlots = false;
  Proposal? _proposal;
  bool _connecting = false;

  Future<void> _saveSlots() async {
    final slots = _slots;
    if (slots == null || slots.isEmpty) return;
    setState(() {
      _savingSlots = true;
      _proposal = null;
    });
    try {
      final proposal = await ref.read(scheduleRepositoryProvider).setAvailability(slots);
      if (!mounted) return;
      setState(() {
        _proposal = proposal;
        _slots = null;
      });
      if (proposal == null) showInfoSnack(context, context.l10n.scheduleAvailabilitySaved);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _saveSlots);
    } finally {
      if (mounted) setState(() => _savingSlots = false);
    }
  }

  Future<void> _connect() async {
    setState(() => _connecting = true);
    try {
      final url = await ref.read(integrationsRepositoryProvider).gcalConnectStart();
      final opened = await launchUrl(url, mode: LaunchMode.externalApplication);
      if (mounted && opened) showInfoSnack(context, context.l10n.scheduleGcalReturn);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _connect);
    } finally {
      if (mounted) setState(() => _connecting = false);
    }
  }

  Future<void> _calendarPref({bool? sync, bool? busy}) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    try {
      await ref.read(userRepositoryProvider).updateCalendarPrefs(uid, syncSessionsToGoogle: sync, respectBusyTimes: busy);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final saved = ref.watch(availabilityProvider);
    final slots = _slots ?? saved.value;
    final project = ref.watch(activeProjectProvider).value;
    final calendar = ref.watch(userSettingsProvider.select((s) => s.value?.calendar)) ?? const CalendarSettings();
    final gcalAllowed = ref.watch(hasFeatureProvider(Features.googleCalendar));

    return SparkPageScaffold(
      title: l10n.settingsSchedule,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          Text(l10n.scheduleAvailability, style: text.titleLarge),
          const SizedBox(height: Space.s),
          if (slots == null)
            AsyncValueView(value: saved, compact: true, onRetry: () => ref.invalidate(availabilityProvider), data: (_) => const SizedBox.shrink())
          else ...<Widget>[
            AvailabilityEditor(slots: slots, onChanged: (v) => setState(() => _slots = v)),
            const SizedBox(height: Space.m),
            SparkButton(
              label: l10n.commonSave,
              loading: _savingSlots,
              expand: true,
              onPressed: _slots == null || _slots!.isEmpty ? null : _saveSlots,
            ),
          ],
          if (_proposal != null) ...<Widget>[
            const SizedBox(height: Space.m),
            ProposalReview(proposal: _proposal!, inline: true),
          ],
          if (project?.targetEndDate != null) ...<Widget>[
            SectionHeader(title: l10n.scheduleDeadline),
            SparkCard(
              child: Row(
                children: <Widget>[
                  Icon(Icons.flag_rounded, color: c.primary),
                  const SizedBox(width: Space.s),
                  Expanded(child: Text(fmt.longDate(clock.toWallClock(project!.targetEndDate!)), style: text.titleMedium)),
                  TextButton(
                    onPressed: () => context.push(
                      Uri(path: Routes.adjustPlan, queryParameters: <String, String>{'action': PlanAction.deadline.name}).toString(),
                    ),
                    child: Text(l10n.scheduleChangeDeadline),
                  ),
                ],
              ),
            ),
          ],
          SectionHeader(title: l10n.scheduleGcal),
          if (!gcalAllowed)
            LockedFeatureCard(title: l10n.scheduleGcal, benefit: l10n.scheduleGcalLocked, onSeePlans: () => context.push(Routes.plans))
          else if (!calendar.connected)
            SparkCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(l10n.scheduleGcalConnectBody, style: text.bodyMedium),
                  const SizedBox(height: Space.m),
                  SparkButton(
                    key: const Key('gcal-connect'),
                    label: l10n.scheduleGcalConnect,
                    icon: Icons.event_available_rounded,
                    loading: _connecting,
                    onPressed: _connect,
                  ),
                ],
              ),
            )
          else
            SparkCard(
              padding: const EdgeInsets.symmetric(vertical: Space.xs),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.check_circle_rounded, color: c.success),
                    title: Text(calendar.googleEmail == null ? l10n.scheduleGcalConnectedNoEmail : l10n.scheduleGcalConnected(calendar.googleEmail!)),
                    subtitle: switch (calendar.syncState) {
                      CalendarSyncState.error => Text(
                          l10n.agendaGcalError(calendar.lastError ?? l10n.errorUnknown),
                          style: text.bodySmall?.copyWith(color: c.danger),
                        ),
                      _ => calendar.lastSyncAt == null
                          ? null
                          : Text(l10n.agendaGcalSynced(fmt.time(clock.toWallClock(calendar.lastSyncAt!)))),
                    },
                  ),
                  SwitchListTile(
                    title: Text(l10n.scheduleGcalAddSessions),
                    value: calendar.syncSessionsToGoogle,
                    onChanged: (v) => _calendarPref(sync: v),
                  ),
                  SwitchListTile(
                    title: Text(l10n.scheduleGcalBusy),
                    value: calendar.respectBusyTimes,
                    onChanged: (v) => _calendarPref(busy: v),
                  ),
                  ListTile(
                    leading: Icon(Icons.link_off_rounded, color: c.danger),
                    title: Text(l10n.scheduleGcalDisconnect),
                    onTap: () => showConfirmSheet(
                      context,
                      title: l10n.scheduleGcalDisconnectConfirm,
                      body: l10n.scheduleGcalDisconnectBody,
                      confirmLabel: l10n.scheduleGcalDisconnect,
                      destructive: true,
                      onConfirm: () => ref.read(integrationsRepositoryProvider).gcalDisconnect(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------- Privacy

class PrivacySettingsScreen extends ConsumerStatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  ConsumerState<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends ConsumerState<PrivacySettingsScreen> {
  late final TextEditingController _city;
  late final TextEditingController _region;
  bool _savingLocation = false;
  bool _savingConsent = false;

  @override
  void initState() {
    super.initState();
    final p = ref.read(userProfileProvider).value;
    _city = TextEditingController(text: p?.locationCity ?? '');
    _region = TextEditingController(text: p?.locationRegion ?? '');
  }

  @override
  void dispose() {
    _city.dispose();
    _region.dispose();
    super.dispose();
  }

  Future<void> _consent(String type, bool granted) async {
    setState(() => _savingConsent = true);
    try {
      await ref.read(userRepositoryProvider).setConsent(type, granted: granted);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: () => _consent(type, granted));
    } finally {
      if (mounted) setState(() => _savingConsent = false);
    }
  }

  Future<void> _saveLocation() async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    setState(() => _savingLocation = true);
    try {
      final city = _city.text.trim();
      final region = _region.text.trim();
      await ref.read(userRepositoryProvider).setLocation(uid, city: city.isEmpty ? null : city, region: region.isEmpty ? null : region);
      await ref.read(userRepositoryProvider).setConsent('location', granted: city.isNotEmpty || region.isNotEmpty);
      if (mounted) showInfoSnack(context, context.l10n.settingsSaved);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _saveLocation);
    } finally {
      if (mounted) setState(() => _savingLocation = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final privacy = ref.watch(userSettingsProvider.select((s) => s.value?.privacy)) ?? const PrivacySettings();
    final teen = ref.watch(userProfileProvider.select((p) => p.value?.ageBracket == AgeBracket.teen));
    final community = ref.watch(appFlagsProvider.select((f) => f.value?.communityEnabled ?? false));
    final calendarConnected = ref.watch(userSettingsProvider.select((s) => s.value?.calendar.connected ?? false));

    return SparkPageScaffold(
      title: l10n.settingsPrivacy,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          if (teen)
            Padding(padding: const EdgeInsets.only(bottom: Space.m), child: Text(l10n.privacyTeenDefaults, style: text.bodyMedium)),
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  title: Text(l10n.privacyLeaderboard),
                  subtitle: Text(l10n.leaderboardPrivacy),
                  value: privacy.leaderboardOptIn,
                  onChanged: _savingConsent ? null : (v) => _consent('leaderboard', v),
                ),
                if (community)
                  ListTile(
                    title: Text(l10n.privacyCommunityVisibility),
                    subtitle: DropdownButton<String>(
                      value: privacy.communityVisibility == 'members' ? 'members' : 'private',
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(value: 'private', child: Text(l10n.privacyVisibilityPrivate)),
                        DropdownMenuItem<String>(value: 'members', child: Text(l10n.privacyVisibilityMembers)),
                      ],
                      onChanged: (v) async {
                        final uid = ref.read(currentUidProvider);
                        if (v == null || uid == null) return;
                        try {
                          await ref.read(userRepositoryProvider).updatePrivacy(uid, communityVisibility: v);
                        } on Object catch (e) {
                          if (context.mounted) showErrorSnack(context, e);
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
          SectionHeader(title: l10n.privacyLocation),
          SparkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(l10n.privacyLocationBody, style: text.bodySmall),
                const SizedBox(height: Space.s),
                TextField(controller: _city, decoration: InputDecoration(labelText: l10n.privacyCity)),
                const SizedBox(height: Space.s),
                TextField(controller: _region, decoration: InputDecoration(labelText: l10n.privacyRegion)),
                const SizedBox(height: Space.m),
                SparkButton(label: l10n.commonSave, loading: _savingLocation, onPressed: _saveLocation),
              ],
            ),
          ),
          SectionHeader(title: l10n.privacyConsents),
          Text(l10n.privacyConsentsBody, style: text.bodySmall),
          const SizedBox(height: Space.s),
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  title: Text(l10n.privacyConsentLocation),
                  value: (ref.watch(userProfileProvider).value?.locationCity ?? '').isNotEmpty,
                  onChanged: _savingConsent
                      ? null
                      : (v) async {
                          if (!v) {
                            _city.clear();
                            _region.clear();
                            await _saveLocation();
                          }
                        },
                ),
                SwitchListTile(
                  title: Text(l10n.privacyConsentCalendar),
                  value: calendarConnected,
                  onChanged: calendarConnected
                      ? (v) => showConfirmSheet(
                            context,
                            title: l10n.scheduleGcalDisconnectConfirm,
                            body: l10n.scheduleGcalDisconnectBody,
                            confirmLabel: l10n.scheduleGcalDisconnect,
                            destructive: true,
                            onConfirm: () => ref.read(integrationsRepositoryProvider).gcalDisconnect(),
                          )
                      : (_) => context.push(Routes.settingsSchedule),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------- Account

class AccountSettingsScreen extends ConsumerWidget {
  const AccountSettingsScreen({super.key});

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final first = await showConfirmSheet(
      context,
      title: l10n.accountDeleteTitle,
      body: l10n.accountDeleteBody,
      confirmLabel: l10n.commonContinue,
      destructive: true,
    );
    if (!first || !context.mounted) return;
    final controller = TextEditingController();
    await showConfirmSheet(
      context,
      title: l10n.accountDeleteConfirmTitle,
      body: l10n.accountDeleteConfirmBody,
      content: TextField(
        key: const Key('delete-confirm-field'),
        controller: controller,
        autocorrect: false,
        decoration: InputDecoration(hintText: l10n.accountDeleteWord),
      ),
      confirmLabel: l10n.accountDeleteButton,
      destructive: true,
      onConfirm: () async {
        if (controller.text.trim().toUpperCase() != l10n.accountDeleteWord.toUpperCase()) {
          throw AppException(kind: AppErrorKind.invalidInput, message: l10n.accountDeleteConfirmBody);
        }
        await ref.read(userRepositoryProvider).deleteAccount();
        await ref.read(authRepositoryProvider).signOut();
      },
    );
    controller.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final email = ref.watch(authSessionProvider.select((s) => s.value?.email));
    return SparkPageScaffold(
      title: l10n.settingsAccount,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.mail_rounded, color: c.secondary),
                  title: Text(l10n.accountEmail),
                  subtitle: Text(email ?? l10n.accountNoEmail),
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded, color: c.secondary),
                  title: Text(l10n.signOut),
                  onTap: () async {
                    try {
                      await ref.read(notificationServiceProvider).cancelAll();
                      await ref.read(authRepositoryProvider).signOut();
                    } on Object catch (e) {
                      if (context.mounted) showErrorSnack(context, e);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: Space.l),
          SparkButton.destructive(
            key: const Key('delete-account'),
            label: l10n.accountDelete,
            icon: Icons.delete_forever_rounded,
            expand: true,
            onPressed: () => _delete(context, ref),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------------ Help

class HelpSettingsScreen extends ConsumerWidget {
  const HelpSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final flags = ref.watch(appFlagsProvider).value;
    final support = flags?.supportEmail ?? (AppConfig.supportEmail.isEmpty ? null : AppConfig.supportEmail);
    final terms = flags?.termsUrl ?? (AppConfig.termsUrl.isEmpty ? null : AppConfig.termsUrl);
    final privacy = flags?.privacyUrl ?? (AppConfig.privacyUrl.isEmpty ? null : AppConfig.privacyUrl);

    return SparkPageScaffold(
      title: l10n.settingsHelp,
      showSettings: false,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
        children: <Widget>[
          SparkCard(
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.replay_rounded, color: c.secondary),
                  title: Text(l10n.helpReplayTutorial),
                  onTap: () {
                    ref.read(tutorialReplayProvider.notifier).start();
                    context.go(Routes.dashboard);
                  },
                ),
                if (support != null)
                  ListTile(
                    leading: Icon(Icons.support_agent_rounded, color: c.secondary),
                    title: Text(l10n.helpContactSupport),
                    subtitle: Text(support),
                    onTap: () => launchUrl(Uri(scheme: 'mailto', path: support, queryParameters: <String, String>{'subject': l10n.helpSupportSubject})),
                  ),
                if (terms != null)
                  ListTile(
                    leading: Icon(Icons.description_rounded, color: c.secondary),
                    title: Text(l10n.helpTerms),
                    onTap: () => openExternalUrl(terms),
                  ),
                if (privacy != null)
                  ListTile(
                    leading: Icon(Icons.privacy_tip_rounded, color: c.secondary),
                    title: Text(l10n.helpPrivacyPolicy),
                    onTap: () => openExternalUrl(privacy),
                  ),
                ListTile(
                  leading: Icon(Icons.article_rounded, color: c.secondary),
                  title: Text(l10n.helpLicenses),
                  onTap: () => showLicensePage(context: context, applicationName: l10n.appName),
                ),
                FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snap) => ListTile(
                    leading: Icon(Icons.info_rounded, color: c.secondary),
                    title: Text(l10n.helpVersion(snap.hasData ? '${snap.data!.version} (${snap.data!.buildNumber})' : '…')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
