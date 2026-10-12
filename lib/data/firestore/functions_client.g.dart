// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'functions_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(functionsClient)
final functionsClientProvider = FunctionsClientProvider._();

final class FunctionsClientProvider
    extends
        $FunctionalProvider<FunctionsClient, FunctionsClient, FunctionsClient>
    with $Provider<FunctionsClient> {
  FunctionsClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'functionsClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$functionsClientHash();

  @$internal
  @override
  $ProviderElement<FunctionsClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FunctionsClient create(Ref ref) {
    return functionsClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FunctionsClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FunctionsClient>(value),
    );
  }
}

String _$functionsClientHash() => r'f9052599ff90437bd53a67b7d4251379eab49670';

@ProviderFor(streamingFunctionsClient)
final streamingFunctionsClientProvider = StreamingFunctionsClientProvider._();

final class StreamingFunctionsClientProvider
    extends
        $FunctionalProvider<
          StreamingFunctionsClient,
          StreamingFunctionsClient,
          StreamingFunctionsClient
        >
    with $Provider<StreamingFunctionsClient> {
  StreamingFunctionsClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'streamingFunctionsClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$streamingFunctionsClientHash();

  @$internal
  @override
  $ProviderElement<StreamingFunctionsClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StreamingFunctionsClient create(Ref ref) {
    return streamingFunctionsClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StreamingFunctionsClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StreamingFunctionsClient>(value),
    );
  }
}

String _$streamingFunctionsClientHash() =>
    r'3b3032516c5d273fd1dce8b521a2fa80c93a0a53';
