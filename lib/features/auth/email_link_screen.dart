import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/repositories/auth_repository.dart';

final RegExp _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

enum _Stage { enterEmail, checkInbox, completing, confirmEmail }

/// Passwordless email sign-in: enter email → "Check your inbox" with a resend
/// timer → the link (deep link) signs the user in.
class EmailLinkScreen extends ConsumerStatefulWidget {
  const EmailLinkScreen({super.key, this.incomingLink});

  /// The sign-in link when opened from the email.
  final String? incomingLink;

  @override
  ConsumerState<EmailLinkScreen> createState() => _EmailLinkScreenState();
}

class _EmailLinkScreenState extends ConsumerState<EmailLinkScreen> {
  static const _resendSeconds = 60;

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  _Stage _stage = _Stage.enterEmail;
  bool _busy = false;
  int _countdown = 0;
  Timer? _timer;
  Object? _error;

  @override
  void initState() {
    super.initState();
    final pending = ref.read(authRepositoryProvider).pendingEmail;
    if (pending != null) _email.text = pending;
    if (widget.incomingLink != null) {
      _stage = _Stage.completing;
      WidgetsBinding.instance.addPostFrameCallback((_) => _complete());
    }
  }

  @override
  void didUpdateWidget(EmailLinkScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.incomingLink != null && widget.incomingLink != oldWidget.incomingLink) {
      setState(() => _stage = _Stage.completing);
      _complete();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _email.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _countdown = _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return t.cancel();
      setState(() => _countdown = (_countdown - 1).clamp(0, _resendSeconds));
      if (_countdown == 0) t.cancel();
    });
  }

  Future<void> _send({bool resend = false}) async {
    if (!(_formKey.currentState?.validate() ?? true)) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(authRepositoryProvider).sendEmailLink(_email.text);
      if (!mounted) return;
      setState(() => _stage = _Stage.checkInbox);
      _startCountdown();
      if (resend) showInfoSnack(context, context.l10n.authResent);
    } on AppException catch (e) {
      if (mounted) setState(() => _error = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _complete({String? email}) async {
    final link = widget.incomingLink;
    if (link == null) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(authRepositoryProvider).completeEmailLink(link, email: email);
      // Signed in: the router redirects to signup/onboarding/dashboard.
    } on EmailNeededForLinkException {
      if (mounted) setState(() => _stage = _Stage.confirmEmail);
    } on AppException catch (e) {
      if (mounted) {
        setState(() {
          _error = e;
          _stage = e.kind == AppErrorKind.invalidInput ? _Stage.enterEmail : _Stage.confirmEmail;
        });
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;

    Widget emailField() => TextFormField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const <String>[AutofillHints.email],
          textInputAction: TextInputAction.send,
          autocorrect: false,
          decoration: InputDecoration(labelText: l10n.authEmailLabel),
          validator: (v) => _emailPattern.hasMatch((v ?? '').trim()) ? null : l10n.authEmailInvalid,
          onFieldSubmitted: (_) => _stage == _Stage.confirmEmail ? _complete(email: _email.text.trim()) : _send(),
        );

    final errorText = _error == null
        ? null
        : (_error is AppException && (_error! as AppException).kind == AppErrorKind.invalidInput &&
                widget.incomingLink != null
            ? l10n.authLinkInvalid
            : errorMessage(l10n, _error!));

    final List<Widget> content = switch (_stage) {
      _Stage.enterEmail => <Widget>[
          Text(l10n.authEmailTitle, style: text.headlineSmall),
          const SizedBox(height: Space.s),
          Text(l10n.authEmailBody, style: text.bodyLarge),
          const SizedBox(height: Space.l),
          emailField(),
          const SizedBox(height: Space.l),
          SparkButton(label: l10n.authEmailSend, onPressed: _send, loading: _busy, expand: true),
        ],
      _Stage.checkInbox => <Widget>[
          Icon(Icons.mark_email_unread_rounded, size: 64, color: c.primary),
          const SizedBox(height: Space.m),
          Text(l10n.authCheckInboxTitle, style: text.headlineSmall),
          const SizedBox(height: Space.s),
          Text(l10n.authCheckInboxBody(_email.text.trim()), style: text.bodyLarge),
          const SizedBox(height: Space.l),
          SparkButton.secondary(
            label: _countdown > 0 ? l10n.authResendIn(_countdown) : l10n.authResend,
            onPressed: _countdown > 0 ? null : () => _send(resend: true),
            loading: _busy,
            expand: true,
          ),
          SparkButton.text(
            label: l10n.authUseDifferentEmail,
            onPressed: () => setState(() => _stage = _Stage.enterEmail),
            expand: true,
          ),
        ],
      _Stage.completing => <Widget>[
          const Center(child: AnimatedSparkLogo(size: 96, loop: true)),
          const SizedBox(height: Space.m),
          Text(l10n.authSigningIn, style: text.titleLarge, textAlign: TextAlign.center),
        ],
      _Stage.confirmEmail => <Widget>[
          Text(l10n.authConfirmEmailTitle, style: text.headlineSmall),
          const SizedBox(height: Space.s),
          Text(l10n.authConfirmEmailBody, style: text.bodyLarge),
          const SizedBox(height: Space.l),
          emailField(),
          const SizedBox(height: Space.l),
          SparkButton(
            label: l10n.commonContinue,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) _complete(email: _email.text.trim());
            },
            loading: _busy,
            expand: true,
          ),
        ],
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: c.background,
        leading: IconButton(
          tooltip: l10n.backTooltip,
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.canPop() ? context.pop() : context.go(Routes.auth),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Space.l),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ...content,
                    if (errorText != null) ...<Widget>[
                      const SizedBox(height: Space.m),
                      Semantics(
                        liveRegion: true,
                        child: Text(errorText, style: text.bodyMedium?.copyWith(color: c.danger)),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
