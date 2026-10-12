// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Signed-in user + claims. Emits on every token refresh.

@ProviderFor(authSession)
final authSessionProvider = AuthSessionProvider._();

/// Signed-in user + claims. Emits on every token refresh.

final class AuthSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthSession?>,
          AuthSession?,
          Stream<AuthSession?>
        >
    with $FutureModifier<AuthSession?>, $StreamProvider<AuthSession?> {
  /// Signed-in user + claims. Emits on every token refresh.
  AuthSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionHash();

  @$internal
  @override
  $StreamProviderElement<AuthSession?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AuthSession?> create(Ref ref) {
    return authSession(ref);
  }
}

String _$authSessionHash() => r'378cd29c676f367156312c8aa7431335d6ec380f';

@ProviderFor(currentUid)
final currentUidProvider = CurrentUidProvider._();

final class CurrentUidProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  CurrentUidProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUidProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUidHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentUid(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentUidHash() => r'15064c26fadb502f973a388dc651f313d56d75a3';

@ProviderFor(userProfile)
final userProfileProvider = UserProfileProvider._();

final class UserProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserProfile?>,
          UserProfile?,
          Stream<UserProfile?>
        >
    with $FutureModifier<UserProfile?>, $StreamProvider<UserProfile?> {
  UserProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileHash();

  @$internal
  @override
  $StreamProviderElement<UserProfile?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UserProfile?> create(Ref ref) {
    return userProfile(ref);
  }
}

String _$userProfileHash() => r'e138865f54d0e913a96b2e55e2bd38c774673ef1';

@ProviderFor(userSettings)
final userSettingsProvider = UserSettingsProvider._();

final class UserSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserSettings>,
          UserSettings,
          Stream<UserSettings>
        >
    with $FutureModifier<UserSettings>, $StreamProvider<UserSettings> {
  UserSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSettingsHash();

  @$internal
  @override
  $StreamProviderElement<UserSettings> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UserSettings> create(Ref ref) {
    return userSettings(ref);
  }
}

String _$userSettingsHash() => r'0d523c48d72bc79fc526afeba15800c7999dcf35';

@ProviderFor(appFlags)
final appFlagsProvider = AppFlagsProvider._();

final class AppFlagsProvider
    extends
        $FunctionalProvider<AsyncValue<AppFlags>, AppFlags, Stream<AppFlags>>
    with $FutureModifier<AppFlags>, $StreamProvider<AppFlags> {
  AppFlagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appFlagsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appFlagsHash();

  @$internal
  @override
  $StreamProviderElement<AppFlags> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<AppFlags> create(Ref ref) {
    return appFlags(ref);
  }
}

String _$appFlagsHash() => r'a2ed887c15bebbdaea9319856984c4d0bcce06a8';

/// Clock in the user's profile time zone (device zone until the profile loads).

@ProviderFor(userClock)
final userClockProvider = UserClockProvider._();

/// Clock in the user's profile time zone (device zone until the profile loads).

final class UserClockProvider
    extends $FunctionalProvider<UserClock, UserClock, UserClock>
    with $Provider<UserClock> {
  /// Clock in the user's profile time zone (device zone until the profile loads).
  UserClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userClockProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userClockHash();

  @$internal
  @override
  $ProviderElement<UserClock> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserClock create(Ref ref) {
    return userClock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserClock value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserClock>(value),
    );
  }
}

String _$userClockHash() => r'7a13a380ccbae152a16f3ba4b415e58101c256a0';

@ProviderFor(activeProjectId)
final activeProjectIdProvider = ActiveProjectIdProvider._();

final class ActiveProjectIdProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  ActiveProjectIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeProjectIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeProjectIdHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return activeProjectId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$activeProjectIdHash() => r'17654a215739f4c8e1569ec656c2f6253d464c45';

@ProviderFor(activeProject)
final activeProjectProvider = ActiveProjectProvider._();

final class ActiveProjectProvider
    extends
        $FunctionalProvider<AsyncValue<Project?>, Project?, Stream<Project?>>
    with $FutureModifier<Project?>, $StreamProvider<Project?> {
  ActiveProjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeProjectProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeProjectHash();

  @$internal
  @override
  $StreamProviderElement<Project?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Project?> create(Ref ref) {
    return activeProject(ref);
  }
}

String _$activeProjectHash() => r'65808d99f4e290a06153ded03bc23ff69647ac91';

@ProviderFor(projectById)
final projectByIdProvider = ProjectByIdFamily._();

