import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';
import 'spark_button.dart';
import 'spark_logo.dart';

/// Friendly empty state: the logo face, one line, and an action.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    this.body,
    this.actionLabel,
    this.onAction,
    this.icon,
    this.compact = false,
  });

  final String title;
  final String? body;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData? icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(compact ? Space.m : Space.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null)
              Icon(icon, size: compact ? 40 : 56, color: c.iconMuted)
            else
              SparkLogoFace(size: compact ? 56 : 88),
            SizedBox(height: compact ? Space.s : Space.m),
            Text(title, style: compact ? text.titleMedium : text.titleLarge, textAlign: TextAlign.center),
            if (body != null) ...<Widget>[
              const SizedBox(height: Space.s),
              Text(body!, style: text.bodyMedium, textAlign: TextAlign.center),
            ],
            if (actionLabel != null && onAction != null) ...<Widget>[
              SizedBox(height: compact ? Space.m : Space.l),
              SparkButton(label: actionLabel!, onPressed: onAction),
            ],
          ],
        ),
      ),
    );
  }
}

/// Error with the real message and a Retry button.
class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.error, this.onRetry, this.compact = false});

  final Object error;
  final VoidCallback? onRetry;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(compact ? Space.m : Space.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.cloud_off_rounded, size: compact ? 32 : 48, color: c.iconMuted),
            const SizedBox(height: Space.s),
            Text(
              compact ? errorMessage(l10n, error) : l10n.commonSomethingWrong,
              style: compact ? text.bodyMedium : text.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (!compact) ...<Widget>[
              const SizedBox(height: Space.xs),
              Text(errorMessage(l10n, error), style: text.bodyMedium, textAlign: TextAlign.center),
            ],
            if (onRetry != null) ...<Widget>[
              const SizedBox(height: Space.m),
              SparkButton.secondary(label: l10n.commonRetry, icon: Icons.refresh_rounded, onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}

/// Shimmering placeholder rows shown while data loads.
class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key, this.itemCount = 4, this.itemHeight = 64, this.shrinkWrap = false});

  final int itemCount;
  final double itemHeight;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final rows = Column(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
        itemCount,
        (i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.xs),
          child: Container(
            height: itemHeight,
            decoration: BoxDecoration(color: c.surfaceAlt, borderRadius: Radii.cardAll),
          ),
        ),
      ),
    );
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final content = Semantics(
      label: context.l10n.loadingSemantics,
      child: reduceMotion
          ? rows
          : Shimmer.fromColors(baseColor: c.surfaceAlt, highlightColor: c.surface, child: rows),
    );
    return shrinkWrap ? content : SingleChildScrollView(padding: const EdgeInsets.all(Space.m), child: content);
  }
}

/// Renders an [AsyncValue] with consistent loading, error (with Retry) and
/// data states.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
    this.loading,
    this.compact = false,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;
  final Widget? loading;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (value.hasError && !value.isLoading) {
      return ErrorState(error: value.error!, onRetry: onRetry, compact: compact);
    }
    if (value.hasValue) return data(value.requireValue);
    return loading ?? SkeletonList(itemCount: compact ? 2 : 4, shrinkWrap: compact);
  }
}
