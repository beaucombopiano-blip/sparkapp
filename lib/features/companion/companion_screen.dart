import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/routes.dart';
import '../../app/shell/page_scaffold.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../core/widgets/chat_bubbles.dart';
import '../../core/widgets/locked_feature_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/companion.dart';
import '../../data/models/project.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/companion_repository.dart';
import '../billing/entitlements.dart';
import '../project/project_providers.dart';
import 'companion_widgets.dart';

part 'companion_screen.g.dart';

@riverpod
Stream<List<ChatMessage>> conversationMessages(Ref ref, String conversationId) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<ChatMessage>>.value(const <ChatMessage>[]);
  return ref.watch(companionRepositoryProvider).watchMessages(uid, conversationId);
}

@riverpod
Stream<List<Conversation>> conversations(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<Conversation>>.value(const <Conversation>[]);
  return ref.watch(companionRepositoryProvider).watchConversations(uid);
}

/// Full-screen companion chat streamed from `companionChat` (SSE).
class CompanionScreen extends ConsumerStatefulWidget {
  const CompanionScreen({super.key, this.conversationId, this.taskId, this.initialPrompt});

  final String? conversationId;
  final String? taskId;
  final String? initialPrompt;

  @override
  ConsumerState<CompanionScreen> createState() => _CompanionScreenState();
}

class _CompanionScreenState extends ConsumerState<CompanionScreen> {
  final _input = TextEditingController();
  final _scroll = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription<CompanionEvent>? _sub;

  late String? _conversationId = widget.conversationId;
  String? _taskId;

  // Local, not-yet-persisted state of the current exchange.
  String? _pendingUser;
  String _streaming = '';
  bool _isStreaming = false;
  bool _stopped = false;
  String? _tool;
  final List<ChatAttachment> _attachments = <ChatAttachment>[];
  final List<String> _proposalIds = <String>[];
  SafetyInfo? _safety;
  String? _doneMessageId;
  int _persistedAtSend = 0;
  bool _awaitingPersist = false;
  Object? _error;
  String? _lastMessage;

