import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/l10n.dart';
import '../../core/widgets/celebration_overlay.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/models/gamification.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/engagement_repository.dart';

part 'celebration_queue.g.dart';

@immutable
class QueuedCelebration {
  const QueuedCelebration({required this.title, this.message, this.badgeName, this.serverId});

  final String title;
  final String? message;
  final String? badgeName;

  /// Id from getHomeDashboard.unreadCelebrations, marked seen after showing.
  final String? serverId;
}

@immutable
class CelebrationQueueState {
  const CelebrationQueueState({this.items = const <QueuedCelebration>[], this.pausedBy = const <String>{}});

  final List<QueuedCelebration> items;

  /// Reasons the queue is paused (e.g. "focus"). Celebrations wait until
  /// every reason is cleared.
  final Set<String> pausedBy;

  bool get paused => pausedBy.isNotEmpty;
  QueuedCelebration? get current => paused || items.isEmpty ? null : items.first;
}

/// Milestones, badges, streaks and challenge wins queue here and show one at
/// a time. Focus mode pauses the queue so nothing pops mid-session.
@Riverpod(keepAlive: true)
class CelebrationQueue extends _$CelebrationQueue {
  @override
  CelebrationQueueState build() => const CelebrationQueueState();

  final Set<String> _seenServerIds = <String>{};

  void add(QueuedCelebration celebration) {
    if (celebration.serverId != null && !_seenServerIds.add(celebration.serverId!)) return;
    state = CelebrationQueueState(items: <QueuedCelebration>[...state.items, celebration], pausedBy: state.pausedBy);
  }

  void addAll(Iterable<QueuedCelebration> celebrations) {
    for (final c in celebrations) {
      add(c);
    }
  }

  /// Queues celebrations from a completeTask result.
  void addFromTaskResult(CompleteTaskResult result, AppLocalizations l10n) {
    if (result.milestoneCompleted != null) {
      add(QueuedCelebration(
        title: l10n.celebrateMilestoneTitle,
        message: result.milestoneCompleted!.title,
      ));
    }
    for (final badge in result.newlyEarnedBadges) {
      add(QueuedCelebration(
        title: l10n.celebrateBadgeTitle,
        message: badge.description,
        badgeName: badge.name,
      ));
    }
    if (result.projectCompleted) {
      add(QueuedCelebration(title: l10n.celebrateProjectCompleteTitle, message: l10n.celebrateProjectCompleteBody));
    }
  }

  void addServerCelebrations(List<Celebration> celebrations, AppLocalizations l10n) {
    for (final c in celebrations) {
      add(QueuedCelebration(
        title: c.title.isNotEmpty ? c.title : l10n.celebrateBadgeTitle,
        message: c.message,
        badgeName: c.kind == CelebrationKind.badge ? c.title : null,
        serverId: c.id,
      ));
    }
  }

  void pause(String reason) =>
      state = CelebrationQueueState(items: state.items, pausedBy: <String>{...state.pausedBy, reason});

  void resume(String reason) =>
      state = CelebrationQueueState(items: state.items, pausedBy: <String>{...state.pausedBy}..remove(reason));

  void dismissCurrent() {
    if (state.items.isEmpty) return;
    final current = state.items.first;
    state = CelebrationQueueState(items: state.items.sublist(1), pausedBy: state.pausedBy);
    final id = current.serverId;
    if (id != null) {
      ref.read(engagementRepositoryProvider).markCelebrationsSeen(<String>[id]).ignore();
    }
  }
}

/// Shows the head of the celebration queue above everything.
class CelebrationHost extends ConsumerWidget {
  const CelebrationHost({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(celebrationQueueProvider.select((s) => s.current));
    final character = ref.watch(selectedCharacterProvider);
    ref.listen(celebrationQueueProvider.select((s) => s.current), (prev, next) {
      if (next != null && prev != next) Haptics.celebrate();
    });
    return Stack(
      children: <Widget>[
        child,
        if (current != null)
          Positioned.fill(
            child: CelebrationOverlay(
              key: ObjectKey(current),
              title: current.title,
              message: current.message,
              badgeName: current.badgeName,
              character: character,
              onContinue: () => ref.read(celebrationQueueProvider.notifier).dismissCurrent(),
            ),
          ),
      ],
    );
  }
}
