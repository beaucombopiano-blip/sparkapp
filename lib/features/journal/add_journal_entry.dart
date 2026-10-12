
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pdfx/pdfx.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../data/models/journal.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/journal_repository.dart';

/// Upload limits (mirrors Storage rules).
const int kMaxImageBytes = 10 * 1024 * 1024;
const int kMaxPdfBytes = 15 * 1024 * 1024;

const Map<String, String> _imageTypes = <String, String>{
  'jpg': 'image/jpeg',
  'jpeg': 'image/jpeg',
  'png': 'image/png',
  'webp': 'image/webp',
  'heic': 'image/heic',
  'heif': 'image/heic',
};

/// A validated file ready to upload.
@immutable
class PreparedUpload {
  const PreparedUpload({
    required this.bytes,
    required this.contentType,
    required this.mediaType,
    this.previewBytes,
  });

  final Uint8List bytes;
  final String contentType;
  final JournalMediaType mediaType;

  /// First-page JPEG for PDFs.
  final Uint8List? previewBytes;
}

/// Why a picked file was rejected before upload.
enum UploadRejection { tooBigImage, tooBigPdf, unsupported }

class UploadRejectedException implements Exception {
  const UploadRejectedException(this.reason);
  final UploadRejection reason;
}

String _extension(String name) {
  final dot = name.lastIndexOf('.');
  return dot < 0 ? '' : name.substring(dot + 1).toLowerCase();
}

/// Validates type and size, compresses images on device (HEIC → JPEG) and
/// renders a PDF's first page as a preview.
Future<PreparedUpload> prepareUpload(String fileName, Uint8List bytes) async {
  final ext = _extension(fileName);
  if (ext == 'pdf') {
    if (bytes.length > kMaxPdfBytes) throw const UploadRejectedException(UploadRejection.tooBigPdf);
    if (bytes.length < 5 || String.fromCharCodes(bytes.sublist(0, 5)) != '%PDF-') {
      throw const UploadRejectedException(UploadRejection.unsupported);
    }
    Uint8List? preview;
    try {
      final doc = await PdfDocument.openData(bytes);
      final page = await doc.getPage(1);
      final image = await page.render(
        width: page.width * 1.5,
        height: page.height * 1.5,
        format: PdfPageImageFormat.jpeg,
        backgroundColor: '#FFFFFF',
        quality: 80,
      );
      await page.close();
      await doc.close();
      preview = image?.bytes;
    } on Object {
      preview = null; // The backend still validates; a missing preview shows a PDF icon.
    }
    return PreparedUpload(bytes: bytes, contentType: 'application/pdf', mediaType: JournalMediaType.pdf, previewBytes: preview);
  }
  if (!_imageTypes.containsKey(ext)) throw const UploadRejectedException(UploadRejection.unsupported);
  var data = bytes;
  var contentType = _imageTypes[ext]!;
  if (!kIsWeb) {
    try {
      data = await FlutterImageCompress.compressWithList(bytes, minWidth: 2048, minHeight: 2048, quality: 82);
      contentType = 'image/jpeg';
    } on Object {
      data = bytes; // Keep the original if compression isn't available.
    }
  }
  if (data.length > kMaxImageBytes) throw const UploadRejectedException(UploadRejection.tooBigImage);
  return PreparedUpload(bytes: data, contentType: contentType, mediaType: JournalMediaType.image);
}

/// Camera / photo library / PDF, caption editing, upload with progress.
Future<void> showAddJournalEntrySheet(BuildContext context, {String? taskId, String? milestoneId}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => AddJournalEntrySheet(taskId: taskId, milestoneId: milestoneId),
  );
}

class AddJournalEntrySheet extends ConsumerStatefulWidget {
  const AddJournalEntrySheet({super.key, this.taskId, this.milestoneId});

  final String? taskId;
  final String? milestoneId;

  @override
  ConsumerState<AddJournalEntrySheet> createState() => _AddJournalEntrySheetState();
}

class _AddJournalEntrySheetState extends ConsumerState<AddJournalEntrySheet> {
  final _caption = TextEditingController();
  PreparedUpload? _file;
  bool _preparing = false;
  double? _progress;
  Object? _error;