  @override
  void initState() {
    super.initState();
    _taskId = widget.taskId;
    final prompt = widget.initialPrompt;
    if (prompt != null && prompt.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _send(prompt));
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(_scroll.position.maxScrollExtent, duration: Motion.medium, curve: Motion.curve);
      }
    });
  }

  List<ChatMessage> _persisted() =>
      _conversationId == null ? const <ChatMessage>[] : (ref.read(conversationMessagesProvider(_conversationId!)).value ?? const <ChatMessage>[]);

  void _resetLocal() {
    _pendingUser = null;
    _streaming = '';
    _stopped = false;
    _tool = null;
    _attachments.clear();
    _proposalIds.clear();
    _safety = null;
    _doneMessageId = null;
    _awaitingPersist = false;
  }

  void _send([String? text]) {
    final message = (text ?? _input.text).trim();
    if (message.isEmpty || _isStreaming) return;
    if (text == null) _input.clear();
    setState(() {
      _resetLocal();
      _pendingUser = message;
      _isStreaming = true;
      _error = null;
      _lastMessage = message;
      _persistedAtSend = _persisted().length;
    });
    _scrollToEnd();
    final hint = CompanionContextHint(screen: _taskId != null ? 'task' : 'companion', taskId: _taskId);
    _sub = ref
        .read(companionRepositoryProvider)
        .send(conversationId: _conversationId, message: message, contextHint: hint)
        .listen(
      (event) {
        if (!mounted) return;
        setState(() {
          switch (event) {
            case CompanionMeta(:final conversationId):
              _conversationId = conversationId;
            case CompanionToken(:final text):
              _streaming += text;
              _tool = null;
            case CompanionToolActivity(:final toolName):
              _tool = toolName;
            case CompanionAttachmentEvent(:final attachment):
              _attachments.add(attachment);
            case CompanionProposalEvent(:final actionId):
              _proposalIds.add(actionId);
            case CompanionSafetyEvent(:final safety):
              _safety = safety;
            case CompanionDone(:final conversationId, :final messageId):
              _conversationId = conversationId;
              _doneMessageId = messageId;
              _isStreaming = false;
              _awaitingPersist = true;
              _tool = null;
          }
        });
        _scrollToEnd();
      },
      onError: (Object e) {
        if (!mounted) return;
        setState(() {
          _error = e;
          _isStreaming = false;
          _tool = null;
        });
      },
      onDone: () {
        if (mounted && _isStreaming) setState(() => _isStreaming = false);
      },
    );
  }

  void _stop() {
    _sub?.cancel();
    setState(() {
      _isStreaming = false;
      _stopped = true;
      _tool = null;
    });
  }

  void _openConversation(String? id) {
    _sub?.cancel();
    setState(() {
      _resetLocal();
      _isStreaming = false;
      _conversationId = id;
      _error = null;
    });
    Navigator.of(context).maybePop();
  }

  String _toolLabel(AppLocalizations l10n, String tool) => switch (tool) {
        'getCurrentTasks' || 'getChecklist' || 'getTaskDetail' => l10n.companionToolTasks,
        'getCalendar' || 'getTimeline' => l10n.companionToolCalendar,
        'getProgress' => l10n.companionToolProgress,
        'searchVideos' || 'searchPapers' || 'searchWebResources' || 'getSavedResources' => l10n.companionToolSearch,
        'searchOpportunities' => l10n.companionToolOpportunities,
        _ => l10n.companionToolWorking,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final allowed = ref.watch(hasFeatureProvider(Features.aiCompanion));
    final character = ref.watch(selectedCharacterProvider);
    final project = ref.watch(activeProjectProvider).value;

    if (!allowed) {
      return SparkPageScaffold(
        title: l10n.titleCompanion,
        body: Padding(
          padding: const EdgeInsets.all(Space.gutter),
          child: LockedFeatureCard(
            title: l10n.titleCompanion,
            benefit: l10n.companionLocked,
            onSeePlans: () => context.push(Routes.plans),
          ),
        ),
      );
    }

    final persistedAsync = _conversationId == null ? null : ref.watch(conversationMessagesProvider(_conversationId!));
    final persisted = persistedAsync?.value ?? const <ChatMessage>[];

    // Drop local copies once the backend's persisted messages arrive.
    final userPersisted = _pendingUser != null &&
        persisted.length > _persistedAtSend &&
        persisted.skip(_persistedAtSend).any((m) => m.isUser);
    final replyPersisted = _awaitingPersist &&
        (_doneMessageId != null ? persisted.any((m) => m.id == _doneMessageId) : persisted.length >= _persistedAtSend + 2);
    if (replyPersisted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _awaitingPersist) setState(_resetLocal);
      });
    }

    final task = _taskId == null ? null : ref.watch(taskByIdProvider(_taskId!)).value;
    final avatar = CharacterAvatar(character: character, size: 32);

    final items = <Widget>[
      for (final m in persisted) _MessageView(message: m, avatar: avatar),
      if (_pendingUser != null && !userPersisted)
        ChatBubble(isUser: true, child: Text(_pendingUser!)),
      if (!replyPersisted && (_isStreaming || _streaming.isNotEmpty || _attachments.isNotEmpty || _proposalIds.isNotEmpty || _safety != null))
        _LocalReply(
          avatar: avatar,
          text: _streaming,
          streaming: _isStreaming,
          stopped: _stopped,
          tool: _tool == null ? null : _toolLabel(l10n, _tool!),
          attachments: _attachments,
          proposalIds: _proposalIds,
          safety: _safety,
        ),
      if (_error != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.s),
          child: ErrorState(
            error: _error!,
            compact: true,
            onRetry: _lastMessage == null
                ? null
                : () {
                    final msg = _lastMessage!;
                    setState(() => _error = null);
                    _send(msg);
                  },
          ),
        ),
    ];

    final empty = persisted.isEmpty && _pendingUser == null && !_isStreaming;
    final prompts = <String>[
      l10n.companionPromptToday,
      l10n.companionPromptStart,
      l10n.companionPromptStuck,
      l10n.companionPromptBehind,
      l10n.companionPromptResources,
      l10n.companionPromptShare,
    ];

    return SparkPageScaffold(
      scaffoldKey: _scaffoldKey,
      title: character?.name ?? l10n.titleCompanion,
      trailing: IconButton(
        key: const Key('companion-history'),
        tooltip: l10n.companionHistory,
        onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
        icon: Icon(Icons.history_rounded, color: c.topBarForeground),
      ),
      endDrawer: _HistoryDrawer(
        currentId: _conversationId,
        onSelect: _openConversation,
      ),
      body: Column(
        children: <Widget>[
          if (project != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.xs, Space.gutter, 0),
              child: Row(
                children: <Widget>[
                  avatar,
                  const SizedBox(width: Space.s),
                  Flexible(
                    child: SparkChip(
                      key: const Key('companion-context'),
                      label: l10n.companionKnows(project.title),
                      icon: Icons.psychology_rounded,
                      onTap: () => _showContextSheet(context, project),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: empty
                ? ListView(
                    padding: const EdgeInsets.all(Space.gutter),
                    children: <Widget>[
                      const SizedBox(height: Space.l),
                      Center(child: CharacterAvatar(character: character, size: 80)),
                      const SizedBox(height: Space.m),
                      Text(l10n.companionEmptyTitle, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                      const SizedBox(height: Space.xs),
                      Text(l10n.companionEmptyBody, textAlign: TextAlign.center),
                      if (persistedAsync?.hasError ?? false)
                        ErrorState(
                          error: persistedAsync!.error!,
                          compact: true,
                          onRetry: () => ref.invalidate(conversationMessagesProvider(_conversationId!)),
                        ),
                    ],
                  )
                : ListView(
                    controller: _scroll,
                    padding: const EdgeInsets.fromLTRB(Space.gutter, Space.s, Space.gutter, Space.m),
                    children: items,
                  ),
          ),
          if (empty)
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                children: <Widget>[
                  for (final p in prompts)
                    Padding(
                      padding: const EdgeInsets.only(right: Space.s),
                      child: SparkChip(label: p, onTap: () => _send(p)),
                    ),
                ],
              ),
            ),
          if (task != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.xs, Space.gutter, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SparkChip(label: l10n.companionHelpingWith(task.title), icon: Icons.task_alt_rounded, tone: SparkChipTone.primary),
                  ),
                  IconButton(
                    tooltip: l10n.commonRemove,
                    onPressed: () => setState(() => _taskId = null),
                    icon: const Icon(Icons.close_rounded, size: 18),
                  ),
                ],
              ),
            ),
          ChatComposer(
            controller: _input,
            hint: l10n.companionHint,
            enabled: !_isStreaming,
            onSend: _send,
            trailing: _isStreaming
                ? IconButton.filledTonal(
                    key: const Key('companion-stop'),
                    tooltip: l10n.companionStop,
                    onPressed: _stop,
                    icon: const Icon(Icons.stop_rounded),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  void _showContextSheet(BuildContext context, Project project) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _ContextSheet(project: project),
    );
  }
}

class _MessageView extends StatelessWidget {
  const _MessageView({required this.message, required this.avatar});

  final ChatMessage message;
  final Widget avatar;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (message.isUser) {
      return ChatBubble(isUser: true, semanticLabel: l10n.companionYou, child: Text(message.content));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (message.isCrisis) ...<Widget>[
          CrisisCard(safety: message.safety!),
          const SizedBox(height: Space.s),
        ],
        if (message.content.isNotEmpty)
          ChatBubble(isUser: false, leading: avatar, child: CompanionMarkdown(data: message.content)),
        for (final a in message.parsedAttachments)
          Padding(padding: const EdgeInsets.only(top: Space.s, left: 40), child: AttachmentCard(attachment: a)),
        for (final id in message.proposedActionIds)
          Padding(padding: const EdgeInsets.only(top: Space.s, left: 40), child: ProposedActionCard(actionId: id)),
      ],
    );
  }
}

