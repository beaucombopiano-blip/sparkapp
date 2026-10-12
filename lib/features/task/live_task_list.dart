import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/task_tile.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import 'task_completion.dart';

/// A list of checkable tasks that keeps a just-completed task visible for a
/// moment so the user sees the check animate before it leaves the list.
/// Completion goes through [completeTaskWithFeedback], so behaviour is
/// identical on the dashboard, project tab and agenda.
class LiveTaskList extends ConsumerStatefulWidget {
  const LiveTaskList({
    super.key,
    required this.tasks,
    this.empty,
    this.showDue = true,
    this.onMore,
    this.dense = false,
  });

  final List<Task> tasks;
  final Widget? empty;
  final bool showDue;
  final void Function(Task task)? onMore;
  final bool dense;

  @override
  ConsumerState<LiveTaskList> createState() => _LiveTaskListState();
}

class _LiveTaskListState extends ConsumerState<LiveTaskList> {
  final Map<String, Task> _justDone = <String, Task>{};
  List<String> _order = <String>[];
  final List<Timer> _timers = <Timer>[];

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    super.dispose();
  }

  Future<void> _complete(Task task) async {
    final result = await completeTaskWithFeedback(context, ref, task);
    if (result == null || !mounted) return;
    setState(() => _justDone[task.id] = task.copyWith(status: TaskStatus.done));
    _timers.add(Timer(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => _justDone.remove(task.id));
    }));
  }

  List<Task> _merged() {
    final current = <String, Task>{for (final t in widget.tasks) t.id: t};
    final result = <Task>[];
    for (final id in _order) {
      final t = current.remove(id) ?? _justDone[id];
      if (t != null) result.add(_justDone[id] ?? t);
    }
    result.addAll(current.values);
    _order = result.map((t) => t.id).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final completing = ref.watch(taskCompletionProvider);
    final clock = ref.watch(userClockProvider);
    final fmt = context.fmt;
    final today = clock.today();
    final tasks = _merged();
    if (tasks.isEmpty) return widget.empty ?? const SizedBox.shrink();

    return Column(
      children: <Widget>[
        for (final task in tasks)
          AnimatedOpacity(
            key: ValueKey<String>(task.id),
            duration: Motion.slow,
            opacity: 1,
            child: TaskTile(
              task: task,
              dense: widget.dense,
              completing: completing.contains(task.id),
              dueLabel: widget.showDue && task.suggestedDate != null
                  ? fmt.dayLabel(clock.dayOf(task.suggestedDate!), today)
                  : null,
              onToggle: () => _complete(task),
              onTap: () => context.push(Routes.task(task.id)),
              onMore: widget.onMore == null ? null : () => widget.onMore!(task),
            ),
          ),
      ],
    );
  }
}
