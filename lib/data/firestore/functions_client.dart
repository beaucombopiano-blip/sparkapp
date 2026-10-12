import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/errors/app_exception.dart';
import '../../core/firebase/firebase_providers.dart';
import '../../core/network/sse_client.dart';
import 'error_mapping.dart';
import 'json.dart';

part 'functions_client.g.dart';

typedef Json = Map<String, dynamic>;

/// Calls `onCall` Cloud Functions and returns normalised JSON. Every error is
/// converted to [AppException] (with the backend's friendly message).
class FunctionsClient {
  FunctionsClient(this._functions);

  final FirebaseFunctions _functions;

  Future<Json> call(
    String name, [
    Map<String, Object?> data = const <String, Object?>{},
    Duration timeout = const Duration(seconds: 70),
  ]) async {
    try {
      final callable = _functions.httpsCallable(name, options: HttpsCallableOptions(timeout: timeout));
      final result = await callable.call<Object?>(data);
      final normalized = normalizeJson(result.data);
      if (normalized is Map<String, Object?>) return Map<String, dynamic>.from(normalized);
      return <String, dynamic>{'value': normalized};
    } on Object catch (e) {
      throw mapError(e);
    }
  }
}

@Riverpod(keepAlive: true)
FunctionsClient functionsClient(Ref ref) => FunctionsClient(ref.watch(firebaseFunctionsProvider));

/// Streams server-sent events from HTTPS functions (companionChat,
/// ideaInterview), sending the Firebase ID token and App Check token.
class StreamingFunctionsClient {
  StreamingFunctionsClient({
    required this._auth,
    required this._appCheck,
    required this._baseUrl,
    SseClient? sse,
  })  : _sse = sse ?? SseClient();

  final FirebaseAuth _auth;
  final FirebaseAppCheck _appCheck;
  final String _baseUrl;
  final SseClient _sse;

  Stream<SseEvent> stream(String functionName, Map<String, Object?> body) async* {
    final user = _auth.currentUser;
    if (user == null) {
      throw const AppException(kind: AppErrorKind.unauthenticated);
    }
    final String? idToken;
    try {
      idToken = await user.getIdToken();
    } on Object catch (e) {
      throw mapError(e);
    }
    String? appCheckToken;
    try {
      appCheckToken = await _appCheck.getToken();
    } on Object {
      // App Check may be unavailable on emulators/dev builds; the backend
      // decides whether to reject the request.
      appCheckToken = null;
    }
    yield* _sse.post(
      Uri.parse('$_baseUrl/$functionName'),
      headers: <String, String>{
        if (idToken != null) 'Authorization': 'Bearer $idToken',
        'X-Firebase-AppCheck': ?appCheckToken,
      },
      body: body,
    );
  }
}

@Riverpod(keepAlive: true)
StreamingFunctionsClient streamingFunctionsClient(Ref ref) => StreamingFunctionsClient(
      auth: ref.watch(firebaseAuthProvider),
      appCheck: ref.watch(firebaseAppCheckProvider),
      baseUrl: ref.watch(functionsBaseUrlProvider),
    );
