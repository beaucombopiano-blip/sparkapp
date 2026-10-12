import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../data/models/project.dart';
import '../utils/l10n.dart';

/// A checkable task row: checkbox, title, estimate, priority dot, due date
/// and a lock icon when prerequisites aren't done yet.
///
/// The checkbox never turns "done" on its own: it shows a spinner while
/// [completing] and only shows the check once the task's status (from the
/// live Firestore stream) is `done`.
class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    this.onToggle,
    this.completing = false,
    this.dueLabel,
    this.onTap,
    this.onMore,
    this.dense = false,
  });

  final Task task;

  /// Called when the user checks an open, unlocked task.
  final VoidCallback? onToggle;
  final bool completing;
  final String? dueLabel;
  final VoidCallback? onTap;
  final VoidCallback? onMore;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final done = task.isDone;
    final locked = task.isLocked;
    final canToggle = !done && !locked && !completing && onToggle != null;

    final priorityLabel = switch (task.priority) {
      TaskPriority.high => l10n.priorityHigh,
      TaskPriority.medium => l10n.priorityMedium,
      TaskPriority.low => l10n.priorityLow,
    };

    final meta = <Widget>[
      _MetaItem(icon: Icons.schedule_rounded, label: context.fmt.duration(task.estimatedMinutes)),
      _PriorityDot(priority: task.priority, label: priorityLabel),
      if (dueLabel != null) _MetaItem(icon: Icons.event_rounded, label: l10n.taskDueOn(dueLabel!)),
      if (locked) _MetaItem(icon: Icons.lock_rounded, label: l10n.taskLocked),
    ];

    return Semantics(
      container: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: Radii.buttonAll,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: dense ? Space.xs : Space.s),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _TaskCheckbox(
                done: done,
                locked: locked,
                completing: completing,
                onPressed: canToggle ? onToggle : null,
                semanticLabel: done ? l10n.taskDoneSemantics(task.title) : l10n.taskCompleteSemantics(task.title),
              ),
              const SizedBox(width: Space.s),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        duration: Motion.medium,
                        style: (text.bodyLarge ?? const TextStyle()).copyWith(
                          color: done ? c.textSecondary : c.textPrimary,
                          fontWeight: FontWeight.w600,
                          decoration: done ? TextDecoration.lineThrough : TextDecoration.none,
                          decorationColor: c.textSecondary,
                        ),
                        child: Text(task.title),
                      ),
                      const SizedBox(height: Space.xs),
                      Wrap(spacing: Space.m, runSpacing: Space.xs, children: meta),
                    ],
                  ),
                ),
              ),
              if (onMore != null)
                IconButton(
                  onPressed: onMore,
                  icon: Icon(Icons.more_horiz_rounded, color: c.iconMuted),
                  tooltip: l10n.commonMore,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskCheckbox extends StatelessWidget {
  const _TaskCheckbox({
    required this.done,
    required this.locked,
    required this.completing,
    required this.onPressed,
    required this.semanticLabel,
  });

  final bool done;
  final bool locked;
  final bool completing;
  final VoidCallback? onPressed;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final Widget inner;
    if (completing) {
      inner = SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(strokeWidth: 2.2, color: c.primary),
      );
    } else if (done) {
      inner = Icon(Icons.check_rounded, key: const ValueKey<String>('done'), size: 18, color: c.onPrimary);
    } else if (locked) {
      inner = Icon(Icons.lock_rounded, key: const ValueKey<String>('locked'), size: 14, color: c.iconMuted);
    } else {
      inner = const SizedBox.shrink(key: ValueKey<String>('open'));
    }

    return Semantics(
      container: true,
      checked: done,
      enabled: onPressed != null,
      label: semanticLabel,
      button: true,
      excludeSemantics: true,
      onTap: onPressed,
      child: InkResponse(
        onTap: onPressed,
        radius: 24,
        child: SizedBox.square(
          dimension: Space.minTouch,
          child: Center(
            child: AnimatedContainer(
              duration: Motion.medium,
              curve: Curves.easeOutBack,
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: done ? c.primary : const Color(0x00000000),
                border: Border.all(color: done ? c.primary : c.iconMuted, width: 2),
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: Motion.medium,
                  transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                  child: inner,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 14, color: c.iconMuted),
        const SizedBox(width: Space.xs),
        Flexible(child: Text(label, style: Theme.of(context).textTheme.bodySmall)),
      ],
    );
  }
}

/// Priority shown by shape *and* colour (filled / half / ring) plus a label
/// for screen readers, so colour is never the only signal.
class _PriorityDot extends StatelessWidget {
  const _PriorityDot({required this.priority, required this.label});
  final TaskPriority priority;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final color = switch (priority) {
      TaskPriority.high => c.danger,
      TaskPriority.medium => c.warning,
      TaskPriority.low => c.iconMuted,
    };
    final short = switch (priority) {
      TaskPriority.high => '!!',
      TaskPriority.medium => '!',
      TaskPriority.low => '',
    };
    return Tooltip(
      message: label,
      child: Semantics(
        label: label,
        excludeSemantics: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: priority == TaskPriority.low ? const Color(0x00000000) : color,
                border: Border.all(color: color, width: 2),
              ),
            ),
            if (short.isNotEmpty) ...<Widget>[
              const SizedBox(width: 2),
              Text(short, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
            ],
          ],
        ),
      ),
    );
  }
}
