// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_screens.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(communityEnabled)
final communityEnabledProvider = CommunityEnabledProvider._();

final class CommunityEnabledProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  CommunityEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityEnabledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityEnabledHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return communityEnabled(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$communityEnabledHash() => r'65cbbecced2b2a5ad37a37fbad7ad22778ffb156';

@ProviderFor(myCommunityProfile)
final myCommunityProfileProvider = MyCommunityProfileProvider._();

final class MyCommunityProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<CommunityProfile?>,
          CommunityProfile?,
          Stream<CommunityProfile?>
        >
    with
        $FutureModifier<CommunityProfile?>,
        $StreamProvider<CommunityProfile?> {
  MyCommunityProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myCommunityProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myCommunityProfileHash();

  @$internal
  @override
  $StreamProviderElement<CommunityProfile?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CommunityProfile?> create(Ref ref) {
    return myCommunityProfile(ref);
  }
}

String _$myCommunityProfileHash() =>
    r'3a5e5436afe42d2bc4a2de0d34d6ce976c1788a6';

@ProviderFor(communityProfileById)
final communityProfileByIdProvider = CommunityProfileByIdFamily._();

final class CommunityProfileByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<CommunityProfile?>,
          CommunityProfile?,
          Stream<CommunityProfile?>
        >
    with
        $FutureModifier<CommunityProfile?>,
        $StreamProvider<CommunityProfile?> {
  CommunityProfileByIdProvider._({
    required CommunityProfileByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'communityProfileByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$communityProfileByIdHash();

  @override
  String toString() {
    return r'communityProfileByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<CommunityProfile?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CommunityProfile?> create(Ref ref) {
    final argument = this.argument as String;
    return communityProfileById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityProfileByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$communityProfileByIdHash() =>
    r'96beb428683673f896282fe394158ca1d38657e1';

final class CommunityProfileByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<CommunityProfile?>, String> {
  CommunityProfileByIdFamily._()
    : super(
        retry: null,
        name: r'communityProfileByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommunityProfileByIdProvider call(String uid) =>
      CommunityProfileByIdProvider._(argument: uid, from: this);

  @override
  String toString() => r'communityProfileByIdProvider';
}

@ProviderFor(blockedUsers)
final blockedUsersProvider = BlockedUsersProvider._();

final class BlockedUsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<String>>,
          Set<String>,
          Stream<Set<String>>
        >
    with $FutureModifier<Set<String>>, $StreamProvider<Set<String>> {
  BlockedUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blockedUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blockedUsersHash();

  @$internal
  @override
  $StreamProviderElement<Set<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Set<String>> create(Ref ref) {
    return blockedUsers(ref);
  }
}

String _$blockedUsersHash() => r'0e76684c296875ce419aa7a7e61f1ab6c057e1c7';

@ProviderFor(communityMatches)
final communityMatchesProvider = CommunityMatchesProvider._();

final class CommunityMatchesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommunityMatch>>,
          List<CommunityMatch>,
          FutureOr<List<CommunityMatch>>
        >
    with
        $FutureModifier<List<CommunityMatch>>,
        $FutureProvider<List<CommunityMatch>> {
  CommunityMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityMatchesHash();

  @$internal
  @override
  $FutureProviderElement<List<CommunityMatch>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CommunityMatch>> create(Ref ref) {
    return communityMatches(ref);
  }
}

String _$communityMatchesHash() => r'538ec89319eb7d4a61edc6369bd7cbd5647f9e07';

@ProviderFor(showcase)
final showcaseProvider = ShowcaseProvider._();

final class ShowcaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommunityPost>>,
          List<CommunityPost>,
          Stream<List<CommunityPost>>
        >
    with
        $FutureModifier<List<CommunityPost>>,
        $StreamProvider<List<CommunityPost>> {
  ShowcaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showcaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showcaseHash();

  @$internal
  @override
  $StreamProviderElement<List<CommunityPost>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CommunityPost>> create(Ref ref) {
    return showcase(ref);
  }
}

String _$showcaseHash() => r'516699f7f3fa9553b0306a34f2726455b41c1290';

@ProviderFor(communityGroups)
final communityGroupsProvider = CommunityGroupsProvider._();

final class CommunityGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommunityGroup>>,
          List<CommunityGroup>,
          Stream<List<CommunityGroup>>
        >
    with
        $FutureModifier<List<CommunityGroup>>,
        $StreamProvider<List<CommunityGroup>> {
  CommunityGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityGroupsHash();

  @$internal
  @override
  $StreamProviderElement<List<CommunityGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CommunityGroup>> create(Ref ref) {
    return communityGroups(ref);
  }
}

String _$communityGroupsHash() => r'0b0edaa2b9f3785f8dc6adbd9658af2bab67bc93';

@ProviderFor(communityGroup)
final communityGroupProvider = CommunityGroupFamily._();

final class CommunityGroupProvider
    extends
        $FunctionalProvider<
          AsyncValue<CommunityGroup?>,
          CommunityGroup?,
          Stream<CommunityGroup?>
        >
    with $FutureModifier<CommunityGroup?>, $StreamProvider<CommunityGroup?> {
  CommunityGroupProvider._({
    required CommunityGroupFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'communityGroupProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$communityGroupHash();

  @override
  String toString() {
    return r'communityGroupProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<CommunityGroup?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CommunityGroup?> create(Ref ref) {
    final argument = this.argument as String;
    return communityGroup(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityGroupProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$communityGroupHash() => r'664c256f1d09cf976f5bfc1048f75baeb3e1a9fd';

final class CommunityGroupFamily extends $Family
    with $FunctionalFamilyOverride<Stream<CommunityGroup?>, String> {
  CommunityGroupFamily._()
    : super(
        retry: null,
        name: r'communityGroupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommunityGroupProvider call(String groupId) =>
      CommunityGroupProvider._(argument: groupId, from: this);

  @override
  String toString() => r'communityGroupProvider';
}

@ProviderFor(groupPosts)
final groupPostsProvider = GroupPostsFamily._();

final class GroupPostsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommunityPost>>,
          List<CommunityPost>,
          Stream<List<CommunityPost>>
        >
    with
        $FutureModifier<List<CommunityPost>>,
        $StreamProvider<List<CommunityPost>> {
  GroupPostsProvider._({
    required GroupPostsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupPostsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupPostsHash();

  @override
  String toString() {
    return r'groupPostsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<CommunityPost>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CommunityPost>> create(Ref ref) {
    final argument = this.argument as String;
    return groupPosts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupPostsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupPostsHash() => r'83998dfc208262c2e91e99567ebd9e1b80c5d1bb';

final class GroupPostsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<CommunityPost>>, String> {
  GroupPostsFamily._()
    : super(
        retry: null,
        name: r'groupPostsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupPostsProvider call(String groupId) =>
      GroupPostsProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupPostsProvider';
}

@ProviderFor(connections)
final connectionsProvider = ConnectionsProvider._();

final class ConnectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommunityConnection>>,
          List<CommunityConnection>,
          Stream<List<CommunityConnection>>
        >
    with
        $FutureModifier<List<CommunityConnection>>,
        $StreamProvider<List<CommunityConnection>> {
  ConnectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectionsHash();

  @$internal
  @override
  $StreamProviderElement<List<CommunityConnection>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CommunityConnection>> create(Ref ref) {
    return connections(ref);
  }
}

String _$connectionsHash() => r'9e5b995986c8c6ad18bd61b7bc11e67552415a27';

@ProviderFor(communityMessages)
final communityMessagesProvider = CommunityMessagesFamily._();

final class CommunityMessagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommunityMessage>>,
          List<CommunityMessage>,
          Stream<List<CommunityMessage>>
        >
    with
        $FutureModifier<List<CommunityMessage>>,
        $StreamProvider<List<CommunityMessage>> {
  CommunityMessagesProvider._({
    required CommunityMessagesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'communityMessagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$communityMessagesHash();

  @override
  String toString() {
    return r'communityMessagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<CommunityMessage>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CommunityMessage>> create(Ref ref) {
    final argument = this.argument as String;
    return communityMessages(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityMessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$communityMessagesHash() => r'aef5c99298434bc35634671a07dfa45a20dce6f7';

final class CommunityMessagesFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<CommunityMessage>>, String> {
  CommunityMessagesFamily._()
    : super(
        retry: null,
        name: r'communityMessagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommunityMessagesProvider call(String connectionId) =>
      CommunityMessagesProvider._(argument: connectionId, from: this);

  @override
  String toString() => r'communityMessagesProvider';
}
