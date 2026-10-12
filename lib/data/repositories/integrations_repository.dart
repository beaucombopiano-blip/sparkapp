import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/errors/app_exception.dart';
import '../firestore/functions_client.dart';
import '../models/billing.dart';

part 'integrations_repository.g.dart';

/// Google Calendar connection and the plan catalog. RevenueCat purchases live
/// in features/billing (device store flows); the backend never charges.
class IntegrationsRepository {
  IntegrationsRepository(this._functions);

  final FunctionsClient _functions;

  /// Returns the Google consent URL (OAuth 2.0 + PKCE handled server-side).
  Future<Uri> gcalConnectStart() async {
    final result = await _functions.call('gcalConnectStart');
    final url = result['url'] as String? ?? result['consentUrl'] as String?;
    final uri = url == null ? null : Uri.tryParse(url);
    if (uri == null) throw const AppException(kind: AppErrorKind.server, code: 'gcal-no-url');
    return uri;
  }

  Future<void> gcalDisconnect() => _functions.call('gcalDisconnect');

  Future<PlanCatalog> getPlanCatalog() async => PlanCatalog.fromJson(await _functions.call('getPlanCatalog'));
}

@Riverpod(keepAlive: true)
IntegrationsRepository integrationsRepository(Ref ref) =>
    IntegrationsRepository(ref.watch(functionsClientProvider));
