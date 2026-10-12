// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resourceRepository)
final resourceRepositoryProvider = ResourceRepositoryProvider._();

final class ResourceRepositoryProvider
    extends
        $FunctionalProvider<
          ResourceRepository,
          ResourceRepository,
          ResourceRepository
        >
    with $Provider<ResourceRepository> {
  ResourceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resourceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resourceRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResourceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResourceRepository create(Ref ref) {
    return resourceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResourceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResourceRepository>(value),
    );
  }
}

String _$resourceRepositoryHash() =>
    r'9e4684fa1e52bf20ef7d1efcb41846a78138c6b0';
