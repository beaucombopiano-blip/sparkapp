import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/app/shell/shell_support.dart';
import 'package:spark/core/firebase/firebase_providers.dart';
import 'package:spark/core/utils/user_clock.dart';
import 'package:spark/data/firestore/functions_client.dart';
import 'package:spark/data/providers/session_providers.dart';
import 'package:spark/data/repositories/auth_repository.dart';
import 'package:spark/features/notifications/notification_service.dart';
import 'package:spark/features/splash_greeting/deep_links.dart';
import 'package:timezone/timezone.dart' as tz;

import 'fakes.dart';

/// A complete, deterministic backend for widget and golden tests: a fake
/// Firestore seeded with a realistic user and project, fake callables, a
/// pinned clock (Wed 14 Oct 2026, 10:00 in America/Chicago).
class SparkTestEnv {
  SparkTestEnv({DateTime? now}) : now = now ?? DateTime.utc(2026, 10, 14, 15);

  final DateTime now;
  final FakeFirebaseFirestore db = FakeFirebaseFirestore();
  final FakeFunctionsClient functions = FakeFunctionsClient();
  final MockStreamingFunctionsClient streaming = MockStreamingFunctionsClient();
  late SharedPreferences prefs;

  static const uid = 'user-1';
  static const projectId = 'project-1';
  static const zone = 'America/Chicago';

  UserClock get clock => UserClock(tz.getLocation(zone), now: () => now);

  DocumentReference<Map<String, dynamic>> get userDoc => db.collection('users').doc(uid);
  DocumentReference<Map<String, dynamic>> get projectDoc => userDoc.collection('projects').doc(projectId);

  /// UTC instant for a local wall-clock time in [zone].
  Timestamp at(int year, int month, int day, [int hour = 0, int minute = 0]) =>
      Timestamp.fromDate(clock.toUtc(DateTime(year, month, day, hour, minute)));

