import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:spark/core/errors/app_exception.dart';
import 'package:spark/core/network/sse_client.dart';

Future<List<SseEvent>> parse(String raw) =>
    Stream<String>.value(raw).transform(const LineSplitter()).transform(const SseParser()).toList();

void main() {
  group('SseParser', () {
    test('parses named events with JSON data', () async {
      final events = await parse('event: meta\ndata: {"conversationId":"c1"}\n\nevent: token\ndata: {"text":"Hi"}\n\n');
      expect(events.map((e) => e.event), <String>['meta', 'token']);
      expect(events.first.json, <String, Object?>{'conversationId': 'c1'});
    });

    test('joins multi-line data, ignores comments, defaults to message', () async {
      final events = await parse(': keep-alive\ndata: line one\ndata: line two\nid: 7\n\n');
      expect(events.single.event, 'message');
      expect(events.single.data, 'line one\nline two');
      expect(events.single.id, '7');
      expect(events.single.json, isNull);
    });

    test('flushes a final event without a trailing blank line', () async {
      final events = await parse('event: done\ndata: {}');
      expect(events.single.event, 'done');
    });

    test('handles data split across chunks', () async {
      final chunks = Stream<String>.fromIterable(<String>['event: tok', 'en\ndata: {"te', 'xt":"a"}\n', '\n']);
      final events = await chunks.transform(const LineSplitter()).transform(const SseParser()).toList();
      expect(events.single.json, <String, Object?>{'text': 'a'});
    });
  });

  group('SseClient', () {
    test('streams events from a 200 response', () async {
      final client = SseClient(
        clientFactory: () => MockClient.streaming((request, body) async {
          expect(request.headers['Accept'], 'text/event-stream');
          expect(request.headers['Authorization'], 'Bearer t');
          return http.StreamedResponse(
            Stream<List<int>>.value(utf8.encode('event: token\ndata: {"text":"Hey"}\n\nevent: done\ndata: {}\n\n')),
            200,
          );
        }),
      );
      final events = await client
          .post(Uri.parse('https://example.test/companionChat'), headers: <String, String>{'Authorization': 'Bearer t'}, body: <String, Object?>{})
          .toList();
      expect(events.map((e) => e.event), <String>['token', 'done']);
    });

    test('maps an error response to a typed, friendly exception', () async {
      final client = SseClient(
        clientFactory: () => MockClient((request) async => http.Response(
              jsonEncode(<String, Object?>{
                'error': <String, Object?>{'message': 'You have used today\'s messages.', 'code': 'rate-limited', 'retryable': false},
              }),
              429,
            )),
      );
      final error = await client
          .post(Uri.parse('https://example.test/x'), headers: const <String, String>{}, body: const <String, Object?>{})
          .first
          .then<Object?>((_) => null, onError: (Object e) => e);
      expect(error, isA<AppException>());
      final e = error! as AppException;
      expect(e.kind, AppErrorKind.rateLimited);
      expect(e.message, "You have used today's messages.");
      expect(e.retryable, isFalse);
    });

    test('maps 403 feature-locked', () async {
      final client = SseClient(
        clientFactory: () => MockClient((_) async => http.Response('{"error":{"status":"PERMISSION_DENIED","details":{"code":"feature-locked"}}}', 403)),
      );
      final error = await client
          .post(Uri.parse('https://example.test/x'), headers: const <String, String>{}, body: const <String, Object?>{})
          .first
          .then<Object?>((_) => null, onError: (Object e) => e);
      expect((error! as AppException).kind, AppErrorKind.featureLocked);
    });

    test('network failures are retryable', () async {
      final client = SseClient(clientFactory: () => MockClient((_) async => throw http.ClientException('offline')));
      final error = await client
          .post(Uri.parse('https://example.test/x'), headers: const <String, String>{}, body: const <String, Object?>{})
          .first
          .then<Object?>((_) => null, onError: (Object e) => e);
      final e = error! as AppException;
      expect(e.kind, AppErrorKind.network);
      expect(e.retryable, isTrue);
    });
  });
}
