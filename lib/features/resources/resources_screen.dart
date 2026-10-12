import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/confirm_sheet.dart';
import '../../core/widgets/locked_feature_card.dart';
import '../../core/widgets/resource_card.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/states.dart';
import '../../data/models/resources.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/resource_repository.dart';
import '../billing/entitlements.dart';
import '../discovery/recommendations_step.dart' show ThinkingLoader;
import '../project/project_screen.dart' show resourceCategoryName;
import 'resources_providers.dart';

/// Resource Center: search + category tiles, results grouped into Videos,
/// Articles and guides, Research papers and Tools; a Saved tab.
class ResourcesScreen extends ConsumerStatefulWidget {
  const ResourcesScreen({super.key, this.initialQuery, this.initialCategoryId});

  final String? initialQuery;
  final String? initialCategoryId;

  @override
  ConsumerState<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends ConsumerState<ResourcesScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);
  late final TextEditingController _query = TextEditingController(text: widget.initialQuery ?? '');
  String? _categoryId;
  AsyncValue<ResourceResults>? _results;

  @override
  void initState() {
    super.initState();
    if (widget.initialCategoryId != null || (widget.initialQuery?.isNotEmpty ?? false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _search(categoryId: widget.initialCategoryId));
    }
  }

  @override
  void dispose() {
    _tabs.dispose();
    _query.dispose();
    super.dispose();
  }

  Future<void> _search({String? categoryId}) async {
    final query = _query.text.trim();
    if (query.isEmpty && categoryId == null) return;
    setState(() {
      _categoryId = categoryId;
      _results = const AsyncValue<ResourceResults>.loading();
    });
    final result = await AsyncValue.guard(
      () => ref.read(resourceRepositoryProvider).recommendResources(
            categoryId: categoryId,
            query: query.isEmpty ? null : query,
          ),
    );
    if (mounted) setState(() => _results = result);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!ref.watch(hasFeatureProvider(Features.resourceCenter))) {
      return Padding(
        padding: const EdgeInsets.all(Space.gutter),
        child: LockedFeatureCard(
          title: l10n.titleResources,
          benefit: l10n.resourcesLocked,
          onSeePlans: () => context.push(Routes.plans),
        ),
      );
    }
    return Column(
      children: <Widget>[
        TabBar(
          controller: _tabs,
          tabs: <Widget>[Tab(text: l10n.resourcesFindTab), Tab(text: l10n.resourcesSavedTab)],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: <Widget>[_buildFind(context), const _SavedList()],
          ),
        ),
      ],
    );
  }

  Widget _buildFind(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final categories = ref.watch(resourceCategoriesProvider);
    final projectType = ref.watch(activeProjectProvider.select((p) => p.value?.projectType));
    final width = MediaQuery.sizeOf(context).width;
    final tileWidth = width >= Breakpoints.medium ? 220.0 : (width - Space.gutter * 2 - Space.s) / 2;

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
      children: <Widget>[
        TextField(
          controller: _query,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => _search(),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search_rounded),
            hintText: l10n.resourcesSearchHint,
            suffixIcon: IconButton(
              tooltip: l10n.resourcesSearch,
              onPressed: _search,
              icon: const Icon(Icons.arrow_forward_rounded),
            ),
          ),
        ),
        const SizedBox(height: Space.s),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => context.push(Routes.companion(prompt: _query.text.trim().isEmpty ? null : _query.text.trim())),
            icon: const Icon(Icons.chat_rounded),
            label: Text(l10n.resourcesAskCompanion),
          ),
        ),
        if (_results == null) ...<Widget>[
          SectionHeader(title: l10n.resourcesCategories),
          AsyncValueView<List<ResourceCategory>>(
            value: categories,
            compact: true,
            onRetry: () => ref.invalidate(resourceCategoriesProvider),
            data: (list) => Wrap(
              spacing: Space.s,
              runSpacing: Space.s,
              children: <Widget>[
                for (final cat in list)
                  SizedBox(
                    width: tileWidth,
                    child: SparkCard(
                      onTap: () => _search(categoryId: cat.id),
                      semanticLabel: resourceCategoryName(cat, projectType, l10n),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(_iconFor(cat.icon), color: c.primary),
                          const SizedBox(height: Space.s),
                          Text(resourceCategoryName(cat, projectType, l10n), style: text.titleSmall),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ] else
          _ResultsView(
            results: _results!,
            onRetry: () => _search(categoryId: _categoryId),
            onClear: () => setState(() => _results = null),
          ),
      ],
    );
  }

  IconData _iconFor(String? key) => switch (key) {
        'start' => Icons.flag_rounded,
        'skill' => Icons.school_rounded,
        'research' => Icons.fact_check_rounded,
        'materials' => Icons.handyman_rounded,
        'problem' => Icons.psychology_alt_rounded,
        'motivation' => Icons.bolt_rounded,
        'audience' => Icons.groups_rounded,
        'marketing' => Icons.campaign_rounded,
        'mentors' => Icons.diversity_3_rounded,
        _ => Icons.auto_awesome_rounded,
      };
}

class _ResultsView extends ConsumerWidget {
  const _ResultsView({required this.results, required this.onRetry, required this.onClear});

  final AsyncValue<ResourceResults> results;
  final VoidCallback onRetry;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final saved = ref.watch(savedResourceUrlsProvider);
    final saving = ref.watch(savingResourcesProvider);

    if (results.isLoading) return ThinkingLoader(lines: <String>[l10n.resourcesSearching]);
    if (results.hasError) return ErrorState(error: results.error!, onRetry: onRetry);
    final items = results.requireValue.items;
    if (items.isEmpty) {
      return EmptyState(title: l10n.resourcesNoResults, icon: Icons.search_off_rounded, actionLabel: l10n.commonBack, onAction: onClear);
    }
    final sections = <(String, List<ResourceItem>)>[
      (l10n.resourcesVideos, items.where((r) => r.type == ResourceType.video).toList()),
      (l10n.resourcesArticles, items.where((r) => r.type == ResourceType.article || r.type == ResourceType.course || r.type == ResourceType.unknown).toList()),
      (l10n.resourcesPapers, items.where((r) => r.type == ResourceType.paper).toList()),
      (l10n.resourcesTools, items.where((r) => r.type == ResourceType.tool).toList()),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(onPressed: onClear, icon: const Icon(Icons.grid_view_rounded), label: Text(l10n.resourcesCategories)),
        ),
        for (final (title, list) in sections)
          if (list.isNotEmpty) ...<Widget>[
            SectionHeader(title: title),
            for (final r in list)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.s),
                child: ResourceCard(
                  resource: r,
                  saved: saved.contains(r.url),
                  saving: saving.contains(r.url),
                  onSave: () async {
                    try {
                      await ref.read(savingResourcesProvider.notifier).save(r);
                    } on Object catch (e) {
                      if (context.mounted) showErrorSnack(context, e);
                    }
                  },
                ),
              ),
          ],
      ],
    );
  }
}

