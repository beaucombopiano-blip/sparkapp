import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/models/discovery.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/discovery_repository.dart';
import '../billing/ad_banner.dart';
import '../onboarding/onboarding_frame.dart';
import 'selection.dart';

part 'recommendations_step.g.dart';

@riverpod
Stream<List<Recommendation>> recommendations(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<Recommendation>>.value(const <Recommendation>[]);
  return ref.watch(discoveryRepositoryProvider).watchRecommendations(uid);
}

/// 10 personalised ideas per batch. "Generate more ideas" adds another batch
/// below (never repeats the quiz); errors keep existing cards visible.
class RecommendationsStep extends ConsumerStatefulWidget {
  const RecommendationsStep({super.key});

  @override
  ConsumerState<RecommendationsStep> createState() => _RecommendationsStepState();
}

class _RecommendationsStepState extends ConsumerState<RecommendationsStep> {
  bool _generating = false;
  Object? _generateError;
  bool _requestedFirst = false;

  String? get _sessionId =>
      ref.read(userProfileProvider).value?.onboardingAnswers['assessmentSessionId'] as String?;

  Future<void> _generate({int? batch}) async {
    final sessionId = _sessionId;
    if (sessionId == null || _generating) return;
    setState(() {
      _generating = true;
      _generateError = null;
    });
    try {
      await ref.read(discoveryRepositoryProvider).recommendProjects(sessionId: sessionId, batch: batch);
    } on Object catch (e) {
      if (mounted) setState(() => _generateError = e);
    } finally {
      if (mounted) setState(() => _generating = false);
    }
  }

  void _openDetail(Recommendation rec) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RecommendationDetailSheet(recommendation: rec),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final recs = ref.watch(recommendationsProvider);

    // First visit: generate the first batch automatically.
    if (recs.hasValue && recs.requireValue.isEmpty && !_requestedFirst) {
      _requestedFirst = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _generate(batch: 1));
    }

    final list = recs.value ?? const <Recommendation>[];
    final maxBatch = list.fold<int>(0, (m, r) => r.batch > m ? r.batch : m);

    Widget content;
    if (recs.hasError && list.isEmpty) {
      content = ErrorState(error: recs.error!, onRetry: () => ref.invalidate(recommendationsProvider));
    } else if (list.isEmpty) {
      content = _generateError != null
          ? ErrorState(error: _generateError!, onRetry: () => _generate(batch: 1))
          : const ThinkingLoader();
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (final rec in list) ...<Widget>[
            RecommendationCard(recommendation: rec, onTap: () => _openDetail(rec)),
            const SizedBox(height: Space.s),
          ],
          const SparkAdBanner(),
          if (_generating)
            Padding(
              padding: const EdgeInsets.all(Space.m),
              child: Column(
                children: <Widget>[
                  const AnimatedSparkLogo(size: 56, loop: true, thinking: true),
                  const SizedBox(height: Space.s),
                  Text(l10n.recommendationsMoreLoading, textAlign: TextAlign.center),
                ],
              ),
            )
          else ...<Widget>[
            if (_generateError != null) ErrorState(error: _generateError!, compact: true),
            SparkButton.secondary(
              key: const Key('generate-more'),
              label: _generateError != null ? l10n.commonRetry : l10n.recommendationsMore,
              icon: Icons.auto_awesome_rounded,
              expand: true,
              onPressed: () => _generate(batch: maxBatch + 1),
            ),
          ],
        ],
      );
    }

    return OnboardingFrame(
      step: OnboardingStep.recommendations,
      title: l10n.recommendationsTitle,
      subtitle: list.isEmpty ? null : l10n.recommendationsBody,
      child: content,
    );
  }
}

/// The logo face thinking with rotating friendly lines.
class ThinkingLoader extends StatefulWidget {
  const ThinkingLoader({super.key, this.lines});

  final List<String>? lines;

  @override
  State<ThinkingLoader> createState() => _ThinkingLoaderState();
}

