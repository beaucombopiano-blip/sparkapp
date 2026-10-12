import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../data/models/resources.dart';
import '../utils/l10n.dart';
import 'spark_card.dart';
import 'spark_chip.dart';

/// Opens an external link in the browser / YouTube app.
Future<bool> openExternalUrl(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null || !(uri.isScheme('https') || uri.isScheme('http'))) return false;
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// Video / paper / article / tool card with a working link and "Save to
/// project". Metrics are only shown when the backend returned real numbers.
class ResourceCard extends StatelessWidget {
  const ResourceCard({
    super.key,
    required this.resource,
    this.onSave,
    this.saved = false,
    this.saving = false,
    this.trailing,
  });

  final ResourceItem resource;
  final VoidCallback? onSave;
  final bool saved;
  final bool saving;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    final fmt = context.fmt;
    final text = Theme.of(context).textTheme;
    final r = resource;

    final (IconData icon, String typeLabel) = switch (r.type) {
      ResourceType.video => (Icons.play_circle_rounded, l10n.resourceVideo),
      ResourceType.paper => (Icons.description_rounded, l10n.resourcePaper),
      ResourceType.tool => (Icons.build_circle_rounded, l10n.resourceTool),
      ResourceType.course => (Icons.school_rounded, l10n.resourceCourse),
      _ => (Icons.article_rounded, l10n.resourceArticle),
    };

    final meta = <String>[
      if (r.type == ResourceType.video && r.channel != null) r.channel!,
      if (r.type != ResourceType.video && r.sourceName != null) r.sourceName!,
      if (r.authors.isNotEmpty) r.authors.take(3).join(', '),
      if (r.year != null) '${r.year}',
      if (r.durationSeconds != null && r.durationSeconds! > 0) fmt.clock(r.durationSeconds!),
      if (r.metrics?.viewCount != null) l10n.resourceViews(fmt.compactNumber(r.metrics!.viewCount!)),
      if (r.metrics?.citationCount != null) l10n.resourceCitations(fmt.compactNumber(r.metrics!.citationCount!)),
    ];

    return SparkCard(
      onTap: () => openExternalUrl(r.url),
      semanticLabel: '$typeLabel: ${r.title}',
      padding: const EdgeInsets.all(Space.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (r.type == ResourceType.video && r.thumbnailUrl != null)
                ClipRRect(
                  borderRadius: Radii.smallAll,
                  child: Image.network(
                    r.thumbnailUrl!,
                    width: 96,
                    height: 54,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => _TypeIcon(icon: icon),
                  ),
                )
              else
                _TypeIcon(icon: icon),
              const SizedBox(width: Space.m),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SparkChip(label: typeLabel, icon: icon),
                    const SizedBox(height: Space.xs),
                    Text(r.title, style: text.titleMedium, maxLines: 3, overflow: TextOverflow.ellipsis),
                    if (meta.isNotEmpty) Text(meta.join(' · '), style: text.bodySmall),
                  ],
                ),
              ),
              ?trailing,
            ],
          ),
          if (r.description != null && r.description!.isNotEmpty) ...<Widget>[
            const SizedBox(height: Space.s),
            Text(r.description!, style: text.bodyMedium, maxLines: 3, overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: Space.s),
          Wrap(
            spacing: Space.s,
            runSpacing: Space.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              TextButton.icon(
                onPressed: () => openExternalUrl(r.url),
                icon: Icon(r.type == ResourceType.video ? Icons.smart_display_rounded : Icons.open_in_new_rounded),
                label: Text(r.type == ResourceType.video ? l10n.resourceOpenYoutube : l10n.commonOpenLink),
              ),
              if (onSave != null || saved)
                TextButton.icon(
                  onPressed: saved || saving ? null : onSave,
                  icon: saving
                      ? SizedBox.square(
                          dimension: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: c.primary),
                        )
                      : Icon(saved ? Icons.bookmark_added_rounded : Icons.bookmark_add_outlined),
                  label: Text(saved ? l10n.resourceSaved : l10n.resourceSave),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: c.surfaceAlt, borderRadius: Radii.smallAll),
      child: Icon(icon, color: c.primary),
    );
  }
}
