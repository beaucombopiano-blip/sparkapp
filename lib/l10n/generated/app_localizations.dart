import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'SPARK'**
  String get appName;

  /// No description provided for @appSlogan.
  ///
  /// In en, this message translates to:
  /// **'By Teens. For Teens.'**
  String get appSlogan;

  /// No description provided for @commonToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get commonToday;

  /// No description provided for @commonTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get commonTomorrow;

  /// No description provided for @commonYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get commonYesterday;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get commonSaving;

  /// No description provided for @commonSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get commonSaved;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonRemove;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get commonNotNow;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get commonOpen;

  /// No description provided for @commonOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Open link'**
  String get commonOpenLink;

  /// No description provided for @commonLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get commonLearnMore;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get commonSeeAll;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get commonOptional;

  /// No description provided for @commonOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get commonOn;

  /// No description provided for @commonOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get commonOff;

  /// No description provided for @commonPremium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get commonPremium;

  /// No description provided for @commonNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get commonNew;

  /// No description provided for @commonMore.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get commonMore;

  /// No description provided for @commonUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get commonUndo;

  /// No description provided for @commonDoneCheck.
  ///
  /// In en, this message translates to:
  /// **'Done ✓'**
  String get commonDoneCheck;

  /// No description provided for @commonSomethingWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonSomethingWrong;

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String durationMinutes(int minutes);

  /// No description provided for @durationHours.
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String durationHours(int hours);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationHoursMinutes(int hours, int minutes);

  /// No description provided for @durationMinutesLong.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =1{1 minute} other{{minutes} minutes}}'**
  String durationMinutesLong(int minutes);

  /// No description provided for @hoursPerWeek.
  ///
  /// In en, this message translates to:
  /// **'About {hours} hours a week'**
  String hoursPerWeek(String hours);

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'You seem to be offline. Check your connection and try again.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'That took too long. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorUnauthenticated.
  ///
  /// In en, this message translates to:
  /// **'Please sign in again to continue.'**
  String get errorUnauthenticated;

  /// No description provided for @errorPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have access to that.'**
  String get errorPermissionDenied;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find that. It may have been removed.'**
  String get errorNotFound;

  /// No description provided for @errorInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'Something in that request wasn\'t quite right. Please check and try again.'**
  String get errorInvalidInput;

  /// No description provided for @errorRateLimited.
  ///
  /// In en, this message translates to:
  /// **'You\'ve hit today\'s limit for this. Try again later.'**
  String get errorRateLimited;

  /// No description provided for @errorFeatureLocked.
  ///
  /// In en, this message translates to:
  /// **'This feature isn\'t included in your plan.'**
  String get errorFeatureLocked;

  /// No description provided for @errorConflict.
  ///
  /// In en, this message translates to:
  /// **'Something changed in the meantime. Please refresh and try again.'**
  String get errorConflict;

  /// No description provided for @errorCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled.'**
  String get errorCancelled;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Our servers hit a snag. Please try again in a moment.'**
  String get errorServer;

  /// No description provided for @errorNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'This part of SPARK isn\'t set up yet.'**
  String get errorNotConfigured;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnknown;

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. Showing what\'s saved on this device.'**
  String get offlineBanner;

  /// No description provided for @notConfiguredTitle.
  ///
  /// In en, this message translates to:
  /// **'SPARK isn\'t connected yet'**
  String get notConfiguredTitle;

  /// No description provided for @notConfiguredBody.
  ///
  /// In en, this message translates to:
  /// **'Firebase hasn\'t been configured for this build. Run `flutterfire configure` or pass the SPARK_FIREBASE_* values, then restart the app.'**
  String get notConfiguredBody;

  /// No description provided for @tabDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get tabDashboard;

  /// No description provided for @tabProject.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get tabProject;

  /// No description provided for @tabJournal.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get tabJournal;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @titleAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get titleAgenda;

  /// No description provided for @titleTask.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get titleTask;

  /// No description provided for @titleTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get titleTimeline;

  /// No description provided for @titleResources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get titleResources;

  /// No description provided for @titleOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Opportunities'**
  String get titleOpportunities;

  /// No description provided for @titleAdjustPlan.
  ///
  /// In en, this message translates to:
  /// **'Adjust plan'**
  String get titleAdjustPlan;

  /// No description provided for @titleJournalEntry.
  ///
  /// In en, this message translates to:
  /// **'Journal entry'**
  String get titleJournalEntry;

  /// No description provided for @titleScrapbook.
  ///
  /// In en, this message translates to:
  /// **'Scrapbook'**
  String get titleScrapbook;

  /// No description provided for @titleBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get titleBadges;

  /// No description provided for @titleLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get titleLeaderboard;

  /// No description provided for @titleReflections.
  ///
  /// In en, this message translates to:
  /// **'Reflections'**
  String get titleReflections;

  /// No description provided for @titleSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get titleSubscription;

  /// No description provided for @titleCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get titleCommunity;

  /// No description provided for @titlePastProjects.
  ///
  /// In en, this message translates to:
  /// **'Past projects'**
  String get titlePastProjects;

  /// No description provided for @titleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettings;

  /// No description provided for @titleCompanion.
  ///
  /// In en, this message translates to:
  /// **'Companion'**
  String get titleCompanion;

  /// No description provided for @titlePlans.
  ///
  /// In en, this message translates to:
  /// **'Plans'**
  String get titlePlans;

  /// No description provided for @logoSemantics.
  ///
  /// In en, this message translates to:
  /// **'SPARK, go to Dashboard'**
  String get logoSemantics;

  /// No description provided for @settingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// No description provided for @backTooltip.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backTooltip;

  /// No description provided for @companionButtonSemantics.
  ///
  /// In en, this message translates to:
  /// **'Ask your companion'**
  String get companionButtonSemantics;

  /// No description provided for @progressSemantics.
  ///
  /// In en, this message translates to:
  /// **'Project {done} complete, {projected} projected by Sunday'**
  String progressSemantics(String done, String projected);

  /// No description provided for @progressSemanticsSimple.
  ///
  /// In en, this message translates to:
  /// **'Project {done} complete'**
  String progressSemanticsSimple(String done);

  /// No description provided for @progressLabel.
  ///
  /// In en, this message translates to:
  /// **'{done} done · {projected} by Sunday if you stick to the plan'**
  String progressLabel(String done, String projected);

  /// No description provided for @progressLabelSimple.
  ///
  /// In en, this message translates to:
  /// **'{done} done'**
  String progressLabelSimple(String done);

  /// No description provided for @priorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High priority'**
  String get priorityHigh;

  /// No description provided for @priorityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium priority'**
  String get priorityMedium;

  /// No description provided for @priorityLow.
  ///
  /// In en, this message translates to:
  /// **'Low priority'**
  String get priorityLow;

  /// No description provided for @taskLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked until earlier tasks are done'**
  String get taskLocked;

  /// No description provided for @taskDueOn.
  ///
  /// In en, this message translates to:
  /// **'Due {date}'**
  String taskDueOn(String date);

  /// No description provided for @taskCompleteSemantics.
  ///
  /// In en, this message translates to:
  /// **'Mark {title} complete'**
  String taskCompleteSemantics(String title);

  /// No description provided for @taskDoneSemantics.
  ///
  /// In en, this message translates to:
  /// **'{title}, done'**
  String taskDoneSemantics(String title);

  /// No description provided for @taskCompleting.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get taskCompleting;

  /// No description provided for @sessionStatusScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get sessionStatusScheduled;

  /// No description provided for @sessionStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get sessionStatusInProgress;

  /// No description provided for @sessionStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get sessionStatusCompleted;

  /// No description provided for @sessionStatusMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get sessionStatusMissed;

  /// No description provided for @sessionStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get sessionStatusCancelled;

  /// No description provided for @milestoneDone.
  ///
  /// In en, this message translates to:
  /// **'Milestone reached'**
  String get milestoneDone;

  /// No description provided for @milestoneInProgress.
  ///
  /// In en, this message translates to:
  /// **'Milestone in progress'**
  String get milestoneInProgress;

  /// No description provided for @milestoneUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming milestone'**
  String get milestoneUpcoming;

  /// No description provided for @sourceVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get sourceVerified;

  /// No description provided for @sourceFoundOnline.
  ///
  /// In en, this message translates to:
  /// **'Found online'**
  String get sourceFoundOnline;

  /// No description provided for @sourceAiSuggestion.
  ///
  /// In en, this message translates to:
  /// **'AI suggestion'**
  String get sourceAiSuggestion;

  /// No description provided for @resourceVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get resourceVideo;

  /// No description provided for @resourcePaper.
  ///
  /// In en, this message translates to:
  /// **'Research paper'**
  String get resourcePaper;

  /// No description provided for @resourceArticle.
  ///
  /// In en, this message translates to:
  /// **'Article'**
  String get resourceArticle;

  /// No description provided for @resourceTool.
  ///
  /// In en, this message translates to:
  /// **'Tool'**
  String get resourceTool;

  /// No description provided for @resourceCourse.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get resourceCourse;

  /// No description provided for @resourceViews.
  ///
  /// In en, this message translates to:
  /// **'{count} views'**
  String resourceViews(String count);

  /// No description provided for @resourceCitations.
  ///
  /// In en, this message translates to:
  /// **'{count} citations'**
  String resourceCitations(String count);

  /// No description provided for @resourceSave.
  ///
  /// In en, this message translates to:
  /// **'Save to project'**
  String get resourceSave;

  /// No description provided for @resourceSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved to project'**
  String get resourceSaved;

  /// No description provided for @resourceOpenYoutube.
  ///
  /// In en, this message translates to:
  /// **'Watch on YouTube'**
  String get resourceOpenYoutube;

  /// No description provided for @proposalConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get proposalConfirm;

  /// No description provided for @proposalNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get proposalNotNow;

  /// No description provided for @proposalWorking.
  ///
  /// In en, this message translates to:
  /// **'Making the change…'**
  String get proposalWorking;

  /// No description provided for @proposalDone.
  ///
  /// In en, this message translates to:
  /// **'Done ✓'**
  String get proposalDone;

  /// No description provided for @proposalFailed.
  ///
  /// In en, this message translates to:
  /// **'That didn\'t work: {message}'**
  String proposalFailed(String message);

  /// No description provided for @proposalCancelled.
  ///
  /// In en, this message translates to:
  /// **'Skipped. Nothing changed.'**
  String get proposalCancelled;

  /// No description provided for @proposalPendingLabel.
  ///
  /// In en, this message translates to:
  /// **'Proposed change'**
  String get proposalPendingLabel;

  /// No description provided for @proposalWouldChange.
  ///
  /// In en, this message translates to:
  /// **'This would change:'**
  String get proposalWouldChange;

  /// No description provided for @lockedSeePlans.
  ///
  /// In en, this message translates to:
  /// **'See plans'**
  String get lockedSeePlans;

  /// No description provided for @celebrationContinue.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get celebrationContinue;

  /// No description provided for @emptyGenericAction.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get emptyGenericAction;

  /// No description provided for @loadingSemantics.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loadingSemantics;

  /// No description provided for @agendaRescheduleUnfinished.
  ///
  /// In en, this message translates to:
  /// **'Reschedule unfinished tasks'**
  String get agendaRescheduleUnfinished;

  /// No description provided for @sessionStart.
  ///
  /// In en, this message translates to:
  /// **'Start session'**
  String get sessionStart;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Getting your SPARK ready…'**
  String get splashLoading;

  /// No description provided for @splashErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load your account'**
  String get splashErrorTitle;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name} ✨'**
  String greetingMorning(String name);

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name} ✨'**
  String greetingAfternoon(String name);

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name} ✨'**
  String greetingEvening(String name);

  /// No description provided for @greetingMorningPlain.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}'**
  String greetingMorningPlain(String name);

  /// No description provided for @greetingAfternoonPlain.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name}'**
  String greetingAfternoonPlain(String name);

  /// No description provided for @greetingEveningPlain.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name}'**
  String greetingEveningPlain(String name);

  /// No description provided for @greetingSkipHint.
  ///
  /// In en, this message translates to:
  /// **'Tap anywhere to skip'**
  String get greetingSkipHint;

  /// No description provided for @greetingLogoSemantics.
  ///
  /// In en, this message translates to:
  /// **'The SPARK logo smiling at you'**
  String get greetingLogoSemantics;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Find your spark. Build something real.'**
  String get authWelcomeTitle;

  /// No description provided for @authWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Turn an interest into a finished project, one small step at a time.'**
  String get authWelcomeBody;

  /// No description provided for @authContinueApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get authContinueApple;

  /// No description provided for @authContinueGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueGoogle;

  /// No description provided for @authContinueEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with email'**
  String get authContinueEmail;

  /// No description provided for @authLegal.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to the Terms and Privacy Policy.'**
  String get authLegal;

  /// No description provided for @authTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get authTerms;

  /// No description provided for @authPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get authPrivacy;

  /// No description provided for @authEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s your email?'**
  String get authEmailTitle;

  /// No description provided for @authEmailBody.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send you a magic link. No password needed.'**
  String get authEmailBody;

  /// No description provided for @authEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// No description provided for @authEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t look like an email address.'**
  String get authEmailInvalid;

  /// No description provided for @authEmailSend.
  ///
  /// In en, this message translates to:
  /// **'Send my link'**
  String get authEmailSend;

  /// No description provided for @authCheckInboxTitle.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox'**
  String get authCheckInboxTitle;

  /// No description provided for @authCheckInboxBody.
  ///
  /// In en, this message translates to:
  /// **'We sent a sign-in link to {email}. Open it on this device to continue.'**
  String authCheckInboxBody(String email);

  /// No description provided for @authResendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String authResendIn(int seconds);

  /// No description provided for @authResend.
  ///
  /// In en, this message translates to:
  /// **'Resend link'**
  String get authResend;

  /// No description provided for @authResent.
  ///
  /// In en, this message translates to:
  /// **'Sent! Check your inbox again.'**
  String get authResent;

  /// No description provided for @authUseDifferentEmail.
  ///
  /// In en, this message translates to:
  /// **'Use a different email'**
  String get authUseDifferentEmail;

  /// No description provided for @authSigningIn.
  ///
  /// In en, this message translates to:
  /// **'Signing you in…'**
  String get authSigningIn;

  /// No description provided for @authConfirmEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm your email'**
  String get authConfirmEmailTitle;

  /// No description provided for @authConfirmEmailBody.
  ///
  /// In en, this message translates to:
  /// **'You opened the link on a different device. Enter the email you used so we can finish signing you in.'**
  String get authConfirmEmailBody;

  /// No description provided for @authLinkInvalid.
  ///
  /// In en, this message translates to:
  /// **'This sign-in link has expired or was already used. Request a new one.'**
  String get authLinkInvalid;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set you up'**
  String get signupTitle;

  /// No description provided for @signupBody.
  ///
  /// In en, this message translates to:
  /// **'Just a couple of things so SPARK can plan around you.'**
  String get signupBody;

  /// No description provided for @signupNameLabel.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get signupNameLabel;

  /// No description provided for @signupNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your first name or a nickname'**
  String get signupNameHint;

  /// No description provided for @signupNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please add a name.'**
  String get signupNameRequired;

  /// No description provided for @signupBirthYearLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth year'**
  String get signupBirthYearLabel;

  /// No description provided for @signupBirthYearHelp.
  ///
  /// In en, this message translates to:
  /// **'We use this to keep SPARK age-appropriate. It\'s never shown to anyone.'**
  String get signupBirthYearHelp;

  /// No description provided for @signupTimezoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Time zone'**
  String get signupTimezoneLabel;

  /// No description provided for @signupTimezoneHelp.
  ///
  /// In en, this message translates to:
  /// **'Detected automatically. Change it if it\'s wrong.'**
  String get signupTimezoneHelp;

  /// No description provided for @signupTimezoneSearch.
  ///
  /// In en, this message translates to:
  /// **'Search time zones'**
  String get signupTimezoneSearch;

  /// No description provided for @signupSubmit.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get signupSubmit;

  /// No description provided for @signupUnderageTitle.
  ///
  /// In en, this message translates to:
  /// **'SPARK is for ages 13 and up'**
  String get signupUnderageTitle;

  /// No description provided for @signupUnderageBody.
  ///
  /// In en, this message translates to:
  /// **'Thanks so much for your interest! SPARK isn\'t available for people under 13 yet, so we didn\'t create an account. We\'d love to see you back when you\'re 13.'**
  String get signupUnderageBody;

  /// No description provided for @signupUnderageOk.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get signupUnderageOk;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @onboardingStepSemantics.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingStepSemantics(int current, int total);

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi {name}! Let\'s find your spark.'**
  String onboardingWelcomeTitle(String name);

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'In a few minutes you\'ll have a project you care about and a plan that fits your life. One thing at a time, promise.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingWelcomeCta.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go'**
  String get onboardingWelcomeCta;

  /// No description provided for @pathChoiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Where are you starting?'**
  String get pathChoiceTitle;

  /// No description provided for @pathChoiceBody.
  ///
  /// In en, this message translates to:
  /// **'Both paths end with a real project and a plan.'**
  String get pathChoiceBody;

  /// No description provided for @pathHasIdeaTitle.
  ///
  /// In en, this message translates to:
  /// **'I already have an idea'**
  String get pathHasIdeaTitle;

  /// No description provided for @pathHasIdeaBody.
  ///
  /// In en, this message translates to:
  /// **'Tell me about it and I\'ll ask a few questions to shape it.'**
  String get pathHasIdeaBody;

  /// No description provided for @pathFindIdeaTitle.
  ///
  /// In en, this message translates to:
  /// **'Help me find an idea'**
  String get pathFindIdeaTitle;

  /// No description provided for @pathFindIdeaBody.
  ///
  /// In en, this message translates to:
  /// **'Answer quick questions and get project ideas made for you.'**
  String get pathFindIdeaBody;

  /// No description provided for @interviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell me about your idea'**
  String get interviewTitle;

  /// No description provided for @interviewIntro.
  ///
  /// In en, this message translates to:
  /// **'What do you want to make, start or explore? A sentence or two is plenty.'**
  String get interviewIntro;

  /// No description provided for @interviewHint.
  ///
  /// In en, this message translates to:
  /// **'Type your answer…'**
  String get interviewHint;

  /// No description provided for @interviewSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get interviewSend;

  /// No description provided for @interviewTyping.
  ///
  /// In en, this message translates to:
  /// **'Thinking…'**
  String get interviewTyping;

  /// No description provided for @interviewSoFar.
  ///
  /// In en, this message translates to:
  /// **'Your project so far'**
  String get interviewSoFar;

  /// No description provided for @interviewGuessed.
  ///
  /// In en, this message translates to:
  /// **'We guessed this, tap to edit'**
  String get interviewGuessed;

  /// No description provided for @interviewReview.
  ///
  /// In en, this message translates to:
  /// **'Review my project'**
  String get interviewReview;

  /// No description provided for @interviewReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your project'**
  String get interviewReviewTitle;

  /// No description provided for @interviewReviewBody.
  ///
  /// In en, this message translates to:
  /// **'Change anything that doesn\'t sound right. You can edit it later too.'**
  String get interviewReviewBody;

  /// No description provided for @interviewConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm project'**
  String get interviewConfirm;

  /// No description provided for @interviewEditField.
  ///
  /// In en, this message translates to:
  /// **'Edit {field}'**
  String interviewEditField(String field);

  /// No description provided for @interviewEmptyField.
  ///
  /// In en, this message translates to:
  /// **'Not answered yet'**
  String get interviewEmptyField;

  /// No description provided for @interviewYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get interviewYou;

  /// No description provided for @fieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Project name'**
  String get fieldTitle;

  /// No description provided for @fieldGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get fieldGoal;

  /// No description provided for @fieldMotivation.
  ///
  /// In en, this message translates to:
  /// **'Why it matters'**
  String get fieldMotivation;

  /// No description provided for @fieldAudience.
  ///
  /// In en, this message translates to:
  /// **'Who it\'s for'**
  String get fieldAudience;

  /// No description provided for @fieldScale.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get fieldScale;

  /// No description provided for @fieldSuccess.
  ///
  /// In en, this message translates to:
  /// **'What success looks like'**
  String get fieldSuccess;

  /// No description provided for @fieldFinishDate.
  ///
  /// In en, this message translates to:
  /// **'Finish by'**
  String get fieldFinishDate;

  /// No description provided for @fieldSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills and resources'**
  String get fieldSkills;

  /// No description provided for @fieldConstraints.
  ///
  /// In en, this message translates to:
  /// **'Constraints'**
  String get fieldConstraints;

  /// No description provided for @fieldProjectType.
  ///
  /// In en, this message translates to:
  /// **'Project type'**
  String get fieldProjectType;

  /// No description provided for @scaleSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get scaleSmall;

  /// No description provided for @scaleMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get scaleMedium;

  /// No description provided for @scaleLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get scaleLarge;

  /// No description provided for @assessmentProgress.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String assessmentProgress(int current, int total);

  /// No description provided for @assessmentSaveExit.
  ///
  /// In en, this message translates to:
  /// **'Save and exit'**
  String get assessmentSaveExit;

  /// No description provided for @likertStronglyDisagree.
  ///
  /// In en, this message translates to:
  /// **'Strongly disagree'**
  String get likertStronglyDisagree;

  /// No description provided for @likertDisagree.
  ///
  /// In en, this message translates to:
  /// **'Disagree'**
  String get likertDisagree;

  /// No description provided for @likertNeutral.
  ///
  /// In en, this message translates to:
  /// **'Not sure'**
  String get likertNeutral;

  /// No description provided for @likertAgree.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get likertAgree;

  /// No description provided for @likertStronglyAgree.
  ///
  /// In en, this message translates to:
  /// **'Strongly agree'**
  String get likertStronglyAgree;

  /// No description provided for @assessmentPausedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your answers are saved'**
  String get assessmentPausedTitle;

  /// No description provided for @assessmentPausedBody.
  ///
  /// In en, this message translates to:
  /// **'Take a break. When you come back you\'ll pick up right where you left off.'**
  String get assessmentPausedBody;

  /// No description provided for @assessmentResume.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get assessmentResume;

  /// No description provided for @assessmentFinishing.
  ///
  /// In en, this message translates to:
  /// **'Finding your matches…'**
  String get assessmentFinishing;

  /// No description provided for @recommendationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ideas picked for you'**
  String get recommendationsTitle;

  /// No description provided for @recommendationsBody.
  ///
  /// In en, this message translates to:
  /// **'Tap one to see more. There\'s no wrong choice.'**
  String get recommendationsBody;

  /// No description provided for @recommendationsLoading1.
  ///
  /// In en, this message translates to:
  /// **'Looking at what lights you up…'**
  String get recommendationsLoading1;

  /// No description provided for @recommendationsLoading2.
  ///
  /// In en, this message translates to:
  /// **'Mixing your interests together…'**
  String get recommendationsLoading2;

  /// No description provided for @recommendationsLoading3.
  ///
  /// In en, this message translates to:
  /// **'Finding niche ideas you can actually finish…'**
  String get recommendationsLoading3;

  /// No description provided for @recommendationsLoading4.
  ///
  /// In en, this message translates to:
  /// **'Almost there…'**
  String get recommendationsLoading4;

  /// No description provided for @recommendationsMore.
  ///
  /// In en, this message translates to:
  /// **'Generate more ideas'**
  String get recommendationsMore;

  /// No description provided for @recommendationsMoreLoading.
  ///
  /// In en, this message translates to:
  /// **'Coming up with more ideas…'**
  String get recommendationsMoreLoading;

  /// No description provided for @recommendationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No ideas yet'**
  String get recommendationsEmpty;

  /// No description provided for @difficultyStarter.
  ///
  /// In en, this message translates to:
  /// **'Starter'**
  String get difficultyStarter;

  /// No description provided for @difficultyStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get difficultyStretch;

  /// No description provided for @difficultyAmbitious.
  ///
  /// In en, this message translates to:
  /// **'Ambitious'**
  String get difficultyAmbitious;

  /// No description provided for @recommendationHours.
  ///
  /// In en, this message translates to:
  /// **'About {hours} hours'**
  String recommendationHours(int hours);

  /// No description provided for @recommendationWhy.
  ///
  /// In en, this message translates to:
  /// **'Why it matches you'**
  String get recommendationWhy;

  /// No description provided for @recommendationCreate.
  ///
  /// In en, this message translates to:
  /// **'What you\'ll create'**
  String get recommendationCreate;

  /// No description provided for @recommendationFirstStep.
  ///
  /// In en, this message translates to:
  /// **'Suggested first step'**
  String get recommendationFirstStep;

  /// No description provided for @recommendationAudience.
  ///
  /// In en, this message translates to:
  /// **'Who it helps'**
  String get recommendationAudience;

  /// No description provided for @recommendationParentNote.
  ///
  /// In en, this message translates to:
  /// **'Heads up'**
  String get recommendationParentNote;

  /// No description provided for @recommendationChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose this project'**
  String get recommendationChoose;

  /// No description provided for @recommendationMatch.
  ///
  /// In en, this message translates to:
  /// **'{percent} match'**
  String recommendationMatch(String percent);

  /// No description provided for @projectPickedTitle.
  ///
  /// In en, this message translates to:
  /// **'You picked your project!'**
  String get projectPickedTitle;

  /// No description provided for @projectPickedBody.
  ///
  /// In en, this message translates to:
  /// **'\"{title}\" is officially yours. Let\'s make a plan that fits your life.'**
  String projectPickedBody(String title);

  /// No description provided for @deadlineTitle.
  ///
  /// In en, this message translates to:
  /// **'When do you want to finish?'**
  String get deadlineTitle;

  /// No description provided for @deadlineBody.
  ///
  /// In en, this message translates to:
  /// **'Pick a date at least a week away. You can change it later.'**
  String get deadlineBody;

  /// No description provided for @deadlinePick.
  ///
  /// In en, this message translates to:
  /// **'Pick a date'**
  String get deadlinePick;

  /// No description provided for @deadlineOneMonth.
  ///
  /// In en, this message translates to:
  /// **'1 month'**
  String get deadlineOneMonth;

  /// No description provided for @deadlineThreeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 months'**
  String get deadlineThreeMonths;

  /// No description provided for @deadlineSixMonths.
  ///
  /// In en, this message translates to:
  /// **'6 months'**
  String get deadlineSixMonths;

  /// No description provided for @deadlineSchoolYear.
  ///
  /// In en, this message translates to:
  /// **'End of school year'**
  String get deadlineSchoolYear;

  /// No description provided for @deadlineSelected.
  ///
  /// In en, this message translates to:
  /// **'Finish by {date}'**
  String deadlineSelected(String date);

  /// No description provided for @deadlineTooSoon.
  ///
  /// In en, this message translates to:
  /// **'Pick a date at least 7 days from today.'**
  String get deadlineTooSoon;

  /// No description provided for @availabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'When can you work on it?'**
  String get availabilityTitle;

  /// No description provided for @availabilityBody.
  ///
  /// In en, this message translates to:
  /// **'Pick the days and times that usually work. SPARK plans around them.'**
  String get availabilityBody;

  /// No description provided for @availabilityAddTime.
  ///
  /// In en, this message translates to:
  /// **'Add a time'**
  String get availabilityAddTime;

  /// No description provided for @availabilityStart.
  ///
  /// In en, this message translates to:
  /// **'Starts'**
  String get availabilityStart;

  /// No description provided for @availabilitySessionLength.
  ///
  /// In en, this message translates to:
  /// **'Session length'**
  String get availabilitySessionLength;

  /// No description provided for @availabilityRemoveTime.
  ///
  /// In en, this message translates to:
  /// **'Remove this time'**
  String get availabilityRemoveTime;

  /// No description provided for @availabilityNone.
  ///
  /// In en, this message translates to:
  /// **'Pick at least one day and time.'**
  String get availabilityNone;

  /// No description provided for @availabilitySummaryNone.
  ///
  /// In en, this message translates to:
  /// **'No time picked yet'**
  String get availabilitySummaryNone;

  /// No description provided for @availabilitySlotLabel.
  ///
  /// In en, this message translates to:
  /// **'{time} for {duration}'**
  String availabilitySlotLabel(String time, String duration);

  /// No description provided for @characterTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick your companion'**
  String get characterTitle;

  /// No description provided for @characterBody.
  ///
  /// In en, this message translates to:
  /// **'They\'ll cheer you on, remind you and help when you\'re stuck.'**
  String get characterBody;

  /// No description provided for @characterPreview.
  ///
  /// In en, this message translates to:
  /// **'How they\'d sound'**
  String get characterPreview;

  /// No description provided for @characterLocked.
  ///
  /// In en, this message translates to:
  /// **'Included with Premium'**
  String get characterLocked;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'How should we nudge you?'**
  String get notificationsTitle;

  /// No description provided for @notificationsBody.
  ///
  /// In en, this message translates to:
  /// **'Everything is on to start. Turn off anything you don\'t want.'**
  String get notificationsBody;

  /// No description provided for @notifDailyQuote.
  ///
  /// In en, this message translates to:
  /// **'Daily quote'**
  String get notifDailyQuote;

  /// No description provided for @notifDailyQuoteBody.
  ///
  /// In en, this message translates to:
  /// **'A short boost each morning.'**
  String get notifDailyQuoteBody;

  /// No description provided for @notifSessionReminder.
  ///
  /// In en, this message translates to:
  /// **'Work session reminders'**
  String get notifSessionReminder;

  /// No description provided for @notifSessionReminderBody.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes before each session.'**
  String notifSessionReminderBody(int minutes);

  /// No description provided for @notifTaskReminders.
  ///
  /// In en, this message translates to:
  /// **'Task and deadline reminders'**
  String get notifTaskReminders;

  /// No description provided for @notifTaskRemindersBody.
  ///
  /// In en, this message translates to:
  /// **'So nothing sneaks up on you.'**
  String get notifTaskRemindersBody;

  /// No description provided for @notifWeeklyCheckin.
  ///
  /// In en, this message translates to:
  /// **'Weekly check-in'**
  String get notifWeeklyCheckin;

  /// No description provided for @notifWeeklyCheckinBody.
  ///
  /// In en, this message translates to:
  /// **'Sunday evening, about a minute long.'**
  String get notifWeeklyCheckinBody;

  /// No description provided for @notifMonthlyReflection.
  ///
  /// In en, this message translates to:
  /// **'Monthly reflection'**
  String get notifMonthlyReflection;

  /// No description provided for @notifMonthlyReflectionBody.
  ///
  /// In en, this message translates to:
  /// **'Look back at what you built this month.'**
  String get notifMonthlyReflectionBody;

  /// No description provided for @notifCelebrations.
  ///
  /// In en, this message translates to:
  /// **'Celebrations'**
  String get notifCelebrations;

  /// No description provided for @notifCelebrationsBody.
  ///
  /// In en, this message translates to:
  /// **'Badges, streaks and milestones.'**
  String get notifCelebrationsBody;

  /// No description provided for @notifQuietHours.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours'**
  String get notifQuietHours;

  /// No description provided for @notifQuietHoursBody.
  ///
  /// In en, this message translates to:
  /// **'No notifications between these times.'**
  String get notifQuietHoursBody;

  /// No description provided for @notifQuietFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get notifQuietFrom;

  /// No description provided for @notifQuietTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get notifQuietTo;

  /// No description provided for @notifTurnOn.
  ///
  /// In en, this message translates to:
  /// **'Turn on notifications'**
  String get notifTurnOn;

  /// No description provided for @notifNotNow.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get notifNotNow;

  /// No description provided for @notifDeniedNote.
  ///
  /// In en, this message translates to:
  /// **'No problem. You can turn notifications on anytime in Settings.'**
  String get notifDeniedNote;

  /// No description provided for @appearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Light or dark?'**
  String get appearanceTitle;

  /// No description provided for @appearanceBody.
  ///
  /// In en, this message translates to:
  /// **'You can switch anytime in Settings.'**
  String get appearanceBody;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;

  /// No description provided for @appearanceSystem.
  ///
  /// In en, this message translates to:
  /// **'Match my phone'**
  String get appearanceSystem;

  /// No description provided for @appearancePreviewTask.
  ///
  /// In en, this message translates to:
  /// **'Sketch the cover'**
  String get appearancePreviewTask;

  /// No description provided for @planBuilding.
  ///
  /// In en, this message translates to:
  /// **'Building your plan step by step…'**
  String get planBuilding;

  /// No description provided for @planBuilding2.
  ///
  /// In en, this message translates to:
  /// **'Breaking your project into small steps…'**
  String get planBuilding2;

  /// No description provided for @planBuilding3.
  ///
  /// In en, this message translates to:
  /// **'Fitting the work into your week…'**
  String get planBuilding3;

  /// No description provided for @planBuilding4.
  ///
  /// In en, this message translates to:
  /// **'Adding milestones to celebrate…'**
  String get planBuilding4;

  /// No description provided for @planNotFeasibleTitle.
  ///
  /// In en, this message translates to:
  /// **'Your plan needs a little more room'**
  String get planNotFeasibleTitle;

  /// No description provided for @planNotFeasibleBody.
  ///
  /// In en, this message translates to:
  /// **'With the time you have before your deadline, the whole project won\'t fit. Pick what feels right:'**
  String get planNotFeasibleBody;

  /// No description provided for @planOptionMoveDeadline.
  ///
  /// In en, this message translates to:
  /// **'Move the deadline to {date}'**
  String planOptionMoveDeadline(String date);

  /// No description provided for @planOptionMoveDeadlineBody.
  ///
  /// In en, this message translates to:
  /// **'Same project, a little more time.'**
  String get planOptionMoveDeadlineBody;

  /// No description provided for @planOptionAddTime.
  ///
  /// In en, this message translates to:
  /// **'Add about {minutes} minutes a week'**
  String planOptionAddTime(int minutes);

  /// No description provided for @planOptionAddTimeBody.
  ///
  /// In en, this message translates to:
  /// **'Add more availability and keep your deadline.'**
  String get planOptionAddTimeBody;

  /// No description provided for @planOptionTrimScope.
  ///
  /// In en, this message translates to:
  /// **'Trim the scope'**
  String get planOptionTrimScope;

  /// No description provided for @planOptionTrimScopeBody.
  ///
  /// In en, this message translates to:
  /// **'Skip these parts for now:'**
  String get planOptionTrimScopeBody;

  /// No description provided for @planRegenerate.
  ///
  /// In en, this message translates to:
  /// **'Make my plan'**
  String get planRegenerate;

  /// No description provided for @planReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your plan is ready!'**
  String get planReadyTitle;

  /// No description provided for @planReadyBody.
  ///
  /// In en, this message translates to:
  /// **'{tasks} tasks across {phases} phases. Let\'s take the first step.'**
  String planReadyBody(int tasks, int phases);

  /// No description provided for @planLetsGo.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started'**
  String get planLetsGo;

  /// No description provided for @planPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Your plan preview'**
  String get planPreviewTitle;

  /// No description provided for @planPreviewFirstTasks.
  ///
  /// In en, this message translates to:
  /// **'Your first tasks'**
  String get planPreviewFirstTasks;

  /// No description provided for @planPreviewMore.
  ///
  /// In en, this message translates to:
  /// **'+{count} more tasks with a full plan'**
  String planPreviewMore(int count);

  /// No description provided for @planContinueBasic.
  ///
  /// In en, this message translates to:
  /// **'Continue with Basic'**
  String get planContinueBasic;

  /// No description provided for @tutorialNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get tutorialNext;

  /// No description provided for @tutorialSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip tour'**
  String get tutorialSkip;

  /// No description provided for @tutorialDone.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get tutorialDone;

  /// No description provided for @tutorialTabsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your four home bases'**
  String get tutorialTabsTitle;

  /// No description provided for @tutorialTabsBody.
  ///
  /// In en, this message translates to:
  /// **'Dashboard for today, Project for your plan, Journal for your story, Profile for your wins.'**
  String get tutorialTabsBody;

  /// No description provided for @tutorialProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Your progress bar'**
  String get tutorialProgressTitle;

  /// No description provided for @tutorialProgressBody.
  ///
  /// In en, this message translates to:
  /// **'The solid part is done. The striped part is where you\'ll be by Sunday if you stick to the plan.'**
  String get tutorialProgressBody;

  /// No description provided for @tutorialChecklistTitle.
  ///
  /// In en, this message translates to:
  /// **'Your next 5 tasks'**
  String get tutorialChecklistTitle;

  /// No description provided for @tutorialChecklistBody.
  ///
  /// In en, this message translates to:
  /// **'Small, clear steps. Check one off and watch your progress move.'**
  String get tutorialChecklistBody;

  /// No description provided for @tutorialCalendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Your calendar'**
  String get tutorialCalendarTitle;

  /// No description provided for @tutorialCalendarBody.
  ///
  /// In en, this message translates to:
  /// **'Dots are work sessions, diamonds are milestones. Tap a day to see its agenda.'**
  String get tutorialCalendarBody;

  /// No description provided for @tutorialCompanionTitle.
  ///
  /// In en, this message translates to:
  /// **'Your companion'**
  String get tutorialCompanionTitle;

  /// No description provided for @tutorialCompanionBody.
  ///
  /// In en, this message translates to:
  /// **'Stuck or behind? Ask anything. It already knows your project.'**
  String get tutorialCompanionBody;

  /// No description provided for @tutorialJournalTitle.
  ///
  /// In en, this message translates to:
  /// **'Your journal'**
  String get tutorialJournalTitle;

  /// No description provided for @tutorialJournalBody.
  ///
  /// In en, this message translates to:
  /// **'Snap photos as you go. They become your project\'s story.'**
  String get tutorialJournalBody;

  /// No description provided for @tutorialSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tutorialSettingsTitle;

  /// No description provided for @tutorialSettingsBody.
  ///
  /// In en, this message translates to:
  /// **'Colors, notifications, schedule and more live behind the gear.'**
  String get tutorialSettingsBody;

  /// No description provided for @planReadyBodyTasks.
  ///
  /// In en, this message translates to:
  /// **'{tasks} small tasks, ready when you are. Let\'s take the first step.'**
  String planReadyBodyTasks(int tasks);

  /// No description provided for @adLabel.
  ///
  /// In en, this message translates to:
  /// **'Ad'**
  String get adLabel;

  /// No description provided for @settingsReminderLead.
  ///
  /// In en, this message translates to:
  /// **'Remind me before sessions'**
  String get settingsReminderLead;

  /// No description provided for @settingsMaxPerDay.
  ///
  /// In en, this message translates to:
  /// **'Most notifications per day'**
  String get settingsMaxPerDay;

  /// No description provided for @settingsMaxPerDayValue.
  ///
  /// In en, this message translates to:
  /// **'Up to {count} a day'**
  String settingsMaxPerDayValue(int count);

  /// No description provided for @celebrateMilestoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Milestone reached! 🎉'**
  String get celebrateMilestoneTitle;

  /// No description provided for @celebrateBadgeTitle.
  ///
  /// In en, this message translates to:
  /// **'You earned a badge!'**
  String get celebrateBadgeTitle;

  /// No description provided for @celebrateProjectCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'You finished your project!'**
  String get celebrateProjectCompleteTitle;

  /// No description provided for @celebrateProjectCompleteBody.
  ///
  /// In en, this message translates to:
  /// **'From an idea to something real. That\'s huge. Your scrapbook is being made.'**
  String get celebrateProjectCompleteBody;

  /// No description provided for @changeMove.
  ///
  /// In en, this message translates to:
  /// **'Move \"{title}\" from {from} to {to}'**
  String changeMove(String title, String from, String to);

  /// No description provided for @changeMoveTo.
  ///
  /// In en, this message translates to:
  /// **'Move \"{title}\" to {to}'**
  String changeMoveTo(String title, String to);

  /// No description provided for @changeAdd.
  ///
  /// In en, this message translates to:
  /// **'Add \"{title}\"'**
  String changeAdd(String title);

  /// No description provided for @changeRemove.
  ///
  /// In en, this message translates to:
  /// **'Set aside \"{title}\" (your finished work is kept)'**
  String changeRemove(String title);

  /// No description provided for @changeDeadline.
  ///
  /// In en, this message translates to:
  /// **'New deadline: {date}'**
  String changeDeadline(String date);

  /// No description provided for @proposalChooseOption.
  ///
  /// In en, this message translates to:
  /// **'This no longer fits your time. Pick one:'**
  String get proposalChooseOption;

  /// No description provided for @proposalDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'A new plan that fits your time'**
  String get proposalDefaultTitle;

  /// No description provided for @proposalSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Review the change'**
  String get proposalSheetTitle;

  /// No description provided for @journalPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Nice work! ✨'**
  String get journalPromptTitle;

  /// No description provided for @journalPromptBody.
  ///
  /// In en, this message translates to:
  /// **'Add a photo to your journal?'**
  String get journalPromptBody;

  /// No description provided for @journalPromptAdd.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get journalPromptAdd;

  /// No description provided for @taskCompletedSnack.
  ///
  /// In en, this message translates to:
  /// **'Task done!'**
  String get taskCompletedSnack;

  /// No description provided for @taskUndone.
  ///
  /// In en, this message translates to:
  /// **'Task marked as not done.'**
  String get taskUndone;

  /// No description provided for @dashboardProjectCardSemantics.
  ///
  /// In en, this message translates to:
  /// **'Open your project'**
  String get dashboardProjectCardSemantics;

  /// No description provided for @dashboardCurrentMilestone.
  ///
  /// In en, this message translates to:
  /// **'Now: {milestone}'**
  String dashboardCurrentMilestone(String milestone);

  /// No description provided for @dashboardNextSession.
  ///
  /// In en, this message translates to:
  /// **'Next work session'**
  String get dashboardNextSession;

  /// No description provided for @dashboardNextSessionNone.
  ///
  /// In en, this message translates to:
  /// **'No sessions coming up'**
  String get dashboardNextSessionNone;

  /// No description provided for @dashboardNextSessionNoneBody.
  ///
  /// In en, this message translates to:
  /// **'Your schedule is clear. Add availability to plan more work.'**
  String get dashboardNextSessionNoneBody;

  /// No description provided for @dashboardFirstTask.
  ///
  /// In en, this message translates to:
  /// **'First up: {title}'**
  String dashboardFirstTask(String title);

  /// No description provided for @dashboardTodaysTasks.
  ///
  /// In en, this message translates to:
  /// **'Today\'s tasks'**
  String get dashboardTodaysTasks;

  /// No description provided for @dashboardNoTasks.
  ///
  /// In en, this message translates to:
  /// **'All caught up!'**
  String get dashboardNoTasks;

  /// No description provided for @dashboardNoTasksBody.
  ///
  /// In en, this message translates to:
  /// **'No tasks waiting right now. Enjoy it or peek at what\'s next.'**
  String get dashboardNoTasksBody;

  /// No description provided for @dashboardSeeAgenda.
  ///
  /// In en, this message translates to:
  /// **'See what\'s next'**
  String get dashboardSeeAgenda;

  /// No description provided for @streakDaily.
  ///
  /// In en, this message translates to:
  /// **'{count}-day streak'**
  String streakDaily(int count);

  /// No description provided for @streakWeekly.
  ///
  /// In en, this message translates to:
  /// **'{count}-week streak'**
  String streakWeekly(int count);

  /// No description provided for @streakSemantics.
  ///
  /// In en, this message translates to:
  /// **'Streaks: {daily} days, {weekly} weeks. Open badges.'**
  String streakSemantics(int daily, int weekly);

  /// No description provided for @companionCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask {name} anything about your project'**
  String companionCardTitle(String name);

  /// No description provided for @companionCardTitleDefault.
  ///
  /// In en, this message translates to:
  /// **'Ask your companion anything about your project'**
  String get companionCardTitleDefault;

  /// No description provided for @companionPromptToday.
  ///
  /// In en, this message translates to:
  /// **'What should I work on today?'**
  String get companionPromptToday;

  /// No description provided for @companionPromptStuck.
  ///
  /// In en, this message translates to:
  /// **'I\'m stuck'**
  String get companionPromptStuck;

  /// No description provided for @companionPromptBehind.
  ///
  /// In en, this message translates to:
  /// **'I\'m behind this week'**
  String get companionPromptBehind;

  /// No description provided for @bannerProposal.
  ///
  /// In en, this message translates to:
  /// **'You missed a session. Here\'s a new plan that fits your time.'**
  String get bannerProposal;

  /// No description provided for @bannerProposalGeneric.
  ///
  /// In en, this message translates to:
  /// **'There\'s a schedule change waiting for you.'**
  String get bannerProposalGeneric;

  /// No description provided for @bannerProposalAction.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get bannerProposalAction;

  /// No description provided for @bannerCheckin.
  ///
  /// In en, this message translates to:
  /// **'Your weekly check-in is ready. It takes about a minute.'**
  String get bannerCheckin;

  /// No description provided for @bannerCheckinAction.
  ///
  /// In en, this message translates to:
  /// **'Check in'**
  String get bannerCheckinAction;

  /// No description provided for @bannerReflection.
  ///
  /// In en, this message translates to:
  /// **'Time for your monthly reflection.'**
  String get bannerReflection;

  /// No description provided for @bannerReflectionAction.
  ///
  /// In en, this message translates to:
  /// **'Reflect'**
  String get bannerReflectionAction;

  /// No description provided for @bannerAtRisk.
  ///
  /// In en, this message translates to:
  /// **'Your schedule is at risk of missing the deadline.'**
  String get bannerAtRisk;

  /// No description provided for @bannerAtRiskAction.
  ///
  /// In en, this message translates to:
  /// **'Adjust plan'**
  String get bannerAtRiskAction;

  /// No description provided for @bannerDowngrade.
  ///
  /// In en, this message translates to:
  /// **'Your plan changed. Your work is safe, some features are locked.'**
  String get bannerDowngrade;

  /// No description provided for @bannerDowngradeAction.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get bannerDowngradeAction;

  /// No description provided for @dashboardEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s find your spark'**
  String get dashboardEmptyTitle;

  /// No description provided for @dashboardEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Pick a new project and SPARK will plan it with you.'**
  String get dashboardEmptyBody;

  /// No description provided for @dashboardEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Start a project'**
  String get dashboardEmptyAction;

  /// No description provided for @dashboardDate.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String dashboardDate(String date);

  /// No description provided for @sessionWhen.
  ///
  /// In en, this message translates to:
  /// **'{day} · {time}'**
  String sessionWhen(String day, String time);

  /// No description provided for @calendarPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get calendarPrevious;

  /// No description provided for @calendarNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get calendarNext;

  /// No description provided for @calendarExpand.
  ///
  /// In en, this message translates to:
  /// **'Show the whole month'**
  String get calendarExpand;

  /// No description provided for @calendarSessions.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 work session} other{{count} work sessions}}'**
  String calendarSessions(int count);

  /// No description provided for @calendarAllDone.
  ///
  /// In en, this message translates to:
  /// **'all sessions done'**
  String get calendarAllDone;

  /// No description provided for @calendarMissed.
  ///
  /// In en, this message translates to:
  /// **'missed session'**
  String get calendarMissed;

  /// No description provided for @calendarMilestone.
  ///
  /// In en, this message translates to:
  /// **'milestone target'**
  String get calendarMilestone;

  /// No description provided for @calendarDeadline.
  ///
  /// In en, this message translates to:
  /// **'project deadline'**
  String get calendarDeadline;

  /// No description provided for @calendarLegendSession.
  ///
  /// In en, this message translates to:
  /// **'Work session'**
  String get calendarLegendSession;

  /// No description provided for @calendarLegendMilestone.
  ///
  /// In en, this message translates to:
  /// **'Milestone'**
  String get calendarLegendMilestone;

  /// No description provided for @calendarLegendDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get calendarLegendDeadline;

  /// No description provided for @calendarLegendMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get calendarLegendMissed;

  /// No description provided for @projectViewAgenda.
  ///
  /// In en, this message translates to:
  /// **'View agenda'**
  String get projectViewAgenda;

  /// No description provided for @projectNoPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'No plan yet'**
  String get projectNoPlanTitle;

  /// No description provided for @projectNoPlanBody.
  ///
  /// In en, this message translates to:
  /// **'Once your plan is ready, your calendar and tasks show up here.'**
  String get projectNoPlanBody;

  /// No description provided for @projectDates.
  ///
  /// In en, this message translates to:
  /// **'{start} → {end}'**
  String projectDates(String start, String end);

  /// No description provided for @projectDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Due today} =1{1 day left} other{{count} days left}}'**
  String projectDaysLeft(int count);

  /// No description provided for @projectOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On track'**
  String get projectOnTrack;

  /// No description provided for @projectAtRisk.
  ///
  /// In en, this message translates to:
  /// **'At risk'**
  String get projectAtRisk;

  /// No description provided for @projectPhase.
  ///
  /// In en, this message translates to:
  /// **'Phase: {phase}'**
  String projectPhase(String phase);

  /// No description provided for @projectProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get projectProgress;

  /// No description provided for @projectTimeSummary.
  ///
  /// In en, this message translates to:
  /// **'{done} done · {left} to go'**
  String projectTimeSummary(String done, String left);

  /// No description provided for @projectCurrentTasks.
  ///
  /// In en, this message translates to:
  /// **'Current tasks'**
  String get projectCurrentTasks;

  /// No description provided for @projectTimelinePreview.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get projectTimelinePreview;

  /// No description provided for @projectOpenTimeline.
  ///
  /// In en, this message translates to:
  /// **'Open full timeline'**
  String get projectOpenTimeline;

  /// No description provided for @projectHelpSection.
  ///
  /// In en, this message translates to:
  /// **'Resources and help'**
  String get projectHelpSection;

  /// No description provided for @projectAskCompanion.
  ///
  /// In en, this message translates to:
  /// **'Ask your companion'**
  String get projectAskCompanion;

  /// No description provided for @projectSavedResources.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No saved resources yet} =1{1 saved resource} other{{count} saved resources}}'**
  String projectSavedResources(int count);

  /// No description provided for @projectBrowseResources.
  ///
  /// In en, this message translates to:
  /// **'Browse resources'**
  String get projectBrowseResources;

  /// No description provided for @projectOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Opportunities near you'**
  String get projectOpportunities;

  /// No description provided for @projectPlanActions.
  ///
  /// In en, this message translates to:
  /// **'Plan actions'**
  String get projectPlanActions;

  /// No description provided for @planActionAdjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust plan'**
  String get planActionAdjust;

  /// No description provided for @planActionAvailability.
  ///
  /// In en, this message translates to:
  /// **'Edit availability'**
  String get planActionAvailability;

  /// No description provided for @planActionDeadline.
  ///
  /// In en, this message translates to:
  /// **'Change deadline'**
  String get planActionDeadline;

  /// No description provided for @planActionRegenerate.
  ///
  /// In en, this message translates to:
  /// **'Regenerate future tasks'**
  String get planActionRegenerate;

  /// No description provided for @planActionsNote.
  ///
  /// In en, this message translates to:
  /// **'You\'ll see a preview of every change first. Finished work is always kept.'**
  String get planActionsNote;

  /// No description provided for @previewLockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock your full plan'**
  String get previewLockedTitle;

  /// No description provided for @previewLockedBody.
  ///
  /// In en, this message translates to:
  /// **'See every task, your calendar and checklists with Standard or Premium.'**
  String get previewLockedBody;

  /// No description provided for @timelineDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get timelineDone;

  /// No description provided for @timelineInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get timelineInProgress;

  /// No description provided for @timelineUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get timelineUpcoming;

  /// No description provided for @timelineStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get timelineStart;

  /// No description provided for @timelineTarget.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get timelineTarget;

  /// No description provided for @timelineUpcomingDeadlines.
  ///
  /// In en, this message translates to:
  /// **'Upcoming deadlines'**
  String get timelineUpcomingDeadlines;

  /// No description provided for @timelineWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get timelineWork;

  /// No description provided for @timelineEstimated.
  ///
  /// In en, this message translates to:
  /// **'Estimated progress'**
  String get timelineEstimated;

  /// No description provided for @timelineEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your timeline will appear once your plan is ready.'**
  String get timelineEmpty;

  /// No description provided for @lockedResourcesBenefit.
  ///
  /// In en, this message translates to:
  /// **'Get videos, guides, opportunities and an AI companion who knows your project.'**
  String get lockedResourcesBenefit;

  /// No description provided for @resourceProjectTypeFallback.
  ///
  /// In en, this message translates to:
  /// **'project'**
  String get resourceProjectTypeFallback;

  /// No description provided for @agendaDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get agendaDay;

  /// No description provided for @agendaWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get agendaWeek;

  /// No description provided for @agendaMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get agendaMonth;

  /// No description provided for @agendaPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get agendaPrevious;

  /// No description provided for @agendaNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get agendaNext;

  /// No description provided for @agendaEmptyDay.
  ///
  /// In en, this message translates to:
  /// **'No work planned. Enjoy your day!'**
  String get agendaEmptyDay;

  /// No description provided for @agendaOtherTasks.
  ///
  /// In en, this message translates to:
  /// **'Also planned'**
  String get agendaOtherTasks;

  /// No description provided for @agendaMilestoneItem.
  ///
  /// In en, this message translates to:
  /// **'Milestone: {title}'**
  String agendaMilestoneItem(String title);

  /// No description provided for @agendaDeadlineItem.
  ///
  /// In en, this message translates to:
  /// **'Project deadline'**
  String get agendaDeadlineItem;

  /// No description provided for @agendaWeekTotals.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} tasks done · {planned} planned'**
  String agendaWeekTotals(int done, int total, String planned);

  /// No description provided for @agendaWeekRange.
  ///
  /// In en, this message translates to:
  /// **'{start} – {end}'**
  String agendaWeekRange(String start, String end);

  /// No description provided for @agendaSessionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 session} other{{count} sessions}}'**
  String agendaSessionCount(int count);

  /// No description provided for @agendaTaskCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 task} other{{count} tasks}}'**
  String agendaTaskCount(int count);

  /// No description provided for @agendaMonthEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing planned this month.'**
  String get agendaMonthEmpty;

  /// No description provided for @agendaMoveDay.
  ///
  /// In en, this message translates to:
  /// **'Move to another day'**
  String get agendaMoveDay;

  /// No description provided for @agendaFindTime.
  ///
  /// In en, this message translates to:
  /// **'Find a new time for this'**
  String get agendaFindTime;

  /// No description provided for @agendaOpenTask.
  ///
  /// In en, this message translates to:
  /// **'Open task'**
  String get agendaOpenTask;

  /// No description provided for @agendaDayFull.
  ///
  /// In en, this message translates to:
  /// **'That day is already full'**
  String get agendaDayFull;

  /// No description provided for @agendaDayFullBody.
  ///
  /// In en, this message translates to:
  /// **'{day} has {planned} planned out of {available} available. Pick another day or let SPARK find a time.'**
  String agendaDayFullBody(String day, String planned, String available);

  /// No description provided for @agendaFinding.
  ///
  /// In en, this message translates to:
  /// **'Finding a time that fits…'**
  String get agendaFinding;

  /// No description provided for @agendaGcalSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced to Google Calendar · {time}'**
  String agendaGcalSynced(String time);

  /// No description provided for @agendaGcalNever.
  ///
  /// In en, this message translates to:
  /// **'Synced to Google Calendar'**
  String get agendaGcalNever;

  /// No description provided for @agendaGcalError.
  ///
  /// In en, this message translates to:
  /// **'Google Calendar sync problem: {message}'**
  String agendaGcalError(String message);

  /// No description provided for @agendaGcalSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing with Google Calendar…'**
  String get agendaGcalSyncing;

  /// No description provided for @agendaNoAvailability.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t set any available days yet.'**
  String get agendaNoAvailability;

  /// No description provided for @agendaMissedTag.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get agendaMissedTag;

  /// No description provided for @taskDoneWhen.
  ///
  /// In en, this message translates to:
  /// **'You\'re done when…'**
  String get taskDoneWhen;

  /// No description provided for @taskEstimate.
  ///
  /// In en, this message translates to:
  /// **'Estimated time'**
  String get taskEstimate;

  /// No description provided for @taskPriority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get taskPriority;

  /// No description provided for @taskPrerequisites.
  ///
  /// In en, this message translates to:
  /// **'Do these first'**
  String get taskPrerequisites;

  /// No description provided for @taskPrereqDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get taskPrereqDone;

  /// No description provided for @taskPrereqPending.
  ///
  /// In en, this message translates to:
  /// **'Not done yet'**
  String get taskPrereqPending;

  /// No description provided for @taskSuggestedDate.
  ///
  /// In en, this message translates to:
  /// **'Planned for'**
  String get taskSuggestedDate;

  /// No description provided for @taskSession.
  ///
  /// In en, this message translates to:
  /// **'Work session'**
  String get taskSession;

  /// No description provided for @taskMilestone.
  ///
  /// In en, this message translates to:
  /// **'Milestone'**
  String get taskMilestone;

  /// No description provided for @taskMarkComplete.
  ///
  /// In en, this message translates to:
  /// **'Mark complete'**
  String get taskMarkComplete;

  /// No description provided for @taskStartFocus.
  ///
  /// In en, this message translates to:
  /// **'Start focus session'**
  String get taskStartFocus;

  /// No description provided for @taskAskCompanion.
  ///
  /// In en, this message translates to:
  /// **'Ask companion about this task'**
  String get taskAskCompanion;

  /// No description provided for @taskReschedule.
  ///
  /// In en, this message translates to:
  /// **'Reschedule'**
  String get taskReschedule;

  /// No description provided for @taskAddJournal.
  ///
  /// In en, this message translates to:
  /// **'Add journal entry'**
  String get taskAddJournal;

  /// No description provided for @taskUndo.
  ///
  /// In en, this message translates to:
  /// **'Mark as not done'**
  String get taskUndo;

  /// No description provided for @taskNotFound.
  ///
  /// In en, this message translates to:
  /// **'This task isn\'t in your current plan anymore.'**
  String get taskNotFound;

  /// No description provided for @taskStatusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get taskStatusDone;

  /// No description provided for @taskStatusObsolete.
  ///
  /// In en, this message translates to:
  /// **'Set aside after a plan change'**
  String get taskStatusObsolete;

  /// No description provided for @taskStatusSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get taskStatusSkipped;

  /// No description provided for @taskNoDescription.
  ///
  /// In en, this message translates to:
  /// **'No extra details for this one.'**
  String get taskNoDescription;

  /// No description provided for @adjustIntro.
  ///
  /// In en, this message translates to:
  /// **'Every change shows you a preview first. Finished tasks and journal entries are never deleted.'**
  String get adjustIntro;

  /// No description provided for @adjustWhatChange.
  ///
  /// In en, this message translates to:
  /// **'What would you like to change?'**
  String get adjustWhatChange;

  /// No description provided for @adjustWhatChangeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. \"Make it a 10-page zine instead of 20\" or \"Add a launch event\"'**
  String get adjustWhatChangeHint;

  /// No description provided for @adjustKindScope.
  ///
  /// In en, this message translates to:
  /// **'Change the scope'**
  String get adjustKindScope;

  /// No description provided for @adjustKindGoal.
  ///
  /// In en, this message translates to:
  /// **'New goal'**
  String get adjustKindGoal;

  /// No description provided for @adjustPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview changes'**
  String get adjustPreview;

  /// No description provided for @adjustCurrentDeadline.
  ///
  /// In en, this message translates to:
  /// **'Current deadline: {date}'**
  String adjustCurrentDeadline(String date);

  /// No description provided for @adjustNewDeadline.
  ///
  /// In en, this message translates to:
  /// **'New deadline'**
  String get adjustNewDeadline;

  /// No description provided for @adjustPickDeadline.
  ///
  /// In en, this message translates to:
  /// **'Pick a new deadline'**
  String get adjustPickDeadline;

  /// No description provided for @adjustRegenerateBody.
  ///
  /// In en, this message translates to:
  /// **'SPARK will rebuild your upcoming tasks around your current progress and availability. Completed work stays exactly as it is.'**
  String get adjustRegenerateBody;

  /// No description provided for @adjustAvailabilitySaved.
  ///
  /// In en, this message translates to:
  /// **'Availability saved. Your plan already fits.'**
  String get adjustAvailabilitySaved;

  /// No description provided for @adjustSaveAvailability.
  ///
  /// In en, this message translates to:
  /// **'Save availability'**
  String get adjustSaveAvailability;

  /// No description provided for @adjustLoadingPreview.
  ///
  /// In en, this message translates to:
  /// **'Working out what would change…'**
  String get adjustLoadingPreview;

  /// No description provided for @focusTitle.
  ///
  /// In en, this message translates to:
  /// **'Focus mode'**
  String get focusTitle;

  /// No description provided for @focusCurrentTask.
  ///
  /// In en, this message translates to:
  /// **'Now working on'**
  String get focusCurrentTask;

  /// No description provided for @focusDoneWithTask.
  ///
  /// In en, this message translates to:
  /// **'Done with this task'**
  String get focusDoneWithTask;

  /// No description provided for @focusPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get focusPause;

  /// No description provided for @focusResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get focusResume;

  /// No description provided for @focusTimerSemantics.
  ///
  /// In en, this message translates to:
  /// **'{time} left in this session'**
  String focusTimerSemantics(String time);

  /// No description provided for @focusTimeUp.
  ///
  /// In en, this message translates to:
  /// **'Time\'s up! Great focus.'**
  String get focusTimeUp;

  /// No description provided for @focusAskCompanion.
  ///
  /// In en, this message translates to:
  /// **'Ask companion'**
  String get focusAskCompanion;

  /// No description provided for @focusEnd.
  ///
  /// In en, this message translates to:
  /// **'End session'**
  String get focusEnd;

  /// No description provided for @focusEndConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'End this session?'**
  String get focusEndConfirmTitle;

  /// No description provided for @focusEndConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Your progress is saved. Anything unfinished stays on your list.'**
  String get focusEndConfirmBody;

  /// No description provided for @focusAllDone.
  ///
  /// In en, this message translates to:
  /// **'Every task in this session is done!'**
  String get focusAllDone;

  /// No description provided for @focusUpNext.
  ///
  /// In en, this message translates to:
  /// **'Up next: {title}'**
  String focusUpNext(String title);

  /// No description provided for @focusSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Session complete'**
  String get focusSummaryTitle;

  /// No description provided for @focusSummaryTasks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No tasks checked off this time, and that\'s okay.} =1{You finished 1 task.} other{You finished {count} tasks.}}'**
  String focusSummaryTasks(int count);

  /// No description provided for @focusSummaryTime.
  ///
  /// In en, this message translates to:
  /// **'You focused for {time}.'**
  String focusSummaryTime(String time);

  /// No description provided for @focusFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get focusFinish;

  /// No description provided for @focusNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find this session. It may have been rescheduled.'**
  String get focusNotFound;

  /// No description provided for @focusClose.
  ///
  /// In en, this message translates to:
  /// **'Close focus mode'**
  String get focusClose;

  /// No description provided for @companionKnows.
  ///
  /// In en, this message translates to:
  /// **'Knows your project: {title}'**
  String companionKnows(String title);

  /// No description provided for @companionKnowsTitle.
  ///
  /// In en, this message translates to:
  /// **'What your companion knows'**
  String get companionKnowsTitle;

  /// No description provided for @companionKnowsBody.
  ///
  /// In en, this message translates to:
  /// **'It reads your plan and progress directly, so you never have to paste project details.'**
  String get companionKnowsBody;

  /// No description provided for @companionKnowsProject.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get companionKnowsProject;

  /// No description provided for @companionKnowsPhase.
  ///
  /// In en, this message translates to:
  /// **'Current phase'**
  String get companionKnowsPhase;

  /// No description provided for @companionKnowsMilestone.
  ///
  /// In en, this message translates to:
  /// **'Current milestone'**
  String get companionKnowsMilestone;

  /// No description provided for @companionKnowsTasks.
  ///
  /// In en, this message translates to:
  /// **'Next tasks'**
  String get companionKnowsTasks;

  /// No description provided for @companionKnowsDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get companionKnowsDeadline;

  /// No description provided for @companionHistory.
  ///
  /// In en, this message translates to:
  /// **'Past chats'**
  String get companionHistory;

  /// No description provided for @companionNewChat.
  ///
  /// In en, this message translates to:
  /// **'New chat'**
  String get companionNewChat;

  /// No description provided for @companionNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No past chats yet.'**
  String get companionNoHistory;

  /// No description provided for @companionHint.
  ///
  /// In en, this message translates to:
  /// **'Ask anything about your project…'**
  String get companionHint;

  /// No description provided for @companionStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get companionStop;

  /// No description provided for @companionStopped.
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get companionStopped;

  /// No description provided for @companionHelpingWith.
  ///
  /// In en, this message translates to:
  /// **'Helping with: {title}'**
  String companionHelpingWith(String title);

  /// No description provided for @companionEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi! What can I help with?'**
  String get companionEmptyTitle;

  /// No description provided for @companionEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'I know your plan, your progress and what\'s coming up.'**
  String get companionEmptyBody;

  /// No description provided for @companionPromptStart.
  ///
  /// In en, this message translates to:
  /// **'Help me start my next task'**
  String get companionPromptStart;

  /// No description provided for @companionPromptResources.
  ///
  /// In en, this message translates to:
  /// **'Find me a good tutorial'**
  String get companionPromptResources;

  /// No description provided for @companionPromptShare.
  ///
  /// In en, this message translates to:
  /// **'How can I share my project?'**
  String get companionPromptShare;

  /// No description provided for @companionToolWorking.
  ///
  /// In en, this message translates to:
  /// **'Checking your project…'**
  String get companionToolWorking;

  /// No description provided for @companionToolTasks.
  ///
  /// In en, this message translates to:
  /// **'Checking your tasks…'**
  String get companionToolTasks;

  /// No description provided for @companionToolCalendar.
  ///
  /// In en, this message translates to:
  /// **'Looking at your calendar…'**
  String get companionToolCalendar;

  /// No description provided for @companionToolProgress.
  ///
  /// In en, this message translates to:
  /// **'Checking your progress…'**
  String get companionToolProgress;

  /// No description provided for @companionToolSearch.
  ///
  /// In en, this message translates to:
  /// **'Searching for resources…'**
  String get companionToolSearch;

  /// No description provided for @companionToolOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Looking for opportunities…'**
  String get companionToolOpportunities;

  /// No description provided for @companionCrisisTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re not alone'**
  String get companionCrisisTitle;

  /// No description provided for @companionCrisisBody.
  ///
  /// In en, this message translates to:
  /// **'If you\'re in danger or thinking about hurting yourself, please reach out right now. Talking to a trusted adult can help too.'**
  String get companionCrisisBody;

  /// No description provided for @companionCrisisCall.
  ///
  /// In en, this message translates to:
  /// **'Call 988'**
  String get companionCrisisCall;

  /// No description provided for @companionCrisisText.
  ///
  /// In en, this message translates to:
  /// **'Text 988'**
  String get companionCrisisText;

  /// No description provided for @companionCrisisLine.
  ///
  /// In en, this message translates to:
  /// **'988 Suicide & Crisis Lifeline (US)'**
  String get companionCrisisLine;

  /// No description provided for @companionLocked.
  ///
  /// In en, this message translates to:
  /// **'Your AI companion is part of Premium.'**
  String get companionLocked;

  /// No description provided for @companionYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get companionYou;

  /// No description provided for @companionSaveOpportunity.
  ///
  /// In en, this message translates to:
  /// **'Save to project'**
  String get companionSaveOpportunity;

  /// No description provided for @opportunityDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline: {date}'**
  String opportunityDeadline(String date);

  /// No description provided for @opportunityRemote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get opportunityRemote;

  /// No description provided for @opportunityEligibility.
  ///
  /// In en, this message translates to:
  /// **'Who can apply: {text}'**
  String opportunityEligibility(String text);

  /// No description provided for @opportunityAiNote.
  ///
  /// In en, this message translates to:
  /// **'This is an idea to look into, not a specific listing.'**
  String get opportunityAiNote;

  /// No description provided for @resourcesFindTab.
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get resourcesFindTab;

  /// No description provided for @resourcesSavedTab.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get resourcesSavedTab;

  /// No description provided for @resourcesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'What do you need help with?'**
  String get resourcesSearchHint;

  /// No description provided for @resourcesSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get resourcesSearch;

  /// No description provided for @resourcesCategories.
  ///
  /// In en, this message translates to:
  /// **'Browse by topic'**
  String get resourcesCategories;

  /// No description provided for @resourcesVideos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get resourcesVideos;

  /// No description provided for @resourcesArticles.
  ///
  /// In en, this message translates to:
  /// **'Articles and guides'**
  String get resourcesArticles;

  /// No description provided for @resourcesPapers.
  ///
  /// In en, this message translates to:
  /// **'Research papers'**
  String get resourcesPapers;

  /// No description provided for @resourcesTools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get resourcesTools;

  /// No description provided for @resourcesAskCompanion.
  ///
  /// In en, this message translates to:
  /// **'Ask the companion instead'**
  String get resourcesAskCompanion;

  /// No description provided for @resourcesSearching.
  ///
  /// In en, this message translates to:
  /// **'Finding real, working resources…'**
  String get resourcesSearching;

  /// No description provided for @resourcesNoResults.
  ///
  /// In en, this message translates to:
  /// **'Nothing solid came up for that. Try different words or ask your companion.'**
  String get resourcesNoResults;

  /// No description provided for @resourcesSavedEmpty.
  ///
  /// In en, this message translates to:
  /// **'Save videos, guides and papers here so they\'re easy to find.'**
  String get resourcesSavedEmpty;

  /// No description provided for @resourcesNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get resourcesNote;

  /// No description provided for @resourcesAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add a note'**
  String get resourcesAddNote;

  /// No description provided for @resourcesEditNote.
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get resourcesEditNote;

  /// No description provided for @resourcesRemoveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this from your saved resources?'**
  String get resourcesRemoveConfirm;

  /// No description provided for @resourcesLocked.
  ///
  /// In en, this message translates to:
  /// **'The Resource Center is part of Premium: real videos, guides and research picked for your project.'**
  String get resourcesLocked;

  /// No description provided for @opportunitiesIntro.
  ///
  /// In en, this message translates to:
  /// **'Find competitions, programs and groups. Type a city or region, or look for remote options.'**
  String get opportunitiesIntro;

  /// No description provided for @opportunitiesLocationHint.
  ///
  /// In en, this message translates to:
  /// **'City or region (optional)'**
  String get opportunitiesLocationHint;

  /// No description provided for @opportunitiesUseSaved.
  ///
  /// In en, this message translates to:
  /// **'Use my saved location'**
  String get opportunitiesUseSaved;

  /// No description provided for @opportunitiesRemoteOnly.
  ///
  /// In en, this message translates to:
  /// **'Remote only'**
  String get opportunitiesRemoteOnly;

  /// No description provided for @opportunitiesSearch.
  ///
  /// In en, this message translates to:
  /// **'Find opportunities'**
  String get opportunitiesSearch;

  /// No description provided for @opportunitiesSearching.
  ///
  /// In en, this message translates to:
  /// **'Looking for real opportunities…'**
  String get opportunitiesSearching;

  /// No description provided for @opportunitiesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing came up. Try a nearby city or include remote options.'**
  String get opportunitiesEmpty;

  /// No description provided for @opportunitiesStrategies.
  ///
  /// In en, this message translates to:
  /// **'Ways to find more'**
  String get opportunitiesStrategies;

  /// No description provided for @opportunitiesTemplate.
  ///
  /// In en, this message translates to:
  /// **'Outreach email you can personalize'**
  String get opportunitiesTemplate;

  /// No description provided for @opportunitiesCopyTemplate.
  ///
  /// In en, this message translates to:
  /// **'Copy template'**
  String get opportunitiesCopyTemplate;

  /// No description provided for @opportunitiesCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get opportunitiesCopied;

  /// No description provided for @opportunitiesLocked.
  ///
  /// In en, this message translates to:
  /// **'Opportunities are part of Premium.'**
  String get opportunitiesLocked;

  /// No description provided for @oppTypeCompetition.
  ///
  /// In en, this message translates to:
  /// **'Competitions'**
  String get oppTypeCompetition;

  /// No description provided for @oppTypeGrant.
  ///
  /// In en, this message translates to:
  /// **'Grants'**
  String get oppTypeGrant;

  /// No description provided for @oppTypeInternship.
  ///
  /// In en, this message translates to:
  /// **'Internships'**
  String get oppTypeInternship;

  /// No description provided for @oppTypeWorkshop.
  ///
  /// In en, this message translates to:
  /// **'Workshops'**
  String get oppTypeWorkshop;

  /// No description provided for @oppTypeShowcase.
  ///
  /// In en, this message translates to:
  /// **'Showcases'**
  String get oppTypeShowcase;

  /// No description provided for @oppTypeMentorship.
  ///
  /// In en, this message translates to:
  /// **'Mentorship'**
  String get oppTypeMentorship;

  /// No description provided for @oppTypeResearch.
  ///
  /// In en, this message translates to:
  /// **'Research programs'**
  String get oppTypeResearch;

  /// No description provided for @oppTypeCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community orgs'**
  String get oppTypeCommunity;

  /// No description provided for @journalAddEntry.
  ///
  /// In en, this message translates to:
  /// **'Add to journal'**
  String get journalAddEntry;

  /// No description provided for @journalCamera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get journalCamera;

  /// No description provided for @journalLibrary.
  ///
  /// In en, this message translates to:
  /// **'Choose from photos'**
  String get journalLibrary;

  /// No description provided for @journalFile.
  ///
  /// In en, this message translates to:
  /// **'Upload a PDF'**
  String get journalFile;

  /// No description provided for @journalCaption.
  ///
  /// In en, this message translates to:
  /// **'Caption'**
  String get journalCaption;

  /// No description provided for @journalCaptionHint.
  ///
  /// In en, this message translates to:
  /// **'What did you make or learn?'**
  String get journalCaptionHint;

  /// No description provided for @journalUpload.
  ///
  /// In en, this message translates to:
  /// **'Add to journal'**
  String get journalUpload;

  /// No description provided for @journalUploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading… {percent}'**
  String journalUploading(String percent);

  /// No description provided for @journalPreparing.
  ///
  /// In en, this message translates to:
  /// **'Getting your file ready…'**
  String get journalPreparing;

  /// No description provided for @journalAdded.
  ///
  /// In en, this message translates to:
  /// **'Added to your journal!'**
  String get journalAdded;

  /// No description provided for @journalTooBigImage.
  ///
  /// In en, this message translates to:
  /// **'That photo is too big (max 10 MB). Try a different one.'**
  String get journalTooBigImage;

  /// No description provided for @journalTooBigPdf.
  ///
  /// In en, this message translates to:
  /// **'That PDF is too big (max 15 MB).'**
  String get journalTooBigPdf;

  /// No description provided for @journalUnsupported.
  ///
  /// In en, this message translates to:
  /// **'SPARK can add photos (JPG, PNG, WebP, HEIC) and PDFs.'**
  String get journalUnsupported;

  /// No description provided for @journalProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing…'**
  String get journalProcessing;

  /// No description provided for @journalFailed.
  ///
  /// In en, this message translates to:
  /// **'This upload didn\'t work. Try adding it again.'**
  String get journalFailed;

  /// No description provided for @journalNewestFirst.
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get journalNewestFirst;

  /// No description provided for @journalOldestFirst.
  ///
  /// In en, this message translates to:
  /// **'Oldest first'**
  String get journalOldestFirst;

  /// No description provided for @journalEmpty.
  ///
  /// In en, this message translates to:
  /// **'Finish a task and snap a photo to start your story.'**
  String get journalEmpty;

  /// No description provided for @journalMilestoneMarker.
  ///
  /// In en, this message translates to:
  /// **'Milestone reached: {title}'**
  String journalMilestoneMarker(String title);

  /// No description provided for @journalBadgeMarker.
  ///
  /// In en, this message translates to:
  /// **'Badge earned: {title}'**
  String journalBadgeMarker(String title);

  /// No description provided for @journalLinkedTask.
  ///
  /// In en, this message translates to:
  /// **'From: {title}'**
  String journalLinkedTask(String title);

  /// No description provided for @journalScrapbooks.
  ///
  /// In en, this message translates to:
  /// **'Scrapbooks'**
  String get journalScrapbooks;

  /// No description provided for @journalScrapbookCompiling.
  ///
  /// In en, this message translates to:
  /// **'Being made…'**
  String get journalScrapbookCompiling;

  /// No description provided for @journalMakeYearInReview.
  ///
  /// In en, this message translates to:
  /// **'Make my year in review'**
  String get journalMakeYearInReview;

  /// No description provided for @journalScrapbookRequested.
  ///
  /// In en, this message translates to:
  /// **'Your scrapbook is being made. It\'ll show up here when it\'s ready.'**
  String get journalScrapbookRequested;

  /// No description provided for @journalScrapbookLocked.
  ///
  /// In en, this message translates to:
  /// **'Scrapbooks are part of Premium.'**
  String get journalScrapbookLocked;

  /// No description provided for @journalLocked.
  ///
  /// In en, this message translates to:
  /// **'Your progress journal is part of Premium.'**
  String get journalLocked;

  /// No description provided for @journalEntryNotFound.
  ///
  /// In en, this message translates to:
  /// **'This entry isn\'t available anymore.'**
  String get journalEntryNotFound;

  /// No description provided for @journalDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete entry'**
  String get journalDelete;

  /// No description provided for @journalDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this journal entry?'**
  String get journalDeleteConfirm;

  /// No description provided for @journalDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'The photo or file is removed for good. This can\'t be undone.'**
  String get journalDeleteBody;

  /// No description provided for @journalCaptionSaved.
  ///
  /// In en, this message translates to:
  /// **'Caption saved'**
  String get journalCaptionSaved;

  /// No description provided for @journalPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get journalPdf;

  /// No description provided for @journalImageSemantics.
  ///
  /// In en, this message translates to:
  /// **'Journal photo: {caption}'**
  String journalImageSemantics(String caption);

  /// No description provided for @journalSelectEntry.
  ///
  /// In en, this message translates to:
  /// **'Pick an entry to see it here.'**
  String get journalSelectEntry;

  /// No description provided for @scrapbookNarrative.
  ///
  /// In en, this message translates to:
  /// **'Your story'**
  String get scrapbookNarrative;

  /// No description provided for @scrapbookHighlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get scrapbookHighlights;

  /// No description provided for @scrapbookYearTitle.
  ///
  /// In en, this message translates to:
  /// **'{year} in review'**
  String scrapbookYearTitle(int year);

  /// No description provided for @scrapbookNoScreenshotNote.
  ///
  /// In en, this message translates to:
  /// **'Scrapbooks stay inside SPARK.'**
  String get scrapbookNoScreenshotNote;

  /// No description provided for @scrapbookFailed.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t make this scrapbook. Please try again later.'**
  String get scrapbookFailed;

  /// No description provided for @scrapbookPage.
  ///
  /// In en, this message translates to:
  /// **'Page {current} of {total}'**
  String scrapbookPage(int current, int total);

  /// No description provided for @profileMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String profileMemberSince(String date);

  /// No description provided for @profileChangeCharacter.
  ///
  /// In en, this message translates to:
  /// **'Change your companion'**
  String get profileChangeCharacter;

  /// No description provided for @profileStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your wins'**
  String get profileStatsTitle;

  /// No description provided for @profileStatTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks done'**
  String get profileStatTasks;

  /// No description provided for @profileStatHours.
  ///
  /// In en, this message translates to:
  /// **'Hours of work'**
  String get profileStatHours;

  /// No description provided for @profileStatStreak.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get profileStatStreak;

  /// No description provided for @profileStatWeekStreak.
  ///
  /// In en, this message translates to:
  /// **'Week streak'**
  String get profileStatWeekStreak;

  /// No description provided for @profileStatMilestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get profileStatMilestones;

  /// No description provided for @profileHoursValue.
  ///
  /// In en, this message translates to:
  /// **'{hours}'**
  String profileHoursValue(String hours);

  /// No description provided for @profileBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get profileBadges;

  /// No description provided for @profilePoints.
  ///
  /// In en, this message translates to:
  /// **'{points} points'**
  String profilePoints(int points);

  /// No description provided for @profileChallenges.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get profileChallenges;

  /// No description provided for @profileChallengeJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get profileChallengeJoin;

  /// No description provided for @profileChallengeJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get profileChallengeJoined;

  /// No description provided for @profileChallengeEnds.
  ///
  /// In en, this message translates to:
  /// **'Ends {date}'**
  String profileChallengeEnds(String date);

  /// No description provided for @profileChallengeProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent} complete'**
  String profileChallengeProgress(String percent);

  /// No description provided for @profileNoChallenges.
  ///
  /// In en, this message translates to:
  /// **'No challenges right now. Check back soon!'**
  String get profileNoChallenges;

  /// No description provided for @profileLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get profileLeaderboard;

  /// No description provided for @profileLeaderboardOff.
  ///
  /// In en, this message translates to:
  /// **'Off. Only you see your points.'**
  String get profileLeaderboardOff;

  /// No description provided for @profileLeaderboardOn.
  ///
  /// In en, this message translates to:
  /// **'On, with your pseudonym'**
  String get profileLeaderboardOn;

  /// No description provided for @profileReflections.
  ///
  /// In en, this message translates to:
  /// **'Reflections and check-ins'**
  String get profileReflections;

  /// No description provided for @profilePastProjects.
  ///
  /// In en, this message translates to:
  /// **'Past projects'**
  String get profilePastProjects;

  /// No description provided for @profileSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get profileSubscription;

  /// No description provided for @profileCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get profileCommunity;

  /// No description provided for @planNameLaunch.
  ///
  /// In en, this message translates to:
  /// **'Premium (launch access)'**
  String get planNameLaunch;

  /// No description provided for @planNameBasic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get planNameBasic;

  /// No description provided for @planNameStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get planNameStandard;

  /// No description provided for @planNamePremium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get planNamePremium;

  /// No description provided for @badgesEarned.
  ///
  /// In en, this message translates to:
  /// **'Earned {date}'**
  String badgesEarned(String date);

  /// No description provided for @badgesLocked.
  ///
  /// In en, this message translates to:
  /// **'Not earned yet'**
  String get badgesLocked;

  /// No description provided for @badgesHowTo.
  ///
  /// In en, this message translates to:
  /// **'How to earn: {text}'**
  String badgesHowTo(String text);

  /// No description provided for @badgesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Badges will appear here as you make progress.'**
  String get badgesEmpty;

  /// No description provided for @leaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly leaderboard'**
  String get leaderboardTitle;

  /// No description provided for @leaderboardOptIn.
  ///
  /// In en, this message translates to:
  /// **'Show me on the leaderboard'**
  String get leaderboardOptIn;

  /// No description provided for @leaderboardPrivacy.
  ///
  /// In en, this message translates to:
  /// **'If you join, others see only your pseudonym, your companion\'s picture and your weekly points. Never your name, school, location or project details. You can leave anytime.'**
  String get leaderboardPrivacy;

  /// No description provided for @leaderboardTeen.
  ///
  /// In en, this message translates to:
  /// **'Teen board'**
  String get leaderboardTeen;

  /// No description provided for @leaderboardAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult board'**
  String get leaderboardAdult;

  /// No description provided for @leaderboardEmpty.
  ///
  /// In en, this message translates to:
  /// **'This week\'s board isn\'t ready yet. Points from consistent work count most!'**
  String get leaderboardEmpty;

  /// No description provided for @leaderboardPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} pts'**
  String leaderboardPoints(int points);

  /// No description provided for @leaderboardRank.
  ///
  /// In en, this message translates to:
  /// **'Rank {rank}'**
  String leaderboardRank(int rank);

  /// No description provided for @leaderboardOffBody.
  ///
  /// In en, this message translates to:
  /// **'The leaderboard is optional and off by default.'**
  String get leaderboardOffBody;

  /// No description provided for @reflectionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your reflections'**
  String get reflectionsTitle;

  /// No description provided for @reflectionsCheckins.
  ///
  /// In en, this message translates to:
  /// **'Weekly check-ins'**
  String get reflectionsCheckins;

  /// No description provided for @reflectionsMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly reflections'**
  String get reflectionsMonthly;

  /// No description provided for @reflectionsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet. Your check-ins and reflections will show up here.'**
  String get reflectionsEmpty;

  /// No description provided for @reflectionsStartCheckin.
  ///
  /// In en, this message translates to:
  /// **'Do a weekly check-in'**
  String get reflectionsStartCheckin;

  /// No description provided for @reflectionsStartMonthly.
  ///
  /// In en, this message translates to:
  /// **'Write a monthly reflection'**
  String get reflectionsStartMonthly;

  /// No description provided for @reflectionLearned.
  ///
  /// In en, this message translates to:
  /// **'What I learned'**
  String get reflectionLearned;

  /// No description provided for @reflectionChange.
  ///
  /// In en, this message translates to:
  /// **'What I\'d change'**
  String get reflectionChange;

  /// No description provided for @reflectionGoals.
  ///
  /// In en, this message translates to:
  /// **'Goals for next month'**
  String get reflectionGoals;

  /// No description provided for @checkinFeeling.
  ///
  /// In en, this message translates to:
  /// **'Feeling: {value}/5'**
  String checkinFeeling(int value);

  /// No description provided for @pastProjectsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Finished and paused projects will live here.'**
  String get pastProjectsEmpty;

  /// No description provided for @pastProjectStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get pastProjectStatusCompleted;

  /// No description provided for @pastProjectStatusPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get pastProjectStatusPaused;

  /// No description provided for @pastProjectStatusAbandoned.
  ///
  /// In en, this message translates to:
  /// **'Set aside'**
  String get pastProjectStatusAbandoned;

  /// No description provided for @pastProjectStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get pastProjectStatusActive;

  /// No description provided for @pastProjectOpenScrapbook.
  ///
  /// In en, this message translates to:
  /// **'Open scrapbook'**
  String get pastProjectOpenScrapbook;

  /// No description provided for @pastProjectCompletedOn.
  ///
  /// In en, this message translates to:
  /// **'Finished {date}'**
  String pastProjectCompletedOn(String date);

  /// No description provided for @checkinTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly check-in'**
  String get checkinTitle;

  /// No description provided for @checkinQ1.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling about your project?'**
  String get checkinQ1;

  /// No description provided for @checkinQ2.
  ///
  /// In en, this message translates to:
  /// **'How\'s progress going this week?'**
  String get checkinQ2;

  /// No description provided for @checkinQ3.
  ///
  /// In en, this message translates to:
  /// **'What\'s been hard lately?'**
  String get checkinQ3;

  /// No description provided for @checkinQ3Hint.
  ///
  /// In en, this message translates to:
  /// **'Anything at all. Even \"nothing\" is a good answer.'**
  String get checkinQ3Hint;

  /// No description provided for @checkinQ4.
  ///
  /// In en, this message translates to:
  /// **'Is your upcoming schedule still realistic?'**
  String get checkinQ4;

  /// No description provided for @checkinYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, it works'**
  String get checkinYes;

  /// No description provided for @checkinNo.
  ///
  /// In en, this message translates to:
  /// **'Not really'**
  String get checkinNo;

  /// No description provided for @checkinFeeling1.
  ///
  /// In en, this message translates to:
  /// **'Rough'**
  String get checkinFeeling1;

  /// No description provided for @checkinFeeling2.
  ///
  /// In en, this message translates to:
  /// **'Meh'**
  String get checkinFeeling2;

  /// No description provided for @checkinFeeling3.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get checkinFeeling3;

  /// No description provided for @checkinFeeling4.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get checkinFeeling4;

  /// No description provided for @checkinFeeling5.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get checkinFeeling5;

  /// No description provided for @checkinProgress1.
  ///
  /// In en, this message translates to:
  /// **'Stuck'**
  String get checkinProgress1;

  /// No description provided for @checkinProgress2.
  ///
  /// In en, this message translates to:
  /// **'Slow'**
  String get checkinProgress2;

  /// No description provided for @checkinProgress3.
  ///
  /// In en, this message translates to:
  /// **'Steady'**
  String get checkinProgress3;

  /// No description provided for @checkinProgress4.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get checkinProgress4;

  /// No description provided for @checkinProgress5.
  ///
  /// In en, this message translates to:
  /// **'Flying'**
  String get checkinProgress5;

  /// No description provided for @checkinSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send check-in'**
  String get checkinSubmit;

  /// No description provided for @checkinThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for checking in!'**
  String get checkinThanks;

  /// No description provided for @checkinDone.
  ///
  /// In en, this message translates to:
  /// **'Back to my dashboard'**
  String get checkinDone;

  /// No description provided for @checkinNoProject.
  ///
  /// In en, this message translates to:
  /// **'Start a project to do weekly check-ins.'**
  String get checkinNoProject;

  /// No description provided for @monthlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly reflection'**
  String get monthlyTitle;

  /// No description provided for @monthlySummary.
  ///
  /// In en, this message translates to:
  /// **'Your month in numbers'**
  String get monthlySummary;

  /// No description provided for @monthlyTasks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 task done} other{{count} tasks done}}'**
  String monthlyTasks(int count);

  /// No description provided for @monthlyTime.
  ///
  /// In en, this message translates to:
  /// **'{time} of work'**
  String monthlyTime(String time);

  /// No description provided for @monthlyMilestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get monthlyMilestones;

  /// No description provided for @monthlyBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get monthlyBadges;

  /// No description provided for @monthlyChallenges.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get monthlyChallenges;

  /// No description provided for @monthlyPriorities.
  ///
  /// In en, this message translates to:
  /// **'Coming up next'**
  String get monthlyPriorities;

  /// No description provided for @monthlyLearnedPrompt.
  ///
  /// In en, this message translates to:
  /// **'What did you learn this month?'**
  String get monthlyLearnedPrompt;

  /// No description provided for @monthlyChangePrompt.
  ///
  /// In en, this message translates to:
  /// **'What would you do differently?'**
  String get monthlyChangePrompt;

  /// No description provided for @monthlyGoalsPrompt.
  ///
  /// In en, this message translates to:
  /// **'What are your goals for next month?'**
  String get monthlyGoalsPrompt;

  /// No description provided for @monthlySave.
  ///
  /// In en, this message translates to:
  /// **'Save reflection'**
  String get monthlySave;

  /// No description provided for @monthlySaved.
  ///
  /// In en, this message translates to:
  /// **'Reflection saved. Nice work looking back!'**
  String get monthlySaved;

  /// No description provided for @monthlyPrevMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get monthlyPrevMonth;

  /// No description provided for @monthlyNextMonth.
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get monthlyNextMonth;

  /// No description provided for @plansTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your plan'**
  String get plansTitle;

  /// No description provided for @plansBody.
  ///
  /// In en, this message translates to:
  /// **'Every plan keeps your work safe. Upgrade or cancel anytime.'**
  String get plansBody;

  /// No description provided for @plansAllPremium.
  ///
  /// In en, this message translates to:
  /// **'Everything in SPARK is unlocked for you right now. Enjoy!'**
  String get plansAllPremium;

  /// No description provided for @plansFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get plansFree;

  /// No description provided for @plansTrial.
  ///
  /// In en, this message translates to:
  /// **'{days}-day free trial'**
  String plansTrial(int days);

  /// No description provided for @plansStartTrial.
  ///
  /// In en, this message translates to:
  /// **'Start free trial · then {price}/{period}'**
  String plansStartTrial(String price, String period);

  /// No description provided for @plansSubscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe · {price}/{period}'**
  String plansSubscribe(String price, String period);

  /// No description provided for @plansCurrent.
  ///
  /// In en, this message translates to:
  /// **'Your plan'**
  String get plansCurrent;

  /// No description provided for @plansTerms.
  ///
  /// In en, this message translates to:
  /// **'Payment is charged to your app store account when you confirm. The subscription renews automatically at the price shown unless you cancel at least 24 hours before the end of the current period. Cancel anytime in your store account settings.'**
  String get plansTerms;

  /// No description provided for @plansTrialTerms.
  ///
  /// In en, this message translates to:
  /// **'After the free trial ends you\'ll be charged {price} every {period} unless you cancel before the trial ends.'**
  String plansTrialTerms(String price, String period);

  /// No description provided for @plansPriceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Price not available right now'**
  String get plansPriceUnavailable;

  /// No description provided for @plansStoreUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Purchases aren\'t available on this device.'**
  String get plansStoreUnavailable;

  /// No description provided for @plansPurchasing.
  ///
  /// In en, this message translates to:
  /// **'Confirming with the store…'**
  String get plansPurchasing;

  /// No description provided for @plansPending.
  ///
  /// In en, this message translates to:
  /// **'Thanks! Your plan will update in a moment.'**
  String get plansPending;

  /// No description provided for @plansRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get plansRestore;

  /// No description provided for @plansRestored.
  ///
  /// In en, this message translates to:
  /// **'Purchases restored.'**
  String get plansRestored;

  /// No description provided for @plansCompare.
  ///
  /// In en, this message translates to:
  /// **'Compare plans'**
  String get plansCompare;

  /// No description provided for @periodWeek.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get periodWeek;

  /// No description provided for @periodMonth.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get periodMonth;

  /// No description provided for @periodYear.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get periodYear;

  /// No description provided for @subscriptionCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current plan'**
  String get subscriptionCurrent;

  /// No description provided for @subscriptionRenews.
  ///
  /// In en, this message translates to:
  /// **'Renews {date}'**
  String subscriptionRenews(String date);

  /// No description provided for @subscriptionExpires.
  ///
  /// In en, this message translates to:
  /// **'Ends {date}'**
  String subscriptionExpires(String date);

  /// No description provided for @subscriptionTrialEnds.
  ///
  /// In en, this message translates to:
  /// **'Free trial ends {date}'**
  String subscriptionTrialEnds(String date);

  /// No description provided for @subscriptionManage.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get subscriptionManage;

  /// No description provided for @subscriptionManageUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Manage your subscription in your app store account settings.'**
  String get subscriptionManageUnavailable;

  /// No description provided for @subscriptionLaunch.
  ///
  /// In en, this message translates to:
  /// **'During launch every feature is free for everyone.'**
  String get subscriptionLaunch;

  /// No description provided for @subscriptionGrant.
  ///
  /// In en, this message translates to:
  /// **'Bonus access: {plan} until {date}'**
  String subscriptionGrant(String plan, String date);

  /// No description provided for @subscriptionDowngradeTitle.
  ///
  /// In en, this message translates to:
  /// **'What changed'**
  String get subscriptionDowngradeTitle;

  /// No description provided for @subscriptionDowngradeLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked for now: {features}'**
  String subscriptionDowngradeLocked(String features);

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsAppearanceBody.
  ///
  /// In en, this message translates to:
  /// **'Light, dark, themes and colors'**
  String get settingsAppearanceBody;

  /// No description provided for @settingsThemes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get settingsThemes;

  /// No description provided for @settingsThemeDefault.
  ///
  /// In en, this message translates to:
  /// **'SPARK default'**
  String get settingsThemeDefault;

  /// No description provided for @settingsThemeSeasonal.
  ///
  /// In en, this message translates to:
  /// **'Seasonal'**
  String get settingsThemeSeasonal;

  /// No description provided for @settingsThemeEarned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get settingsThemeEarned;

  /// No description provided for @settingsThemeLockedEarned.
  ///
  /// In en, this message translates to:
  /// **'Unlock by staying consistent'**
  String get settingsThemeLockedEarned;

  /// No description provided for @settingsCustomColors.
  ///
  /// In en, this message translates to:
  /// **'Custom colors'**
  String get settingsCustomColors;

  /// No description provided for @settingsCustomColorsBody.
  ///
  /// In en, this message translates to:
  /// **'Pick your own colors (Premium)'**
  String get settingsCustomColorsBody;

  /// No description provided for @settingsCharacter.
  ///
  /// In en, this message translates to:
  /// **'Companion character'**
  String get settingsCharacter;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'Reminders, quiet hours and more'**
  String get settingsNotificationsBody;

  /// No description provided for @settingsNotifPermissionOff.
  ///
  /// In en, this message translates to:
  /// **'Notifications are turned off for SPARK on this device.'**
  String get settingsNotifPermissionOff;

  /// No description provided for @settingsOpenSystemSettings.
  ///
  /// In en, this message translates to:
  /// **'Open system settings'**
  String get settingsOpenSystemSettings;

  /// No description provided for @settingsSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get settingsSchedule;

  /// No description provided for @settingsScheduleBody.
  ///
  /// In en, this message translates to:
  /// **'Availability, deadline and Google Calendar'**
  String get settingsScheduleBody;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacy;

  /// No description provided for @settingsPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard, community, location'**
  String get settingsPrivacyBody;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get settingsSaved;

  /// No description provided for @colorsIntro.
  ///
  /// In en, this message translates to:
  /// **'Pick a color for each part of the app. We check that text stays easy to read.'**
  String get colorsIntro;

  /// No description provided for @colorsLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get colorsLightMode;

  /// No description provided for @colorsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get colorsDarkMode;

  /// No description provided for @colorsPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get colorsPreview;

  /// No description provided for @colorsContrastWarning.
  ///
  /// In en, this message translates to:
  /// **'{fg} on {bg} is hard to read ({ratio}:1, needs 4.5:1).'**
  String colorsContrastWarning(String fg, String bg, String ratio);

  /// No description provided for @colorsUseSuggested.
  ///
  /// In en, this message translates to:
  /// **'Use a readable shade'**
  String get colorsUseSuggested;

  /// No description provided for @colorsAllGood.
  ///
  /// In en, this message translates to:
  /// **'All text passes the readability check.'**
  String get colorsAllGood;

  /// No description provided for @colorsSave.
  ///
  /// In en, this message translates to:
  /// **'Save colors'**
  String get colorsSave;

  /// No description provided for @colorsReset.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get colorsReset;

  /// No description provided for @colorsResetDone.
  ///
  /// In en, this message translates to:
  /// **'Colors reset'**
  String get colorsResetDone;

  /// No description provided for @colorsLocked.
  ///
  /// In en, this message translates to:
  /// **'Custom colors are part of Premium.'**
  String get colorsLocked;

  /// No description provided for @colorsPick.
  ///
  /// In en, this message translates to:
  /// **'Pick a color for {role}'**
  String colorsPick(String role);

  /// No description provided for @roleBackground.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get roleBackground;

  /// No description provided for @roleSurface.
  ///
  /// In en, this message translates to:
  /// **'Sheets and inputs'**
  String get roleSurface;

  /// No description provided for @roleCard.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get roleCard;

  /// No description provided for @rolePrimary.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get rolePrimary;

  /// No description provided for @roleOnPrimary.
  ///
  /// In en, this message translates to:
  /// **'Button text'**
  String get roleOnPrimary;

  /// No description provided for @roleAccent.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get roleAccent;

  /// No description provided for @roleTextPrimary.
  ///
  /// In en, this message translates to:
  /// **'Main text'**
  String get roleTextPrimary;

  /// No description provided for @roleTextSecondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary text'**
  String get roleTextSecondary;

  /// No description provided for @roleProgressDone.
  ///
  /// In en, this message translates to:
  /// **'Progress (done)'**
  String get roleProgressDone;

  /// No description provided for @roleProgressProjected.
  ///
  /// In en, this message translates to:
  /// **'Progress (projected)'**
  String get roleProgressProjected;

  /// No description provided for @scheduleAvailability.
  ///
  /// In en, this message translates to:
  /// **'Weekly availability'**
  String get scheduleAvailability;

  /// No description provided for @scheduleDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get scheduleDeadline;

  /// No description provided for @scheduleChangeDeadline.
  ///
  /// In en, this message translates to:
  /// **'Change deadline'**
  String get scheduleChangeDeadline;

  /// No description provided for @scheduleAvailabilitySaved.
  ///
  /// In en, this message translates to:
  /// **'Availability saved.'**
  String get scheduleAvailabilitySaved;

  /// No description provided for @scheduleGcal.
  ///
  /// In en, this message translates to:
  /// **'Google Calendar'**
  String get scheduleGcal;

  /// No description provided for @scheduleGcalConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect Google Calendar'**
  String get scheduleGcalConnect;

  /// No description provided for @scheduleGcalConnectBody.
  ///
  /// In en, this message translates to:
  /// **'Add SPARK sessions to your calendar and plan around your busy times. You\'ll sign in with Google in your browser.'**
  String get scheduleGcalConnectBody;

  /// No description provided for @scheduleGcalOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening Google in your browser…'**
  String get scheduleGcalOpening;

  /// No description provided for @scheduleGcalReturn.
  ///
  /// In en, this message translates to:
  /// **'Finish connecting in your browser, then come back here.'**
  String get scheduleGcalReturn;

  /// No description provided for @scheduleGcalConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected as {email}'**
  String scheduleGcalConnected(String email);

  /// No description provided for @scheduleGcalConnectedNoEmail.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get scheduleGcalConnectedNoEmail;

  /// No description provided for @scheduleGcalAddSessions.
  ///
  /// In en, this message translates to:
  /// **'Add SPARK sessions to my calendar'**
  String get scheduleGcalAddSessions;

  /// No description provided for @scheduleGcalBusy.
  ///
  /// In en, this message translates to:
  /// **'Plan around my busy times'**
  String get scheduleGcalBusy;

  /// No description provided for @scheduleGcalDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect Google Calendar'**
  String get scheduleGcalDisconnect;

  /// No description provided for @scheduleGcalDisconnectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Disconnect Google Calendar?'**
  String get scheduleGcalDisconnectConfirm;

  /// No description provided for @scheduleGcalDisconnectBody.
  ///
  /// In en, this message translates to:
  /// **'SPARK will stop syncing and revoke its access. Your SPARK plan stays the same.'**
  String get scheduleGcalDisconnectBody;

  /// No description provided for @scheduleGcalLocked.
  ///
  /// In en, this message translates to:
  /// **'Google Calendar sync is included with Standard and Premium.'**
  String get scheduleGcalLocked;

  /// No description provided for @privacyLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get privacyLeaderboard;

  /// No description provided for @privacyCommunityVisibility.
  ///
  /// In en, this message translates to:
  /// **'Community profile visibility'**
  String get privacyCommunityVisibility;

  /// No description provided for @privacyVisibilityPrivate.
  ///
  /// In en, this message translates to:
  /// **'Only people I connect with'**
  String get privacyVisibilityPrivate;

  /// No description provided for @privacyVisibilityMembers.
  ///
  /// In en, this message translates to:
  /// **'Members with shared interests'**
  String get privacyVisibilityMembers;

  /// No description provided for @privacyLocation.
  ///
  /// In en, this message translates to:
  /// **'Location (city or region only)'**
  String get privacyLocation;

  /// No description provided for @privacyLocationBody.
  ///
  /// In en, this message translates to:
  /// **'Used only to find opportunities near you. Never precise location.'**
  String get privacyLocationBody;

  /// No description provided for @privacyCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get privacyCity;

  /// No description provided for @privacyRegion.
  ///
  /// In en, this message translates to:
  /// **'State or region'**
  String get privacyRegion;

  /// No description provided for @privacyConsents.
  ///
  /// In en, this message translates to:
  /// **'Your consents'**
  String get privacyConsents;

  /// No description provided for @privacyConsentsBody.
  ///
  /// In en, this message translates to:
  /// **'Change any of these anytime. Some features turn off without them.'**
  String get privacyConsentsBody;

  /// No description provided for @privacyConsentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use my city/region for opportunities'**
  String get privacyConsentLocation;

  /// No description provided for @privacyConsentCalendar.
  ///
  /// In en, this message translates to:
  /// **'Connect calendar data'**
  String get privacyConsentCalendar;

  /// No description provided for @privacyTeenDefaults.
  ///
  /// In en, this message translates to:
  /// **'For teens, SPARK starts with the most private settings.'**
  String get privacyTeenDefaults;

  /// No description provided for @accountEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get accountEmail;

  /// No description provided for @accountNoEmail.
  ///
  /// In en, this message translates to:
  /// **'Signed in with Apple or Google'**
  String get accountNoEmail;

  /// No description provided for @accountDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get accountDelete;

  /// No description provided for @accountDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete your account?'**
  String get accountDeleteTitle;

  /// No description provided for @accountDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your projects, plans, journal photos, scrapbooks, chats, badges and settings, disconnects Google Calendar and removes your sign-in. Subscriptions must be cancelled in your app store account.'**
  String get accountDeleteBody;

  /// No description provided for @accountDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you absolutely sure?'**
  String get accountDeleteConfirmTitle;

  /// No description provided for @accountDeleteConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Type DELETE to confirm. This can\'t be undone.'**
  String get accountDeleteConfirmBody;

  /// No description provided for @accountDeleteWord.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get accountDeleteWord;

  /// No description provided for @accountDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get accountDeleteButton;

  /// No description provided for @accountDeleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting your account…'**
  String get accountDeleting;

  /// No description provided for @helpReplayTutorial.
  ///
  /// In en, this message translates to:
  /// **'Replay the tour'**
  String get helpReplayTutorial;

  /// No description provided for @helpContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get helpContactSupport;

  /// No description provided for @helpTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get helpTerms;

  /// No description provided for @helpPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get helpPrivacyPolicy;

  /// No description provided for @helpVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String helpVersion(String version);

  /// No description provided for @helpLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open-source licenses'**
  String get helpLicenses;

  /// No description provided for @helpSupportSubject.
  ///
  /// In en, this message translates to:
  /// **'SPARK help'**
  String get helpSupportSubject;

  /// No description provided for @communityUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Community isn\'t open yet. Check back soon!'**
  String get communityUnavailable;

  /// No description provided for @communitySafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Staying safe in the SPARK community'**
  String get communitySafetyTitle;

  /// No description provided for @communitySafetyPoint1.
  ///
  /// In en, this message translates to:
  /// **'You use a pseudonym and your companion\'s picture. Never share your real name, school, address, phone number or social media.'**
  String get communitySafetyPoint1;

  /// No description provided for @communitySafetyPoint2.
  ///
  /// In en, this message translates to:
  /// **'Messages are only between people your age group who both accepted a connection. Teens can only send text.'**
  String get communitySafetyPoint2;

  /// No description provided for @communitySafetyPoint3.
  ///
  /// In en, this message translates to:
  /// **'Everything is checked for safety before it\'s shown. Report or block anyone, anytime. We review every report.'**
  String get communitySafetyPoint3;

  /// No description provided for @communitySafetyPoint4.
  ///
  /// In en, this message translates to:
  /// **'Mentors are approved adults and only talk with teens in moderated groups, never in private messages.'**
  String get communitySafetyPoint4;

  /// No description provided for @communitySafetyAgree.
  ///
  /// In en, this message translates to:
  /// **'I understand'**
  String get communitySafetyAgree;

  /// No description provided for @communitySetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your community profile'**
  String get communitySetupTitle;

  /// No description provided for @communitySetupBody.
  ///
  /// In en, this message translates to:
  /// **'Only a pseudonym, your avatar and interests are shown.'**
  String get communitySetupBody;

  /// No description provided for @communityPseudonym.
  ///
  /// In en, this message translates to:
  /// **'Pseudonym'**
  String get communityPseudonym;

  /// No description provided for @communityPseudonymHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. PixelFox'**
  String get communityPseudonymHint;

  /// No description provided for @communityInterests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get communityInterests;

  /// No description provided for @communityInterestsHint.
  ///
  /// In en, this message translates to:
  /// **'Add an interest and press enter'**
  String get communityInterestsHint;

  /// No description provided for @communityBio.
  ///
  /// In en, this message translates to:
  /// **'Short bio (optional)'**
  String get communityBio;

  /// No description provided for @communityBioWarning.
  ///
  /// In en, this message translates to:
  /// **'Please remove contact info, links or real names.'**
  String get communityBioWarning;

  /// No description provided for @communitySaveProfile.
  ///
  /// In en, this message translates to:
  /// **'Save profile'**
  String get communitySaveProfile;

  /// No description provided for @communityPeople.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get communityPeople;

  /// No description provided for @communityShowcase.
  ///
  /// In en, this message translates to:
  /// **'Showcase'**
  String get communityShowcase;

  /// No description provided for @communityGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get communityGroups;

  /// No description provided for @communityConnections.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get communityConnections;

  /// No description provided for @communityNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches yet. Add more interests to find people.'**
  String get communityNoMatches;

  /// No description provided for @communityShared.
  ///
  /// In en, this message translates to:
  /// **'Shared: {interests}'**
  String communityShared(String interests);

  /// No description provided for @communityConnect.
  ///
  /// In en, this message translates to:
  /// **'Send connection request'**
  String get communityConnect;

  /// No description provided for @communityRequested.
  ///
  /// In en, this message translates to:
  /// **'Request sent'**
  String get communityRequested;

  /// No description provided for @communityAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get communityAccept;

  /// No description provided for @communityDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get communityDecline;

  /// No description provided for @communityPending.
  ///
  /// In en, this message translates to:
  /// **'Waiting for them to accept'**
  String get communityPending;

  /// No description provided for @communityIncoming.
  ///
  /// In en, this message translates to:
  /// **'Wants to connect'**
  String get communityIncoming;

  /// No description provided for @communityOpenChat.
  ///
  /// In en, this message translates to:
  /// **'Open chat'**
  String get communityOpenChat;

  /// No description provided for @communityNoConnections.
  ///
  /// In en, this message translates to:
  /// **'No connections yet.'**
  String get communityNoConnections;

  /// No description provided for @communityShowcaseEmpty.
  ///
  /// In en, this message translates to:
  /// **'No showcases yet. Finish a milestone and share it!'**
  String get communityShowcaseEmpty;

  /// No description provided for @communityShareProject.
  ///
  /// In en, this message translates to:
  /// **'Share a showcase'**
  String get communityShareProject;

  /// No description provided for @communityPostTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get communityPostTitle;

  /// No description provided for @communityPostBody.
  ///
  /// In en, this message translates to:
  /// **'What did you make?'**
  String get communityPostBody;

  /// No description provided for @communityPostConsent.
  ///
  /// In en, this message translates to:
  /// **'I want to share this with the community.'**
  String get communityPostConsent;

  /// No description provided for @communityPostPending.
  ///
  /// In en, this message translates to:
  /// **'Thanks! It\'ll appear after a quick safety check.'**
  String get communityPostPending;

  /// No description provided for @communityPost.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get communityPost;

  /// No description provided for @communityJoinGroup.
  ///
  /// In en, this message translates to:
  /// **'Join group'**
  String get communityJoinGroup;

  /// No description provided for @communityLeaveGroup.
  ///
  /// In en, this message translates to:
  /// **'Leave group'**
  String get communityLeaveGroup;

  /// No description provided for @communityGroupEmpty.
  ///
  /// In en, this message translates to:
  /// **'No posts yet.'**
  String get communityGroupEmpty;

  /// No description provided for @communityWritePost.
  ///
  /// In en, this message translates to:
  /// **'Write something kind…'**
  String get communityWritePost;

  /// No description provided for @communityMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Message…'**
  String get communityMessageHint;

  /// No description provided for @communityMessagePending.
  ///
  /// In en, this message translates to:
  /// **'Checking…'**
  String get communityMessagePending;

  /// No description provided for @communityMessageBlocked.
  ///
  /// In en, this message translates to:
  /// **'Not sent: this message didn\'t pass the safety check.'**
  String get communityMessageBlocked;

  /// No description provided for @communityReport.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get communityReport;

  /// No description provided for @communityReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Report this?'**
  String get communityReportTitle;

  /// No description provided for @communityReportReason.
  ///
  /// In en, this message translates to:
  /// **'What\'s wrong? (optional)'**
  String get communityReportReason;

  /// No description provided for @communityReported.
  ///
  /// In en, this message translates to:
  /// **'Thanks for reporting. Our team will review it.'**
  String get communityReported;

  /// No description provided for @communityBlock.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get communityBlock;

  /// No description provided for @communityBlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Block {name}?'**
  String communityBlockTitle(String name);

  /// No description provided for @communityBlockBody.
  ///
  /// In en, this message translates to:
  /// **'They won\'t be able to see your profile or message you.'**
  String get communityBlockBody;

  /// No description provided for @communityBlocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked.'**
  String get communityBlocked;

  /// No description provided for @communityMembers.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 member} other{{count} members}}'**
  String communityMembers(int count);

  /// No description provided for @communityModerated.
  ///
  /// In en, this message translates to:
  /// **'Moderated group'**
  String get communityModerated;

  /// No description provided for @communityEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit community profile'**
  String get communityEditProfile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
