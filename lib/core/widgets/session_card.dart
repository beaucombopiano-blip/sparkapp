import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../data/models/project.dart';
import '../utils/l10n.dart';
import 'spark_button.dart';
import 'spark_card.dart';
import 'spark_chip.dart';

/// A scheduled work session (time range, duration, status) with its tasks
/// nested inside.
class SessionCard extends StatelessWidget {
  const SessionCard({
    super.key,
    required this.session,
    required this.timeLabel,
    this.children = const <Widget>[],
    this.onMore,
    this.onStart,
    this.onRescheduleMissed,
    this.missed = false,
  });

  final WorkSession session;

  /// e.g. "4:00 PM – 5:00 PM"
  final String timeLabel;
  final List<Widget> children;
  final VoidCallback? onMore;
  final VoidCallback? onStart;
  final VoidCallback? onRescheduleMissed;

  /// Past session with unfinished tasks.
  final bool missed;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final isMissed = missed || session.status == SessionStatus.missed;
    final (String statusLabel, SparkChipTone tone, IconData icon) = switch (session.status) {
      _ when isMissed => (l10n.sessionStatusMissed, SparkChipTone.danger, Icons.report_gmailerrorred_rounded),
      SessionStatus.completed => (l10n.sessionStatusCompleted, SparkChipTone.success, Icons.check_circle_rounded),
      SessionStatus.inProgress => (l10n.sessionStatusInProgress, SparkChipTone.accent, Icons.timelapse_rounded),
      SessionStatus.cancelled => (l10n.sessionStatusCancelled, SparkChipTone.neutral, Icons.block_rounded),
      _ => (l10n.sessionStatusScheduled, SparkChipTone.primary, Icons.event_available_rounded),
    };

    return SparkCard(
      padding: const EdgeInsets.fromLTRB(Space.m, Space.s, Space.xs, Space.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.access_time_filled_rounded, color: c.secondary, size: 20),
              const SizedBox(width: Space.s),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(timeLabel, style: text.titleMedium),
                    Text(context.fmt.duration(session.durationMinutes), style: text.bodySmall),
                  ],
                ),
              ),
              SparkChip(label: statusLabel, icon: icon, tone: tone),
              if (onMore != null)
                IconButton(
                  onPressed: onMore,
                  icon: Icon(Icons.more_horiz_rounded, color: c.iconMuted),
                  tooltip: l10n.commonMore,
                )
              else
                const SizedBox(width: Space.s),
            ],
          ),
          if (children.isNotEmpty) ...<Widget>[
            const SizedBox(height: Space.xs),
            ...children,
          ],
          if (isMissed && onRescheduleMissed != null)
            Padding(
              padding: const EdgeInsets.only(top: Space.s, right: Space.s),
              child: SparkButton.secondary(
                label: l10n.agendaRescheduleUnfinished,
                icon: Icons.event_repeat_rounded,
                onPressed: onRescheduleMissed,
              ),
            )
          else if (onStart != null)
            Padding(
              padding: const EdgeInsets.only(top: Space.s, right: Space.s),
              child: SparkButton(label: l10n.sessionStart, icon: Icons.play_arrow_rounded, onPressed: onStart),
            ),
        ],
      ),
    );
  }
}
