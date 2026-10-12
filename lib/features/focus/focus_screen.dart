import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/models/project.dart';
import '../billing/entitlements.dart';
import '../gamification/celebration_queue.dart';
import '../project/project_providers.dart';
import '../task/task_completion.dart';

/// Coach mode: calm, distraction-free. Current task with its completion
/// criteria, a countdown for the session length (pause/resume), "Done with
/// this task" moves to the next one. No ads, and celebrations wait until the
/// session ends.
class FocusScreen extends ConsumerStatefulWidget {
  const FocusScreen({super.key, this.sessionId, this.taskId});

  final String? sessionId;
  final String? taskId;

  @override
  ConsumerState<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends ConsumerState<FocusScreen> {
  static const _pauseReason = 'focus';

  Timer? _ticker;
  Duration _elapsed = Duration.zero;
  DateTime? _runningSince;
  bool _ended = false;
  final Set<String> _completedHere = <String>{};
  Task? _lastCompleted;
  late final CelebrationQueue _queue = ref.read(celebrationQueueProvider.notifier);

  @override
  void initState() {
    super.initState();
    _queue.pause(_pauseReason);
    _start();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _queue.resume(_pauseReason);
    super.dispose();
  }

  bool get _running => _runningSince != null;

  Duration get _totalElapsed =>
      _elapsed + (_runningSince == null ? Duration.zero : DateTime.now().difference(_runningSince!));

  void _start() {
    _runningSince = DateTime.now();
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => mounted ? setState(() {}) : null);
  }

  void _pause() {
    setState(() {
      _elapsed = _totalElapsed;
      _runningSince = null;
      _ticker?.cancel();
    });
  }

  void _togglePause() => _running ? _pause() : setState(_start);

  Future<void> _done(Task task) async {
    final result = await completeTaskWithFeedback(context, ref, task, promptJournal: false);
    if (result != null && mounted) {
      setState(() {
        _completedHere.add(task.id);
        _lastCompleted = task;
      });
    }
  }

