// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(earnedBadges)
final earnedBadgesProvider = EarnedBadgesProvider._();

final class EarnedBadgesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EarnedBadge>>,
          List<EarnedBadge>,
          Stream<List<EarnedBadge>>
        >
    with
        $FutureModifier<List<EarnedBadge>>,
        $StreamProvider<List<EarnedBadge>> {
  EarnedBadgesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'earnedBadgesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$earnedBadgesHash();

  @$internal
  @override
  $StreamProviderElement<List<EarnedBadge>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<EarnedBadge>> create(Ref ref) {
    return earnedBadges(ref);
  }
}

String _$earnedBadgesHash() => r'0b52b3b64e550d9709fa2976bf525738d9f7b9b0';

@ProviderFor(challengeParticipation)
final challengeParticipationProvider = ChallengeParticipationProvider._();

final class ChallengeParticipationProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChallengeParticipation>>,
          List<ChallengeParticipation>,
          Stream<List<ChallengeParticipation>>
        >
    with
        $FutureModifier<List<ChallengeParticipation>>,
        $StreamProvider<List<ChallengeParticipation>> {
  ChallengeParticipationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'challengeParticipationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$challengeParticipationHash();

  @$internal
  @override
  $StreamProviderElement<List<ChallengeParticipation>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ChallengeParticipation>> create(Ref ref) {
    return challengeParticipation(ref);
  }
}

String _$challengeParticipationHash() =>
    r'f6dfa61cb313368eece9b37a0d814aea0792ff59';

@ProviderFor(unlocks)
final unlocksProvider = UnlocksProvider._();

final class UnlocksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Unlock>>,
          List<Unlock>,
          Stream<List<Unlock>>
        >
    with $FutureModifier<List<Unlock>>, $StreamProvider<List<Unlock>> {
  UnlocksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unlocksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unlocksHash();

  @$internal
  @override
  $StreamProviderElement<List<Unlock>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Unlock>> create(Ref ref) {
    return unlocks(ref);
  }
}

String _$unlocksHash() => r'324ff1c02cce31c114de13d15b201de7d63d3fbc';

/// Total points; refreshed when badges change.

@ProviderFor(totalPoints)
final totalPointsProvider = TotalPointsProvider._();

/// Total points; refreshed when badges change.

final class TotalPointsProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// Total points; refreshed when badges change.
  TotalPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalPointsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalPointsHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalPoints(ref);
  }
}

String _$totalPointsHash() => r'bb3219e15a5adf2b5b9332f3104506a1eb1b466b';

@ProviderFor(allProjects)
final allProjectsProvider = AllProjectsProvider._();

final class AllProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Project>>,
          List<Project>,
          Stream<List<Project>>
        >
    with $FutureModifier<List<Project>>, $StreamProvider<List<Project>> {
  AllProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allProjectsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allProjectsHash();

  @$internal
  @override
  $StreamProviderElement<List<Project>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Project>> create(Ref ref) {
    return allProjects(ref);
  }
}

String _$allProjectsHash() => r'5d3bc0d080704db5fe77ab72c48dbc4f7e5c394f';

@ProviderFor(profileStats)
final profileStatsProvider = ProfileStatsProvider._();

final class ProfileStatsProvider
    extends $FunctionalProvider<ProfileStats, ProfileStats, ProfileStats>
    with $Provider<ProfileStats> {
  ProfileStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileStatsHash();

  @$internal
  @override
  $ProviderElement<ProfileStats> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileStats create(Ref ref) {
    return profileStats(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileStats value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileStats>(value),
    );
  }
}

String _$profileStatsHash() => r'f55853ce31429cb09a0594bb7d7943ade62bf9c3';

/// Latest weekly board for the user's age bracket.

@ProviderFor(leaderboard)
final leaderboardProvider = LeaderboardProvider._();

/// Latest weekly board for the user's age bracket.

final class LeaderboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<LeaderboardWeek?>,
          LeaderboardWeek?,
          Stream<LeaderboardWeek?>
        >
    with $FutureModifier<LeaderboardWeek?>, $StreamProvider<LeaderboardWeek?> {
  /// Latest weekly board for the user's age bracket.
  LeaderboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardHash();

  @$internal
  @override
  $StreamProviderElement<LeaderboardWeek?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LeaderboardWeek?> create(Ref ref) {
    return leaderboard(ref);
  }
}

String _$leaderboardHash() => r'fbc497fce3a5586e53b85b92cef2d0ef55c695b2';
