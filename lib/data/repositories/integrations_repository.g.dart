// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrations_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(integrationsRepository)
final integrationsRepositoryProvider = IntegrationsRepositoryProvider._();

final class IntegrationsRepositoryProvider
    extends
        $FunctionalProvider<
          IntegrationsRepository,
          IntegrationsRepository,
          IntegrationsRepository
        >
    with $Provider<IntegrationsRepository> {
  IntegrationsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'integrationsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$integrationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<IntegrationsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IntegrationsRepository create(Ref ref) {
    return integrationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IntegrationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IntegrationsRepository>(value),
    );
  }
}

String _$integrationsRepositoryHash() =>
    r'cd9982da5afc2a10280b34a56a56e8edce9d9685';