class _LocalReply extends StatelessWidget {
  const _LocalReply({
    required this.avatar,
    required this.text,
    required this.streaming,
    required this.stopped,
    required this.tool,
    required this.attachments,
    required this.proposalIds,
    required this.safety,
  });

  final Widget avatar;
  final String text;
  final bool streaming;
  final bool stopped;
  final String? tool;
  final List<ChatAttachment> attachments;
  final List<String> proposalIds;
  final SafetyInfo? safety;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (safety?.crisis ?? false) ...<Widget>[CrisisCard(safety: safety!), const SizedBox(height: Space.s)],
        ChatBubble(
          isUser: false,
          leading: avatar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (text.isEmpty && streaming) const TypingIndicator() else CompanionMarkdown(data: text),
              if (tool != null) ...<Widget>[
                const SizedBox(height: Space.xs),
                Text(tool!, style: textTheme.bodySmall),
              ],
              if (stopped) Text(l10n.companionStopped, style: textTheme.labelSmall),
            ],
          ),
        ),
        for (final a in attachments)
          Padding(padding: const EdgeInsets.only(top: Space.s, left: 40), child: AttachmentCard(attachment: a)),
        for (final id in proposalIds)
          Padding(padding: const EdgeInsets.only(top: Space.s, left: 40), child: ProposedActionCard(actionId: id)),
      ],
    );
  }
}

