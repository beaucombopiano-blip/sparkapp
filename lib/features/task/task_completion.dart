import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/project_repository.dart';
import '../gamification/celebration_queue.dart';
import '../journal/add_journal_entry.dart';

part 'task_completion.g.dart';

/// Task ids with a completeTask call in flight. Every TaskTile (dashboard,
/// project tab, agenda, task detail, focus mode) reads this same provider.
@Riverpod(keepAlive: true)
class TaskCompletion extends _$TaskCompletion {
  @override
  Set<String> build() => const <String>{};

  /// Calls completeTask. Returns the backend result; throws on failure.
  /// The task only shows as done once the live Firestore stream says so.
  Future<CompleteTaskResult> complete(String projectId, String taskId) async {
    if (state.contains(taskId)) throw StateError('already completing');
    state = <String>{...state, taskId};
    try {
      return await ref.read(projectRepositoryProvider).completeTask(projectId, taskId);
    } finally {
      state = <String>{...state}..remove(taskId);
    }
  }

  Future<void> undo(String projectId, String taskId) async {
    state = <String>{...state, taskId};
    try {
      await ref.read(projectRepositoryProvider).undoCompleteTask(projectId, taskId);
    } finally {
      state = <String>{...state}..remove(taskId);
    }
  }
}

/// Completes [task] with the full SPARK feedback loop: animated check (from
/// the live stream), haptics, queued celebrations (badges, milestones) and
/// the "Add a photo to your journal?" prompt. Errors show the real message
/// with Retry. Identical everywhere a task can be checked.
Future<CompleteTaskResult?> completeTaskWithFeedback(
  BuildContext context,
  WidgetRef ref,
  Task task, {
  bool promptJournal = true,
}) async {
  final projectId = task.projectId ?? ref.read(activeProjectIdProvider);
  if (projectId == null) return null;
  final l10n = context.l10n;
  try {
    final result = await ref.read(taskCompletionProvider.notifier).complete(projectId, task.id);
    await Haptics.success();
    ref.read(celebrationQueueProvider.notifier).addFromTaskResult(result, l10n);
    if (promptJournal && result.promptJournal && context.mounted) {
      await showJournalPrompt(context, ref, task);
    }
    return result;
  } on StateError {
    return null; // Already in flight.
  } on Object catch (e) {
    if (context.mounted) {
      showErrorSnack(context, e, onRetry: () => completeTaskWithFeedback(context, ref, task, promptJournal: promptJournal));
    }
    return null;
  }
}

/// Bottom sheet: "Add a photo to your journal?" (Add photo / Not now).
Future<void> showJournalPrompt(BuildContext context, WidgetRef ref, Task task) async {
  final l10n = context.l10n;
  final add = await showModalBottomSheet<bool>(
    context: context,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(child: AnimatedSparkLogo(size: 64)),
            const SizedBox(height: Space.s),
            Text(l10n.journalPromptTitle, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: Space.xs),
            Text(l10n.journalPromptBody, textAlign: TextAlign.center),
            const SizedBox(height: Space.l),
            SparkButton(
              key: const Key('journal-prompt-add'),
              label: l10n.journalPromptAdd,
              icon: Icons.add_a_photo_rounded,
              expand: true,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            SparkButton.text(label: l10n.commonNotNow, expand: true, onPressed: () => Navigator.of(context).pop(false)),
          ],
        ),
      ),
    ),
  );
  if ((add ?? false) && context.mounted) {
    await showAddJournalEntrySheet(context, taskId: task.id, milestoneId: task.milestoneId);
  }
}