  @override
  void dispose() {
    _caption.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picked = await ImagePicker().pickImage(source: source, maxWidth: 4096, maxHeight: 4096);
      if (picked == null) return;
      setState(() {
        _preparing = true;
        _error = null;
      });
      final bytes = await picked.readAsBytes();
      final prepared = await prepareUpload(picked.name, bytes);
      if (mounted) setState(() => _file = prepared);
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _preparing = false);
    }
  }

  Future<void> _pickPdf() async {
    try {
      final result = await FilePicker.pickFiles(type: FileType.custom, allowedExtensions: <String>['pdf']);
      final file = result.firstOrNull;
      if (file == null) return;
      final size = await file.length();
      if (size != null && size > kMaxPdfBytes) throw const UploadRejectedException(UploadRejection.tooBigPdf);
      setState(() {
        _preparing = true;
        _error = null;
      });
      final bytes = await file.xFile.readAsBytes();
      final prepared = await prepareUpload(file.name, bytes);
      if (mounted) setState(() => _file = prepared);
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _preparing = false);
    }
  }

  Future<void> _upload() async {
    final file = _file;
    final projectId = ref.read(activeProjectIdProvider);
    if (file == null || projectId == null) return;
    final repo = ref.read(journalRepositoryProvider);
    setState(() {
      _progress = 0;
      _error = null;
    });
    try {
      final target = await repo.createEntry(
        projectId: projectId,
        mediaType: file.mediaType,
        contentType: file.contentType,
        sizeBytes: file.bytes.length,
        caption: _caption.text.trim().isEmpty ? null : _caption.text.trim(),
        taskId: widget.taskId,
        milestoneId: widget.milestoneId,
      );
      await repo.upload(
        path: target.uploadPath,
        bytes: file.bytes,
        contentType: file.contentType,
        onProgress: (p) => mounted ? setState(() => _progress = p * (file.previewBytes == null ? 1 : 0.9)) : null,
      );
      if (file.previewBytes != null && target.previewUploadPath != null) {
        await repo.upload(path: target.previewUploadPath!, bytes: file.previewBytes!, contentType: 'image/jpeg');
      }
      if (!mounted) return;
      showInfoSnack(context, context.l10n.journalAdded);
      Navigator.of(context).pop();
    } on Object catch (e) {
      if (mounted) {
        setState(() {
          _error = e;
          _progress = null;
        });
      }
    }
  }

  String _errorText(AppLocalizations l10n, Object e) => switch (e) {
        UploadRejectedException(reason: UploadRejection.tooBigImage) => l10n.journalTooBigImage,
        UploadRejectedException(reason: UploadRejection.tooBigPdf) => l10n.journalTooBigPdf,
        UploadRejectedException() => l10n.journalUnsupported,
        AppException() => errorMessage(l10n, e),
        _ => l10n.journalUnsupported,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final uploading = _progress != null;
    final file = _file;

    return Padding(
      padding: EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l + MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(l10n.journalAddEntry, style: text.titleLarge),
            const SizedBox(height: Space.m),
            if (file == null && !_preparing) ...<Widget>[
              if (!kIsWeb)
                ListTile(
                  leading: Icon(Icons.photo_camera_rounded, color: c.primary),
                  title: Text(l10n.journalCamera),
                  onTap: () => _pickImage(ImageSource.camera),
                ),
              ListTile(
                leading: Icon(Icons.photo_library_rounded, color: c.primary),
                title: Text(l10n.journalLibrary),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf_rounded, color: c.primary),
                title: Text(l10n.journalFile),
                onTap: _pickPdf,
              ),
            ],
            if (_preparing)
              Padding(
                padding: const EdgeInsets.all(Space.l),
                child: Column(
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    const SizedBox(height: Space.s),
                    Text(l10n.journalPreparing),
                  ],
                ),
              ),
            if (file != null) ...<Widget>[
              ClipRRect(
                borderRadius: Radii.cardAll,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ColoredBox(
                    color: c.surfaceAlt,
                    child: file.mediaType == JournalMediaType.image
                        ? Image.memory(file.bytes, fit: BoxFit.cover)
                        : (file.previewBytes != null
                            ? Image.memory(file.previewBytes!, fit: BoxFit.contain)
                            : Center(child: Icon(Icons.picture_as_pdf_rounded, size: 64, color: c.primary))),
                  ),
                ),
              ),
              const SizedBox(height: Space.m),
              TextField(
                controller: _caption,
                enabled: !uploading,
                maxLength: 280,
                minLines: 1,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: l10n.journalCaption, hintText: l10n.journalCaptionHint),
              ),
              if (uploading) ...<Widget>[
                Semantics(
                  liveRegion: true,
                  child: Text(l10n.journalUploading(context.fmt.percent(_progress!)), style: text.bodyMedium),
                ),
                const SizedBox(height: Space.xs),
                LinearProgressIndicator(value: _progress, color: c.primary, backgroundColor: c.progressTrack),
                const SizedBox(height: Space.m),
              ],
              SparkButton(
                key: const Key('journal-upload'),
                label: l10n.journalUpload,
                icon: Icons.cloud_upload_rounded,
                loading: uploading,
                expand: true,
                onPressed: _upload,
              ),
              SparkButton.text(
                label: l10n.commonCancel,
                expand: true,
                onPressed: uploading ? null : () => setState(() => _file = null),
              ),
            ],
            if (_error != null) ...<Widget>[
              const SizedBox(height: Space.s),
              Semantics(
                liveRegion: true,
                child: Text(_errorText(l10n, _error!), style: text.bodyMedium?.copyWith(color: c.danger)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
