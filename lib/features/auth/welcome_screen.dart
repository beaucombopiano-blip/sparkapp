import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/routes.dart';
import '../../app/theme/spark_colors.dart';
import '../../app/theme/tokens.dart';
import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/resource_card.dart' show openExternalUrl;
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../data/repositories/auth_repository.dart';

enum _Provider { apple, google }

/// Welcome: logo, slogan, Continue with Apple / Google / email.
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  _Provider? _busy;

  Future<void> _signIn(_Provider provider) async {
    setState(() => _busy = provider);
    final auth = ref.read(authRepositoryProvider);
    try {
      switch (provider) {
        case _Provider.apple:
          await auth.signInWithApple();
        case _Provider.google:
          await auth.signInWithGoogle();
      }
      // The router redirects once the auth state changes.
    } on AppException catch (e) {
      if (!e.isCancelled && mounted) showErrorSnack(context, e, onRetry: () => _signIn(provider));
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;
    final c = context.spark;
    final appleFirst = !kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS);

    final apple = SparkButton(
      key: const Key('auth-apple'),
      label: l10n.authContinueApple,
      icon: Icons.apple,
      loading: _busy == _Provider.apple,
      onPressed: _busy == null ? () => _signIn(_Provider.apple) : null,
      expand: true,
    );
    final google = SparkButton.secondary(
      key: const Key('auth-google'),
      label: l10n.authContinueGoogle,
      icon: Icons.g_mobiledata_rounded,
      loading: _busy == _Provider.google,
      onPressed: _busy == null ? () => _signIn(_Provider.google) : null,
      expand: true,
    );
    final email = SparkButton.secondary(
      key: const Key('auth-email'),
      label: l10n.authContinueEmail,
      icon: Icons.mail_outline_rounded,
      onPressed: _busy == null ? () => context.push(Routes.authEmailLink) : null,
      expand: true,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Space.l),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(child: AnimatedSparkLogo(size: 120)),
                  const SizedBox(height: Space.m),
                  Text(l10n.appName, style: text.displayMedium, textAlign: TextAlign.center),
                  Text(
                    l10n.appSlogan,
                    style: text.titleMedium?.copyWith(color: c.secondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Space.l),
                  Text(l10n.authWelcomeTitle, style: text.headlineSmall, textAlign: TextAlign.center),
                  const SizedBox(height: Space.s),
                  Text(l10n.authWelcomeBody, style: text.bodyLarge, textAlign: TextAlign.center),
                  const SizedBox(height: Space.xl),
                  if (appleFirst) ...<Widget>[apple, const SizedBox(height: Space.s), google]
                  else ...<Widget>[google, const SizedBox(height: Space.s), apple],
                  const SizedBox(height: Space.s),
                  email,
                  const SizedBox(height: Space.l),
                  Text(l10n.authLegal, style: text.bodySmall, textAlign: TextAlign.center),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      if (AppConfig.termsUrl.isNotEmpty)
                        TextButton(onPressed: () => openExternalUrl(AppConfig.termsUrl), child: Text(l10n.authTerms)),
                      if (AppConfig.privacyUrl.isNotEmpty)
                        TextButton(
                          onPressed: () => openExternalUrl(AppConfig.privacyUrl),
                          child: Text(l10n.authPrivacy),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
