// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activePlanScope)
final activePlanScopeProvider = ActivePlanScopeProvider._();

final class ActivePlanScopeProvider
    extends $FunctionalProvider<PlanScope?, PlanScope?, PlanScope?>
    with $Provider<PlanScope?> {
  ActivePlanScopeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePlanScopeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePlanScopeHash();

  @$internal
  @override
  $ProviderElement<PlanScope?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlanScope? create(Ref ref) {
    return activePlanScope(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanScope? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanScope?>(value),
    );
  }
}

String _$activePlanScopeHash() => r'1c5875974032170bec22fb6787126184228ad298';

/// The next 5 actionable tasks (live).

@ProviderFor(currentTasks)
final currentTasksProvider = CurrentTasksProvider._();

/// The next 5 actionable tasks (live).

final class CurrentTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  /// The next 5 actionable tasks (live).
  CurrentTasksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentTasksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentTasksHash();

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    return currentTasks(ref);
  }
}

String _$currentTasksHash() => r'3dc0941af4c292344c589287b382c579ee12ad5b';

/// `getProgress`, re-fetched whenever the project's progress counters change
/// (completing a task anywhere updates every screen).

@ProviderFor(activeProgress)
final activeProgressProvider = ActiveProgressProvider._();

/// `getProgress`, re-fetched whenever the project's progress counters change
/// (completing a task anywhere updates every screen).

final class ActiveProgressProvider
    extends
        $FunctionalProvider<
          AsyncValue<Progress?>,
          Progress?,
          FutureOr<Progress?>
        >
    with $FutureModifier<Progress?>, $FutureProvider<Progress?> {
  /// `getProgress`, re-fetched whenever the project's progress counters change
  /// (completing a task anywhere updates every screen).
  ActiveProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeProgressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeProgressHash();

  @$internal
  @override
  $FutureProviderElement<Progress?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Progress?> create(Ref ref) {
    return activeProgress(ref);
  }
}

String _$activeProgressHash() => r'f600db1bb1930ef5b8e11e39ce7909c40483777f';

/// `getHomeDashboard` (one call); live streams keep the rest fresh.

@ProviderFor(homeDashboard)
final homeDashboardProvider = HomeDashboardProvider._();

/// `getHomeDashboard` (one call); live streams keep the rest fresh.

final class HomeDashboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeDashboard>,
          HomeDashboard,
          FutureOr<HomeDashboard>
        >
    with $FutureModifier<HomeDashboard>, $FutureProvider<HomeDashboard> {
  /// `getHomeDashboard` (one call); live streams keep the rest fresh.
  HomeDashboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeDashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeDashboardHash();

  @$internal
  @override
  $FutureProviderElement<HomeDashboard> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HomeDashboard> create(Ref ref) {
    return homeDashboard(ref);
  }
}

String _$homeDashboardHash() => r'3ffd7412c4c6369d521ec47458dfdeb8a498f8cb';

/// `getTimeline`, refreshed when progress changes.

@ProviderFor(activeTimeline)
final activeTimelineProvider = ActiveTimelineProvider._();

/// `getTimeline`, refreshed when progress changes.

final class ActiveTimelineProvider
    extends
        $FunctionalProvider<
          AsyncValue<Timeline?>,
          Timeline?,
          FutureOr<Timeline?>
        >
    with $FutureModifier<Timeline?>, $FutureProvider<Timeline?> {
  /// `getTimeline`, refreshed when progress changes.
  ActiveTimelineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeTimelineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeTimelineHash();

  @$internal
  @override
  $FutureProviderElement<Timeline?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Timeline?> create(Ref ref) {
    return activeTimeline(ref);
  }
}

String _$activeTimelineHash() => r'8380a5a9097970fc55aa791ed3ec23aebd09344a';

@ProviderFor(activeMilestones)
final activeMilestonesProvider = ActiveMilestonesProvider._();

final class ActiveMilestonesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Milestone>>,
          List<Milestone>,
          Stream<List<Milestone>>
        >
    with $FutureModifier<List<Milestone>>, $StreamProvider<List<Milestone>> {
  ActiveMilestonesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeMilestonesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeMilestonesHash();

  @$internal
  @override
  $StreamProviderElement<List<Milestone>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Milestone>> create(Ref ref) {
    return activeMilestones(ref);
  }
}

String _$activeMilestonesHash() => r'fceb2da6b2ca7f49253d402aea9dfa171916739c';

@ProviderFor(activePhases)
final activePhasesProvider = ActivePhasesProvider._();

final class ActivePhasesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Phase>>,
          List<Phase>,
          Stream<List<Phase>>
        >
    with $FutureModifier<List<Phase>>, $StreamProvider<List<Phase>> {
  ActivePhasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePhasesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePhasesHash();

  @$internal
  @override
  $StreamProviderElement<List<Phase>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Phase>> create(Ref ref) {
    return activePhases(ref);
  }
}

