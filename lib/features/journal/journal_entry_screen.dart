import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:pdfx/pdfx.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/confirm_sheet.dart';
import '../../core/widgets/legacy_material_bridge.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/states.dart';
import '../../data/models/journal.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/journal_repository.dart';
import 'journal_providers.dart';

/// Displays a short-lived signed URL from memory only (Flutter's in-memory
/// image cache, no disk cache). An expired URL refreshes the timeline.
class SignedImage extends ConsumerWidget {
  const SignedImage({super.key, required this.url, this.fit = BoxFit.contain});

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.spark;
    return Image.network(
      url,
      fit: fit,
      gaplessPlayback: true,
      loadingBuilder: (context, child, progress) =>
          progress == null ? child : ColoredBox(color: c.surfaceAlt, child: const Center(child: CircularProgressIndicator())),
      errorBuilder: (context, error, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // The URL may have expired (10-minute signed URLs); refresh, throttled.
          if (ref.read(signedUrlRefreshProvider.notifier).tryAcquire()) ref.invalidate(journalTimelineProvider);
        });
        return ColoredBox(color: c.surfaceAlt, child: Icon(Icons.broken_image_rounded, color: c.iconMuted));
      },
    );
  }
}

/// `/journal/entry/:entryId`
class JournalEntryScreen extends StatelessWidget {
  const JournalEntryScreen({super.key, required this.entryId});

  final String entryId;

  @override
  Widget build(BuildContext context) => JournalEntryView(entryId: entryId, popOnDelete: true);
}

/// Full-screen viewer (pinch-zoom), caption edit and delete. No download,
/// export, share or "save image" options.
class JournalEntryView extends ConsumerStatefulWidget {
  const JournalEntryView({super.key, required this.entryId, this.popOnDelete = false});

  final String entryId;
  final bool popOnDelete;

  @override
  ConsumerState<JournalEntryView> createState() => _JournalEntryViewState();
}

class _JournalEntryViewState extends ConsumerState<JournalEntryView> {
  final _caption = TextEditingController();
  bool _editing = false;
  bool _saving = false;

  @override
  void dispose() {
    _caption.dispose();
    super.dispose();
  }

  Future<void> _saveCaption() async {
    final uid = ref.read(currentUidProvider);
    final pid = ref.read(activeProjectIdProvider);
    if (uid == null || pid == null) return;
    setState(() => _saving = true);
    try {
      await ref.read(journalRepositoryProvider).updateCaption(uid, pid, widget.entryId, _caption.text);
      if (!mounted) return;
      setState(() => _editing = false);
      showInfoSnack(context, context.l10n.journalCaptionSaved);
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _saveCaption);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete() async {
    final l10n = context.l10n;
    final deleted = await showConfirmSheet(
      context,
      title: l10n.journalDeleteConfirm,
      body: l10n.journalDeleteBody,
      confirmLabel: l10n.journalDelete,
      destructive: true,
      onConfirm: () async {
        final pid = ref.read(activeProjectIdProvider);
        if (pid != null) await ref.read(journalRepositoryProvider).deleteEntry(pid, widget.entryId);
      },
    );
    if (deleted && mounted && widget.popOnDelete && context.canPop()) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final timeline = ref.watch(journalTimelineProvider);
    final entries = ref.watch(journalEntriesProvider).value ?? const <JournalEntry>[];
    final entry = entries.where((e) => e.id == widget.entryId).firstOrNull;

    return AsyncValueView<JournalTimeline?>(
      value: timeline,
      onRetry: () => ref.invalidate(journalTimelineProvider),
      data: (t) {
        final item = t?.items.where((i) => (i.entryId ?? i.id) == widget.entryId).firstOrNull;
        if (item == null && entry == null) {
          return EmptyState(title: l10n.journalEntryNotFound, icon: Icons.image_not_supported_rounded);
        }
        final caption = entry?.caption ?? item?.caption ?? '';
        if (!_editing) _caption.text = caption;
        final isPdf = (item?.mediaType ?? entry?.mediaType) == JournalMediaType.pdf;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: item?.mediaUrl == null
                  ? Center(child: Text(l10n.journalProcessing, style: text.titleMedium))
                  : isPdf
                      ? _PdfViewer(url: item!.mediaUrl!)
                      : Semantics(
                          image: true,
                          label: l10n.journalImageSemantics(caption),
                          child: InteractiveViewer(
                            minScale: 1,
                            maxScale: 5,
                            child: Center(child: SignedImage(url: item!.mediaUrl!)),
                          ),
                        ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.gutter),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (_editing) ...<Widget>[
                    TextField(
                      controller: _caption,
                      autofocus: true,
                      maxLength: 280,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: l10n.journalCaption),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: SparkButton(label: l10n.commonSave, loading: _saving, onPressed: _saveCaption)),
                        const SizedBox(width: Space.s),
                        SparkButton.text(label: l10n.commonCancel, onPressed: () => setState(() => _editing = false)),
                      ],
                    ),
                  ] else
                    InkWell(
                      onTap: () => setState(() => _editing = true),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: Space.s),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(caption.isEmpty ? l10n.journalCaptionHint : caption, style: text.bodyLarge),
                            ),
                            Icon(Icons.edit_rounded, color: context.spark.iconMuted, semanticLabel: l10n.commonEdit),
                          ],
                        ),
                      ),
                    ),
                  SparkButton.text(
                    key: const Key('journal-delete'),
                    label: l10n.journalDelete,
                    icon: Icons.delete_outline_rounded,
                    onPressed: _delete,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Renders a PDF fetched into memory from its signed URL.
class _PdfViewer extends StatefulWidget {
  const _PdfViewer({required this.url});
  final String url;

  @override
  State<_PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<_PdfViewer> {
  PdfControllerPinch? _controller;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode != 200) throw http.ClientException('HTTP ${response.statusCode}');
      if (!mounted) return;
      setState(() => _controller = PdfControllerPinch(document: PdfDocument.openData(response.bodyBytes)));
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) return ErrorState(error: _error!, onRetry: _load);
    final controller = _controller;
    if (controller == null) return const Center(child: CircularProgressIndicator());
    return LegacyMaterialBridge(child: PdfViewPinch(controller: controller));
  }
}
