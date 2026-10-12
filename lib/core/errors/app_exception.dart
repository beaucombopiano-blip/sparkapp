import 'package:flutter/foundation.dart';

/// Broad categories so the UI can show a friendly, localised message when the
/// backend did not supply one.
enum AppErrorKind {
  network,
  unauthenticated,
  permissionDenied,
  notFound,
  invalidInput,
  rateLimited,
  featureLocked,
  conflict,
  cancelled,
  timeout,
  server,
  notConfigured,
  unknown,
}

/// The single error type the UI deals with. Repositories convert Firebase,
/// HTTP and platform errors into this.
@immutable
class AppException implements Exception {
  const AppException({
    required this.kind,
    this.message,
    this.code,
    this.retryable = false,
    this.details,
    this.cause,
  });

  final AppErrorKind kind;

  /// Friendly message from the backend (`HttpsError.message`), shown verbatim.
  /// Null when the error originated on the device.
  final String? message;

  /// Machine-readable code (`details.code` from the backend, or the SDK code).
  final String? code;

  /// Whether retrying the same request may succeed.
  final bool retryable;

  final Map<String, Object?>? details;
  final Object? cause;

  bool get isCancelled => kind == AppErrorKind.cancelled;

  @override
  String toString() => 'AppException($kind, code: $code, message: $message)';
}

/// Wraps an arbitrary error. Use at the repository boundary.
AppException toAppException(Object error) {
  if (error is AppException) return error;
  return AppException(kind: AppErrorKind.unknown, cause: error, retryable: true);
}