  Future<void> init({bool greetedToday = true}) async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      if (greetedToday) 'spark.lastGreetingDay': clock.today().toIso(),
      'spark.communitySafetySeen': true,
    });
    prefs = await SharedPreferences.getInstance();
    _defaultHandlers();
  }

  List<Override> overrides({AuthSession? session = const AuthSession(uid: uid, email: 'maya@example.com', profileComplete: true)}) =>
      <Override>[
        firestoreProvider.overrideWithValue(db),
        functionsClientProvider.overrideWithValue(functions),
        streamingFunctionsClientProvider.overrideWithValue(streaming),
        sharedPreferencesProvider.overrideWithValue(prefs),
        authSessionProvider.overrideWith((ref) => Stream<AuthSession?>.value(session)),
        userClockProvider.overrideWithValue(clock),
        isOnlineProvider.overrideWith((ref) => Stream<bool>.value(true)),
        notificationBootstrapProvider.overrideWith((ref) async {}),
        deepLinkListenerProvider.overrideWithValue(DeepLinkListener(onLink: (_) {})),
      ];

  void _defaultHandlers() {
    functions
      ..on('getProgress', (_) => <String, dynamic>{
            'percentComplete': 42,
            'completedMinutes': 300,
            'remainingMinutes': 420,
            'projectedPercentByWeekEnd': 55,
            'currentPhase': <String, dynamic>{'id': 'phase-1', 'title': 'Research'},
            'currentMilestone': <String, dynamic>{'id': 'ms-2', 'title': 'Record 5 interviews'},
            'daysLeft': 48,
            'onTrack': true,
            'streaks': <String, dynamic>{'daily': 4, 'weekly': 2},
          })
      ..on('getHomeDashboard', (_) => <String, dynamic>{
            'displayName': 'Maya',
            'unreadCelebrations': <Object>[],
            'checkinReady': false,
          })
      ..on('getTimeline', (_) => <String, dynamic>{
            'startDate': '2026-09-01T05:00:00.000Z',
            'targetEndDate': '2026-12-01T05:59:00.000Z',
            'percentComplete': 42,
            'projectedPercentByWeekEnd': 55,
            'completedMinutes': 300,
            'remainingMinutes': 420,
            'phases': <Object>[
              <String, dynamic>{
                'id': 'phase-1',
                'title': 'Research',
                'order': 0,
                'status': 'inProgress',
                'milestones': <Object>[
                  <String, dynamic>{'id': 'ms-1', 'title': 'Pick 10 businesses', 'status': 'done', 'order': 0},
                  <String, dynamic>{'id': 'ms-2', 'title': 'Record 5 interviews', 'status': 'inProgress', 'order': 1},
                ],
              },
              <String, dynamic>{
                'id': 'phase-2',
                'title': 'Build the archive',
                'order': 1,
                'status': 'upcoming',
                'milestones': <Object>[
                  <String, dynamic>{'id': 'ms-3', 'title': 'Publish the site', 'status': 'upcoming', 'order': 0},
                ],
              },
            ],
          })
      ..on('getJournalTimeline', (_) => <String, dynamic>{
            'items': <Object>[
              <String, dynamic>{
                'kind': 'entry',
                'id': 'j1',
                'entryId': 'j1',
                'date': '2026-10-12T20:00:00.000Z',
                'caption': 'First interview with the bakery owner',
                'mediaType': 'image',
                'taskTitle': 'Interview the bakery',
                'status': 'ready',
              },
              <String, dynamic>{'kind': 'milestone', 'id': 'm1', 'date': '2026-10-05T20:00:00.000Z', 'title': 'Pick 10 businesses'},
              <String, dynamic>{'kind': 'badge', 'id': 'b1', 'date': '2026-09-02T20:00:00.000Z', 'title': 'Project chosen'},
            ],
          })
      ..on('completeTask', (data) async {
        await projectDoc.collection('tasks').doc(data['taskId']! as String).update(<String, Object?>{
          'status': 'done',
          'completedAt': Timestamp.fromDate(now),
        });
        await projectDoc.update(<String, Object?>{'completedMinutes': FieldValue.increment(30)});
        return <String, dynamic>{'promptJournal': true, 'newlyEarnedBadges': <Object>[]};
      })
      ..on('markCelebrationsSeen', (_) => <String, dynamic>{});
  }

  /// Seeds the reference data, the user and an active project with a plan.
  Future<void> seed({
    String appearanceMode = 'light',
    Map<String, Object?>? customPalette,
    String onboardingStep = 'complete',
    bool withProject = true,
  }) async {
    await db.collection('config').doc('app').set(<String, Object?>{'entitlementsMode': 'all_premium', 'communityEnabled': false});
    for (final c in <Map<String, Object?>>[
      <String, Object?>{'id': 'nova', 'name': 'Nova', 'description': 'Upbeat and encouraging', 'order': 0},
      <String, Object?>{'id': 'sage', 'name': 'Sage', 'description': 'Calm and wise', 'order': 1},
      <String, Object?>{'id': 'blaze', 'name': 'Blaze', 'description': 'High energy coach', 'isPremium': true, 'order': 2},
    ]) {
      await db.collection('characters').doc(c['id']! as String).set(c);
    }
    for (final b in <Map<String, Object?>>[
      <String, Object?>{'id': 'project_chosen', 'name': 'Project chosen', 'description': 'Picked a project', 'order': 0},
      <String, Object?>{'id': 'first_task', 'name': 'First task', 'description': 'Finished a task', 'order': 1},
      <String, Object?>{'id': 'streak_7', 'name': '7-day streak', 'description': 'Work 7 planned days in a row', 'howToEarn': 'Finish a task on 7 planned days in a row', 'order': 2},
    ]) {
      await db.collection('badges').doc(b['id']! as String).set(b);
    }
    await db.collection('themes').doc('fall').set(<String, Object?>{
      'name': 'Fall',
      'kind': 'seasonal',
      'availability': 'free',
      'palette': <String, Object?>{
        'light': <String, Object?>{'teal': '#C9773B'},
        'dark': <String, Object?>{'teal': '#E39A5E'},
      },
    });
    await db.collection('resourceCategories').doc('start').set(<String, Object?>{'name': 'Getting started', 'icon': 'start', 'order': 0});

    await userDoc.set(<String, Object?>{
      'displayName': 'Maya Lopez',
      'birthYear': 2010,
      'ageBracket': 'teen',
      'timezone': zone,
      'characterId': 'nova',
      'appearanceMode': appearanceMode,
      'customPalette': ?customPalette,
      'onboardingPath': 'findIdea',
      'onboardingStep': onboardingStep,
      if (withProject) 'activeProjectId': projectId,
      'createdAt': at(2026, 9, 1, 9),
    });
    await userDoc.collection('private').doc('settings').set(<String, Object?>{
      'notifications': <String, Object?>{'osPermission': 'granted'},
      'privacy': <String, Object?>{'leaderboardOptIn': false},
      'calendar': <String, Object?>{'connected': false},
    });
    await userDoc.collection('private').doc('entitlements').set(<String, Object?>{
      'plan': 'premium',
      'mode': 'all_premium',
      'features': <String>[],
    });
    await userDoc.collection('badges').doc('project_chosen').set(<String, Object?>{'earnedAt': at(2026, 9, 2, 15)});
    for (final (i, day) in <(int, int)>[(0, 13), (1, 14), (2, 15), (3, 16), (4, 17), (5, 18), (6, 19)]) {
      if (day == 18) continue;
      await userDoc.collection('availability').doc('slot-$i').set(<String, Object?>{
        'weekday': (DateTime(2026, 10, day).weekday % 7),
        'startTime': day == 17 || day == 19 ? '10:00' : '16:00',
        'durationMinutes': 60,
      });
    }

    if (!withProject) return;
    await projectDoc.set(<String, Object?>{
      'title': 'Main Street Oral History',
      'description': 'Record stories from the oldest small businesses in town.',
      'projectType': 'community initiative',
      'status': 'active',
      'startDate': at(2026, 9, 1),
      'targetEndDate': at(2026, 11, 30, 23, 59),
      'activePlanVersion': 1,
      'completedMinutes': 300,
      'totalMinutes': 720,
      'completedTaskCount': 6,
      'totalTaskCount': 18,
      'completedMilestoneCount': 1,
      'totalMilestoneCount': 3,
      'streak': <String, Object?>{'daily': 4, 'weekly': 2},
      'createdAt': at(2026, 9, 1, 9),
    });
    final phases = projectDoc.collection('phases');
    await phases.doc('phase-1').set(<String, Object?>{'planVersion': 1, 'order': 0, 'title': 'Research', 'status': 'inProgress'});
    await phases.doc('phase-2').set(<String, Object?>{'planVersion': 1, 'order': 1, 'title': 'Build the archive', 'status': 'upcoming'});
    final milestones = projectDoc.collection('milestones');
    await milestones.doc('ms-1').set(<String, Object?>{
      'planVersion': 1, 'phaseId': 'phase-1', 'order': 0, 'title': 'Pick 10 businesses', 'status': 'done', 'targetDate': at(2026, 10, 5),
    });
    await milestones.doc('ms-2').set(<String, Object?>{
      'planVersion': 1, 'phaseId': 'phase-1', 'order': 1, 'title': 'Record 5 interviews', 'status': 'inProgress', 'targetDate': at(2026, 10, 23),
    });
    await milestones.doc('ms-3').set(<String, Object?>{
      'planVersion': 1, 'phaseId': 'phase-2', 'order': 0, 'title': 'Publish the site', 'status': 'upcoming', 'targetDate': at(2026, 11, 27),
    });

    final tasks = projectDoc.collection('tasks');
    Future<void> task(String id, String title, {
      required Timestamp date,
      String status = 'pending',
      bool actionable = true,
      String priority = 'medium',
      int minutes = 30,
      int order = 0,
      String? sessionId,
      List<String> dependsOn = const <String>[],
    }) =>
        tasks.doc(id).set(<String, Object?>{
          'planVersion': 1,
          'milestoneId': 'ms-2',
          'order': order,
          'title': title,
          'description': 'Part of recording the interviews.',
          'completionCriteria': 'You have a saved recording and notes.',
          'estimatedMinutes': minutes,
          'priority': priority,
          'dependsOn': dependsOn,
          'actionable': actionable,
          'suggestedDate': date,
          'sessionId': ?sessionId,
          'status': status,
          if (status == 'done') 'completedAt': at(2026, 10, 13, 17),
        });

    await task('t-done', 'Write interview questions', date: at(2026, 10, 13, 16), status: 'done', actionable: false, sessionId: 's-yesterday', order: 1);
    await task('t1', 'Call the bakery to book a time', date: at(2026, 10, 14, 16), priority: 'high', sessionId: 's-today', order: 2);
    await task('t2', 'Test the recording app', date: at(2026, 10, 14, 16), minutes: 20, sessionId: 's-today', order: 3);
    await task('t3', 'Interview the hardware store', date: at(2026, 10, 15, 16), minutes: 45, sessionId: 's-tomorrow', order: 4);
    await task('t4', 'Transcribe the bakery interview', date: at(2026, 10, 17, 10), priority: 'low', order: 5);
    await task('t5', 'Edit audio highlights', date: at(2026, 10, 19, 10), actionable: false, dependsOn: <String>['t4'], order: 6);
    await task('t-missed', 'Draft the project intro', date: at(2026, 10, 12, 16), sessionId: 's-missed', order: 0);

    final sessions = projectDoc.collection('sessions');
    Future<void> session(String id, Timestamp start, String status, List<String> taskIds) => sessions.doc(id).set(<String, Object?>{
          'planVersion': 1,
          'startsAt': start,
          'endsAt': Timestamp.fromDate(start.toDate().add(const Duration(hours: 1))),
          'durationMinutes': 60,
          'status': status,
          'taskIds': taskIds,
        });
    await session('s-missed', at(2026, 10, 12, 16), 'scheduled', <String>['t-missed']);
    await session('s-yesterday', at(2026, 10, 13, 16), 'completed', <String>['t-done']);
    await session('s-today', at(2026, 10, 14, 16), 'scheduled', <String>['t1', 't2']);
    await session('s-tomorrow', at(2026, 10, 15, 16), 'scheduled', <String>['t3']);
    await session('s-sat', at(2026, 10, 17, 10), 'scheduled', <String>['t4']);

    await projectDoc.collection('journal').doc('j1').set(<String, Object?>{
      'mediaType': 'image',
      'caption': 'First interview with the bakery owner',
      'status': 'ready',
      'createdAt': at(2026, 10, 12, 15),
    });
  }
}
