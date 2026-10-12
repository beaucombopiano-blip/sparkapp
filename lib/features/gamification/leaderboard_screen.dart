import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/states.dart';
import '../../data/models/catalog.dart';
import '../../data/models/gamification.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/user_repository.dart';
import 'gamification_providers.dart';

/// Opt-in weekly leaderboard (pseudonyms and avatars only), separate teen and
/// adult boards.
class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  bool _busy = false;

  Future<void> _toggle(bool value) async {
    setState(() => _busy = true);
    try {
      await ref.read(userRepositoryProvider).setConsent('leaderboard', granted: value);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: () => _toggle(value));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final optedIn = ref.watch(userSettingsProvider.select((s) => s.value?.privacy.leaderboardOptIn ?? false));
    final adult = ref.watch(userProfileProvider.select((p) => p.value?.ageBracket == AgeBracket.adult));
    final characters = {for (final ch in ref.watch(charactersProvider).value ?? const <CharacterDef>[]) ch.id: ch};

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        SparkCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SwitchListTile(
                key: const Key('leaderboard-optin'),
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.leaderboardOptIn, style: text.titleMedium),
                value: optedIn,
                onChanged: _busy ? null : _toggle,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.shield_rounded, color: c.secondary),
                  const SizedBox(width: Space.s),
                  Expanded(child: Text(l10n.leaderboardPrivacy, style: text.bodyMedium)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: Space.l),
        if (!optedIn)
          EmptyState(title: l10n.leaderboardOffBody, icon: Icons.leaderboard_outlined, compact: true)
        else ...<Widget>[
          Text(adult ? l10n.leaderboardAdult : l10n.leaderboardTeen, style: text.titleLarge),
          const SizedBox(height: Space.s),
          AsyncValueView<LeaderboardWeek?>(
            value: ref.watch(leaderboardProvider),
            compact: true,
            onRetry: () => ref.invalidate(leaderboardProvider),
            data: (week) {
              final entries = List<LeaderboardEntry>.of(week?.entries ?? const <LeaderboardEntry>[])
                ..sort((a, b) => a.rank.compareTo(b.rank));
              if (entries.isEmpty) return EmptyState(title: l10n.leaderboardEmpty, compact: true, icon: Icons.hourglass_empty_rounded);
              return SparkCard(
                padding: const EdgeInsets.symmetric(vertical: Space.xs),
                child: Column(
                  children: <Widget>[
                    for (final e in entries)
                      ListTile(
                        leading: SizedBox(
                          width: 72,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 24,
                                child: Text('${e.rank}', style: text.titleMedium, semanticsLabel: l10n.leaderboardRank(e.rank)),
                              ),
                              CharacterAvatar(character: characters[e.characterId], size: 36),
                            ],
                          ),
                        ),
                        title: Text(e.pseudonym),
                        trailing: Text(l10n.leaderboardPoints(e.points), style: text.labelLarge),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
