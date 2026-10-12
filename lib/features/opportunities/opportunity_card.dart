import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/resource_card.dart' show openExternalUrl;
import '../../core/widgets/source_badge.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../data/models/resources.dart';
import '../../data/providers/session_providers.dart';
import '../resources/resources_providers.dart';

/// An opportunity with a clear Verified / Found online / AI suggestion badge.
/// AI suggestions are visually distinct (dashed border, lightbulb) and never
/// carry invented names or contact info, so they have no link.
class OpportunityCard extends ConsumerWidget {
  const OpportunityCard({super.key, required this.opportunity, this.showSave = true});

  final Opportunity opportunity;
  final bool showSave;

  ResourceItem _asResource() => ResourceItem(
        type: ResourceType.article,
        title: opportunity.title,
        description: opportunity.description,
        sourceName: opportunity.organization,
        url: opportunity.url ?? '',
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final o = opportunity;
    final ai = o.isAiSuggestion;
    final hasLink = !ai && o.url != null && o.url!.isNotEmpty;
    final saved = hasLink && ref.watch(savedResourceUrlsProvider).contains(o.url);
    final saving = hasLink && ref.watch(savingResourcesProvider).contains(o.url);

    return SparkCard(
      dashed: ai,
      tone: ai ? SparkCardTone.outlined : SparkCardTone.normal,
      onTap: hasLink ? () => openExternalUrl(o.url!) : null,
      semanticLabel: o.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (ai) ...<Widget>[
                Icon(Icons.lightbulb_outline_rounded, color: c.accent),
                const SizedBox(width: Space.s),
              ],
              Expanded(child: Text(o.title, style: text.titleMedium)),
              const SizedBox(width: Space.s),
              SourceBadge(label: o.label),
            ],
          ),
          if (!ai && o.organization != null) Text(o.organization!, style: text.labelMedium),
          if (o.description != null) ...<Widget>[
            const SizedBox(height: Space.xs),
            Text(o.description!, style: text.bodyMedium),
          ],
          if (ai) ...<Widget>[
            const SizedBox(height: Space.xs),
            Text(l10n.opportunityAiNote, style: text.bodySmall),
          ],
          const SizedBox(height: Space.s),
          Wrap(
            spacing: Space.s,
            runSpacing: Space.xs,
            children: <Widget>[
              SparkChip(label: o.type, icon: Icons.category_rounded),
              if (o.isRemote) SparkChip(label: l10n.opportunityRemote, icon: Icons.wifi_rounded),
              if (!o.isRemote && o.locationText != null) SparkChip(label: o.locationText!, icon: Icons.place_rounded),
              if (o.deadline != null)
                SparkChip(
                  label: l10n.opportunityDeadline(fmt.shortDate(clock.toWallClock(o.deadline!))),
                  icon: Icons.event_rounded,
                ),
            ],
          ),
          if (o.eligibility != null && o.eligibility!.isNotEmpty) ...<Widget>[
            const SizedBox(height: Space.xs),
            Text(l10n.opportunityEligibility(o.eligibility!), style: text.bodySmall),
          ],
          if (hasLink)
            Wrap(
              spacing: Space.s,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () => openExternalUrl(o.url!),
                  icon: const Icon(Icons.open_in_new_rounded),
                  label: Text(l10n.commonOpenLink),
                ),
                if (showSave)
                  TextButton.icon(
                    onPressed: saved || saving
                        ? null
                        : () async {
                            try {
                              await ref.read(savingResourcesProvider.notifier).save(_asResource());
                            } on Object catch (e) {
                              if (context.mounted) showErrorSnack(context, e);
                            }
                          },
                    icon: Icon(saved ? Icons.bookmark_added_rounded : Icons.bookmark_add_outlined),
                    label: Text(saved ? l10n.resourceSaved : l10n.resourceSave),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
