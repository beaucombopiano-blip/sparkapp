// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_links.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Listens for incoming links for the lifetime of the app and routes them:
/// email sign-in links → /auth/email-link, everything else → its route.

@ProviderFor(deepLinkListener)
final deepLinkListenerProvider = DeepLinkListenerProvider._();

/// Listens for incoming links for the lifetime of the app and routes them:
/// email sign-in links → /auth/email-link, everything else → its route.

final class DeepLinkListenerProvider
    extends
        $FunctionalProvider<
          DeepLinkListener,
          DeepLinkListener,
          DeepLinkListener
        >
    with $Provider<DeepLinkListener> {
  /// Listens for incoming links for the lifetime of the app and routes them:
  /// email sign-in links → /auth/email-link, everything else → its route.
  DeepLinkListenerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deepLinkListenerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deepLinkListenerHash();

  @$internal
  @override
  $ProviderElement<DeepLinkListener> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeepLinkListener create(Ref ref) {
    return deepLinkListener(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeepLinkListener value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeepLinkListener>(value),
    );
  }
}

String _$deepLinkListenerHash() => r'2e4cef1a3fff8ad8335c98d486e3126a8fc525e1';
