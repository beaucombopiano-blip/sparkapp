import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:spark/core/network/sse_client.dart';
import 'package:spark/data/firestore/functions_client.dart';

typedef CallableHandler = FutureOr<Map<String, dynamic>> Function(Map<String, Object?> data);

/// In-memory stand-in for Cloud Functions callables. Unhandled calls fail
/// loudly so tests never pass by accident.
class FakeFunctionsClient implements FunctionsClient {
  final Map<String, CallableHandler> handlers = <String, CallableHandler>{};
  final List<(String, Map<String, Object?>)> calls = <(String, Map<String, Object?>)>[];

  void on(String name, CallableHandler handler) => handlers[name] = handler;

  int callCount(String name) => calls.where((c) => c.$1 == name).length;

  @override
  Future<Map<String, dynamic>> call(
    String name, [
    Map<String, Object?> data = const <String, Object?>{},
    Duration timeout = const Duration(seconds: 70),
  ]) async {
    calls.add((name, data));
    final handler = handlers[name];
    if (handler == null) throw StateError('No fake handler for callable "$name"');
    return Map<String, dynamic>.from(await handler(data));
  }
}

/// Mocked SSE client for companionChat / ideaInterview.
class MockStreamingFunctionsClient extends Mock implements StreamingFunctionsClient {}

/// Builds an SSE event.
SseEvent sse(String event, String data) => SseEvent(event: event, data: data);
