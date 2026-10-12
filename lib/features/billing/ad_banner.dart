import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/config/app_config.dart';
import '../../core/utils/l10n.dart';
import 'entitlements.dart';

/// A single, clearly labelled banner for plans with adsEnabled.
///
/// Allowed only on discovery screens (recommendations list, bottom of the
/// profile). Never place it on dashboard tasks, the Project tab, Agenda, focus
/// mode, companion or journal, or anywhere it could be mistaken for an AI
/// recommendation.
class SparkAdBanner extends ConsumerStatefulWidget {
  const SparkAdBanner({super.key});

  @override
  ConsumerState<SparkAdBanner> createState() => _SparkAdBannerState();
}

class _SparkAdBannerState extends ConsumerState<SparkAdBanner> {
  BannerAd? _ad;
  bool _loaded = false;
  static bool _sdkStarted = false;

  String? get _unitId {
    if (kIsWeb) return null;
    final id = switch (defaultTargetPlatform) {
      TargetPlatform.android => AppConfig.admobBannerAndroid,
      TargetPlatform.iOS => AppConfig.admobBannerIos,
      _ => '',
    };
    return id.isEmpty ? null : id;
  }

  Future<void> _load() async {
    final unit = _unitId;
    if (unit == null || _ad != null) return;
    if (!_sdkStarted) {
      _sdkStarted = true;
      await MobileAds.instance.initialize();
    }
    final ad = BannerAd(
      adUnitId: unit,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => mounted ? setState(() => _loaded = true) : null,
        onAdFailedToLoad: (ad, _) {
          ad.dispose();
          if (mounted) setState(() => _ad = null);
        },
      ),
    );
    setState(() => _ad = ad);
    await ad.load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = ref.watch(adsEnabledProvider);
    if (!enabled || _unitId == null) return const SizedBox.shrink();
    if (_ad == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _load());
      return const SizedBox.shrink();
    }
    if (!_loaded) return const SizedBox.shrink();
    final c = context.spark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Space.m),
      padding: const EdgeInsets.all(Space.xs),
      decoration: BoxDecoration(border: Border.all(color: c.border), borderRadius: Radii.smallAll),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(context.l10n.adLabel, style: Theme.of(context).textTheme.labelSmall),
          ),
          SizedBox(
            width: _ad!.size.width.toDouble(),
            height: _ad!.size.height.toDouble(),
            child: AdWidget(ad: _ad!),
          ),
        ],
      ),
    );
  }
}
