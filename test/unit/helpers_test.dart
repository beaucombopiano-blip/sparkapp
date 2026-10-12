import 'package:flutter_test/flutter_test.dart';
import 'package:spark/app/routes.dart';
import 'package:spark/app/shell/shell_support.dart';
import 'package:spark/core/utils/formatters.dart';
import 'package:spark/data/models/schedule.dart';
import 'package:spark/data/models/user.dart';
import 'package:spark/features/community/community_screens.dart';
import 'package:spark/features/notifications/notification_service.dart';
import 'package:spark/features/onboarding/steps/availability_editor.dart';
import 'package:spark/features/onboarding/steps/deadline_step.dart';
import 'package:spark/features/splash_greeting/deep_links.dart';
import 'package:spark/l10n/generated/app_localizations_en.dart';

void main() {
  final l10n = AppLocalizationsEn();

  group('deep links', () {
    test('spark:// links map to app routes', () {
      expect(routeForLink(Uri.parse('spark://project/task/abc')), '/project/task/abc');
      expect(routeForLink(Uri.parse('spark://checkin/weekly/')), '/checkin/weekly');
      expect(routeForLink(Uri.parse('spark://focus?sessionId=s1')), '/focus?sessionId=s1');
      expect(routeForLink(Uri.parse('spark://')), Routes.dashboard);
    });

    test('https links are accepted only for known routes', () {
      expect(routeForLink(Uri.parse('https://sparkteens.app/journal/entry/j1')), '/journal/entry/j1');
      expect(routeForLink(Uri.parse('https://sparkteens.app/settings/notifications')), '/settings/notifications');
      expect(routeForLink(Uri.parse('https://sparkteens.app/admin')), isNull);
      expect(routeForLink(Uri.parse('mailto:hi@example.com')), isNull);
    });
  });

  group('shell', () {
    test('titles follow the current location', () {
      expect(shellTitleFor(Routes.dashboard, l10n), l10n.tabDashboard);
      expect(shellTitleFor(Routes.agenda, l10n), l10n.titleAgenda);
      expect(shellTitleFor(Routes.task('t1'), l10n), l10n.titleTask);
      expect(shellTitleFor(Routes.journalEntry('j1'), l10n), l10n.titleJournalEntry);
      expect(shellTitleFor('/profile/community/groups', l10n), l10n.titleCommunity);
    });

    test('companion button only on dashboard, project, agenda and task', () {
      expect(companionVisibleOn(Routes.dashboard), isTrue);
      expect(companionVisibleOn(Routes.project), isTrue);
      expect(companionVisibleOn(Routes.agenda), isTrue);
      expect(companionVisibleOn(Routes.task('t1')), isTrue);
      expect(companionVisibleOn(Routes.journal), isFalse);
      expect(companionVisibleOn(Routes.timeline), isFalse);
      expect(companionVisibleOn(Routes.profile), isFalse);
    });

    test('tab index for nested routes', () {
      expect(tabIndexFor(Routes.task('x')), 1);
      expect(tabIndexFor(Routes.scrapbook('x')), 2);
      expect(tabIndexFor(Routes.badges), 3);
      expect(tabIndexFor(Routes.dashboard), 0);
    });
  });

  group('notifications', () {
    test('preferences gate each notification type', () {
      const prefs = NotificationPrefs(dailyQuote: false, taskDeadlineReminders: false);
      expect(allowedByPrefs('dailyQuote', prefs), isFalse);
      expect(allowedByPrefs('deadlineReminder', prefs), isFalse);
      expect(allowedByPrefs('taskReminder', prefs), isFalse);
      expect(allowedByPrefs('sessionReminder', prefs), isTrue);
      expect(allowedByPrefs('somethingNew', prefs), isTrue);
    });

    test('ids are stable, positive 31-bit ints', () {
      expect(notificationIdFor('session:s1'), notificationIdFor('session:s1'));
      expect(notificationIdFor('session:s1'), isNot(notificationIdFor('session:s2')));
      for (final id in <String>['', 'a', 'x' * 500]) {
        final n = notificationIdFor(id);
        expect(n, inInclusiveRange(0, 0x7FFFFFFF));
      }
    });
  });

  group('community safety', () {
    test('contact info and links are detected', () {
      expect(containsContactInfo('email me at maya@example.com'), isTrue);
      expect(containsContactInfo('call 555-123-4567'), isTrue);
      expect(containsContactInfo('see https://example.com'), isTrue);
      expect(containsContactInfo('dm me @maya_makes'), isTrue);
      expect(containsContactInfo('I finished 3 interviews this week!'), isFalse);
      expect(containsContactInfo('We meet at 4:30 on 10/14'), isFalse);
    });
  });

  group('onboarding helpers', () {
    test('end of school year is the next June 15 at least a week away', () {
      expect(endOfSchoolYear(DateTime(2026, 10, 14)), DateTime(2027, 6, 15));
      expect(endOfSchoolYear(DateTime(2027, 3, 1)), DateTime(2027, 6, 15));
      expect(endOfSchoolYear(DateTime(2027, 6, 10)), DateTime(2028, 6, 15));
    });

    test('weekly summary rounds to the nearest half hour', () {
      expect(weeklySummary(l10n, const <AvailabilitySlot>[]), l10n.availabilitySummaryNone);
      expect(
        weeklySummary(l10n, const <AvailabilitySlot>[
          AvailabilitySlot(weekday: 1, startTime: '16:00', durationMinutes: 60),
          AvailabilitySlot(weekday: 3, startTime: '16:00', durationMinutes: 90),
        ]),
        l10n.hoursPerWeek('2.5'),
      );
      expect(
        weeklySummary(l10n, const <AvailabilitySlot>[AvailabilitySlot(weekday: 1, startTime: '16:00', durationMinutes: 120)]),
        l10n.hoursPerWeek('2'),
      );
    });

    test('HH:mm parsing', () {
      expect(parseHhMm('16:30'), 990);
      expect(parseHhMm(' 7:05 '), 425);
      expect(parseHhMm('24:00'), isNull);
      expect(parseHhMm('7pm'), isNull);
      expect(formatHhMm(990), '16:30');
    });
  });
}
