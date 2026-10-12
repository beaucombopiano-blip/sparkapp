import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';
import 'spark_button.dart';
import 'spark_card.dart';

/// Shown only when entitlements are enforced and the plan lacks a feature.
class LockedFeatureCard extends StatelessWidget {
  const LockedFeatureCard({
    super.key,
    required this.title,
    required this.benefit,
    required this.onSeePlans,
  });

  final String title;
  final String benefit;
  final VoidCallback onSeePlans;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    return SparkCard(
      tone: SparkCardTone.tinted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.lock_rounded, color: c.primary),
              const SizedBox(width: Space.s),
              Expanded(child: Text(title, style: text.titleMedium)),
            ],
          ),
          const SizedBox(height: Space.s),
          Text(benefit, style: text.bodyMedium),
          const SizedBox(height: Space.m),
          SparkButton(label: context.l10n.lockedSeePlans, onPressed: onSeePlans, icon: Icons.star_rounded),
        ],
      ),
    );
  }
}
