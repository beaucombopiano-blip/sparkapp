import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../errors/app_exception.dart';

/// One server-sent event.
class SseEvent {
  const SseEvent({required this.event, required this.data, this.id});

  /// Event name (`message` when the server did not send an `event:` line).
  final String event;

  /// Raw data (multiple `data:` lines joined with `\n`).
  final String data;
  final String? id;

  /// Data decoded as a JSON object, or null when it is not JSON.
  Map<String, Object?>? get json {
    try {
      final decoded = jsonDecode(data);
      return decoded is Map<String, Object?> ? decoded : null;
    } on FormatException {
      return null;
    }
  }

  @override
  String toString() => 'SseEvent($event, $data)';
}

/// Incrementally parses an SSE byte stream (https://html.spec.whatwg.org/multipage/server-sent-events.html).
class SseParser extends StreamTransformerBase<String, SseEvent> {
  const SseParser();

  @override
  Stream<SseEvent> bind(Stream<String> lines) async* {
    String? eventName;
    String? lastId;
    final data = <String>[];

    await for (final line in lines) {
      if (line.isEmpty) {
        if (data.isNotEmpty) {
          yield SseEvent(event: eventName ?? 'message', data: data.join('\n'), id: lastId);
        }
        eventName = null;
        data.clear();
        continue;
      }
      if (line.startsWith(':')) continue; // comment / keep-alive
      final colon = line.indexOf(':');
      final field = colon == -1 ? line : line.substring(0, colon);
      var value = colon == -1 ? '' : line.substring(colon + 1);
      if (value.startsWith(' ')) value = value.substring(1);
      switch (field) {
        case 'event':
          eventName = value;
        case 'data':
          data.add(value);
        case 'id':
          lastId = value;
        default:
          break; // `retry` and unknown fields are ignored.
      }
    }
    // Flush a final event if the stream ended without a blank line.
    if (data.isNotEmpty) {
      yield SseEvent(event: eventName ?? 'message', data: data.join('\n'), id: lastId);
    }
  }
}

typedef HttpClientFactory = http.Client Function();

/// Posts a JSON body and streams back server-sent events. Cancelling the
/// subscription closes the connection (used by the companion's Stop button).
class SseClient {
  SseClient({HttpClientFactory? clientFactory}) : _clientFactory = clientFactory ?? http.Client.new;

  final HttpClientFactory _clientFactory;

  Stream<SseEvent> post(
    Uri url, {
    required Map<String, String> headers,
    required Map<String, Object?> body,
    Duration connectTimeout = const Duration(seconds: 30),
  }) {
    late final StreamController<SseEvent> controller;
    http.Client? client;
    StreamSubscription<SseEvent>? subscription;

    Future<void> start() async {
      client = _clientFactory();
      try {
        final request = http.Request('POST', url)
          ..headers.addAll(<String, String>{
            'Content-Type': 'application/json',
            'Accept': 'text/event-stream',
            'Cache-Control': 'no-cache',
            ...headers,
          })
          ..body = jsonEncode(body);
        final response = await client!.send(request).timeout(connectTimeout);
        if (response.statusCode < 200 || response.statusCode >= 300) {
          final text = await response.stream.bytesToString();
          throw _httpError(response.statusCode, text);
        }
        subscription = response.stream
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .transform(const SseParser())
            .listen(
              controller.add,
              onError: (Object e, StackTrace st) => controller.addError(_wrap(e), st),
              onDone: () {
                client?.close();
                controller.close();
              },
              cancelOnError: true,
            );
      } catch (e, st) {
        client?.close();
        if (!controller.isClosed) {
          controller.addError(_wrap(e), st);
          await controller.close();
        }
      }
    }

    controller = StreamController<SseEvent>(
      onListen: start,
      onCancel: () async {
        await subscription?.cancel();
        client?.close();
      },
    );
    return controller.stream;
  }

  static AppException _wrap(Object e) {
    if (e is AppException) return e;
    if (e is TimeoutException) {
      return AppException(kind: AppErrorKind.timeout, retryable: true, cause: e);
    }
    return AppException(kind: AppErrorKind.network, retryable: true, cause: e);
  }

  /// Maps an error response. The backend replies with
  /// `{"error": {"message", "code", "retryable"}}` (or the callable-style
  /// `{"error": {"status", "message", "details"}}`).
  static AppException _httpError(int status, String body) {
    Map<String, Object?>? error;
    try {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, Object?>) {
        final e = decoded['error'];
        error = e is Map<String, Object?> ? e : decoded;
      }
    } on FormatException {
      error = null;
    }
    final details = error?['details'];
    final code = (details is Map ? details['code'] : null) as String? ??
        error?['code'] as String? ??
        error?['status'] as String?;
    final retryableValue = (details is Map ? details['retryable'] : null) ?? error?['retryable'];
    final kind = switch (status) {
      400 => AppErrorKind.invalidInput,
      401 => AppErrorKind.unauthenticated,
      403 => code == 'feature-locked' ? AppErrorKind.featureLocked : AppErrorKind.permissionDenied,
      404 => AppErrorKind.notFound,
      409 => AppErrorKind.conflict,
      429 => AppErrorKind.rateLimited,
      >= 500 => AppErrorKind.server,
      _ => AppErrorKind.unknown,
    };
    return AppException(
      kind: kind,
      message: error?['message'] as String?,
      code: code ?? 'http-$status',
      retryable: retryableValue is bool ? retryableValue : status >= 500 || status == 429,
    );
  }
}