class _SavedList extends ConsumerWidget {
  const _SavedList();

  Future<void> _editNote(BuildContext context, WidgetRef ref, SavedResource item) async {
    final l10n = context.l10n;
    final controller = TextEditingController(text: item.note ?? '');
    final note = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item.note == null ? l10n.resourcesAddNote : l10n.resourcesEditNote),
        content: TextField(controller: controller, autofocus: true, minLines: 2, maxLines: 5),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.commonCancel)),
          FilledButton(onPressed: () => Navigator.of(context).pop(controller.text.trim()), child: Text(l10n.commonSave)),
        ],
      ),
    );
    controller.dispose();
    if (note == null) return;
    final uid = ref.read(currentUidProvider);
    final pid = ref.read(activeProjectIdProvider);
    if (uid == null || pid == null) return;
    try {
      await ref.read(resourceRepositoryProvider).updateNote(uid, pid, item.id, note.isEmpty ? null : note);
    } on Object catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final saved = ref.watch(savedResourcesProvider);
    return AsyncValueView<List<SavedResource>>(
      value: saved,
      onRetry: () => ref.invalidate(savedResourcesProvider),
      data: (items) => items.isEmpty
          ? EmptyState(title: l10n.resourcesSavedEmpty, icon: Icons.bookmarks_outlined)
          : ListView(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.m, Space.gutter, Space.xl),
              children: <Widget>[
                for (final item in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Space.s),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ResourceCard(
                          resource: item.resource,
                          trailing: IconButton(
                            tooltip: l10n.commonRemove,
                            icon: const Icon(Icons.bookmark_remove_rounded),
                            onPressed: () => showConfirmSheet(
                              context,
                              title: l10n.resourcesRemoveConfirm,
                              body: item.resource.title,
                              confirmLabel: l10n.commonRemove,
                              destructive: true,
                              onConfirm: () async {
                                final pid = ref.read(activeProjectIdProvider);
                                if (pid != null) await ref.read(resourceRepositoryProvider).unsaveResource(pid, item.id);
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: () => _editNote(context, ref, item),
                            icon: const Icon(Icons.sticky_note_2_outlined),
                            label: Text(item.note == null || item.note!.isEmpty ? l10n.resourcesAddNote : '${l10n.resourcesNote}: ${item.note}'),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}
