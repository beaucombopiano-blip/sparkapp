import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/legacy_material_bridge.dart';
import '../../core/widgets/proposal_card.dart';
import '../../core/widgets/resource_card.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../data/models/companion.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/companion_repository.dart';
import '../opportunities/opportunity_card.dart';
import '../resources/resources_providers.dart';

/// Markdown for companion replies (numbered steps, bold, links).
class CompanionMarkdown extends StatelessWidget {
  const CompanionMarkdown({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    return LegacyMaterialBridge(
      child: MarkdownBody(
        data: data,
        selectable: true,
        softLineBreak: true,
        onTapLink: (_, href, _) {
          final uri = href == null ? null : Uri.tryParse(href);
          if (uri != null && (uri.isScheme('https') || uri.isScheme('http'))) {
            launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        styleSheet: MarkdownStyleSheet(
          p: text.bodyLarge?.copyWith(color: c.textPrimary),
          listBullet: text.bodyLarge?.copyWith(color: c.textPrimary),
          strong: text.bodyLarge?.copyWith(color: c.textPrimary, fontWeight: FontWeight.w700),
          a: text.bodyLarge?.copyWith(color: c.link, decoration: TextDecoration.underline),
          h1: text.titleLarge,
          h2: text.titleMedium,
          h3: text.titleSmall,
          code: text.bodyMedium?.copyWith(fontFamily: 'monospace', backgroundColor: c.surface),
        ),
      ),
    );
  }
}

/// Resource/opportunity attachments with "Save to project".
class AttachmentCard extends ConsumerWidget {
  const AttachmentCard({super.key, required this.attachment});

  final ChatAttachment attachment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (attachment) {
      case ResourceAttachment(:final resource):
        final saved = ref.watch(savedResourceUrlsProvider).contains(resource.url);
        final saving = ref.watch(savingResourcesProvider).contains(resource.url);
        return ResourceCard(
          resource: resource,
          saved: saved,
          saving: saving,
          onSave: () async {
            try {
              await ref.read(savingResourcesProvider.notifier).save(resource);
            } on Object catch (e) {
              if (context.mounted) showErrorSnack(context, e);
            }
          },
        );
      case OpportunityAttachment(:final opportunity):
        return OpportunityCard(opportunity: opportunity);
    }
  }
}

/// A companion write action awaiting confirmation. Shows exactly what would
/// change; "Done ✓" only after confirmAction reports success (or the action
/// document says executed).
class ProposedActionCard extends ConsumerWidget {
  const ProposedActionCard({super.key, required this.actionId});

  final String actionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(currentUidProvider);
    if (uid == null) return const SizedBox.shrink();
    final repo = ref.read(companionRepositoryProvider);
    final action = ref.watch(_proposedActionProvider((uid, actionId)));
    final a = action.value;
    if (a == null) {
      return action.hasError
          ? Text(errorMessage(context.l10n, action.error!))
          : const LinearProgressIndicator(minHeight: 2);
    }
    final phase = switch (a.status) {
      ProposedActionStatus.executed => ProposalPhase.done,
      ProposedActionStatus.cancelled => ProposalPhase.cancelled,
      ProposedActionStatus.failed => ProposalPhase.failed,
      ProposedActionStatus.confirmed => ProposalPhase.working,
      _ => null,
    };
    return ProposalCard(
      key: ValueKey<String>('action-${a.id}'),
      preview: a.preview,
      details: a.previewDetails,
      serverPhase: phase,
      serverError: a.error,
      onConfirm: () => repo.confirmAction(a.id),
      onNotNow: () => repo.cancelAction(a.id),
    );
  }
}

final _proposedActionProvider = StreamProvider.autoDispose.family<ProposedAction?, (String, String)>(
  (ref, key) => ref.watch(companionRepositoryProvider).watchProposedAction(key.$1, key.$2),
);

/// Crisis response: support information highlighted and tappable.
class CrisisCard extends StatelessWidget {
  const CrisisCard({super.key, required this.safety});

  final SafetyInfo safety;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    return Semantics(
      container: true,
      liveRegion: true,
      child: SparkCard(
        tone: SparkCardTone.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.favorite_rounded, color: c.danger),
                const SizedBox(width: Space.s),
                Expanded(child: Text(l10n.companionCrisisTitle, style: text.titleLarge)),
              ],
            ),
            const SizedBox(height: Space.s),
            Text(safety.message ?? l10n.companionCrisisBody, style: text.bodyLarge),
            const SizedBox(height: Space.m),
            Text(l10n.companionCrisisLine, style: text.titleSmall),
            const SizedBox(height: Space.s),
            Wrap(
              spacing: Space.s,
              runSpacing: Space.s,
              children: <Widget>[
                SparkButton(
                  key: const Key('crisis-call'),
                  label: l10n.companionCrisisCall,
                  icon: Icons.call_rounded,
                  onPressed: () => launchUrl(Uri(scheme: 'tel', path: '988')),
                ),
                SparkButton.secondary(
                  key: const Key('crisis-text'),
                  label: l10n.companionCrisisText,
                  icon: Icons.sms_rounded,
                  onPressed: () => launchUrl(Uri(scheme: 'sms', path: '988')),
                ),
              ],
            ),
            for (final r in safety.resources.where((r) => !(r.phone == '988' || r.sms == '988')))
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(r.label),
                subtitle: r.description == null ? null : Text(r.description!),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  final uri = r.phone != null
                      ? Uri(scheme: 'tel', path: r.phone)
                      : r.sms != null
                          ? Uri(scheme: 'sms', path: r.sms)
                          : (r.url == null ? null : Uri.tryParse(r.url!));
                  if (uri != null) launchUrl(uri, mode: LaunchMode.externalApplication);
                },
              ),
          ],
        ),
      ),
    );
  }
}
