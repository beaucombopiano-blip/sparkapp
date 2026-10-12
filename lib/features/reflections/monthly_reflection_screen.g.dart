// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_reflection_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(monthlySummary)
final monthlySummaryProvider = MonthlySummaryFamily._();

final class MonthlySummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<MonthlyReflectionSummary?>,
          MonthlyReflectionSummary?,
          FutureOr<MonthlyReflectionSummary?>
        >
    with
        $FutureModifier<MonthlyReflectionSummary?>,
        $FutureProvider<MonthlyReflectionSummary?> {
  MonthlySummaryProvider._({
    required MonthlySummaryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'monthlySummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$monthlySummaryHash();

  @override
  String toString() {
    return r'monthlySummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MonthlyReflectionSummary?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MonthlyReflectionSummary?> create(Ref ref) {
    final argument = this.argument as String;
    return monthlySummary(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlySummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$monthlySummaryHash() => r'4102a2a5dff682210a126e8279833d14861263f1';

final class MonthlySummaryFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<MonthlyReflectionSummary?>, String> {
  MonthlySummaryFamily._()
    : super(
        retry: null,
        name: r'monthlySummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MonthlySummaryProvider call(String month) =>
      MonthlySummaryProvider._(argument: month, from: this);

  @override
  String toString() => r'monthlySummaryProvider';
}
