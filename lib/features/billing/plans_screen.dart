import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:purchases_flutter/purchases_flutter.dart' show Package;

import '../../app/shell/page_scaffold.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/models/billing.dart';
import '../../data/providers/session_providers.dart';
import 'billing_service.dart';
import 'entitlements.dart';

/// ISO-8601 subscription period ("P1M") → localised unit.
String periodLabel(AppLocalizations l10n, String? iso) {
  if (iso == null) return l10n.periodMonth;
  if (iso.endsWith('Y')) return l10n.periodYear;
  if (iso.endsWith('W') || iso == 'P7D') return l10n.periodWeek;
  return l10n.periodMonth;
}

/// Plan comparison built from getPlanCatalog plus RevenueCat offerings.
/// Hidden (informational only) in all_premium mode.
class PlansScreen extends ConsumerWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final allPremium = ref.watch(allPremiumModeProvider);
    return SparkPageScaffold(
      title: l10n.titlePlans,
      body: allPremium
          ? EmptyState(title: l10n.plansAllPremium, icon: Icons.celebration_rounded)
          : const PlanComparison(),
    );
  }
}

class PlanComparison extends ConsumerStatefulWidget {
  const PlanComparison({super.key});

  @override
  ConsumerState<PlanComparison> createState() => _PlanComparisonState();
}

class _PlanComparisonState extends ConsumerState<PlanComparison> {
  String? _purchasing;
  String? _awaitingPlan;
  bool _restoring = false;

  Future<void> _buy(BillingPlan plan, Package package) async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    setState(() => _purchasing = plan.key);
    try {
      await ref.read(billingServiceProvider).purchase(uid, package);
      // The webhook updates entitlements; the UI waits for that document.
      if (mounted) setState(() => _awaitingPlan = plan.key);
    } on AppException catch (e) {
      if (!e.isCancelled && mounted) showErrorSnack(context, e, onRetry: () => _buy(plan, package));
    } finally {
      if (mounted) setState(() => _purchasing = null);
    }
  }

  Future<void> _restore() async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    setState(() => _restoring = true);
    try {
      await ref.read(billingServiceProvider).restore(uid);
      if (mounted) showInfoSnack(context, context.l10n.plansRestored);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e);
    } finally {
      if (mounted) setState(() => _restoring = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final catalog = ref.watch(planCatalogProvider);
    final offerings = ref.watch(storeOfferingsProvider);
    final currentPlan = ref.watch(entitlementsProvider.select((e) => e.value?.plan));
    final wide = MediaQuery.sizeOf(context).width >= Breakpoints.expanded;
    final storeAvailable = ref.read(billingServiceProvider).available;

    return AsyncValueView<PlanCatalog>(
      value: catalog,
      onRetry: () => ref.invalidate(planCatalogProvider),
      data: (cat) {
        final plans = List<BillingPlan>.of(cat.plans)..sort((a, b) => a.rank.compareTo(b.rank));
        final cards = <Widget>[
          for (final plan in plans)
            _PlanCard(
              plan: plan,
              features: cat.features,
              package: packageForPlan(plan, offerings.value),
              current: plan.key == currentPlan,
              purchasing: _purchasing == plan.key,
              pending: _awaitingPlan == plan.key && currentPlan != plan.key,
              onBuy: _buy,
            ),
        ];
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
          children: <Widget>[
            Text(l10n.plansTitle, style: text.headlineSmall),
            const SizedBox(height: Space.xs),
            Text(l10n.plansBody, style: text.bodyMedium),
            const SizedBox(height: Space.m),
            if (!storeAvailable) Text(l10n.plansStoreUnavailable, style: text.bodySmall),
            if (offerings.hasError) ErrorState(error: offerings.error!, compact: true, onRetry: () => ref.invalidate(storeOfferingsProvider)),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (final card in cards) Expanded(child: Padding(padding: const EdgeInsets.all(Space.xs), child: card)),
                ],
              )
            else
              for (final card in cards) Padding(padding: const EdgeInsets.only(bottom: Space.m), child: card),
            const SizedBox(height: Space.m),
            Text(cat.cancellationTerms ?? l10n.plansTerms, style: text.bodySmall),
            if (storeAvailable)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: _restoring ? null : _restore, child: Text(l10n.plansRestore)),
              ),
          ],
        );
      },
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.plan,
    required this.features,
    required this.package,
    required this.current,
    required this.purchasing,
    required this.pending,
    required this.onBuy,
  });

  final BillingPlan plan;
  final List<BillingFeature> features;
  final Package? package;
  final bool current;
  final bool purchasing;
  final bool pending;
  final void Function(BillingPlan plan, Package package) onBuy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final product = package?.storeProduct;
    final free = plan.rank == 0 || plan.key == 'basic';
    final period = periodLabel(l10n, product?.subscriptionPeriod);
    final hasTrial = plan.trialDays > 0;

    Widget? cta;
    if (!free && !current) {
      if (product == null) {
        cta = Text(l10n.plansPriceUnavailable, style: text.bodySmall);
      } else {
        cta = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SparkButton(
              key: Key('plan-buy-${plan.key}'),
              label: hasTrial
                  ? l10n.plansStartTrial(product.priceString, period)
                  : l10n.plansSubscribe(product.priceString, period),
              loading: purchasing,
              expand: true,
              onPressed: () => onBuy(plan, package!),
            ),
            if (hasTrial)
              Padding(
                padding: const EdgeInsets.only(top: Space.xs),
                child: Text(l10n.plansTrialTerms(product.priceString, period), style: text.bodySmall),
              ),
          ],
        );
      }
    }

    return SparkCard(
      tone: current ? SparkCardTone.tinted : SparkCardTone.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text(plan.name, style: text.titleLarge)),
              if (current) SparkChip(label: l10n.plansCurrent, icon: Icons.check_rounded, tone: SparkChipTone.success),
            ],
          ),
          if (plan.description != null) Text(plan.description!, style: text.bodyMedium),
          const SizedBox(height: Space.s),
          Text(free ? l10n.plansFree : (product == null ? '' : '${product.priceString} / $period'), style: text.headlineSmall),
          if (hasTrial && !free) SparkChip(label: l10n.plansTrial(plan.trialDays), icon: Icons.card_giftcard_rounded, tone: SparkChipTone.accent),
          const SizedBox(height: Space.s),
          for (final f in features)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: <Widget>[
                  Icon(
                    plan.features.contains(f.key) ? Icons.check_circle_rounded : Icons.remove_circle_outline_rounded,
                    size: 18,
                    color: plan.features.contains(f.key) ? c.success : c.iconMuted,
                    semanticLabel: plan.features.contains(f.key) ? l10n.commonYes : l10n.commonNo,
                  ),
                  const SizedBox(width: Space.s),
                  Expanded(child: Text(f.name, style: text.bodyMedium)),
                ],
              ),
            ),
          const SizedBox(height: Space.m),
          if (pending)
            Row(
              children: <Widget>[
                const SparkLogoFace(size: 28),
                const SizedBox(width: Space.s),
                Expanded(child: Text(l10n.plansPending, style: text.bodyMedium)),
              ],
            )
          else
            ?cta,
        ],
      ),
    );
  }
}
