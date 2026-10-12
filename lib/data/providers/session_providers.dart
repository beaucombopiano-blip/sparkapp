import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/user_clock.dart';
import '../models/catalog.dart';
import '../models/gamification.dart';
import '../models/project.dart';
import '../models/resources.dart';
import '../models/user.dart';
import '../repositories/auth_repository.dart';
import '../repositories/catalog_repository.dart';
import '../repositories/project_repository.dart';
import '../repositories/user_repository.dart';

part 'session_providers.g.dart';

/// Signed-in user + claims. Emits on every token refresh.
@Riverpod(keepAlive: true)
Stream<AuthSession?> authSession(Ref ref) => ref.watch(authRepositoryProvider).sessions();

@Riverpod(keepAlive: true)
String? currentUid(Ref ref) => ref.watch(authSessionProvider.select((s) => s.value?.uid));

@Riverpod(keepAlive: true)
Stream<UserProfile?> userProfile(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<UserProfile?>.value(null);
  return ref.watch(userRepositoryProvider).watchProfile(uid);
}

@Riverpod(keepAlive: true)
Stream<UserSettings> userSettings(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<UserSettings>.value(const UserSettings());
  return ref.watch(userRepositoryProvider).watchSettings(uid);
}

@Riverpod(keepAlive: true)
Stream<AppFlags> appFlags(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  // config/app is readable by signed-in users only.
  if (uid == null) return Stream<AppFlags>.value(const AppFlags());
  return ref.watch(userRepositoryProvider).watchAppFlags();
}

/// Clock in the user's profile time zone (device zone until the profile loads).
@Riverpod(keepAlive: true)
UserClock userClock(Ref ref) {
  final zone = ref.watch(userProfileProvider.select((p) => p.value?.timezone));
  return UserClock.forZone(zone);
}

@Riverpod(keepAlive: true)
String? activeProjectId(Ref ref) => ref.watch(userProfileProvider.select((p) => p.value?.activeProjectId));

@Riverpod(keepAlive: true)
Stream<Project?> activeProject(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<Project?>.value(null);
  return ref.watch(projectRepositoryProvider).watchProject(uid, pid);
}

@riverpod
Stream<Project?> projectById(Ref ref, String projectId) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<Project?>.value(null);
  return ref.watch(projectRepositoryProvider).watchProject(uid, projectId);
}

// ---------------------------------------------------------------- Catalogs

@Riverpod(keepAlive: true)
Stream<List<CharacterDef>> characters(Ref ref) {
  if (ref.watch(currentUidProvider) == null) return Stream<List<CharacterDef>>.value(const <CharacterDef>[]);
  return ref.watch(catalogRepositoryProvider).watchCharacters();
}

@Riverpod(keepAlive: true)
Stream<List<ThemeDef>> themes(Ref ref) {
  if (ref.watch(currentUidProvider) == null) return Stream<List<ThemeDef>>.value(const <ThemeDef>[]);
  return ref.watch(catalogRepositoryProvider).watchThemes();
}

@Riverpod(keepAlive: true)
Stream<List<BadgeDef>> badgeCatalog(Ref ref) {
  if (ref.watch(currentUidProvider) == null) return Stream<List<BadgeDef>>.value(const <BadgeDef>[]);
  return ref.watch(catalogRepositoryProvider).watchBadges();
}

@Riverpod(keepAlive: true)
Stream<List<ResourceCategory>> resourceCategories(Ref ref) {
  if (ref.watch(currentUidProvider) == null) {
    return Stream<List<ResourceCategory>>.value(const <ResourceCategory>[]);
  }
  return ref.watch(catalogRepositoryProvider).watchResourceCategories();
}

@Riverpod(keepAlive: true)
Stream<List<Challenge>> challenges(Ref ref) {
  if (ref.watch(currentUidProvider) == null) return Stream<List<Challenge>>.value(const <Challenge>[]);
  return ref.watch(catalogRepositoryProvider).watchChallenges();
}

/// The user's selected companion character (null until chosen/loaded).
@Riverpod(keepAlive: true)
CharacterDef? selectedCharacter(Ref ref) {
  final id = ref.watch(userProfileProvider.select((p) => p.value?.characterId));
  final all = ref.watch(charactersProvider).value ?? const <CharacterDef>[];
  if (id == null) return null;
  for (final c in all) {
    if (c.id == id) return c;
  }
  return null;
}
