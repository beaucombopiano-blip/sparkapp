// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appSession)
final appSessionProvider = AppSessionProvider._();

final class AppSessionProvider
    extends $FunctionalProvider<AppSession, AppSession, AppSession>
    with $Provider<AppSession> {
  AppSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSessionHash();

  @$internal
  @override
  $ProviderElement<AppSession> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppSession create(Ref ref) {
    return appSession(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSession>(value),
    );
  }
}

String _$appSessionHash() => r'e46d7ac4f11f5a2071422e62eacf9dc823efc752';

@ProviderFor(greetingGate)
final greetingGateProvider = GreetingGateProvider._();

final class GreetingGateProvider
    extends $FunctionalProvider<GreetingGate, GreetingGate, GreetingGate>
    with $Provider<GreetingGate> {
  GreetingGateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'greetingGateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$greetingGateHash();

  @$internal
  @override
  $ProviderElement<GreetingGate> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GreetingGate create(Ref ref) {
    return greetingGate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GreetingGate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GreetingGate>(value),
    );
  }
}

String _$greetingGateHash() => r'df0386e857adabb102973b02ed843901f508bbb9';
