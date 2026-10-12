import 'package:material_ui/material_ui.dart';

import '../../data/models/resources.dart';
import '../utils/l10n.dart';
import 'spark_chip.dart';

/// Verified / Found online / AI suggestion — always icon + text.
class SourceBadge extends StatelessWidget {
  const SourceBadge({super.key, required this.label});

  final OpportunityLabel label;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (label) {
      OpportunityLabel.verified =>
        SparkChip(label: l10n.sourceVerified, icon: Icons.verified_rounded, tone: SparkChipTone.success),
      OpportunityLabel.foundOnline =>
        SparkChip(label: l10n.sourceFoundOnline, icon: Icons.travel_explore_rounded, tone: SparkChipTone.primary),
      OpportunityLabel.aiSuggestion =>
        SparkChip(label: l10n.sourceAiSuggestion, icon: Icons.lightbulb_outline_rounded, tone: SparkChipTone.accent),
    };
  }
}
