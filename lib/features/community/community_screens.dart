import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/errors/app_exception.dart';
import '../../core/firebase/firebase_providers.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/character_avatar.dart';
import '../../core/widgets/chat_bubbles.dart';
import '../../core/widgets/confirm_sheet.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/states.dart';
import '../../data/models/catalog.dart';
import '../../data/models/community.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/community_repository.dart';
import '../billing/entitlements.dart';

part 'community_screens.g.dart';

@riverpod
bool communityEnabled(Ref ref) =>
    (ref.watch(appFlagsProvider).value?.communityEnabled ?? false) && ref.watch(hasFeatureProvider(Features.community));

@riverpod
Stream<CommunityProfile?> myCommunityProfile(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<CommunityProfile?>.value(null);
  return ref.watch(communityRepositoryProvider).watchProfile(uid);
}

@riverpod
Stream<CommunityProfile?> communityProfileById(Ref ref, String uid) =>
    ref.watch(communityRepositoryProvider).watchProfile(uid);

@riverpod
Stream<Set<String>> blockedUsers(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<Set<String>>.value(const <String>{});
  return ref.watch(communityRepositoryProvider).watchBlocks(uid);
}

@riverpod
Future<List<CommunityMatch>> communityMatches(Ref ref) => ref.read(communityRepositoryProvider).findMatches();

@riverpod
Stream<List<CommunityPost>> showcase(Ref ref) => ref.watch(communityRepositoryProvider).watchShowcase();

@riverpod
Stream<List<CommunityGroup>> communityGroups(Ref ref) => ref.watch(communityRepositoryProvider).watchGroups();

@riverpod
Stream<CommunityGroup?> communityGroup(Ref ref, String groupId) => ref.watch(communityRepositoryProvider).watchGroup(groupId);

@riverpod
Stream<List<CommunityPost>> groupPosts(Ref ref, String groupId) => ref.watch(communityRepositoryProvider).watchGroupPosts(groupId);

@riverpod
Stream<List<CommunityConnection>> connections(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<CommunityConnection>>.value(const <CommunityConnection>[]);
  return ref.watch(communityRepositoryProvider).watchConnections(uid);
}

@riverpod
Stream<List<CommunityMessage>> communityMessages(Ref ref, String connectionId) =>
    ref.watch(communityRepositoryProvider).watchMessages(connectionId);

final RegExp _contactPattern = RegExp(
  r'([\w.+-]+@[\w-]+\.[\w.]+)|(\+?\d[\d\s().-]{7,}\d)|(https?://|www\.)|(@[A-Za-z0-9_]{3,})',
);

/// True when text looks like it contains contact info or links.
bool containsContactInfo(String text) => _contactPattern.hasMatch(text);

CharacterDef? _characterFor(WidgetRef ref, String? id) =>
    (ref.watch(charactersProvider).value ?? const <CharacterDef>[]).where((c) => c.id == id).firstOrNull;

Future<void> _report(BuildContext context, WidgetRef ref, String type, String id) async {
  final l10n = context.l10n;
  final reason = TextEditingController();
  final done = await showConfirmSheet(
    context,
    title: l10n.communityReportTitle,
    content: TextField(controller: reason, decoration: InputDecoration(labelText: l10n.communityReportReason)),
    confirmLabel: l10n.communityReport,
    destructive: true,
    onConfirm: () => ref.read(communityRepositoryProvider).report(targetType: type, targetId: id, reason: reason.text.trim()),
  );
  reason.dispose();
  if (done && context.mounted) showInfoSnack(context, l10n.communityReported);
}

Future<void> _block(BuildContext context, WidgetRef ref, String uid, String name) async {
  final l10n = context.l10n;
  final done = await showConfirmSheet(
    context,
    title: l10n.communityBlockTitle(name),
    body: l10n.communityBlockBody,
    confirmLabel: l10n.communityBlock,
    destructive: true,
    onConfirm: () => ref.read(communityRepositoryProvider).block(uid),
  );
  if (done && context.mounted) showInfoSnack(context, l10n.communityBlocked);
}

/// Report / Block menu shown on every profile, post and message.
class _SafetyMenu extends ConsumerWidget {
  const _SafetyMenu({required this.targetType, required this.targetId, this.authorId, this.authorName});

