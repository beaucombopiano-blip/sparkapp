// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations_step.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recommendations)
final recommendationsProvider = RecommendationsProvider._();

final class RecommendationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Recommendation>>,
          List<Recommendation>,
          Stream<List<Recommendation>>
        >
    with
        $FutureModifier<List<Recommendation>>,
        $StreamProvider<List<Recommendation>> {
  RecommendationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recommendationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recommendationsHash();

  @$internal
  @override
  $StreamProviderElement<List<Recommendation>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Recommendation>> create(Ref ref) {
    return recommendations(ref);
  }
}

String _$recommendationsHash() => r'42e157fa73dd787ccc051781b067f6bfa712e184';
