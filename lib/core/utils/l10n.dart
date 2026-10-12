import 'package:material_ui/material_ui.dart';

import '../../l10n/generated/app_localizations.dart';
import '../errors/app_exception.dart';
import 'formatters.dart';

export '../../l10n/generated/app_localizations.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  SparkFormat get fmt => SparkFormat(Localizations.localeOf(this).toLanguageTag(), l10n);
}

/// A user-facing message for any error. Backend messages (already friendly)
/// are shown verbatim; device-side errors get a localised message.
String errorMessage(AppLocalizations l10n, Object error) {
  if (error is AppException) {
    final message = error.message;
    if (message != null && message.trim().isNotEmpty) return message;
    return switch (error.kind) {
      AppErrorKind.network => l10n.errorNetwork,
      AppErrorKind.timeout => l10n.errorTimeout,
      AppErrorKind.unauthenticated => l10n.errorUnauthenticated,
      AppErrorKind.permissionDenied => l10n.errorPermissionDenied,
      AppErrorKind.notFound => l10n.errorNotFound,
      AppErrorKind.invalidInput => l10n.errorInvalidInput,
      AppErrorKind.rateLimited => l10n.errorRateLimited,
      AppErrorKind.featureLocked => l10n.errorFeatureLocked,
      AppErrorKind.conflict => l10n.errorConflict,
      AppErrorKind.cancelled => l10n.errorCancelled,
      AppErrorKind.server => l10n.errorServer,
      AppErrorKind.notConfigured => l10n.errorNotConfigured,
      AppErrorKind.unknown => l10n.errorUnknown,
    };
  }
  return l10n.errorUnknown;
}

/// Shows a snackbar with the real error and an optional Retry action.
void showErrorSnack(BuildContext context, Object error, {VoidCallback? onRetry}) {
  final l10n = context.l10n;
  ScaffoldMessenger.maybeOf(context)
    ?..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(errorMessage(l10n, error)),
        action: onRetry == null ? null : SnackBarAction(label: l10n.commonRetry, onPressed: onRetry),
      ),
    );
}

void showInfoSnack(BuildContext context, String message) {
  ScaffoldMessenger.maybeOf(context)
    ?..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
