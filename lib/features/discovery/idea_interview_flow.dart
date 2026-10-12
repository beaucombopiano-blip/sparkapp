import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/chat_bubbles.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_card.dart';
import '../../core/widgets/spark_chip.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/models/discovery.dart';
import '../../data/models/project.dart';
import '../../data/models/user.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/discovery_repository.dart';
import '../onboarding/onboarding_frame.dart';
import 'selection.dart';

/// One editable field of the project profile.
class ProfileField {
  const ProfileField(this.key, this.label, this.read, this.write, {this.multiline = true});

  final String key;
  final String Function(AppLocalizations l10n) label;
  final String? Function(ProjectProfile p) read;
  final ProjectProfile Function(ProjectProfile p, String value) write;
  final bool multiline;
}

final List<ProfileField> profileFields = <ProfileField>[
  ProfileField('title', (l) => l.fieldTitle, (p) => p.title, (p, v) => p.copyWith(title: v), multiline: false),
  ProfileField('goal', (l) => l.fieldGoal, (p) => p.goal, (p, v) => p.copyWith(goal: v)),
  ProfileField('motivation', (l) => l.fieldMotivation, (p) => p.motivation, (p, v) => p.copyWith(motivation: v)),
  ProfileField(
    'audienceOrBeneficiary',
    (l) => l.fieldAudience,
    (p) => p.audienceOrBeneficiary,
    (p, v) => p.copyWith(audienceOrBeneficiary: v),
  ),
  ProfileField('scale', (l) => l.fieldScale, (p) => p.scale, (p, v) => p.copyWith(scale: v), multiline: false),
  ProfileField(
    'successDefinition',
    (l) => l.fieldSuccess,
    (p) => p.successDefinition,
    (p, v) => p.copyWith(successDefinition: v),
  ),
  ProfileField(
    'desiredFinishDate',
    (l) => l.fieldFinishDate,
    (p) => p.desiredFinishDate,
    (p, v) => p.copyWith(desiredFinishDate: v),
    multiline: false,
  ),
  ProfileField(
    'existingSkillsAndResources',
    (l) => l.fieldSkills,
    (p) => p.existingSkillsAndResources,
    (p, v) => p.copyWith(existingSkillsAndResources: v),
  ),
  ProfileField(
    'constraintsAndChallenges',
    (l) => l.fieldConstraints,
    (p) => p.constraintsAndChallenges,
    (p, v) => p.copyWith(constraintsAndChallenges: v),
  ),
  ProfileField(
    'projectType',
    (l) => l.fieldProjectType,
    (p) => p.projectType,
    (p, v) => p.copyWith(projectType: v),
    multiline: false,
  ),
];

/// Path A: adaptive interview streamed from `ideaInterview`. One question at a
/// time; "Your project so far" fills in live; ends with an editable review.
class IdeaInterviewFlow extends ConsumerStatefulWidget {
  const IdeaInterviewFlow({super.key});

  @override
  ConsumerState<IdeaInterviewFlow> createState() => _IdeaInterviewFlowState();
}

class _IdeaInterviewFlowState extends ConsumerState<IdeaInterviewFlow> {
  final _input = TextEditingController();
  final _scroll = ScrollController();
  final List<InterviewMessage> _turns = <InterviewMessage>[];
  StreamSubscription<InterviewEvent>? _sub;

  String? _interviewId;
  ProjectProfile _profile = const ProjectProfile();
  Set<String> _assumed = <String>{};
  final Set<String> _editedByUser = <String>{};
  String _streaming = '';
  bool _isStreaming = false;
  bool _complete = false;
  bool _reviewing = false;
  bool _restoring = true;
  Object? _error;
  String? _lastMessage;

  @override
  void initState() {
    super.initState();
    _restore();
  }

