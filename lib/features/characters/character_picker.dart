import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../core/widgets/chat_bubbles.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/catalog.dart';
import '../../data/providers/session_providers.dart';
import '../billing/entitlements.dart';

/// Grid of characters: avatar, name, personality line and a preview of how
/// they'd sound in a notification. Premium characters carry a badge and are
/// selectable whenever entitlements allow.
class CharacterPicker extends ConsumerWidget {
  const CharacterPicker({super.key, required this.selectedId, required this.onSelected, this.onLockedTap});

  final String? selectedId;
  final ValueChanged<CharacterDef> onSelected;
  final VoidCallback? onLockedTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(charactersProvider);
    final premiumAllowed = ref.watch(hasFeatureProvider(Features.premiumCharacters));
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= Breakpoints.expanded ? 3 : (width >= Breakpoints.medium ? 2 : 1);

    return AsyncValueView<List<CharacterDef>>(
      value: characters,
      onRetry: () => ref.invalidate(charactersProvider),
      data: (list) {
        if (list.isEmpty) {
          return EmptyState(title: context.l10n.errorNotFound, compact: true);
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - Space.s * (columns - 1)) / columns;
            return Wrap(
              spacing: Space.s,
              runSpacing: Space.s,
              children: <Widget>[
                for (final character in list)
                  SizedBox(
                    width: itemWidth,
                    child: _CharacterCard(
                      character: character,
                      selected: character.id == selectedId,
                      locked: character.isPremium && !premiumAllowed,
                      onTap: () {
                        if (character.isPremium && !premiumAllowed) {
                          onLockedTap?.call();
                        } else {
                          onSelected(character);
                        }
                      },
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({required this.character, required this.selected, required this.locked, required this.onTap});

  final CharacterDef character;
  final bool selected;
  final bool locked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    return Semantics(
      selected: selected,
      child: SparkCard(
        onTap: onTap,
        semanticLabel: '${character.name}. ${character.description}',
        tone: selected ? SparkCardTone.tinted : SparkCardTone.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CharacterAvatar(character: character, size: 56),
                const SizedBox(width: Space.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(character.name, style: text.titleMedium),
                      Text(character.description, style: text.bodySmall),
                    ],
                  ),
                ),
                if (selected) Icon(Icons.check_circle_rounded, color: c.primary),
              ],
            ),
            if (character.isPremium) ...<Widget>[
              const SizedBox(height: Space.s),
              SparkChip(
                label: locked ? l10n.characterLocked : l10n.commonPremium,
                icon: locked ? Icons.lock_rounded : Icons.star_rounded,
                tone: SparkChipTone.accent,
              ),
            ],
            if (character.sampleNotification != null) ...<Widget>[
              const SizedBox(height: Space.s),
              Text(l10n.characterPreview, style: text.labelSmall),
              ChatBubble(isUser: false, child: Text(character.sampleNotification!, style: text.bodySmall)),
            ],
          ],
        ),
      ),
    );
  }
}