class _ThinkingLoaderState extends State<ThinkingLoader> {
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2400), (_) => setState(() => _index++));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final lines = widget.lines ??
        <String>[
          l10n.recommendationsLoading1,
          l10n.recommendationsLoading2,
          l10n.recommendationsLoading3,
          l10n.recommendationsLoading4,
        ];
    final line = lines[_index % lines.length];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.xl),
      child: Column(
        children: <Widget>[
          const AnimatedSparkLogo(size: 110, loop: true, thinking: true),
          const SizedBox(height: Space.l),
          Semantics(
            liveRegion: true,
            child: AnimatedSwitcher(
              duration: Motion.slow,
              child: Text(
                line,
                key: ValueKey<String>(line),
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String difficultyLabel(AppLocalizations l10n, Difficulty d) => switch (d) {
      Difficulty.starter => l10n.difficultyStarter,
      Difficulty.stretch => l10n.difficultyStretch,
      Difficulty.ambitious => l10n.difficultyAmbitious,
    };

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key, required this.recommendation, required this.onTap});

  final Recommendation recommendation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final r = recommendation;
    return SparkCard(
      onTap: onTap,
      semanticLabel: r.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(r.title, style: text.titleMedium),
          const SizedBox(height: Space.xs),
          Text(r.description, style: text.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: Space.s),
          Wrap(
            spacing: Space.s,
            runSpacing: Space.xs,
            children: <Widget>[
              SparkChip(label: difficultyLabel(l10n, r.difficulty), icon: Icons.terrain_rounded),
              if (r.estimatedTotalHours != null)
                SparkChip(label: l10n.recommendationHours(r.estimatedTotalHours!), icon: Icons.schedule_rounded),
            ],
          ),
          if (r.whyItMatches.isNotEmpty) ...<Widget>[
            const SizedBox(height: Space.s),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.favorite_rounded, size: 16, color: c.accent),
                const SizedBox(width: Space.xs),
                Expanded(
                  child: Text(r.whyItMatches, style: text.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class RecommendationDetailSheet extends ConsumerStatefulWidget {
  const RecommendationDetailSheet({super.key, required this.recommendation});

  final Recommendation recommendation;

  @override
  ConsumerState<RecommendationDetailSheet> createState() => _RecommendationDetailSheetState();
}

class _RecommendationDetailSheetState extends ConsumerState<RecommendationDetailSheet> {
  bool _busy = false;

  Future<void> _choose() async {
    setState(() => _busy = true);
    try {
      await confirmSelection(
        ref,
        fromStep: OnboardingStep.recommendations,
        select: (repo) => repo.selectProject(recommendationId: widget.recommendation.id),
      );
      if (mounted) Navigator.of(context).pop();
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _choose);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final r = widget.recommendation;

    Widget section(String title, String? body, IconData icon) {
      if (body == null || body.trim().isEmpty) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.only(bottom: Space.m),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(icon, color: context.spark.secondary),
            const SizedBox(width: Space.s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: text.labelLarge),
                  const SizedBox(height: 2),
                  Text(body, style: text.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      builder: (context, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
        children: <Widget>[
          Text(r.title, style: text.headlineSmall),
          const SizedBox(height: Space.s),
          Wrap(
            spacing: Space.s,
            runSpacing: Space.xs,
            children: <Widget>[
              SparkChip(label: difficultyLabel(l10n, r.difficulty), icon: Icons.terrain_rounded),
              if (r.estimatedTotalHours != null)
                SparkChip(label: l10n.recommendationHours(r.estimatedTotalHours!), icon: Icons.schedule_rounded),
              if (r.matchScore != null)
                SparkChip(
                  label: l10n.recommendationMatch(context.fmt.percent(r.matchScore!.clamp(0, 1))),
                  icon: Icons.bolt_rounded,
                  tone: SparkChipTone.accent,
                ),
            ],
          ),
          const SizedBox(height: Space.m),
          Text(r.description, style: text.bodyLarge),
          const SizedBox(height: Space.m),
          section(l10n.recommendationWhy, r.whyItMatches, Icons.favorite_rounded),
          section(l10n.recommendationCreate, r.tangibleOutcome, Icons.inventory_2_rounded),
          section(l10n.recommendationFirstStep, r.suggestedFirstStep, Icons.flag_rounded),
          section(l10n.recommendationAudience, r.audienceOrImpact, Icons.groups_rounded),
          section(l10n.recommendationParentNote, r.parentNote, Icons.info_rounded),
          const SizedBox(height: Space.s),
          SparkButton(
            key: const Key('choose-project'),
            label: l10n.recommendationChoose,
            icon: Icons.check_rounded,
            loading: _busy,
            expand: true,
            onPressed: _choose,
          ),
        ],
      ),
    );
  }
}
