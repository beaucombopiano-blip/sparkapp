// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflections_history_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkins)
final checkinsProvider = CheckinsProvider._();

final class CheckinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Checkin>>,
          List<Checkin>,
          Stream<List<Checkin>>
        >
    with $FutureModifier<List<Checkin>>, $StreamProvider<List<Checkin>> {
  CheckinsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkinsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkinsHash();

  @$internal
  @override
  $StreamProviderElement<List<Checkin>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Checkin>> create(Ref ref) {
    return checkins(ref);
  }
}

String _$checkinsHash() => r'b94f1c1ea457049adfd6e60860e61338b766d3df';

@ProviderFor(reflections)
final reflectionsProvider = ReflectionsProvider._();

final class ReflectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Reflection>>,
          List<Reflection>,
          Stream<List<Reflection>>
        >
    with $FutureModifier<List<Reflection>>, $StreamProvider<List<Reflection>> {
  ReflectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reflectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reflectionsHash();

  @$internal
  @override
  $StreamProviderElement<List<Reflection>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Reflection>> create(Ref ref) {
    return reflections(ref);
  }
}

String _$reflectionsHash() => r'1f0273506b33e46dac2afe87f05028c0990da46d';
