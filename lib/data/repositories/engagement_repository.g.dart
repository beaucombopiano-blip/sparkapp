// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engagement_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(engagementRepository)
final engagementRepositoryProvider = EngagementRepositoryProvider._();

final class EngagementRepositoryProvider
    extends
        $FunctionalProvider<
          EngagementRepository,
          EngagementRepository,
          EngagementRepository
        >
    with $Provider<EngagementRepository> {
  EngagementRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'engagementRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$engagementRepositoryHash();

  @$internal
  @override
  $ProviderElement<EngagementRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EngagementRepository create(Ref ref) {
    return engagementRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EngagementRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EngagementRepository>(value),
    );
  }
}

String _$engagementRepositoryHash() =>
    r'9b688ee6275e0d52162c8c2a7c16ffd24b4165db';