  final String targetType;
  final String targetId;
  final String? authorId;
  final String? authorName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final me = ref.watch(currentUidProvider);
    return PopupMenuButton<String>(
      tooltip: l10n.commonMore,
      onSelected: (v) {
        if (v == 'report') _report(context, ref, targetType, targetId);
        if (v == 'block' && authorId != null) _block(context, ref, authorId!, authorName ?? '');
      },
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(value: 'report', child: Text(l10n.communityReport)),
        if (authorId != null && authorId != me) PopupMenuItem<String>(value: 'block', child: Text(l10n.communityBlock)),
      ],
    );
  }
}

/// `/profile/community` — safety explainer on first visit, then People,
/// Showcase, Groups and Connections.
class CommunityHomeScreen extends ConsumerStatefulWidget {
  const CommunityHomeScreen({super.key});

  @override
  ConsumerState<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends ConsumerState<CommunityHomeScreen> {
  static const _seenKey = 'spark.communitySafetySeen';

  bool get _safetySeen {
    try {
      return ref.read(sharedPreferencesProvider).getBool(_seenKey) ?? false;
    } on Object {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!ref.watch(communityEnabledProvider)) {
      return EmptyState(title: l10n.communityUnavailable, icon: Icons.diversity_3_outlined);
    }
    if (!_safetySeen) {
      return _SafetyExplainer(
        onAgree: () async {
          await ref.read(sharedPreferencesProvider).setBool(_seenKey, true);
          if (mounted) setState(() {});
        },
      );
    }
    final profile = ref.watch(myCommunityProfileProvider);
    return AsyncValueView<CommunityProfile?>(
      value: profile,
      onRetry: () => ref.invalidate(myCommunityProfileProvider),
      data: (p) {
        if (p == null) {
          return EmptyState(
            title: l10n.communitySetupTitle,
            body: l10n.communitySetupBody,
            actionLabel: l10n.communitySaveProfile,
            onAction: () => context.push('${Routes.community}/setup'),
          );
        }
        return DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              TabBar(
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: l10n.communityPeople),
                  Tab(text: l10n.communityShowcase),
                  Tab(text: l10n.communityGroups),
                  Tab(text: l10n.communityConnections),
                ],
              ),
              const Expanded(
                child: TabBarView(children: <Widget>[_PeopleTab(), _ShowcaseTab(), _GroupsTab(), _ConnectionsTab()]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SafetyExplainer extends StatelessWidget {
  const _SafetyExplainer({required this.onAgree});
  final VoidCallback onAgree;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final points = <(IconData, String)>[
      (Icons.badge_rounded, l10n.communitySafetyPoint1),
      (Icons.lock_person_rounded, l10n.communitySafetyPoint2),
      (Icons.shield_rounded, l10n.communitySafetyPoint3),
      (Icons.groups_rounded, l10n.communitySafetyPoint4),
    ];
    return ListView(
      padding: const EdgeInsets.all(Space.gutter),
      children: <Widget>[
        Text(l10n.communitySafetyTitle, style: text.headlineSmall),
        const SizedBox(height: Space.m),
        for (final (icon, body) in points)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.m),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: c.primary),
                const SizedBox(width: Space.m),
                Expanded(child: Text(body, style: text.bodyLarge)),
              ],
            ),
          ),
        SparkButton(key: const Key('community-agree'), label: l10n.communitySafetyAgree, expand: true, onPressed: onAgree),
      ],
    );
  }
}

