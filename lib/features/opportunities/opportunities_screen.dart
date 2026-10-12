import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/locked_feature_card.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/resources.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/resource_repository.dart';
import '../billing/entitlements.dart';
import '../discovery/recommendations_step.dart' show ThinkingLoader;
import 'opportunity_card.dart';

/// Backend type keys with their labels.
List<(String, String)> opportunityTypes(AppLocalizations l10n) => <(String, String)>[
      ('competition', l10n.oppTypeCompetition),
      ('grant', l10n.oppTypeGrant),
      ('internship', l10n.oppTypeInternship),
      ('workshop', l10n.oppTypeWorkshop),
      ('showcase', l10n.oppTypeShowcase),
      ('mentorship', l10n.oppTypeMentorship),
      ('research program', l10n.oppTypeResearch),
      ('community org', l10n.oppTypeCommunity),
    ];

/// Opportunities near you: city/region text (no GPS), type filters, remote
/// toggle. Every card is labelled Verified / Found online / AI suggestion.
class OpportunitiesScreen extends ConsumerStatefulWidget {
  const OpportunitiesScreen({super.key});

  @override
  ConsumerState<OpportunitiesScreen> createState() => _OpportunitiesScreenState();
}

class _OpportunitiesScreenState extends ConsumerState<OpportunitiesScreen> {
  final _location = TextEditingController();
  final Set<String> _types = <String>{};
  bool _remoteOnly = false;
  AsyncValue<OpportunityResults>? _results;

  @override
  void dispose() {
    _location.dispose();
    super.dispose();
  }

  void _useSaved() {
    final p = ref.read(userProfileProvider).value;
    final parts = <String>[
      if (p?.locationCity?.isNotEmpty ?? false) p!.locationCity!,
      if (p?.locationRegion?.isNotEmpty ?? false) p!.locationRegion!,
    ];
    setState(() => _location.text = parts.join(', '));
  }

  Future<void> _search() async {
    final pid = ref.read(activeProjectIdProvider);
    if (pid == null) return;
    setState(() => _results = const AsyncValue<OpportunityResults>.loading());
    final result = await AsyncValue.guard(
      () => ref.read(resourceRepositoryProvider).findOpportunities(
            pid,
            locationQuery: _location.text,
            types: _types.toList(),
            remoteOnly: _remoteOnly ? true : null,
          ),
    );
    if (mounted) setState(() => _results = result);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    if (!ref.watch(hasFeatureProvider(Features.opportunities))) {
      return Padding(
        padding: const EdgeInsets.all(Space.gutter),
        child: LockedFeatureCard(
          title: l10n.titleOpportunities,
          benefit: l10n.opportunitiesLocked,
          onSeePlans: () => context.push(Routes.plans),
        ),
      );
    }
    final profile = ref.watch(userProfileProvider).value;
    final hasSaved = (profile?.locationCity?.isNotEmpty ?? false) || (profile?.locationRegion?.isNotEmpty ?? false);

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        Text(l10n.opportunitiesIntro, style: text.bodyMedium),
        const SizedBox(height: Space.m),
        TextField(
          controller: _location,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => _search(),
          decoration: InputDecoration(prefixIcon: const Icon(Icons.place_rounded), hintText: l10n.opportunitiesLocationHint),
        ),
        if (hasSaved)
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: _useSaved,
              icon: const Icon(Icons.my_location_rounded),
              label: Text(l10n.opportunitiesUseSaved),
            ),
          ),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.xs,
          children: <Widget>[
            for (final (key, label) in opportunityTypes(l10n))
              SparkChip(
                label: label,
                selected: _types.contains(key),
                onTap: () => setState(() => _types.contains(key) ? _types.remove(key) : _types.add(key)),
              ),
          ],
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.opportunitiesRemoteOnly),
          value: _remoteOnly,
          onChanged: (v) => setState(() => _remoteOnly = v),
        ),
        SparkButton(
          key: const Key('opportunities-search'),
          label: l10n.opportunitiesSearch,
          icon: Icons.travel_explore_rounded,
          expand: true,
          loading: _results?.isLoading ?? false,
          onPressed: _search,
        ),
        const SizedBox(height: Space.m),
        if (_results != null) _buildResults(context, _results!),
      ],
    );
  }

  Widget _buildResults(BuildContext context, AsyncValue<OpportunityResults> results) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    if (results.isLoading) return ThinkingLoader(lines: <String>[l10n.opportunitiesSearching]);
    if (results.hasError) return ErrorState(error: results.error!, onRetry: _search);
    final r = results.requireValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (r.items.isEmpty) EmptyState(title: l10n.opportunitiesEmpty, icon: Icons.search_off_rounded, compact: true),
        for (final o in r.items)
          Padding(padding: const EdgeInsets.only(bottom: Space.s), child: OpportunityCard(opportunity: o)),
        if (r.searchStrategies.isNotEmpty) ...<Widget>[
          SectionHeader(title: l10n.opportunitiesStrategies),
          SparkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final s in r.searchStrategies)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Space.xs),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Icon(Icons.tips_and_updates_outlined, size: 18),
                        const SizedBox(width: Space.s),
                        Expanded(child: Text(s, style: text.bodyMedium)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
        if (r.outreachTemplate != null && r.outreachTemplate!.isNotEmpty) ...<Widget>[
          SectionHeader(title: l10n.opportunitiesTemplate),
          SparkCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SelectableText(r.outreachTemplate!, style: text.bodyMedium),
                const SizedBox(height: Space.s),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: r.outreachTemplate!));
                      if (context.mounted) showInfoSnack(context, l10n.opportunitiesCopied);
                    },
                    icon: const Icon(Icons.copy_rounded),
                    label: Text(l10n.opportunitiesCopyTemplate),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