  Future<void> _restore() async {
    final uid = ref.read(currentUidProvider);
    if (uid == null) return;
    try {
      final latest = await ref.read(discoveryRepositoryProvider).watchLatestInterview(uid).first;
      if (!mounted) return;
      if (latest != null && latest.status != 'abandoned') {
        setState(() {
          _interviewId = latest.id;
          _turns.addAll(latest.transcript);
          _profile = latest.profileSoFar ?? const ProjectProfile();
          _assumed = latest.assumedFields.toSet();
          _complete = latest.status == 'complete' || (latest.transcript.isNotEmpty && latest.nextQuestion == null);
        });
      }
    } on Object {
      // Nothing to resume (or offline): start fresh.
    } finally {
      if (mounted) setState(() => _restoring = false);
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

  void _send([String? retryText]) {
    final message = retryText ?? _input.text.trim();
    if (message.isEmpty || _isStreaming) return;
    if (retryText == null) {
      _input.clear();
      _turns.add(InterviewMessage(role: 'user', content: message));
    }
    _lastMessage = message;
    setState(() {
      _isStreaming = true;
      _streaming = '';
      _error = null;
    });
    _scrollToEnd();
    _sub = ref
        .read(discoveryRepositoryProvider)
        .interviewTurn(interviewId: _interviewId, message: message)
        .listen(
      (event) {
        switch (event) {
          case InterviewToken(:final text):
            setState(() => _streaming += text);
            _scrollToEnd();
          case InterviewProfileUpdate():
            setState(() {
              if (event.interviewId.isNotEmpty) _interviewId = event.interviewId;
              _profile = _mergeProfile(event.profile);
              _assumed = event.assumedFields.toSet().difference(_editedByUser);
            });
          case InterviewTurnDone():
            setState(() {
              _interviewId = event.interviewId;
              final reply = _streaming.trim().isNotEmpty ? _streaming.trim() : (event.nextQuestion ?? '');
              if (reply.isNotEmpty) _turns.add(InterviewMessage(role: 'assistant', content: reply));
              _streaming = '';
              _isStreaming = false;
              _complete = event.complete;
            });
            _scrollToEnd();
        }
      },
      onError: (Object e) {
        if (!mounted) return;
        setState(() {
          _error = e;
          _isStreaming = false;
          _streaming = '';
        });
      },
      onDone: () {
        if (mounted && _isStreaming) setState(() => _isStreaming = false);
      },
    );
  }

  /// Server updates never overwrite fields the user edited by hand.
  ProjectProfile _mergeProfile(ProjectProfile incoming) {
    var merged = incoming;
    for (final field in profileFields) {
      if (_editedByUser.contains(field.key)) {
        merged = field.write(merged, field.read(_profile) ?? '');
      }
    }
    return merged;
  }

  Future<void> _editField(ProfileField field) async {
    final l10n = context.l10n;
    final controller = TextEditingController(text: field.read(_profile) ?? '');
    final value = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.interviewEditField(field.label(l10n))),
        content: TextField(
          controller: controller,
          autofocus: true,
          minLines: field.multiline ? 2 : 1,
          maxLines: field.multiline ? 5 : 1,
        ),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.commonCancel)),
          FilledButton(onPressed: () => Navigator.of(context).pop(controller.text.trim()), child: Text(l10n.commonSave)),
        ],
      ),
    );
    controller.dispose();
    if (value == null) return;
    setState(() {
      _profile = field.write(_profile, value);
      _editedByUser.add(field.key);
      _assumed.remove(field.key);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_reviewing && _interviewId != null) {
      return _InterviewReview(
        interviewId: _interviewId!,
        profile: _profile,
        assumed: _assumed,
        onBack: () => setState(() => _reviewing = false),
      );
    }
    final c = context.spark;
    final text = Theme.of(context).textTheme;

    final messages = <Widget>[
      ChatBubble(isUser: false, leading: const SparkLogoFace(size: 28), child: Text(l10n.interviewIntro)),
      for (final t in _turns)
        ChatBubble(
          isUser: t.role == 'user',
          leading: const SparkLogoFace(size: 28),
          child: Text(t.content),
        ),
      if (_isStreaming)
        ChatBubble(
          isUser: false,
          leading: const SparkLogoFace(size: 28),
          child: _streaming.isEmpty ? const TypingIndicator() : Text(_streaming),
        ),
      if (_error != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.s),
          child: Column(
            children: <Widget>[
              Text(errorMessage(l10n, _error!), style: text.bodyMedium?.copyWith(color: c.danger)),
              SparkButton.secondary(
                label: l10n.commonRetry,
                icon: Icons.refresh_rounded,
                onPressed: _lastMessage == null ? null : () => _send(_lastMessage),
              ),
            ],
          ),
        ),
    ];

    return OnboardingFrame(
      step: OnboardingStep.discovery,
      title: l10n.interviewTitle,
      scrollable: false,
      child: Column(
        children: <Widget>[
          _ProfileSoFarCard(profile: _profile, assumed: _assumed, onEdit: _editField),
          const SizedBox(height: Space.s),
          Expanded(
            child: _restoring
                ? const Center(child: TypingIndicator())
                : ListView(controller: _scroll, children: messages),
          ),
          if (_complete && !_isStreaming)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Space.s),
              child: SparkButton(
                key: const Key('interview-review'),
                label: l10n.interviewReview,
                icon: Icons.checklist_rounded,
                expand: true,
                onPressed: () => setState(() => _reviewing = true),
              ),
            )
          else
            ChatComposer(
              controller: _input,
              enabled: !_isStreaming && !_restoring,
              hint: l10n.interviewHint,
              onSend: _send,
            ),
        ],
      ),
    );
  }
}

