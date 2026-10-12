import 'package:material_ui/material_ui.dart';

import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';
import 'spark_button.dart';

/// A bottom sheet asking the user to confirm an action. When [onConfirm] is
/// given, the sheet stays open with a spinner until it completes and shows
/// the real error (with Retry) if it fails. Resolves to true only on success.
Future<bool> showConfirmSheet(
  BuildContext context, {
  required String title,
  String? body,
  Widget? content,
  required String confirmLabel,
  bool destructive = false,
  Future<void> Function()? onConfirm,
}) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => _ConfirmSheet(
      title: title,
      body: body,
      content: content,
      confirmLabel: confirmLabel,
      destructive: destructive,
      onConfirm: onConfirm,
    ),
  );
  return result ?? false;
}

class _ConfirmSheet extends StatefulWidget {
  const _ConfirmSheet({
    required this.title,
    required this.body,
    required this.content,
    required this.confirmLabel,
    required this.destructive,
    required this.onConfirm,
  });

  final String title;
  final String? body;
  final Widget? content;
  final String confirmLabel;
  final bool destructive;
  final Future<void> Function()? onConfirm;

  @override
  State<_ConfirmSheet> createState() => _ConfirmSheetState();
}

class _ConfirmSheetState extends State<_ConfirmSheet> {
  bool _busy = false;
  Object? _error;

  Future<void> _confirm() async {
    final action = widget.onConfirm;
    if (action == null) {
      Navigator.of(context).pop(true);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
      if (mounted) Navigator.of(context).pop(true);
    } on Object catch (e) {
      if (mounted) {
        setState(() {
          _busy = false;
          _error = e;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Space.l,
        0,
        Space.l,
        Space.l + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Semantics(header: true, child: Text(widget.title, style: text.titleLarge)),
            if (widget.body != null) ...<Widget>[
              const SizedBox(height: Space.s),
              Text(widget.body!, style: text.bodyMedium),
            ],
            if (widget.content != null) ...<Widget>[
              const SizedBox(height: Space.m),
              widget.content!,
            ],
            if (_error != null) ...<Widget>[
              const SizedBox(height: Space.m),
              Semantics(
                liveRegion: true,
                child: Text(
                  errorMessage(l10n, _error!),
                  style: text.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
            const SizedBox(height: Space.l),
            if (widget.destructive)
              SparkButton.destructive(
                label: _error != null ? l10n.commonRetry : widget.confirmLabel,
                onPressed: _confirm,
                loading: _busy,
                expand: true,
              )
            else
              SparkButton(
                label: _error != null ? l10n.commonRetry : widget.confirmLabel,
                onPressed: _confirm,
                loading: _busy,
                expand: true,
              ),
            const SizedBox(height: Space.s),
            SparkButton.text(
              label: l10n.commonCancel,
              onPressed: _busy ? null : () => Navigator.of(context).pop(false),
              expand: true,
            ),
          ],
        ),
      ),
    );
  }
}
