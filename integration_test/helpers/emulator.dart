import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spark/core/firebase/firebase_providers.dart';
import 'package:spark/firebase_options.dart';

/// Talks to the Firebase Emulator Suite's REST endpoints (test-only).
class EmulatorAdmin {
  EmulatorAdmin() : projectId = DefaultFirebaseOptions.currentPlatform.projectId;

  final String projectId;
  String get _host => emulatorHost();

  /// Wipes Firestore and Auth so each flow starts from a clean backend.
  Future<void> reset() async {
    await http.delete(Uri.parse('http://$_host:8080/emulator/v1/projects/$projectId/databases/(default)/documents'));
    await http.delete(Uri.parse('http://$_host:9099/emulator/v1/projects/$projectId/accounts'));
  }

  /// The most recent email sign-in link the Auth emulator "sent" to [email].
  Future<String?> emailSignInLink(String email) async {
    final response = await http.get(Uri.parse('http://$_host:9099/emulator/v1/projects/$projectId/oobCodes'));
    if (response.statusCode != 200) return null;
    final codes = (jsonDecode(response.body) as Map<String, Object?>)['oobCodes'] as List<Object?>? ?? const <Object?>[];
    final matching = codes
        .whereType<Map<String, Object?>>()
        .where((c) => c['email'] == email && c['requestType'] == 'EMAIL_SIGNIN')
        .toList();
    return matching.isEmpty ? null : matching.last['oobLink'] as String?;
  }

  /// Reads a document with admin rights (bypasses security rules).
  Future<Map<String, Object?>?> getDocument(String path) async {
    final response = await http.get(
      Uri.parse('http://$_host:8080/v1/projects/$projectId/databases/(default)/documents/$path'),
      headers: const <String, String>{'Authorization': 'Bearer owner'},
    );
    if (response.statusCode != 200) return null;
    return jsonDecode(response.body) as Map<String, Object?>;
  }

  /// A string field from a REST document (`fields.<name>.stringValue`).
  static String? stringField(Map<String, Object?>? doc, String name) {
    final fields = doc?['fields'] as Map<String, Object?>?;
    final value = fields?[name] as Map<String, Object?>?;
    return value?['stringValue'] as String?;
  }
}
