// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Live journal entries for the active project.

@ProviderFor(journalEntries)
final journalEntriesProvider = JournalEntriesProvider._();

/// Live journal entries for the active project.

final class JournalEntriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<JournalEntry>>,
          List<JournalEntry>,
          Stream<List<JournalEntry>>
        >
    with
        $FutureModifier<List<JournalEntry>>,
        $StreamProvider<List<JournalEntry>> {
  /// Live journal entries for the active project.
  JournalEntriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'journalEntriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$journalEntriesHash();

  @$internal
  @override
  $StreamProviderElement<List<JournalEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<JournalEntry>> create(Ref ref) {
    return journalEntries(ref);
  }
}

String _$journalEntriesHash() => r'4c2de0941ab8a451c37b84a516387a265960a5c2';

/// The merged timeline with 10-minute signed URLs. Re-fetched whenever an
/// entry is added, finishes processing, changes caption or is deleted.

@ProviderFor(journalTimeline)
final journalTimelineProvider = JournalTimelineProvider._();

/// The merged timeline with 10-minute signed URLs. Re-fetched whenever an
/// entry is added, finishes processing, changes caption or is deleted.

final class JournalTimelineProvider
    extends
        $FunctionalProvider<
          AsyncValue<JournalTimeline?>,
          JournalTimeline?,
          FutureOr<JournalTimeline?>
        >
    with $FutureModifier<JournalTimeline?>, $FutureProvider<JournalTimeline?> {
  /// The merged timeline with 10-minute signed URLs. Re-fetched whenever an
  /// entry is added, finishes processing, changes caption or is deleted.
  JournalTimelineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'journalTimelineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$journalTimelineHash();

  @$internal
  @override
  $FutureProviderElement<JournalTimeline?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<JournalTimeline?> create(Ref ref) {
    return journalTimeline(ref);
  }
}

String _$journalTimelineHash() => r'e07a25056526bdb04a7ace1863b98e7f94f75202';

@ProviderFor(scrapbooks)
final scrapbooksProvider = ScrapbooksProvider._();

final class ScrapbooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Scrapbook>>,
          List<Scrapbook>,
          Stream<List<Scrapbook>>
        >
    with $FutureModifier<List<Scrapbook>>, $StreamProvider<List<Scrapbook>> {
  ScrapbooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scrapbooksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scrapbooksHash();

  @$internal
  @override
  $StreamProviderElement<List<Scrapbook>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Scrapbook>> create(Ref ref) {
    return scrapbooks(ref);
  }
}

String _$scrapbooksHash() => r'efcfdfbad670e2426d709ad4bf3aa3d91ff15cde';

@ProviderFor(scrapbookView)
final scrapbookViewProvider = ScrapbookViewFamily._();

final class ScrapbookViewProvider
    extends
        $FunctionalProvider<
          AsyncValue<ScrapbookView>,
          ScrapbookView,
          FutureOr<ScrapbookView>
        >
    with $FutureModifier<ScrapbookView>, $FutureProvider<ScrapbookView> {
  ScrapbookViewProvider._({
    required ScrapbookViewFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'scrapbookViewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scrapbookViewHash();

  @override
  String toString() {
    return r'scrapbookViewProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ScrapbookView> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ScrapbookView> create(Ref ref) {
    final argument = this.argument as String;
    return scrapbookView(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ScrapbookViewProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scrapbookViewHash() => r'f0935c8ce65d9fc95c3c6b17a21161caaab40e8f';

final class ScrapbookViewFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ScrapbookView>, String> {
  ScrapbookViewFamily._()
    : super(
        retry: null,
        name: r'scrapbookViewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScrapbookViewProvider call(String scrapbookId) =>
      ScrapbookViewProvider._(argument: scrapbookId, from: this);

  @override
  String toString() => r'scrapbookViewProvider';
}

/// Timeline order (device-local preference).

@ProviderFor(JournalNewestFirst)
final journalNewestFirstProvider = JournalNewestFirstProvider._();

/// Timeline order (device-local preference).
final class JournalNewestFirstProvider
    extends $NotifierProvider<JournalNewestFirst, bool> {
  /// Timeline order (device-local preference).
  JournalNewestFirstProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'journalNewestFirstProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$journalNewestFirstHash();

  @$internal
  @override
  JournalNewestFirst create() => JournalNewestFirst();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$journalNewestFirstHash() =>
    r'30cc559a54349393eb0f5fccb1e24a58f72b31ee';

/// Timeline order (device-local preference).

abstract class _$JournalNewestFirst extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