/// What the companion currently knows, from live project data.
class _ContextSheet extends ConsumerWidget {
  const _ContextSheet({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final progress = ref.watch(activeProgressProvider).value;
    final tasks = ref.watch(currentTasksProvider).value ?? const <Task>[];

    Widget row(IconData icon, String label, String? value) => value == null || value.isEmpty
        ? const SizedBox.shrink()
        : ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, color: c.secondary),
            title: Text(label, style: text.labelMedium),
            subtitle: Text(value, style: text.bodyLarge),
          );

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
      children: <Widget>[
        Text(l10n.companionKnowsTitle, style: text.titleLarge),
        const SizedBox(height: Space.xs),
        Text(l10n.companionKnowsBody, style: text.bodyMedium),
        const SizedBox(height: Space.m),
        row(Icons.rocket_launch_rounded, l10n.companionKnowsProject, project.title),
        row(Icons.layers_rounded, l10n.companionKnowsPhase, progress?.currentPhase?.title),
        row(Icons.diamond_rounded, l10n.companionKnowsMilestone, progress?.currentMilestone?.title),
        row(
          Icons.flag_rounded,
          l10n.companionKnowsDeadline,
          project.targetEndDate == null ? null : fmt.longDate(clock.toWallClock(project.targetEndDate!)),
        ),
        if (tasks.isNotEmpty) ...<Widget>[
          Text(l10n.companionKnowsTasks, style: text.labelMedium),
          for (final t in tasks)
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: Icon(Icons.radio_button_unchecked_rounded, color: c.iconMuted, size: 18),
              title: Text(t.title),
            ),
        ],
      ],
    );
  }
}

class _HistoryDrawer extends ConsumerWidget {
  const _HistoryDrawer({required this.currentId, required this.onSelect});

  final String? currentId;
  final void Function(String? id) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final fmt = context.fmt;
    final clock = ref.watch(userClockProvider);
    final list = ref.watch(conversationsProvider);
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Space.m),
              child: Text(l10n.companionHistory, style: text.titleLarge),
            ),
            ListTile(
              leading: const Icon(Icons.add_comment_rounded),
              title: Text(l10n.companionNewChat),
              onTap: () => onSelect(null),
            ),
            const Divider(),
            Expanded(
              child: AsyncValueView<List<Conversation>>(
                value: list,
                compact: true,
                onRetry: () => ref.invalidate(conversationsProvider),
                data: (items) => items.isEmpty
                    ? EmptyState(compact: true, title: l10n.companionNoHistory, icon: Icons.forum_outlined)
                    : ListView(
                        children: <Widget>[
                          for (final conv in items)
                            ListTile(
                              selected: conv.id == currentId,
                              title: Text(conv.title ?? conv.lastMessagePreview ?? l10n.titleCompanion, maxLines: 1, overflow: TextOverflow.ellipsis),
                              subtitle: conv.lastMessageAt == null
                                  ? null
                                  : Text(fmt.shortDate(clock.toWallClock(conv.lastMessageAt!))),
                              onTap: () => onSelect(conv.id),
                            ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
