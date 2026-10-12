// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sparkTheme)
final sparkThemeProvider = SparkThemeProvider._();

final class SparkThemeProvider
    extends
        $FunctionalProvider<
          SparkThemeBundle,
          SparkThemeBundle,
          SparkThemeBundle
        >
    with $Provider<SparkThemeBundle> {
  SparkThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sparkThemeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sparkThemeHash();

  @$internal
  @override
  $ProviderElement<SparkThemeBundle> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SparkThemeBundle create(Ref ref) {
    return sparkTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SparkThemeBundle value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SparkThemeBundle>(value),
    );
  }
}

String _$sparkThemeHash() => r'8637899e9540069b7bcf39f6b796513f93ac1c77';
