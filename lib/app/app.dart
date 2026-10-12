import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../core/utils/l10n.dart';
import '../features/gamification/celebration_queue.dart';
import '../features/notifications/notification_service.dart';
import '../features/splash_greeting/deep_links.dart';
import 'router.dart';
import 'theme/theme_providers.dart';

/// Root widget: themes from the user's palette, localisation, router.
class SparkApp extends ConsumerWidget {
  const SparkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(sparkThemeProvider);
    // Background services that live for the whole session.
    ref.watch(deepLinkListenerProvider);
    ref.watch(notificationBootstrapProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appName,
      debugShowCheckedModeBanner: false,
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: theme.mode,
      themeAnimationDuration: const Duration(milliseconds: 250),
      routerConfig: router,
      localizationsDelegates: <LocalizationsDelegate<Object?>>[
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) => CelebrationHost(child: child ?? const SizedBox.shrink()),
    );
  }
}