final class ProjectByIdProvider
    extends
        $FunctionalProvider<AsyncValue<Project?>, Project?, Stream<Project?>>
    with $FutureModifier<Project?>, $StreamProvider<Project?> {
  ProjectByIdProvider._({
    required ProjectByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'projectByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectByIdHash();

  @override
  String toString() {
    return r'projectByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Project?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Project?> create(Ref ref) {
    final argument = this.argument as String;
    return projectById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectByIdHash() => r'4df8818b034ad444bfcfbf175cd9b7b8ed9ccfec';

final class ProjectByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Project?>, String> {
  ProjectByIdFamily._()
    : super(
        retry: null,
        name: r'projectByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectByIdProvider call(String projectId) =>
      ProjectByIdProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectByIdProvider';
}

@ProviderFor(characters)
final charactersProvider = CharactersProvider._();

final class CharactersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CharacterDef>>,
          List<CharacterDef>,
          Stream<List<CharacterDef>>
        >
    with
        $FutureModifier<List<CharacterDef>>,
        $StreamProvider<List<CharacterDef>> {
  CharactersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'charactersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$charactersHash();

  @$internal
  @override
  $StreamProviderElement<List<CharacterDef>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CharacterDef>> create(Ref ref) {
    return characters(ref);
  }
}

String _$charactersHash() => r'557bebea5b9f082cdf066409d0d949b59500ed4a';

@ProviderFor(themes)
final themesProvider = ThemesProvider._();

final class ThemesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ThemeDef>>,
          List<ThemeDef>,
          Stream<List<ThemeDef>>
        >
    with $FutureModifier<List<ThemeDef>>, $StreamProvider<List<ThemeDef>> {
  ThemesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themesHash();

  @$internal
  @override
  $StreamProviderElement<List<ThemeDef>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ThemeDef>> create(Ref ref) {
    return themes(ref);
  }
}

String _$themesHash() => r'a0cc801a38f0c50c860a4374f0ba2028535119e1';

@ProviderFor(badgeCatalog)
final badgeCatalogProvider = BadgeCatalogProvider._();

final class BadgeCatalogProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BadgeDef>>,
          List<BadgeDef>,
          Stream<List<BadgeDef>>
        >
    with $FutureModifier<List<BadgeDef>>, $StreamProvider<List<BadgeDef>> {
  BadgeCatalogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'badgeCatalogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$badgeCatalogHash();

  @$internal
  @override
  $StreamProviderElement<List<BadgeDef>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<BadgeDef>> create(Ref ref) {
    return badgeCatalog(ref);
  }
}

String _$badgeCatalogHash() => r'26cf30e4ee2474daa43ec147bad1b22e743992e4';

@ProviderFor(resourceCategories)
final resourceCategoriesProvider = ResourceCategoriesProvider._();

final class ResourceCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ResourceCategory>>,
          List<ResourceCategory>,
          Stream<List<ResourceCategory>>
        >
    with
        $FutureModifier<List<ResourceCategory>>,
        $StreamProvider<List<ResourceCategory>> {
  ResourceCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resourceCategoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resourceCategoriesHash();

  @$internal
  @override
  $StreamProviderElement<List<ResourceCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ResourceCategory>> create(Ref ref) {
    return resourceCategories(ref);
  }
}

String _$resourceCategoriesHash() =>
    r'4459dd0a44d1d0a24d3878a4928c224ce78118c3';

@ProviderFor(challenges)
final challengesProvider = ChallengesProvider._();

final class ChallengesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Challenge>>,
          List<Challenge>,
          Stream<List<Challenge>>
        >
    with $FutureModifier<List<Challenge>>, $StreamProvider<List<Challenge>> {
  ChallengesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'challengesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$challengesHash();

  @$internal
  @override
  $StreamProviderElement<List<Challenge>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Challenge>> create(Ref ref) {
    return challenges(ref);
  }
}

String _$challengesHash() => r'3df19b0902a5251727cc0571fb21e64254ba774d';

/// The user's selected companion character (null until chosen/loaded).

@ProviderFor(selectedCharacter)
final selectedCharacterProvider = SelectedCharacterProvider._();

/// The user's selected companion character (null until chosen/loaded).

final class SelectedCharacterProvider
    extends $FunctionalProvider<CharacterDef?, CharacterDef?, CharacterDef?>
    with $Provider<CharacterDef?> {
  /// The user's selected companion character (null until chosen/loaded).
  SelectedCharacterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCharacterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCharacterHash();

  @$internal
  @override
  $ProviderElement<CharacterDef?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CharacterDef? create(Ref ref) {
    return selectedCharacter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CharacterDef? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CharacterDef?>(value),
    );
  }
}

String _$selectedCharacterHash() => r'01b5957ac81433b503bc2b8a3634cd8427b59d88';