class _PeopleTab extends ConsumerWidget {
  const _PeopleTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final blocked = ref.watch(blockedUsersProvider).value ?? const <String>{};
    return AsyncValueView<List<CommunityMatch>>(
      value: ref.watch(communityMatchesProvider),
      onRetry: () => ref.invalidate(communityMatchesProvider),
      data: (matches) {
        final visible = matches.where((m) => !blocked.contains(m.profile.id)).toList();
        if (visible.isEmpty) return EmptyState(title: l10n.communityNoMatches, icon: Icons.person_search_rounded);
        return ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: <Widget>[
            for (final m in visible)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.s),
                child: SparkCard(
                  onTap: () => context.push('${Routes.community}/person/${m.profile.id}'),
                  child: Row(
                    children: <Widget>[
                      CharacterAvatar(character: _characterFor(ref, m.profile.characterId), size: 44),
                      const SizedBox(width: Space.m),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(m.profile.pseudonym, style: Theme.of(context).textTheme.titleMedium),
                            if (m.sharedInterests.isNotEmpty)
                              Text(l10n.communityShared(m.sharedInterests.join(', ')), style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _PostCard extends ConsumerWidget {
  const _PostCard({required this.post});
  final CommunityPost post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    return SparkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CharacterAvatar(character: _characterFor(ref, post.authorCharacterId), size: 32),
              const SizedBox(width: Space.s),
              Expanded(child: Text(post.authorPseudonym, style: text.labelLarge)),
              _SafetyMenu(targetType: 'post', targetId: post.id, authorId: post.authorId, authorName: post.authorPseudonym),
            ],
          ),
          if (post.title.isNotEmpty) Text(post.title, style: text.titleMedium),
          Text(post.body, style: text.bodyMedium),
        ],
      ),
    );
  }
}

class _ShowcaseTab extends ConsumerWidget {
  const _ShowcaseTab();

  Future<void> _share(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final title = TextEditingController();
    final body = TextEditingController();
    var consent = false;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l + MediaQuery.viewInsetsOf(context).bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(l10n.communityShareProject, style: Theme.of(context).textTheme.titleLarge),
              TextField(controller: title, decoration: InputDecoration(labelText: l10n.communityPostTitle)),
              const SizedBox(height: Space.s),
              TextField(controller: body, minLines: 3, maxLines: 6, decoration: InputDecoration(labelText: l10n.communityPostBody)),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: consent,
                onChanged: (v) => setState(() => consent = v ?? false),
                title: Text(l10n.communityPostConsent),
              ),
              _AsyncButton(
                label: l10n.communityPost,
                enabled: consent,
                action: () async {
                  if (containsContactInfo('${title.text} ${body.text}')) {
                    throw AppException(kind: AppErrorKind.invalidInput, message: l10n.communityBioWarning);
                  }
                  await ref.read(communityRepositoryProvider).createShowcasePost(title: title.text, body: body.text);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    showInfoSnack(context, l10n.communityPostPending);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
    title.dispose();
    body.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final blocked = ref.watch(blockedUsersProvider).value ?? const <String>{};
    return AsyncValueView<List<CommunityPost>>(
      value: ref.watch(showcaseProvider),
      onRetry: () => ref.invalidate(showcaseProvider),
      data: (posts) {
        final visible = posts.where((p) => !blocked.contains(p.authorId)).toList();
        return ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: <Widget>[
            SparkButton.secondary(label: l10n.communityShareProject, icon: Icons.ios_share_rounded, onPressed: () => _share(context, ref)),
            const SizedBox(height: Space.m),
            if (visible.isEmpty) EmptyState(title: l10n.communityShowcaseEmpty, compact: true),
            for (final p in visible) Padding(padding: const EdgeInsets.only(bottom: Space.s), child: _PostCard(post: p)),
          ],
        );
      },
    );
  }
}

/// Button that runs an async action, showing a spinner and the real error.
class _AsyncButton extends StatefulWidget {
  const _AsyncButton({required this.label, required this.action, this.enabled = true});
  final String label;
  final Future<void> Function() action;
  final bool enabled;

  @override
  State<_AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<_AsyncButton> {
  bool _busy = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (_error != null) Text(_error!, style: TextStyle(color: context.spark.danger)),
        SparkButton(
          label: widget.label,
          loading: _busy,
          onPressed: !widget.enabled
              ? null
              : () async {
                  setState(() {
                    _busy = true;
                    _error = null;
                  });
                  try {
                    await widget.action();
                  } on Object catch (e) {
                    if (mounted) setState(() => _error = errorMessage(context.l10n, e));
                  } finally {
                    if (mounted) setState(() => _busy = false);
                  }
                },
        ),
      ],
    );
  }
}

