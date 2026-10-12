import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/firebase/firebase_providers.dart';
import '../../data/models/journal.dart';
import '../../data/providers/session_providers.dart';
import '../../data/repositories/journal_repository.dart';

part 'journal_providers.g.dart';

/// Live journal entries for the active project.
@Riverpod(keepAlive: true)
Stream<List<JournalEntry>> journalEntries(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  final pid = ref.watch(activeProjectIdProvider);
  if (uid == null || pid == null) return Stream<List<JournalEntry>>.value(const <JournalEntry>[]);
  return ref.watch(journalRepositoryProvider).watchEntries(uid, pid);
}

/// The merged timeline with 10-minute signed URLs. Re-fetched whenever an
/// entry is added, finishes processing, changes caption or is deleted.
@riverpod
Future<JournalTimeline?> journalTimeline(Ref ref) async {
  final pid = ref.watch(activeProjectIdProvider);
  if (pid == null) return null;
  ref.watch(journalEntriesProvider.select((e) => e.value?.map((x) => '${x.id}:${x.status.name}:${x.caption}').join('|')));
  return ref.read(journalRepositoryProvider).getTimeline(pid);
}

/// Throttles refreshes triggered by failing signed URLs: a broken file (not
/// just an expired URL) must not cause an endless refetch loop.
@Riverpod(keepAlive: true)
class SignedUrlRefresh extends _$SignedUrlRefresh {
  static const Duration minInterval = Duration(seconds: 60);

  @override
  DateTime? build() => null;

  /// Returns true (and records the time) when a refresh is allowed now.
  bool tryAcquire({DateTime? now}) {
    final t = now ?? DateTime.now();
    final last = state;
    if (last != null && t.difference(last) < minInterval) return false;
    state = t;
    return true;
  }
}

@Riverpod(keepAlive: true)
Stream<List<Scrapbook>> scrapbooks(Ref ref) {
  final uid = ref.watch(currentUidProvider);
  if (uid == null) return Stream<List<Scrapbook>>.value(const <Scrapbook>[]);
  return ref.watch(journalRepositoryProvider).watchScrapbooks(uid);
}

@riverpod
Future<ScrapbookView> scrapbookView(Ref ref, String scrapbookId) =>
    ref.read(journalRepositoryProvider).getScrapbook(scrapbookId);

/// Timeline order (device-local preference).
@Riverpod(keepAlive: true)
class JournalNewestFirst extends _$JournalNewestFirst {
  static const _key = 'spark.journalNewestFirst';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  bool build() {
    try {
      return _prefs.getBool(_key) ?? true;
    } on Object {
      return true;
    }
  }

  void toggle() {
    state = !state;
    _prefs.setBool(_key, state).ignore();
  }
}
