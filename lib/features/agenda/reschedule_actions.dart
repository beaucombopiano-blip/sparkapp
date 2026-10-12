import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/utils/user_clock.dart';
import '../../core/widgets/pickers.dart';
import '../../data/models/project.dart';
import '../../data/models/schedule.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/schedule_repository.dart';
import '../project/project_providers.dart';
import '../project/proposal_sheet.dart';

/// What the user wants to move.
class RescheduleTarget {
  const RescheduleTarget.session(WorkSession this.session) : task = null;
  const RescheduleTarget.task(Task this.task) : session = null;

  final WorkSession? session;
  final Task? task;

  int minutes(List<Task> sessionTasks) =>
      task?.estimatedMinutes ??
      sessionTasks.where((t) => t.isOpen).fold<int>(0, (sum, t) => sum + t.estimatedMinutes);

  RescheduleItems scope(LocalDay? day) => session != null
      ? RescheduleItems(sessionId: session!.id, targetDay: day)
      : RescheduleItems(taskIds: <String>[task!.id], targetDay: day);
}

/// "⋯" / long-press menu: Move to another day · Find a new time · Open task.
Future<void> showRescheduleMenu(
  BuildContext context,
  WidgetRef ref,
  RescheduleTarget target, {
  List<Task> sessionTasks = const <Task>[],
}) async {
  final l10n = context.l10n;
  final choice = await showModalBottomSheet<String>(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.event_rounded),
            title: Text(l10n.agendaMoveDay),
            onTap: () => Navigator.of(context).pop('move'),
          ),
          ListTile(
            leading: const Icon(Icons.auto_fix_high_rounded),
            title: Text(l10n.agendaFindTime),
            onTap: () => Navigator.of(context).pop('find'),
          ),
          if (target.task != null)
            ListTile(
              leading: const Icon(Icons.open_in_new_rounded),
              title: Text(l10n.agendaOpenTask),
              onTap: () => Navigator.of(context).pop('open'),
            ),
          const SizedBox(height: Space.s),
        ],
      ),
    ),
  );
  if (!context.mounted || choice == null) return;
  switch (choice) {
    case 'move':
      await moveToAnotherDay(context, ref, target, sessionTasks: sessionTasks);
    case 'find':
      await requestReschedule(context, ref, target.scope(null));
    case 'open':
      await context.push(Routes.task(target.task!.id));
  }
}

/// Date picker limited to days with availability. Refuses to overload a day
/// beyond its available minutes (shows a warning instead), then asks the
/// backend for a proposal and shows it for confirmation.
Future<void> moveToAnotherDay(
  BuildContext context,
  WidgetRef ref,
  RescheduleTarget target, {
  List<Task> sessionTasks = const <Task>[],
}) async {
  final l10n = context.l10n;
  final clock = ref.read(userClockProvider);
  final slots = ref.read(availabilityProvider).value ?? const <AvailabilitySlot>[];
  final exceptions = ref.read(availabilityExceptionsProvider).value ?? const <AvailabilityException>[];
  final project = ref.read(activeProjectProvider).value;
  if (slots.isEmpty) {
    showInfoSnack(context, l10n.agendaNoAvailability);
    return;
  }
  final today = clock.today();
  final last = project?.targetEndDate == null ? today.addDays(365) : clock.dayOf(project!.targetEndDate!);
  bool selectable(DateTime d) =>
      availableMinutesOn(LocalDay.fromDateTime(d), slots, exceptions, clock) > 0;

  final picked = await showSparkDatePicker(
    context,
    initial: today.addDays(1).asDateTime,
    first: today.asDateTime,
    last: (last.isBefore(today) ? today.addDays(30) : last).asDateTime,
    selectable: selectable,
  );
  if (picked == null || !context.mounted) return;
  final day = LocalDay.fromDateTime(picked);

  // Overload check against what's already planned that day.
  final scope = ref.read(activePlanScopeProvider);
  if (scope != null) {
    final range = clock.rangeForDay(day);
    try {
      final planned = await ref
          .read(projectRepositoryProvider)
          .watchTasksInRange(scope.uid, scope.projectId, scope.version, range)
          .first;
      final plannedMinutes = planned
          .where((t) => t.isOpen && t.id != target.task?.id && !(target.session?.taskIds.contains(t.id) ?? false))
          .fold<int>(0, (sum, t) => sum + t.estimatedMinutes);
      final available = availableMinutesOn(day, slots, exceptions, clock);
      final moving = target.minutes(sessionTasks);
      if (plannedMinutes + moving > available && context.mounted) {
        final fmt = context.fmt;
        final findInstead = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.agendaDayFull),
            content: Text(l10n.agendaDayFullBody(
              fmt.fullDay(day.asDateTime),
              fmt.duration(plannedMinutes),
              fmt.duration(available),
            )),
            actions: <Widget>[
              TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.commonCancel)),
              FilledButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.agendaFindTime)),
            ],
          ),
        );
        if ((findInstead ?? false) && context.mounted) {
          await requestReschedule(context, ref, target.scope(null));
        }
        return;
      }
    } on Object catch (e) {
      if (context.mounted) showErrorSnack(context, e);
      return;
    }
  }
  if (context.mounted) await requestReschedule(context, ref, target.scope(day));
}

/// Calls `reschedule`, then shows the proposal. Nothing changes until the
/// user confirms (applyProposal).
Future<void> requestReschedule(BuildContext context, WidgetRef ref, RescheduleScope scope) async {
  final projectId = ref.read(activeProjectIdProvider);
  if (projectId == null) return;
  final l10n = context.l10n;
  final messenger = ScaffoldMessenger.maybeOf(context);
  messenger?.showSnackBar(SnackBar(content: Text(l10n.agendaFinding), duration: const Duration(seconds: 30)));
  try {
    final proposal = await ref.read(scheduleRepositoryProvider).reschedule(projectId, scope);
    messenger?.hideCurrentSnackBar();
    if (context.mounted) await showProposalSheet(context, proposal);
  } on Object catch (e) {
    messenger?.hideCurrentSnackBar();
    if (context.mounted) showErrorSnack(context, e, onRetry: () => requestReschedule(context, ref, scope));
  }
}