/// Collapsible live card: goal, why, audience, scale, success, date, skills,
/// constraints. Assumed fields are marked and tappable.
class _ProfileSoFarCard extends StatefulWidget {
  const _ProfileSoFarCard({required this.profile, required this.assumed, required this.onEdit});

  final ProjectProfile profile;
  final Set<String> assumed;
  final void Function(ProfileField field) onEdit;

  @override
  State<_ProfileSoFarCard> createState() => _ProfileSoFarCardState();
}

class _ProfileSoFarCardState extends State<_ProfileSoFarCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.spark;
    final text = Theme.of(context).textTheme;
    final filled = profileFields.where((f) => (f.read(widget.profile) ?? '').trim().isNotEmpty).length;

    return SparkCard(
      tone: SparkCardTone.tinted,
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          InkWell(
            borderRadius: Radii.cardAll,
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(Space.m),
              child: Row(
                children: <Widget>[
                  Icon(Icons.auto_awesome_rounded, color: c.primary),
                  const SizedBox(width: Space.s),
                  Expanded(child: Text(l10n.interviewSoFar, style: text.titleMedium)),
                  Text('$filled/${profileFields.length}', style: text.labelMedium),
                  Icon(_expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: Motion.medium,
            child: !_expanded
                ? const SizedBox(width: double.infinity)
                : ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.35),
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.m),
                      children: <Widget>[
                        for (final field in profileFields)
                          _FieldRow(
                            label: field.label(l10n),
                            value: field.read(widget.profile),
                            assumed: widget.assumed.contains(field.key),
                            onTap: () => widget.onEdit(field),
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  const _FieldRow({required this.label, required this.value, required this.assumed, required this.onTap});

  final String label;
  final String? value;
  final bool assumed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final empty = value == null || value!.trim().isEmpty;
    return InkWell(
      onTap: onTap,
      borderRadius: Radii.smallAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text(label, style: text.labelMedium)),
                if (assumed) SparkChip(label: l10n.interviewGuessed, icon: Icons.edit_rounded, tone: SparkChipTone.accent),
              ],
            ),
            const SizedBox(height: 2),
            Text(empty ? l10n.interviewEmptyField : value!, style: empty ? text.bodySmall : text.bodyMedium),
          ],
        ),
      ),
    );
  }
}

/// Every field editable, then Confirm project (selectProject).
class _InterviewReview extends ConsumerStatefulWidget {
  const _InterviewReview({
    required this.interviewId,
    required this.profile,
    required this.assumed,
    required this.onBack,
  });

  final String interviewId;
  final ProjectProfile profile;
  final Set<String> assumed;
  final VoidCallback onBack;

  @override
  ConsumerState<_InterviewReview> createState() => _InterviewReviewState();
}

class _InterviewReviewState extends ConsumerState<_InterviewReview> {
  late final Map<String, TextEditingController> _controllers = <String, TextEditingController>{
    for (final f in profileFields) f.key: TextEditingController(text: f.read(widget.profile) ?? ''),
  };
  bool _busy = false;

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  ProjectProfile _collect() {
    var p = widget.profile;
    for (final f in profileFields) {
      p = f.write(p, _controllers[f.key]!.text.trim());
    }
    return p.copyWith(assumedFields: widget.assumed.toList());
  }

  Future<void> _confirm() async {
    setState(() => _busy = true);
    try {
      await confirmSelection(
        ref,
        fromStep: OnboardingStep.discovery,
        select: (repo) => repo.selectProject(interviewId: widget.interviewId, profile: _collect()),
      );
    } on Object catch (e) {
      if (mounted) showErrorSnack(context, e, onRetry: _confirm);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    return OnboardingFrame(
      step: OnboardingStep.discovery,
      title: l10n.interviewReviewTitle,
      subtitle: l10n.interviewReviewBody,
      topAction: TextButton(onPressed: widget.onBack, child: Text(l10n.commonBack)),
      primary: SparkButton(
        key: const Key('interview-confirm'),
        label: l10n.interviewConfirm,
        loading: _busy,
        expand: true,
        onPressed: _confirm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (final f in profileFields) ...<Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text(f.label(l10n), style: text.labelLarge)),
                if (widget.assumed.contains(f.key))
                  SparkChip(label: l10n.interviewGuessed, icon: Icons.edit_rounded, tone: SparkChipTone.accent),
              ],
            ),
            const SizedBox(height: Space.xs),
            TextField(
              controller: _controllers[f.key],
              minLines: 1,
              maxLines: f.multiline ? 4 : 1,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: Space.m),
          ],
        ],
      ),
    );
  }
}