String _$activePhasesHash() => r'f555ced3c43da6043d910a60843c9c3d58dd26d5';

/// Sessions whose start falls on local days [from, to].

@ProviderFor(sessionsInRange)
final sessionsInRangeProvider = SessionsInRangeFamily._();

/// Sessions whose start falls on local days [from, to].

final class SessionsInRangeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WorkSession>>,
          List<WorkSession>,
          Stream<List<WorkSession>>
        >
    with
        $FutureModifier<List<WorkSession>>,
        $StreamProvider<List<WorkSession>> {
  /// Sessions whose start falls on local days [from, to].
  SessionsInRangeProvider._({
    required SessionsInRangeFamily super.from,
    required (LocalDay, LocalDay) super.argument,
  }) : super(
         retry: null,
         name: r'sessionsInRangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionsInRangeHash();

  @override
  String toString() {
    return r'sessionsInRangeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<WorkSession>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<WorkSession>> create(Ref ref) {
    final argument = this.argument as (LocalDay, LocalDay);
    return sessionsInRange(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionsInRangeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionsInRangeHash() => r'8b69c95fdb69a0275213f02a468d63d27fab1ef4';

/// Sessions whose start falls on local days [from, to].

final class SessionsInRangeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<WorkSession>>,
          (LocalDay, LocalDay)
        > {
  SessionsInRangeFamily._()
    : super(
        retry: null,
        name: r'sessionsInRangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Sessions whose start falls on local days [from, to].

  SessionsInRangeProvider call(LocalDay from, LocalDay to) =>
      SessionsInRangeProvider._(argument: (from, to), from: this);

  @override
  String toString() => r'sessionsInRangeProvider';
}

/// Tasks suggested for local days [from, to].

@ProviderFor(tasksInRange)
final tasksInRangeProvider = TasksInRangeFamily._();

/// Tasks suggested for local days [from, to].

final class TasksInRangeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  /// Tasks suggested for local days [from, to].
  TasksInRangeProvider._({
    required TasksInRangeFamily super.from,
    required (LocalDay, LocalDay) super.argument,
  }) : super(
         retry: null,
         name: r'tasksInRangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tasksInRangeHash();

  @override
  String toString() {
    return r'tasksInRangeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as (LocalDay, LocalDay);
    return tasksInRange(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is TasksInRangeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tasksInRangeHash() => r'c3d964438038234d1114461152f888567ab1ca0e';

/// Tasks suggested for local days [from, to].

final class TasksInRangeFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, (LocalDay, LocalDay)> {
  TasksInRangeFamily._()
    : super(
        retry: null,
        name: r'tasksInRangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Tasks suggested for local days [from, to].

  TasksInRangeProvider call(LocalDay from, LocalDay to) =>
      TasksInRangeProvider._(argument: (from, to), from: this);

  @override
  String toString() => r'tasksInRangeProvider';
}

@ProviderFor(taskById)
final taskByIdProvider = TaskByIdFamily._();

final class TaskByIdProvider
    extends $FunctionalProvider<AsyncValue<Task?>, Task?, Stream<Task?>>
    with $FutureModifier<Task?>, $StreamProvider<Task?> {
  TaskByIdProvider._({
    required TaskByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'taskByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$taskByIdHash();

  @override
  String toString() {
    return r'taskByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Task?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task?> create(Ref ref) {
    final argument = this.argument as String;
    return taskById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taskByIdHash() => r'a19ebe5a26083365dd9951ceaff89fb1c5b9e6c1';

final class TaskByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Task?>, String> {
  TaskByIdFamily._()
    : super(
        retry: null,
        name: r'taskByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TaskByIdProvider call(String taskId) =>
      TaskByIdProvider._(argument: taskId, from: this);

  @override
  String toString() => r'taskByIdProvider';
}

/// Tasks for a comma-separated id list (family keys must compare by value).

@ProviderFor(tasksByIds)
final tasksByIdsProvider = TasksByIdsFamily._();

/// Tasks for a comma-separated id list (family keys must compare by value).

final class TasksByIdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  /// Tasks for a comma-separated id list (family keys must compare by value).
  TasksByIdsProvider._({
    required TasksByIdsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'tasksByIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tasksByIdsHash();

  @override
  String toString() {
    return r'tasksByIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return tasksByIds(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TasksByIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tasksByIdsHash() => r'a8c9d080cf124ce2eb0c44655b106e02764175a7';

/// Tasks for a comma-separated id list (family keys must compare by value).

final class TasksByIdsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  TasksByIdsFamily._()
    : super(
        retry: null,
        name: r'tasksByIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Tasks for a comma-separated id list (family keys must compare by value).

  TasksByIdsProvider call(String commaSeparatedIds) =>
      TasksByIdsProvider._(argument: commaSeparatedIds, from: this);

  @override
  String toString() => r'tasksByIdsProvider';
}

@ProviderFor(sessionById)
final sessionByIdProvider = SessionByIdFamily._();

final class SessionByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkSession?>,
          WorkSession?,
          Stream<WorkSession?>
        >
    with $FutureModifier<WorkSession?>, $StreamProvider<WorkSession?> {
  SessionByIdProvider._({
    required SessionByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionByIdHash();

  @override
  String toString() {
    return r'sessionByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<WorkSession?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<WorkSession?> create(Ref ref) {
    final argument = this.argument as String;
    return sessionById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionByIdHash() => r'c15e33ce371e95a8c25897087441e809c6190cce';

final class SessionByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<WorkSession?>, String> {
  SessionByIdFamily._()
    : super(
        retry: null,
        name: r'sessionByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionByIdProvider call(String sessionId) =>
      SessionByIdProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionByIdProvider';
}

/// Next scheduled session from now (live).

@ProviderFor(nextSession)
final nextSessionProvider = NextSessionProvider._();

/// Next scheduled session from now (live).

final class NextSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkSession?>,
          WorkSession?,
          Stream<WorkSession?>
        >
    with $FutureModifier<WorkSession?>, $StreamProvider<WorkSession?> {
  /// Next scheduled session from now (live).
  NextSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nextSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nextSessionHash();

  @$internal
  @override
  $StreamProviderElement<WorkSession?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<WorkSession?> create(Ref ref) {
    return nextSession(ref);
  }
}

String _$nextSessionHash() => r'48ad5ec730157968de7bf1403b84cd77d3ca90ae';

@ProviderFor(pendingProposals)
final pendingProposalsProvider = PendingProposalsProvider._();

final class PendingProposalsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Proposal>>,
          List<Proposal>,
          Stream<List<Proposal>>
        >
    with $FutureModifier<List<Proposal>>, $StreamProvider<List<Proposal>> {
  PendingProposalsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingProposalsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingProposalsHash();

  @$internal
  @override
  $StreamProviderElement<List<Proposal>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Proposal>> create(Ref ref) {
    return pendingProposals(ref);
  }
}

String _$pendingProposalsHash() => r'a3c39a12aff4b5177979a29358f1658b876ea079';

/// A proposal's live document (status changes after apply/dismiss).

@ProviderFor(proposalById)
final proposalByIdProvider = ProposalByIdFamily._();

/// A proposal's live document (status changes after apply/dismiss).

final class ProposalByIdProvider
    extends
        $FunctionalProvider<AsyncValue<Proposal?>, Proposal?, Stream<Proposal?>>
    with $FutureModifier<Proposal?>, $StreamProvider<Proposal?> {
  /// A proposal's live document (status changes after apply/dismiss).
  ProposalByIdProvider._({
    required ProposalByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'proposalByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$proposalByIdHash();

  @override
  String toString() {
    return r'proposalByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Proposal?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Proposal?> create(Ref ref) {
    final argument = this.argument as String;
    return proposalById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProposalByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$proposalByIdHash() => r'10273ba6a13bcd6fb2482172534f4eeaa6a8362f';

/// A proposal's live document (status changes after apply/dismiss).

final class ProposalByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Proposal?>, String> {
  ProposalByIdFamily._()
    : super(
        retry: null,
        name: r'proposalByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A proposal's live document (status changes after apply/dismiss).

  ProposalByIdProvider call(String proposalId) =>
      ProposalByIdProvider._(argument: proposalId, from: this);

  @override
  String toString() => r'proposalByIdProvider';
}

@ProviderFor(availability)
final availabilityProvider = AvailabilityProvider._();

final class AvailabilityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AvailabilitySlot>>,
          List<AvailabilitySlot>,
          Stream<List<AvailabilitySlot>>
        >
    with
        $FutureModifier<List<AvailabilitySlot>>,
        $StreamProvider<List<AvailabilitySlot>> {
  AvailabilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availabilityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availabilityHash();

  @$internal
  @override
  $StreamProviderElement<List<AvailabilitySlot>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<AvailabilitySlot>> create(Ref ref) {
    return availability(ref);
  }
}

String _$availabilityHash() => r'fd531e1dacdadafa4ed47bf66a315c5e703d70ed';

@ProviderFor(availabilityExceptions)
final availabilityExceptionsProvider = AvailabilityExceptionsProvider._();

final class AvailabilityExceptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AvailabilityException>>,
          List<AvailabilityException>,
          Stream<List<AvailabilityException>>
        >
    with
        $FutureModifier<List<AvailabilityException>>,
        $StreamProvider<List<AvailabilityException>> {
  AvailabilityExceptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availabilityExceptionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availabilityExceptionsHash();

  @$internal
  @override
  $StreamProviderElement<List<AvailabilityException>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<AvailabilityException>> create(Ref ref) {
    return availabilityExceptions(ref);
  }
}

String _$availabilityExceptionsHash() =>
    r'9b6fb7909e5a0172ea4eff90680eb02436fc4d7f';