class _GroupsTab extends ConsumerWidget {
  const _GroupsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AsyncValueView<List<CommunityGroup>>(
      value: ref.watch(communityGroupsProvider),
      onRetry: () => ref.invalidate(communityGroupsProvider),
      data: (groups) => ListView(
        padding: const EdgeInsets.all(Space.gutter),
        children: <Widget>[
          for (final g in groups)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.s),
              child: SparkCard(
                onTap: () => context.push('${Routes.community}/group/${g.id}'),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(g.name),
                  subtitle: Text(<String>[
                    if (g.description != null) g.description!,
                    l10n.communityMembers(g.memberCount),
                  ].join(' · ')),
                  trailing: g.moderated ? SparkChip(label: l10n.communityModerated, icon: Icons.verified_user_rounded) : null,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ConnectionsTab extends ConsumerWidget {
  const _ConnectionsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final me = ref.watch(currentUidProvider);
    final repo = ref.read(communityRepositoryProvider);
    return AsyncValueView<List<CommunityConnection>>(
      value: ref.watch(connectionsProvider),
      onRetry: () => ref.invalidate(connectionsProvider),
      data: (list) {
        if (list.isEmpty) return EmptyState(title: l10n.communityNoConnections, icon: Icons.people_outline_rounded);
        return ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: <Widget>[
            for (final conn in list)
              Builder(builder: (context) {
                final other = conn.members.firstWhere((m) => m != me, orElse: () => '');
                final name = conn.pseudonyms[other] ?? '';
                final incoming = conn.status == 'pending' && conn.requesterId != me;
                return Padding(
                  padding: const EdgeInsets.only(bottom: Space.s),
                  child: SparkCard(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(name, style: Theme.of(context).textTheme.titleMedium),
                              if (conn.status == 'pending')
                                Text(incoming ? l10n.communityIncoming : l10n.communityPending, style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        if (incoming) ...<Widget>[
                          TextButton(
                            onPressed: () => repo.respondToConnection(conn.id, accept: false).catchError((Object e) {
                              if (context.mounted) showErrorSnack(context, e);
                            }),
                            child: Text(l10n.communityDecline),
                          ),
                          FilledButton(
                            onPressed: () => repo.respondToConnection(conn.id, accept: true).catchError((Object e) {
                              if (context.mounted) showErrorSnack(context, e);
                            }),
                            child: Text(l10n.communityAccept),
                          ),
                        ] else if (conn.status == 'accepted')
                          TextButton(
                            onPressed: () => context.push('${Routes.community}/chat/${conn.id}'),
                            child: Text(l10n.communityOpenChat),
                          ),
                        _SafetyMenu(targetType: 'profile', targetId: other, authorId: other, authorName: name),
                      ],
                    ),
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}

/// `/profile/community/setup` — pseudonymous profile (never real name,
/// school, contact info or location).
class CommunityProfileSetupScreen extends ConsumerStatefulWidget {
  const CommunityProfileSetupScreen({super.key});

  @override
  ConsumerState<CommunityProfileSetupScreen> createState() => _CommunityProfileSetupScreenState();
}

class _CommunityProfileSetupScreenState extends ConsumerState<CommunityProfileSetupScreen> {
  final _pseudonym = TextEditingController();
  final _interest = TextEditingController();
  final _bio = TextEditingController();
  final List<String> _interests = <String>[];
  bool _loaded = false;

  @override
  void dispose() {
    _pseudonym.dispose();
    _interest.dispose();
    _bio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final existing = ref.watch(myCommunityProfileProvider).value;
    if (!_loaded && existing != null) {
      _loaded = true;
      _pseudonym.text = existing.pseudonym;
      _bio.text = existing.bio ?? '';
      _interests.addAll(existing.interests);
    }
    final teen = ref.watch(userProfileProvider.select((p) => p.value?.ageBracket == AgeBracket.teen));
    final character = ref.watch(selectedCharacterProvider);
    final bioUnsafe = containsContactInfo(_bio.text) || containsContactInfo(_pseudonym.text);

    return ListView(
      padding: const EdgeInsets.all(Space.gutter),
      children: <Widget>[
        Text(l10n.communitySetupTitle, style: text.headlineSmall),
        Text(l10n.communitySetupBody, style: text.bodyMedium),
        const SizedBox(height: Space.m),
        Center(child: CharacterAvatar(character: character, size: 72)),
        TextField(
          controller: _pseudonym,
          maxLength: 24,
          decoration: InputDecoration(labelText: l10n.communityPseudonym, hintText: l10n.communityPseudonymHint),
          onChanged: (_) => setState(() {}),
        ),
        TextField(
          controller: _interest,
          decoration: InputDecoration(labelText: l10n.communityInterests, hintText: l10n.communityInterestsHint),
          onSubmitted: (v) => setState(() {
            if (v.trim().isNotEmpty && !_interests.contains(v.trim())) _interests.add(v.trim());
            _interest.clear();
          }),
        ),
        Wrap(
          spacing: Space.s,
          children: <Widget>[
            for (final i in _interests)
              InputChip(label: Text(i), onDeleted: () => setState(() => _interests.remove(i))),
          ],
        ),
        const SizedBox(height: Space.s),
        TextField(
          controller: _bio,
          maxLength: 160,
          minLines: 2,
          maxLines: 4,
          decoration: InputDecoration(labelText: l10n.communityBio, errorText: bioUnsafe ? l10n.communityBioWarning : null),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: Space.m),
        _AsyncButton(
          label: l10n.communitySaveProfile,
          enabled: _pseudonym.text.trim().length >= 3 && !bioUnsafe,
          action: () async {
            await ref.read(communityRepositoryProvider).saveProfile(
                  pseudonym: _pseudonym.text,
                  characterId: character?.id,
                  interests: _interests,
                  bio: _bio.text,
                  visibility: existing?.visibility ?? (teen ? 'private' : 'members'),
                );
            if (context.mounted) context.pop();
          },
        ),
      ],
    );
  }
}

/// `/profile/community/person/:uid`
class CommunityPersonScreen extends ConsumerWidget {
  const CommunityPersonScreen({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final conns = ref.watch(connectionsProvider).value ?? const <CommunityConnection>[];
    final existing = conns.where((c) => c.members.contains(uid)).firstOrNull;
    return AsyncValueView<CommunityProfile?>(
      value: ref.watch(communityProfileByIdProvider(uid)),
      onRetry: () => ref.invalidate(communityProfileByIdProvider(uid)),
      data: (p) {
        if (p == null) return EmptyState(title: l10n.errorNotFound);
        return ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: <Widget>[
            Row(
              children: <Widget>[
                CharacterAvatar(character: _characterFor(ref, p.characterId), size: 64),
                const SizedBox(width: Space.m),
                Expanded(child: Text(p.pseudonym, style: text.headlineSmall)),
                _SafetyMenu(targetType: 'profile', targetId: p.id, authorId: p.id, authorName: p.pseudonym),
              ],
            ),
            if (p.bio != null) Padding(padding: const EdgeInsets.only(top: Space.s), child: Text(p.bio!, style: text.bodyLarge)),
            const SizedBox(height: Space.s),
            Wrap(spacing: Space.s, runSpacing: Space.xs, children: <Widget>[for (final i in p.interests) SparkChip(label: i)]),
            const SizedBox(height: Space.l),
            if (existing == null)
              _AsyncButton(label: l10n.communityConnect, action: () => ref.read(communityRepositoryProvider).sendConnectionRequest(uid))
            else if (existing.status == 'accepted')
              SparkButton(label: l10n.communityOpenChat, onPressed: () => context.push('${Routes.community}/chat/${existing.id}'))
            else
              Text(l10n.communityRequested, style: text.bodyMedium),
          ],
        );
      },
    );
  }
}

/// `/profile/community/group/:groupId` — moderated group posts.
class CommunityGroupScreen extends ConsumerStatefulWidget {
  const CommunityGroupScreen({super.key, required this.groupId});
  final String groupId;

  @override
  ConsumerState<CommunityGroupScreen> createState() => _CommunityGroupScreenState();
}

class _CommunityGroupScreenState extends ConsumerState<CommunityGroupScreen> {
  final _post = TextEditingController();

  @override
  void dispose() {
    _post.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final repo = ref.read(communityRepositoryProvider);
    final group = ref.watch(communityGroupProvider(widget.groupId)).value;
    final blocked = ref.watch(blockedUsersProvider).value ?? const <String>{};
    return Column(
      children: <Widget>[
        if (group != null)
          Padding(
            padding: const EdgeInsets.all(Space.gutter),
            child: Row(
              children: <Widget>[
                Expanded(child: Text(group.name, style: Theme.of(context).textTheme.titleLarge)),
                _AsyncButton(
                  label: group.isMember ? l10n.communityLeaveGroup : l10n.communityJoinGroup,
                  action: () => group.isMember ? repo.leaveGroup(group.id) : repo.joinGroup(group.id),
                ),
              ],
            ),
          ),
        Expanded(
          child: AsyncValueView<List<CommunityPost>>(
            value: ref.watch(groupPostsProvider(widget.groupId)),
            onRetry: () => ref.invalidate(groupPostsProvider(widget.groupId)),
            data: (posts) {
              final visible = posts.where((p) => !blocked.contains(p.authorId)).toList();
              if (visible.isEmpty) return EmptyState(title: l10n.communityGroupEmpty, compact: true);
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                children: <Widget>[for (final p in visible) Padding(padding: const EdgeInsets.only(bottom: Space.s), child: _PostCard(post: p))],
              );
            },
          ),
        ),
        if (group?.isMember ?? false)
          ChatComposer(
            controller: _post,
            hint: l10n.communityWritePost,
            onSend: () async {
              final body = _post.text.trim();
              if (body.isEmpty) return;
              if (containsContactInfo(body)) {
                showInfoSnack(context, l10n.communityBioWarning);
                return;
              }
              try {
                await repo.postToGroup(widget.groupId, body);
                _post.clear();
                if (context.mounted) showInfoSnack(context, l10n.communityPostPending);
              } on Object catch (e) {
                if (context.mounted) showErrorSnack(context, e);
              }
            },
          ),
      ],
    );
  }
}

/// `/profile/community/chat/:connectionId` — text-only, moderated messages
/// between accepted connections in the same age bracket.
class CommunityChatScreen extends ConsumerStatefulWidget {
  const CommunityChatScreen({super.key, required this.connectionId});
  final String connectionId;

  @override
  ConsumerState<CommunityChatScreen> createState() => _CommunityChatScreenState();
}

class _CommunityChatScreenState extends ConsumerState<CommunityChatScreen> {
  final _text = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final l10n = context.l10n;
    final msg = _text.text.trim();
    if (msg.isEmpty) return;
    if (containsContactInfo(msg)) {
      showInfoSnack(context, l10n.communityBioWarning);
      return;
    }
    try {
      await ref.read(communityRepositoryProvider).sendMessage(widget.connectionId, msg);
      _text.clear();
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _send);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final me = ref.watch(currentUidProvider);
    final text = Theme.of(context).textTheme;
    final conn = (ref.watch(connectionsProvider).value ?? const <CommunityConnection>[])
        .where((c) => c.id == widget.connectionId)
        .firstOrNull;
    final other = conn?.members.firstWhere((m) => m != me, orElse: () => '') ?? '';
    final name = conn?.pseudonyms[other] ?? '';
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(name, style: text.titleMedium),
          trailing: _SafetyMenu(targetType: 'profile', targetId: other, authorId: other, authorName: name),
        ),
        Expanded(
          child: AsyncValueView<List<CommunityMessage>>(
            value: ref.watch(communityMessagesProvider(widget.connectionId)),
            onRetry: () => ref.invalidate(communityMessagesProvider(widget.connectionId)),
            data: (messages) => ListView(
              padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
              children: <Widget>[
                for (final m in messages)
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ChatBubble(
                          isUser: m.senderId == me,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(m.text),
                              if (m.status == 'pending') Text(l10n.communityMessagePending, style: text.labelSmall),
                              if (m.status == 'blocked') Text(l10n.communityMessageBlocked, style: text.labelSmall),
                            ],
                          ),
                        ),
                      ),
                      if (m.senderId != me) _SafetyMenu(targetType: 'message', targetId: m.id, authorId: m.senderId, authorName: name),
                    ],
                  ),
              ],
            ),
          ),
        ),
        ChatComposer(controller: _text, hint: l10n.communityMessageHint, onSend: _send),
      ],
    );
  }
}
