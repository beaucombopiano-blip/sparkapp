import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/states.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../profile/profile_screen.dart' show planDisplayName;
import 'billing_service.dart';
import 'entitlements.dart';

/// Current plan, renewal or trial end date, "Manage subscription" (store
/// management page via RevenueCat) and plan comparison.
class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  ConsumerState<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  bool _opening = false;

  Future<void> _manage() async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    setState(() => _opening = true);
    try {
      final url = await ref.read(billingServiceProvider).managementUrl(uid);
      final uri = url == null ? null : Uri.tryParse(url);
      if (uri == null) {
        if (mounted) showInfoSnack(context, context.l10n.subscriptionManageUnavailable);
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e);
    } finally {
      if (mounted) setState(() => _opening = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final allPremium = ref.watch(allPremiumModeProvider);
    final entitlements = ref.watch(entitlementsProvider);
    final storeAvailable = ref.read(billingServiceProvider).available;

    return AsyncValueView<Entitlements?>(
      value: entitlements,
      onRetry: () => ref.invalidate(entitlementsProvider),
      data: (e) {
        String date(DateTime d) => fmt.longDate(clock.toWallClock(d));
        final notice = e?.downgradeNotice;
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
          children: <Widget>[
            SparkCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(l10n.subscriptionCurrent, style: text.labelLarge),
                  Text(planDisplayName(l10n, e?.plan, allPremium: allPremium), style: text.headlineSmall),
                  if (allPremium) Text(l10n.subscriptionLaunch, style: text.bodyMedium),
                  if (!allPremium && e?.inTrial == true && e?.trialEndsAt != null)
                    Text(l10n.subscriptionTrialEnds(date(e!.trialEndsAt!)), style: text.bodyMedium),
                  if (!allPremium && e?.renewsAt != null && e!.willRenew)
                    Text(l10n.subscriptionRenews(date(e.renewsAt!)), style: text.bodyMedium),
                  if (!allPremium && e?.expiresAt != null && !(e?.willRenew ?? false))
                    Text(l10n.subscriptionExpires(date(e!.expiresAt!)), style: text.bodyMedium),
                  for (final g in e?.grants ?? const <EntitlementGrant>[])
                    if (g.endsAt != null)
                      Text(
                        l10n.subscriptionGrant(planDisplayName(l10n, g.planKey, allPremium: false), date(g.endsAt!)),
                        style: text.bodySmall,
                      ),
                ],
              ),
            ),
            if (notice != null) ...<Widget>[
              const SizedBox(height: Space.m),
              SparkCard(
                tone: SparkCardTone.accent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(l10n.subscriptionDowngradeTitle, style: text.titleMedium),
                    Text(notice.message ?? l10n.bannerDowngrade, style: text.bodyMedium),
                    if (notice.lockedFeatures.isNotEmpty)
                      Text(l10n.subscriptionDowngradeLocked(notice.lockedFeatures.join(', ')), style: text.bodySmall),
                  ],
                ),
              ),
            ],
            const SizedBox(height: Space.l),
            if (storeAvailable && !allPremium)
              SparkButton.secondary(
                label: l10n.subscriptionManage,
                icon: Icons.open_in_new_rounded,
                loading: _opening,
                expand: true,
                onPressed: _manage,
              ),
            if (!allPremium) ...<Widget>[
              const SizedBox(height: Space.s),
              SparkButton(
                label: l10n.plansCompare,
                icon: Icons.compare_arrows_rounded,
                expand: true,
                onPressed: () => context.push(Routes.plans),
              ),
            ],
            if (allPremium)
              Padding(
                padding: const EdgeInsets.only(top: Space.m),
                child: Icon(Icons.celebration_rounded, size: 48, color: context.spark.accent),
              ),
          ],
        );
      },
    );
  }
}