  Future<void> _confirmEnd() async {
    final l10n = context.l10n;
    final end = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.focusEndConfirmTitle),
        content: Text(l10n.focusEndConfirmBody),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(l10n.commonCancel)),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: Text(l10n.focusEnd)),
        ],
      ),
    );
    if (end ?? false) _end();
  }

  void _end() {
    _pause();
    setState(() => _ended = true);
  }

  void _close() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(Routes.dashboard);
    }
  }

  Future<void> _finish() async {
    final last = _lastCompleted;
    final journal = ref.read(hasFeatureProvider(Features.journal));
    if (last != null && journal) await showJournalPrompt(context, ref, last);
    if (mounted) _close();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;

    final AsyncValue<List<Task>> tasks;
    int? plannedMinutes;
    if (widget.sessionId != null) {
      final session = ref.watch(sessionByIdProvider(widget.sessionId!));
      final s = session.value;
      plannedMinutes = s?.durationMinutes;
      if (session.hasError) {
        tasks = AsyncValue<List<Task>>.error(session.error!, session.stackTrace ?? StackTrace.current);
      } else if (!session.hasValue) {
        tasks = const AsyncValue<List<Task>>.loading();
      } else if (s == null) {
        tasks = const AsyncValue<List<Task>>.data(<Task>[]);
      } else {
        tasks = ref.watch(tasksByIdsProvider(s.taskIds.join(',')));
      }
    } else if (widget.taskId != null) {
      final t = ref.watch(taskByIdProvider(widget.taskId!));
      plannedMinutes = t.value?.estimatedMinutes;
      tasks = t.whenData((task) => task == null ? <Task>[] : <Task>[task]);
    } else {
      tasks = const AsyncValue<List<Task>>.data(<Task>[]);
    }

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: AsyncValueView<List<Task>>(
              value: tasks,
              onRetry: () {
                if (widget.sessionId != null) ref.invalidate(sessionByIdProvider(widget.sessionId!));
                if (widget.taskId != null) ref.invalidate(taskByIdProvider(widget.taskId!));
              },
              data: (list) {
                if (list.isEmpty && !_ended) {
                  return EmptyState(
                    title: l10n.focusNotFound,
                    actionLabel: l10n.commonClose,
                    onAction: _close,
                    icon: Icons.event_busy_rounded,
                  );
                }
                return _ended
                    ? _Summary(
                        completed: _completedHere.length,
                        elapsed: _totalElapsed,
                        onFinish: _finish,
                      )
                    : _buildFocus(context, list, plannedMinutes ?? 30);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFocus(BuildContext context, List<Task> tasks, int plannedMinutes) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final completing = ref.watch(taskCompletionProvider);
    final open = tasks.where((t) => t.isOpen && !_completedHere.contains(t.id)).toList();
    final current = open.firstOrNull;
    final next = open.length > 1 ? open[1] : null;
    final remaining = Duration(minutes: plannedMinutes) - _totalElapsed;
    final timeUp = remaining <= Duration.zero;
    final clock = timeUp ? '0:00' : fmt.clock(remaining.inSeconds);

    return Padding(
      padding: const EdgeInsets.all(Space.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                tooltip: l10n.focusClose,
                onPressed: _confirmEnd,
                icon: Icon(Icons.close_rounded, color: c.textSecondary),
              ),
              const Spacer(),
              Text(l10n.focusTitle, style: text.labelLarge),
              const Spacer(),
              const SizedBox(width: Space.minTouch),
            ],
          ),
          const SizedBox(height: Space.l),
          Semantics(
            label: l10n.focusTimerSemantics(clock),
            excludeSemantics: true,
            child: Text(
              clock,
              key: const Key('focus-timer'),
              textAlign: TextAlign.center,
              style: text.displayLarge?.copyWith(fontSize: 72, fontFeatures: const <FontFeature>[FontFeature.tabularFigures()]),
            ),
          ),
          if (timeUp)
            Text(l10n.focusTimeUp, textAlign: TextAlign.center, style: text.titleMedium?.copyWith(color: c.success)),
          Center(
            child: TextButton.icon(
              key: const Key('focus-pause'),
              onPressed: timeUp ? null : _togglePause,
              icon: Icon(_running ? Icons.pause_rounded : Icons.play_arrow_rounded),
              label: Text(_running ? l10n.focusPause : l10n.focusResume),
            ),
          ),
          const SizedBox(height: Space.l),
          Expanded(
            child: SingleChildScrollView(
              child: current == null
                  ? Column(
                      children: <Widget>[
                        const SparkLogoFace(size: 88),
                        const SizedBox(height: Space.m),
                        Text(l10n.focusAllDone, style: text.headlineSmall, textAlign: TextAlign.center),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(l10n.focusCurrentTask, style: text.labelLarge),
                        const SizedBox(height: Space.xs),
                        Text(current.title, style: text.headlineMedium),
                        if (current.completionCriteria != null && current.completionCriteria!.isNotEmpty) ...<Widget>[
                          const SizedBox(height: Space.m),
                          Text(l10n.taskDoneWhen, style: text.titleSmall),
                          const SizedBox(height: Space.xs),
                          Text(current.completionCriteria!, style: text.bodyLarge?.copyWith(fontSize: 18)),
                        ],
                        if (next != null) ...<Widget>[
                          const SizedBox(height: Space.l),
                          Text(l10n.focusUpNext(next.title), style: text.bodyMedium),
                        ],
                      ],
                    ),
            ),
          ),
          if (current != null)
            SparkButton(
              key: const Key('focus-done-task'),
              label: l10n.focusDoneWithTask,
              icon: Icons.check_rounded,
              expand: true,
              loading: completing.contains(current.id),
              onPressed: current.isLocked ? null : () => _done(current),
            ),
          const SizedBox(height: Space.s),
          Row(
            children: <Widget>[
              if (ref.watch(hasFeatureProvider(Features.aiCompanion)))
                Expanded(
                  child: SparkButton.text(
                    label: l10n.focusAskCompanion,
                    icon: Icons.chat_bubble_outline_rounded,
                    onPressed: () => context.push(Routes.companion(taskId: current?.id)),
                  ),
                ),
              Expanded(
                child: SparkButton.text(label: l10n.focusEnd, icon: Icons.stop_rounded, onPressed: current == null ? _end : _confirmEnd),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.completed, required this.elapsed, required this.onFinish});

  final int completed;
  final Duration elapsed;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(Space.l),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Center(child: AnimatedSparkLogo(size: 110)),
          const SizedBox(height: Space.l),
          Semantics(header: true, child: Text(l10n.focusSummaryTitle, style: text.headlineMedium, textAlign: TextAlign.center)),
          const SizedBox(height: Space.s),
          Text(l10n.focusSummaryTasks(completed), style: text.bodyLarge, textAlign: TextAlign.center),
          Text(
            l10n.focusSummaryTime(context.fmt.duration(elapsed.inMinutes.clamp(1, 1 << 20))),
            style: text.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Space.xl),
          SparkButton(key: const Key('focus-finish'), label: l10n.focusFinish, expand: true, onPressed: onFinish),
        ],
      ),
    );
  }
}
