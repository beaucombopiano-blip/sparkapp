import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../core/errors/app_exception.dart';
import 'json.dart';

/// Converts any error thrown by Firebase, the network or a platform channel
/// into an [AppException].
AppException mapError(Object error) {
  if (error is AppException) return error;
  if (error is FirebaseFunctionsException) return _fromFunctions(error);
  if (error is FirebaseAuthException) return _fromAuth(error);
  if (error is FirebaseException) return _fromFirebase(error);
  if (error is TimeoutException) {
    return AppException(kind: AppErrorKind.timeout, retryable: true, cause: error);
  }
  // SocketException is matched by name so this file stays web-compatible.
  if (error is http.ClientException || error.runtimeType.toString() == 'SocketException') {
    return AppException(kind: AppErrorKind.network, retryable: true, cause: error);
  }
  if (error is PlatformException) {
    return AppException(
      kind: error.code.toLowerCase().contains('cancel') ? AppErrorKind.cancelled : AppErrorKind.unknown,
      code: error.code,
      cause: error,
      retryable: true,
    );
  }
  return AppException(kind: AppErrorKind.unknown, cause: error, retryable: true);
}

AppException _fromFunctions(FirebaseFunctionsException e) {
  final details = e.details is Map ? normalizeMap(e.details as Map<Object?, Object?>) : null;
  final backendCode = details?['code'] as String?;
  final retryableFromBackend = details?['retryable'];
  return AppException(
    kind: _kindForCode(backendCode ?? e.code),
    message: (e.message == null || e.message!.isEmpty || e.message == e.code.toUpperCase())
        ? null
        : e.message,
    code: backendCode ?? e.code,
    retryable: retryableFromBackend is bool ? retryableFromBackend : _retryableCode(e.code),
    details: details,
    cause: e,
  );
}

AppException _fromFirebase(FirebaseException e) {
  return AppException(
    kind: _kindForCode(e.code),
    code: e.code,
    retryable: _retryableCode(e.code),
    cause: e,
  );
}

AppException _fromAuth(FirebaseAuthException e) {
  final kind = switch (e.code) {
    'network-request-failed' => AppErrorKind.network,
    'too-many-requests' => AppErrorKind.rateLimited,
    'invalid-email' || 'invalid-action-code' || 'expired-action-code' => AppErrorKind.invalidInput,
    'user-disabled' || 'operation-not-allowed' => AppErrorKind.permissionDenied,
    'web-context-canceled' || 'canceled' || 'popup-closed-by-user' => AppErrorKind.cancelled,
    'requires-recent-login' || 'user-token-expired' => AppErrorKind.unauthenticated,
    _ => AppErrorKind.unknown,
  };
  return AppException(
    kind: kind,
    code: e.code,
    retryable: kind == AppErrorKind.network || kind == AppErrorKind.rateLimited,
    cause: e,
  );
}

AppErrorKind _kindForCode(String code) {
  switch (code) {
    case 'unavailable':
      return AppErrorKind.network;
    case 'deadline-exceeded':
      return AppErrorKind.timeout;
    case 'unauthenticated':
      return AppErrorKind.unauthenticated;
    case 'permission-denied':
      return AppErrorKind.permissionDenied;
    case 'not-found':
      return AppErrorKind.notFound;
    case 'invalid-argument':
    case 'failed-precondition':
    case 'out-of-range':
      return AppErrorKind.invalidInput;
    case 'resource-exhausted':
    case 'rate-limited':
      return AppErrorKind.rateLimited;
    case 'already-exists':
    case 'aborted':
      return AppErrorKind.conflict;
    case 'cancelled':
      return AppErrorKind.cancelled;
    case 'feature-locked':
    case 'entitlement-required':
      return AppErrorKind.featureLocked;
    case 'internal':
    case 'unknown':
    case 'data-loss':
      return AppErrorKind.server;
    default:
      return AppErrorKind.unknown;
  }
}

bool _retryableCode(String code) =>
    const <String>{'unavailable', 'deadline-exceeded', 'internal', 'aborted', 'unknown'}.contains(code);
