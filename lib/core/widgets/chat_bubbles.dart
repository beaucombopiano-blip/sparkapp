import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../utils/l10n.dart';

/// User bubbles sit right in blueDark; companion bubbles sit left in
/// surfaceAlt.
class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isUser, required this.child, this.leading, this.semanticLabel});

  final bool isUser;
  final Widget child;
  final Widget? leading;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final maxWidth = math.min(MediaQuery.sizeOf(context).width * 0.82, 560.0);
    final bubble = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isUser ? c.primary : c.surfaceAlt,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: isUser ? c.onPrimary : c.textPrimary),
          child: child,
        ),
      ),
    );
    return Semantics(
      label: semanticLabel,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.xs),
        child: Row(
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (!isUser && leading != null) ...<Widget>[leading!, const SizedBox(width: Space.s)],
            Flexible(child: bubble),
          ],
        ),
      ),
    );
  }
}

/// Three bouncing dots shown while the AI is replying.
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final reduce = MediaQuery.disableAnimationsOf(context);
    return Semantics(
      label: context.l10n.interviewTyping,
      liveRegion: true,
      child: SizedBox(
        height: 20,
        width: 44,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(3, (i) {
              final t = (_controller.value - i * 0.18) % 1.0;
              final dy = reduce ? 0.0 : -math.sin(t * math.pi).clamp(0.0, 1.0) * 5;
              return Transform.translate(
                offset: Offset(0, dy),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: c.iconMuted, shape: BoxShape.circle),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// Text field + send button pinned above the keyboard.
class ChatComposer extends StatelessWidget {
  const ChatComposer({
    super.key,
    required this.controller,
    required this.onSend,
    required this.hint,
    this.enabled = true,
    this.trailing,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final String hint;
  final bool enabled;

  /// Replaces the send button (e.g. Stop while streaming).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final c = context.spark;
    final l10n = context.l10n;
    return Material(
      color: c.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.m, Space.s, Space.s, Space.s),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller,
                  enabled: enabled,
                  minLines: 1,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => onSend(),
                  decoration: InputDecoration(hintText: hint),
                ),
              ),
              const SizedBox(width: Space.s),
              trailing ??
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: controller,
                    builder: (context, value, _) => IconButton.filled(
                      key: const Key('chat-send'),
                      tooltip: l10n.interviewSend,
                      onPressed: enabled && value.text.trim().isNotEmpty ? onSend : null,
                      icon: const Icon(Icons.arrow_upward_rounded),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
