import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/router.dart';
import '../../app/routes.dart';
import '../../core/config/app_config.dart';
import '../../data/repositories/auth_repository.dart';

part 'deep_links.g.dart';

/// Maps an incoming link to an in-app route, or null when it isn't ours.
///
/// Handles `spark://<path>` (notifications, OAuth returns) and https universal
/// links whose path is an app route. Email sign-in links are recognised by the
/// caller via Firebase Auth.
String? routeForLink(Uri uri) {
  if (uri.scheme == AppConfig.urlScheme) {
    // spark://project/task/abc → /project/task/abc
    final path = '/${uri.host}${uri.path}'.replaceAll(RegExp(r'/+$'), '');
    return Uri(path: path.isEmpty ? Routes.dashboard : path, query: uri.query.isEmpty ? null : uri.query).toString();
  }
  if (uri.scheme == 'https' || uri.scheme == 'http') {
    const known = <String>[
      Routes.dashboard,
      Routes.project,
      Routes.journal,
      Routes.profile,
      Routes.companionPath,
      Routes.focusPath,
      Routes.settings,
      Routes.weeklyCheckin,
      Routes.monthlyReflection,
    ];
    if (known.any((r) => uri.path == r || uri.path.startsWith('$r/'))) {
      return Uri(path: uri.path, query: uri.query.isEmpty ? null : uri.query).toString();
    }
  }
  return null;
}

/// Listens for incoming links for the lifetime of the app and routes them:
/// email sign-in links → /auth/email-link, everything else → its route.
@Riverpod(keepAlive: true)
DeepLinkListener deepLinkListener(Ref ref) {
  final listener = DeepLinkListener(
    onLink: (uri) {
      final auth = ref.read(authRepositoryProvider);
      final router = ref.read(routerProvider);
      final link = uri.toString();
      if (auth.isEmailSignInLink(link)) {
        router.go(Uri(path: Routes.authEmailLink, queryParameters: <String, String>{'link': link}).toString());
        return;
      }
      final route = routeForLink(uri);
      if (route != null) router.go(route);
    },
  )..start();
  ref.onDispose(listener.dispose);
  return listener;
}

class DeepLinkListener {
  DeepLinkListener({required this.onLink});

  final void Function(Uri uri) onLink;
  StreamSubscription<Uri>? _sub;

  void start() {
    if (kIsWeb) return; // Web URLs are handled by the router directly.
    try {
      // Emits the initial link (cold start) and every later link.
      _sub = AppLinks().uriLinkStream.listen(onLink, onError: (Object _) {});
    } on Object {
      _sub = null;
    }
  }

  void dispose() => _sub?.cancel();
}
