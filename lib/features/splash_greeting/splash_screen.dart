import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/session.dart';
import '../../app/theme/tokens.dart';
import '../../core/utils/l10n.dart';
import '../../core/widgets/spark_button.dart';
import '../../core/widgets/spark_logo.dart';
import '../../core/widgets/states.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/auth_repository.dart';

/// Shown while auth state resolves, so the wrong screen never flashes.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(appSessionProvider);
    final l10n = context.l10n;
    final text = Theme.of(context).textTheme;

    if (session is SessionFailed) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SparkLogoFace(size: 80),
              const SizedBox(height: Space.m),
              Text(l10n.splashErrorTitle, style: text.titleLarge, textAlign: TextAlign.center),
              ErrorState(
                error: session.error,
                compact: true,
                onRetry: () {
                  ref.invalidate(authSessionProvider);
                  ref.invalidate(userProfileProvider);
                },
              ),
              SparkButton.text(
                label: l10n.signOut,
                onPressed: () => ref.read(authRepositoryProvider).signOut(),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Space.l),
          child: Column(
            children: <Widget>[
              const SizedBox(height: Space.xxl),
              AnimatedSparkLogo(size: 96, loop: true, semanticLabel: l10n.splashLoading),
              const SizedBox(height: Space.l),
              const Expanded(child: SkeletonList(itemCount: 4, itemHeight: 72)),
            ],
          ),
        ),
      ),
    );
  }
}
