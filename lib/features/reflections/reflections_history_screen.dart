import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/states.dart';
import '../../data/models/checkins.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';

part 'reflections_history_screen.g.dart';

@riverpod
Stream<List<Checkin>> checkins(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<List<Checkin>>.value(const <Checkin>[]);
  return ref.watch(engagementRepositoryProvider).watchCheckins(uid, pid);
}

@riverpod
Stream<List<Reflection>> reflections(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<List<Reflection>>.value(const <Reflection>[]);
  return ref.watch(engagementRepositoryProvider).watchReflections(uid, pid);
}

/// History of weekly check-ins and monthly reflections.
class ReflectionsHistoryScreen extends ConsumerWidget {
  const ReflectionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final checkins = ref.watch(checkinsProvider);
    final reflections = ref.watch(reflectionsProvider);
    final hasProject = ref.watch(activeProjectIdProvider) != null;

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        if (hasProject)
          Wrap(
            spacing: Space.s,
            runSpacing: Space.s,
            children: <Widget>[
              SparkButton.secondary(label: l10n.reflectionsStartCheckin, icon: Icons.forum_rounded, onPressed: () => context.push(Routes.weeklyCheckin)),
              SparkButton.secondary(
                label: l10n.reflectionsStartMonthly,
                icon: Icons.auto_stories_rounded,
                onPressed: () => context.push(Routes.monthlyReflection),
              ),
            ],
          ),
        SectionHeader(title: l10n.reflectionsMonthly),
        AsyncValueView<List<Reflection>>(
          value: reflections,
          compact: true,
          onRetry: () => ref.invalidate(reflectionsProvider),
          data: (list) => list.isEmpty
              ? Text(l10n.reflectionsEmpty, style: text.bodyMedium)
              : Column(
                  children: <Widget>[
                    for (final r in list)
                      Padding(
                        padding: const EdgeInsets.only(bottom: Space.s),
                        child: SparkCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_monthLabel(context, r.month), style: text.titleMedium),
                              _qa(context, l10n.reflectionLearned, r.learned),
                              _qa(context, l10n.reflectionChange, r.change),
                              _qa(context, l10n.reflectionGoals, r.goals),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
        ),
        SectionHeader(title: l10n.reflectionsCheckins),
        AsyncValueView<List<Checkin>>(
          value: checkins,
          compact: true,
          onRetry: () => ref.invalidate(checkinsProvider),
          data: (list) => list.isEmpty
              ? Text(l10n.reflectionsEmpty, style: text.bodyMedium)
              : Column(
                  children: <Widget>[
                    for (final ch in list)
                      Padding(
                        padding: const EdgeInsets.only(bottom: Space.s),
                        child: SparkCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (ch.createdAt != null) Text(fmt.longDate(clock.toWallClock(ch.createdAt!)), style: text.titleSmall),
                              Text(l10n.checkinFeeling(ch.feeling), style: text.bodyMedium),
                              if (ch.challenges != null && ch.challenges!.isNotEmpty) _qa(context, l10n.checkinQ3, ch.challenges!),
                              if (ch.encouragement != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: Space.xs),
                                  child: Text(ch.encouragement!, style: text.bodyMedium?.copyWith(color: context.spark.secondary)),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }

  String _monthLabel(BuildContext context, String month) {
    final parts = month.split('-');
    if (parts.length != 2) return month;
    final y = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (y == null || m == null) return month;
    return context.fmt.monthYear(DateTime(y, m));
  }

  Widget _qa(BuildContext context, String q, String a) {
    if (a.trim().isEmpty) return const SizedBox.shrink();
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: Space.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(q, style: text.labelMedium), Text(a, style: text.bodyMedium)],
      ),
    );
  }
}
