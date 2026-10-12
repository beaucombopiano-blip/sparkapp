// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebration_queue.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Milestones, badges, streaks and challenge wins queue here and show one at
/// a time. Focus mode pauses the queue so nothing pops mid-session.

@ProviderFor(CelebrationQueue)
final celebrationQueueProvider = CelebrationQueueProvider._();

/// Milestones, badges, streaks and challenge wins queue here and show one at
/// a time. Focus mode pauses the queue so nothing pops mid-session.
final class CelebrationQueueProvider
    extends $NotifierProvider<CelebrationQueue, CelebrationQueueState> {
  /// Milestones, badges, streaks and challenge wins queue here and show one at
  /// a time. Focus mode pauses the queue so nothing pops mid-session.
  CelebrationQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'celebrationQueueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$celebrationQueueHash();

  @$internal
  @override
  CelebrationQueue create() => CelebrationQueue();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CelebrationQueueState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CelebrationQueueState>(value),
    );
  }
}

String _$celebrationQueueHash() => r'8ea60230fa595f01c79dcccfcccf0a22f3bc3d82';

/// Milestones, badges, streaks and challenge wins queue here and show one at
/// a time. Focus mode pauses the queue so nothing pops mid-session.

abstract class _$CelebrationQueue extends $Notifier<CelebrationQueueState> {
  CelebrationQueueState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CelebrationQueueState, CelebrationQueueState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CelebrationQueueState, CelebrationQueueState>,
              CelebrationQueueState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
