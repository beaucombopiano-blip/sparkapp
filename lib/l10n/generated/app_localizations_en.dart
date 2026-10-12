// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'SPARK';

  @override
  String get appSlogan => 'By Teens. For Teens.';

  @override
  String get commonToday => 'Today';

  @override
  String get commonTomorrow => 'Tomorrow';

  @override
  String get commonYesterday => 'Yesterday';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonNext => 'Next';

  @override
  String get commonBack => 'Back';

  @override
  String get commonDone => 'Done';

  @override
  String get commonSave => 'Save';

  @override
  String get commonSaving => 'Saving…';

  @override
  String get commonSaved => 'Saved';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonClose => 'Close';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonNotNow => 'Not now';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonOpen => 'Open';

  @override
  String get commonOpenLink => 'Open link';

  @override
  String get commonLearnMore => 'Learn more';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonOptional => 'Optional';

  @override
  String get commonOn => 'On';

  @override
  String get commonOff => 'Off';

  @override
  String get commonPremium => 'Premium';

  @override
  String get commonNew => 'New';

  @override
  String get commonMore => 'More options';

  @override
  String get commonUndo => 'Undo';

  @override
  String get commonDoneCheck => 'Done ✓';

  @override
  String get commonSomethingWrong => 'Something went wrong';

  @override
  String durationMinutes(int minutes) {
    return '${minutes}m';
  }

  @override
  String durationHours(int hours) {
    return '${hours}h';
  }

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String durationMinutesLong(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String hoursPerWeek(String hours) {
    return 'About $hours hours a week';
  }

  @override
  String get errorNetwork =>
      'You seem to be offline. Check your connection and try again.';

  @override
  String get errorTimeout => 'That took too long. Please try again.';

  @override
  String get errorUnauthenticated => 'Please sign in again to continue.';

  @override
  String get errorPermissionDenied => 'You don\'t have access to that.';

  @override
  String get errorNotFound =>
      'We couldn\'t find that. It may have been removed.';

  @override
  String get errorInvalidInput =>
      'Something in that request wasn\'t quite right. Please check and try again.';

  @override
  String get errorRateLimited =>
      'You\'ve hit today\'s limit for this. Try again later.';

  @override
  String get errorFeatureLocked => 'This feature isn\'t included in your plan.';

  @override
  String get errorConflict =>
      'Something changed in the meantime. Please refresh and try again.';

  @override
  String get errorCancelled => 'Cancelled.';

  @override
  String get errorServer =>
      'Our servers hit a snag. Please try again in a moment.';

  @override
  String get errorNotConfigured => 'This part of SPARK isn\'t set up yet.';

  @override
  String get errorUnknown => 'Something went wrong. Please try again.';

  @override
  String get offlineBanner =>
      'You\'re offline. Showing what\'s saved on this device.';

  @override
  String get notConfiguredTitle => 'SPARK isn\'t connected yet';

  @override
  String get notConfiguredBody =>
      'Firebase hasn\'t been configured for this build. Run `flutterfire configure` or pass the SPARK_FIREBASE_* values, then restart the app.';

  @override
  String get tabDashboard => 'Dashboard';

  @override
  String get tabProject => 'Project';

  @override
  String get tabJournal => 'Journal';

  @override
  String get tabProfile => 'Profile';

  @override
  String get titleAgenda => 'Agenda';

  @override
  String get titleTask => 'Task';

  @override
  String get titleTimeline => 'Timeline';

  @override
  String get titleResources => 'Resources';

  @override
  String get titleOpportunities => 'Opportunities';

  @override
  String get titleAdjustPlan => 'Adjust plan';

  @override
  String get titleJournalEntry => 'Journal entry';

  @override
  String get titleScrapbook => 'Scrapbook';

  @override
  String get titleBadges => 'Badges';

  @override
  String get titleLeaderboard => 'Leaderboard';

  @override
  String get titleReflections => 'Reflections';

  @override
  String get titleSubscription => 'Subscription';

  @override
  String get titleCommunity => 'Community';

  @override
  String get titlePastProjects => 'Past projects';

  @override
  String get titleSettings => 'Settings';

  @override
  String get titleCompanion => 'Companion';

  @override
  String get titlePlans => 'Plans';

  @override
  String get logoSemantics => 'SPARK, go to Dashboard';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get backTooltip => 'Back';

  @override
  String get companionButtonSemantics => 'Ask your companion';

  @override
  String progressSemantics(String done, String projected) {
    return 'Project $done complete, $projected projected by Sunday';
  }

  @override
  String progressSemanticsSimple(String done) {
    return 'Project $done complete';
  }

  @override
  String progressLabel(String done, String projected) {
    return '$done done · $projected by Sunday if you stick to the plan';
  }

  @override
  String progressLabelSimple(String done) {
    return '$done done';
  }

  @override
  String get priorityHigh => 'High priority';

  @override
  String get priorityMedium => 'Medium priority';

  @override
  String get priorityLow => 'Low priority';

  @override
  String get taskLocked => 'Locked until earlier tasks are done';

  @override
  String taskDueOn(String date) {
    return 'Due $date';
  }

  @override
  String taskCompleteSemantics(String title) {
    return 'Mark $title complete';
  }

  @override
  String taskDoneSemantics(String title) {
    return '$title, done';
  }

  @override
  String get taskCompleting => 'Saving…';

  @override
  String get sessionStatusScheduled => 'Scheduled';

  @override
  String get sessionStatusInProgress => 'In progress';

  @override
  String get sessionStatusCompleted => 'Completed';

  @override
  String get sessionStatusMissed => 'Missed';

  @override
  String get sessionStatusCancelled => 'Cancelled';

  @override
  String get milestoneDone => 'Milestone reached';

  @override
  String get milestoneInProgress => 'Milestone in progress';

  @override
  String get milestoneUpcoming => 'Upcoming milestone';

  @override
  String get sourceVerified => 'Verified';

  @override
  String get sourceFoundOnline => 'Found online';

  @override
  String get sourceAiSuggestion => 'AI suggestion';

  @override
  String get resourceVideo => 'Video';

  @override
  String get resourcePaper => 'Research paper';

  @override
  String get resourceArticle => 'Article';

  @override
  String get resourceTool => 'Tool';

  @override
  String get resourceCourse => 'Course';

  @override
  String resourceViews(String count) {
    return '$count views';
  }

  @override
  String resourceCitations(String count) {
    return '$count citations';
  }

  @override
  String get resourceSave => 'Save to project';

  @override
  String get resourceSaved => 'Saved to project';

  @override
  String get resourceOpenYoutube => 'Watch on YouTube';

  @override
  String get proposalConfirm => 'Confirm';

  @override
  String get proposalNotNow => 'Not now';

  @override
  String get proposalWorking => 'Making the change…';

  @override
  String get proposalDone => 'Done ✓';

  @override
  String proposalFailed(String message) {
    return 'That didn\'t work: $message';
  }

  @override
  String get proposalCancelled => 'Skipped. Nothing changed.';

  @override
  String get proposalPendingLabel => 'Proposed change';

  @override
  String get proposalWouldChange => 'This would change:';

  @override
  String get lockedSeePlans => 'See plans';

  @override
  String get celebrationContinue => 'Keep going';

  @override
  String get emptyGenericAction => 'Get started';

  @override
  String get loadingSemantics => 'Loading';

  @override
  String get agendaRescheduleUnfinished => 'Reschedule unfinished tasks';

  @override
  String get sessionStart => 'Start session';

  @override
  String get splashLoading => 'Getting your SPARK ready…';

  @override
  String get splashErrorTitle => 'We couldn\'t load your account';

  @override
  String greetingMorning(String name) {
    return 'Good morning, $name ✨';
  }

  @override
  String greetingAfternoon(String name) {
    return 'Good afternoon, $name ✨';
  }

  @override
  String greetingEvening(String name) {
    return 'Good evening, $name ✨';
  }

  @override
  String greetingMorningPlain(String name) {
    return 'Good morning, $name';
  }

  @override
  String greetingAfternoonPlain(String name) {
    return 'Good afternoon, $name';
  }

  @override
  String greetingEveningPlain(String name) {
    return 'Good evening, $name';
  }

  @override
  String get greetingSkipHint => 'Tap anywhere to skip';

  @override
  String get greetingLogoSemantics => 'The SPARK logo smiling at you';

  @override
  String get authWelcomeTitle => 'Find your spark. Build something real.';

  @override
  String get authWelcomeBody =>
      'Turn an interest into a finished project, one small step at a time.';

  @override
  String get authContinueApple => 'Continue with Apple';

  @override
  String get authContinueGoogle => 'Continue with Google';

  @override
  String get authContinueEmail => 'Continue with email';

  @override
  String get authLegal =>
      'By continuing you agree to the Terms and Privacy Policy.';

  @override
  String get authTerms => 'Terms';

  @override
  String get authPrivacy => 'Privacy Policy';

  @override
  String get authEmailTitle => 'What\'s your email?';

  @override
  String get authEmailBody =>
      'We\'ll send you a magic link. No password needed.';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailInvalid => 'That doesn\'t look like an email address.';

  @override
  String get authEmailSend => 'Send my link';

  @override
  String get authCheckInboxTitle => 'Check your inbox';

  @override
  String authCheckInboxBody(String email) {
    return 'We sent a sign-in link to $email. Open it on this device to continue.';
  }

  @override
  String authResendIn(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get authResend => 'Resend link';

  @override
  String get authResent => 'Sent! Check your inbox again.';

  @override
  String get authUseDifferentEmail => 'Use a different email';

  @override
  String get authSigningIn => 'Signing you in…';

  @override
  String get authConfirmEmailTitle => 'Confirm your email';

  @override
  String get authConfirmEmailBody =>
      'You opened the link on a different device. Enter the email you used so we can finish signing you in.';

  @override
  String get authLinkInvalid =>
      'This sign-in link has expired or was already used. Request a new one.';

  @override
  String get signupTitle => 'Let\'s set you up';

  @override
  String get signupBody =>
      'Just a couple of things so SPARK can plan around you.';

  @override
  String get signupNameLabel => 'What should we call you?';

  @override
  String get signupNameHint => 'Your first name or a nickname';

  @override
  String get signupNameRequired => 'Please add a name.';

  @override
  String get signupBirthYearLabel => 'Birth year';

  @override
  String get signupBirthYearHelp =>
      'We use this to keep SPARK age-appropriate. It\'s never shown to anyone.';

  @override
  String get signupTimezoneLabel => 'Time zone';

  @override
  String get signupTimezoneHelp =>
      'Detected automatically. Change it if it\'s wrong.';

  @override
  String get signupTimezoneSearch => 'Search time zones';

  @override
  String get signupSubmit => 'Continue';

  @override
  String get signupUnderageTitle => 'SPARK is for ages 13 and up';

  @override
  String get signupUnderageBody =>
      'Thanks so much for your interest! SPARK isn\'t available for people under 13 yet, so we didn\'t create an account. We\'d love to see you back when you\'re 13.';

  @override
  String get signupUnderageOk => 'Okay';

  @override
  String get signOut => 'Sign out';

  @override
  String onboardingStepSemantics(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String onboardingWelcomeTitle(String name) {
    return 'Hi $name! Let\'s find your spark.';
  }

  @override
  String get onboardingWelcomeBody =>
      'In a few minutes you\'ll have a project you care about and a plan that fits your life. One thing at a time, promise.';

  @override
  String get onboardingWelcomeCta => 'Let\'s go';

  @override
  String get pathChoiceTitle => 'Where are you starting?';

  @override
  String get pathChoiceBody => 'Both paths end with a real project and a plan.';

  @override
  String get pathHasIdeaTitle => 'I already have an idea';

  @override
  String get pathHasIdeaBody =>
      'Tell me about it and I\'ll ask a few questions to shape it.';

  @override
  String get pathFindIdeaTitle => 'Help me find an idea';

  @override
  String get pathFindIdeaBody =>
      'Answer quick questions and get project ideas made for you.';

  @override
  String get interviewTitle => 'Tell me about your idea';

  @override
  String get interviewIntro =>
      'What do you want to make, start or explore? A sentence or two is plenty.';

  @override
  String get interviewHint => 'Type your answer…';

  @override
  String get interviewSend => 'Send';

  @override
  String get interviewTyping => 'Thinking…';

  @override
  String get interviewSoFar => 'Your project so far';

  @override
  String get interviewGuessed => 'We guessed this, tap to edit';

  @override
  String get interviewReview => 'Review my project';

  @override
  String get interviewReviewTitle => 'Here\'s your project';

  @override
  String get interviewReviewBody =>
      'Change anything that doesn\'t sound right. You can edit it later too.';

  @override
  String get interviewConfirm => 'Confirm project';

  @override
  String interviewEditField(String field) {
    return 'Edit $field';
  }

  @override
  String get interviewEmptyField => 'Not answered yet';

  @override
  String get interviewYou => 'You';

  @override
  String get fieldTitle => 'Project name';

  @override
  String get fieldGoal => 'Goal';

  @override
  String get fieldMotivation => 'Why it matters';

  @override
  String get fieldAudience => 'Who it\'s for';

  @override
  String get fieldScale => 'Scale';

  @override
  String get fieldSuccess => 'What success looks like';

  @override
  String get fieldFinishDate => 'Finish by';

  @override
  String get fieldSkills => 'Skills and resources';

  @override
  String get fieldConstraints => 'Constraints';

  @override
  String get fieldProjectType => 'Project type';

  @override
  String get scaleSmall => 'Small';

  @override
  String get scaleMedium => 'Medium';

  @override
  String get scaleLarge => 'Large';

  @override
  String assessmentProgress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get assessmentSaveExit => 'Save and exit';

  @override
  String get likertStronglyDisagree => 'Strongly disagree';

  @override
  String get likertDisagree => 'Disagree';

  @override
  String get likertNeutral => 'Not sure';

  @override
  String get likertAgree => 'Agree';

  @override
  String get likertStronglyAgree => 'Strongly agree';

  @override
  String get assessmentPausedTitle => 'Your answers are saved';

  @override
  String get assessmentPausedBody =>
      'Take a break. When you come back you\'ll pick up right where you left off.';

  @override
  String get assessmentResume => 'Keep going';

  @override
  String get assessmentFinishing => 'Finding your matches…';

  @override
  String get recommendationsTitle => 'Ideas picked for you';

  @override
  String get recommendationsBody =>
      'Tap one to see more. There\'s no wrong choice.';

  @override
  String get recommendationsLoading1 => 'Looking at what lights you up…';

  @override
  String get recommendationsLoading2 => 'Mixing your interests together…';

  @override
  String get recommendationsLoading3 =>
      'Finding niche ideas you can actually finish…';

  @override
  String get recommendationsLoading4 => 'Almost there…';

  @override
  String get recommendationsMore => 'Generate more ideas';

  @override
  String get recommendationsMoreLoading => 'Coming up with more ideas…';

  @override
  String get recommendationsEmpty => 'No ideas yet';

  @override
  String get difficultyStarter => 'Starter';

  @override
  String get difficultyStretch => 'Stretch';

  @override
  String get difficultyAmbitious => 'Ambitious';

  @override
  String recommendationHours(int hours) {
    return 'About $hours hours';
  }

  @override
  String get recommendationWhy => 'Why it matches you';

  @override
  String get recommendationCreate => 'What you\'ll create';

  @override
  String get recommendationFirstStep => 'Suggested first step';

  @override
  String get recommendationAudience => 'Who it helps';

  @override
  String get recommendationParentNote => 'Heads up';

  @override
  String get recommendationChoose => 'Choose this project';

  @override
  String recommendationMatch(String percent) {
    return '$percent match';
  }

  @override
  String get projectPickedTitle => 'You picked your project!';

  @override
  String projectPickedBody(String title) {
    return '\"$title\" is officially yours. Let\'s make a plan that fits your life.';
  }

  @override
  String get deadlineTitle => 'When do you want to finish?';

  @override
  String get deadlineBody =>
      'Pick a date at least a week away. You can change it later.';

  @override
  String get deadlinePick => 'Pick a date';

  @override
  String get deadlineOneMonth => '1 month';

  @override
  String get deadlineThreeMonths => '3 months';

  @override
  String get deadlineSixMonths => '6 months';

  @override
  String get deadlineSchoolYear => 'End of school year';

  @override
  String deadlineSelected(String date) {
    return 'Finish by $date';
  }

  @override
  String get deadlineTooSoon => 'Pick a date at least 7 days from today.';

  @override
  String get availabilityTitle => 'When can you work on it?';

  @override
  String get availabilityBody =>
      'Pick the days and times that usually work. SPARK plans around them.';

  @override
  String get availabilityAddTime => 'Add a time';

  @override
  String get availabilityStart => 'Starts';

  @override
  String get availabilitySessionLength => 'Session length';

  @override
  String get availabilityRemoveTime => 'Remove this time';

  @override
  String get availabilityNone => 'Pick at least one day and time.';

  @override
  String get availabilitySummaryNone => 'No time picked yet';

  @override
  String availabilitySlotLabel(String time, String duration) {
    return '$time for $duration';
  }

  @override
  String get characterTitle => 'Pick your companion';

  @override
  String get characterBody =>
      'They\'ll cheer you on, remind you and help when you\'re stuck.';

  @override
  String get characterPreview => 'How they\'d sound';

  @override
  String get characterLocked => 'Included with Premium';

  @override
  String get notificationsTitle => 'How should we nudge you?';

  @override
  String get notificationsBody =>
      'Everything is on to start. Turn off anything you don\'t want.';

  @override
  String get notifDailyQuote => 'Daily quote';

  @override
  String get notifDailyQuoteBody => 'A short boost each morning.';

  @override
  String get notifSessionReminder => 'Work session reminders';

  @override
  String notifSessionReminderBody(int minutes) {
    return '$minutes minutes before each session.';
  }

  @override
  String get notifTaskReminders => 'Task and deadline reminders';

  @override
  String get notifTaskRemindersBody => 'So nothing sneaks up on you.';

  @override
  String get notifWeeklyCheckin => 'Weekly check-in';

  @override
  String get notifWeeklyCheckinBody => 'Sunday evening, about a minute long.';

  @override
  String get notifMonthlyReflection => 'Monthly reflection';

  @override
  String get notifMonthlyReflectionBody =>
      'Look back at what you built this month.';

  @override
  String get notifCelebrations => 'Celebrations';

  @override
  String get notifCelebrationsBody => 'Badges, streaks and milestones.';

  @override
  String get notifQuietHours => 'Quiet hours';

  @override
  String get notifQuietHoursBody => 'No notifications between these times.';

  @override
  String get notifQuietFrom => 'From';

  @override
  String get notifQuietTo => 'To';

  @override
  String get notifTurnOn => 'Turn on notifications';

  @override
  String get notifNotNow => 'Maybe later';

  @override
  String get notifDeniedNote =>
      'No problem. You can turn notifications on anytime in Settings.';

  @override
  String get appearanceTitle => 'Light or dark?';

  @override
  String get appearanceBody => 'You can switch anytime in Settings.';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get appearanceSystem => 'Match my phone';

  @override
  String get appearancePreviewTask => 'Sketch the cover';

  @override
  String get planBuilding => 'Building your plan step by step…';

  @override
  String get planBuilding2 => 'Breaking your project into small steps…';

  @override
  String get planBuilding3 => 'Fitting the work into your week…';

  @override
  String get planBuilding4 => 'Adding milestones to celebrate…';

  @override
  String get planNotFeasibleTitle => 'Your plan needs a little more room';

  @override
  String get planNotFeasibleBody =>
      'With the time you have before your deadline, the whole project won\'t fit. Pick what feels right:';

  @override
  String planOptionMoveDeadline(String date) {
    return 'Move the deadline to $date';
  }

  @override
  String get planOptionMoveDeadlineBody => 'Same project, a little more time.';

  @override
  String planOptionAddTime(int minutes) {
    return 'Add about $minutes minutes a week';
  }

  @override
  String get planOptionAddTimeBody =>
      'Add more availability and keep your deadline.';

  @override
  String get planOptionTrimScope => 'Trim the scope';

  @override
  String get planOptionTrimScopeBody => 'Skip these parts for now:';

  @override
  String get planRegenerate => 'Make my plan';

  @override
  String get planReadyTitle => 'Your plan is ready!';

  @override
  String planReadyBody(int tasks, int phases) {
    return '$tasks tasks across $phases phases. Let\'s take the first step.';
  }

  @override
  String get planLetsGo => 'Let\'s get started';

  @override
  String get planPreviewTitle => 'Your plan preview';

  @override
  String get planPreviewFirstTasks => 'Your first tasks';

  @override
  String planPreviewMore(int count) {
    return '+$count more tasks with a full plan';
  }

  @override
  String get planContinueBasic => 'Continue with Basic';

  @override
  String get tutorialNext => 'Next';

  @override
  String get tutorialSkip => 'Skip tour';

  @override
  String get tutorialDone => 'Got it!';

  @override
  String get tutorialTabsTitle => 'Your four home bases';

  @override
  String get tutorialTabsBody =>
      'Dashboard for today, Project for your plan, Journal for your story, Profile for your wins.';

  @override
  String get tutorialProgressTitle => 'Your progress bar';

  @override
  String get tutorialProgressBody =>
      'The solid part is done. The striped part is where you\'ll be by Sunday if you stick to the plan.';

  @override
  String get tutorialChecklistTitle => 'Your next 5 tasks';

  @override
  String get tutorialChecklistBody =>
      'Small, clear steps. Check one off and watch your progress move.';

  @override
  String get tutorialCalendarTitle => 'Your calendar';

  @override
  String get tutorialCalendarBody =>
      'Dots are work sessions, diamonds are milestones. Tap a day to see its agenda.';

  @override
  String get tutorialCompanionTitle => 'Your companion';

  @override
  String get tutorialCompanionBody =>
      'Stuck or behind? Ask anything. It already knows your project.';

  @override
  String get tutorialJournalTitle => 'Your journal';

  @override
  String get tutorialJournalBody =>
      'Snap photos as you go. They become your project\'s story.';

  @override
  String get tutorialSettingsTitle => 'Settings';

  @override
  String get tutorialSettingsBody =>
      'Colors, notifications, schedule and more live behind the gear.';

  @override
  String planReadyBodyTasks(int tasks) {
    return '$tasks small tasks, ready when you are. Let\'s take the first step.';
  }

  @override
  String get adLabel => 'Ad';

  @override
  String get settingsReminderLead => 'Remind me before sessions';

  @override
  String get settingsMaxPerDay => 'Most notifications per day';

  @override
  String settingsMaxPerDayValue(int count) {
    return 'Up to $count a day';
  }

  @override
  String get celebrateMilestoneTitle => 'Milestone reached! 🎉';

  @override
  String get celebrateBadgeTitle => 'You earned a badge!';

  @override
  String get celebrateProjectCompleteTitle => 'You finished your project!';

  @override
  String get celebrateProjectCompleteBody =>
      'From an idea to something real. That\'s huge. Your scrapbook is being made.';

  @override
  String changeMove(String title, String from, String to) {
    return 'Move \"$title\" from $from to $to';
  }

  @override
  String changeMoveTo(String title, String to) {
    return 'Move \"$title\" to $to';
  }

  @override
  String changeAdd(String title) {
    return 'Add \"$title\"';
  }

  @override
  String changeRemove(String title) {
    return 'Set aside \"$title\" (your finished work is kept)';
  }

  @override
  String changeDeadline(String date) {
    return 'New deadline: $date';
  }

  @override
  String get proposalChooseOption => 'This no longer fits your time. Pick one:';

  @override
  String get proposalDefaultTitle => 'A new plan that fits your time';

  @override
  String get proposalSheetTitle => 'Review the change';

  @override
  String get journalPromptTitle => 'Nice work! ✨';

  @override
  String get journalPromptBody => 'Add a photo to your journal?';

  @override
  String get journalPromptAdd => 'Add photo';

  @override
  String get taskCompletedSnack => 'Task done!';

  @override
  String get taskUndone => 'Task marked as not done.';

  @override
  String get dashboardProjectCardSemantics => 'Open your project';

  @override
  String dashboardCurrentMilestone(String milestone) {
    return 'Now: $milestone';
  }

  @override
  String get dashboardNextSession => 'Next work session';

  @override
  String get dashboardNextSessionNone => 'No sessions coming up';

  @override
  String get dashboardNextSessionNoneBody =>
      'Your schedule is clear. Add availability to plan more work.';

  @override
  String dashboardFirstTask(String title) {
    return 'First up: $title';
  }

  @override
  String get dashboardTodaysTasks => 'Today\'s tasks';

  @override
  String get dashboardNoTasks => 'All caught up!';

  @override
  String get dashboardNoTasksBody =>
      'No tasks waiting right now. Enjoy it or peek at what\'s next.';

  @override
  String get dashboardSeeAgenda => 'See what\'s next';

  @override
  String streakDaily(int count) {
    return '$count-day streak';
  }

  @override
  String streakWeekly(int count) {
    return '$count-week streak';
  }

  @override
  String streakSemantics(int daily, int weekly) {
    return 'Streaks: $daily days, $weekly weeks. Open badges.';
  }

  @override
  String companionCardTitle(String name) {
    return 'Ask $name anything about your project';
  }

  @override
  String get companionCardTitleDefault =>
      'Ask your companion anything about your project';

  @override
  String get companionPromptToday => 'What should I work on today?';

  @override
  String get companionPromptStuck => 'I\'m stuck';

  @override
  String get companionPromptBehind => 'I\'m behind this week';

  @override
  String get bannerProposal =>
      'You missed a session. Here\'s a new plan that fits your time.';

  @override
  String get bannerProposalGeneric =>
      'There\'s a schedule change waiting for you.';

  @override
  String get bannerProposalAction => 'Review';

  @override
  String get bannerCheckin =>
      'Your weekly check-in is ready. It takes about a minute.';

  @override
  String get bannerCheckinAction => 'Check in';

  @override
  String get bannerReflection => 'Time for your monthly reflection.';

  @override
  String get bannerReflectionAction => 'Reflect';

  @override
  String get bannerAtRisk =>
      'Your schedule is at risk of missing the deadline.';

  @override
  String get bannerAtRiskAction => 'Adjust plan';

  @override
  String get bannerDowngrade =>
      'Your plan changed. Your work is safe, some features are locked.';

  @override
  String get bannerDowngradeAction => 'Details';

  @override
  String get dashboardEmptyTitle => 'Let\'s find your spark';

  @override
  String get dashboardEmptyBody =>
      'Pick a new project and SPARK will plan it with you.';

  @override
  String get dashboardEmptyAction => 'Start a project';

  @override
  String dashboardDate(String date) {
    return '$date';
  }

  @override
  String sessionWhen(String day, String time) {
    return '$day · $time';
  }

  @override
  String get calendarPrevious => 'Previous';

  @override
  String get calendarNext => 'Next';

  @override
  String get calendarExpand => 'Show the whole month';

  @override
  String calendarSessions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count work sessions',
      one: '1 work session',
    );
    return '$_temp0';
  }

  @override
  String get calendarAllDone => 'all sessions done';

  @override
  String get calendarMissed => 'missed session';

  @override
  String get calendarMilestone => 'milestone target';

  @override
  String get calendarDeadline => 'project deadline';

  @override
  String get calendarLegendSession => 'Work session';

  @override
  String get calendarLegendMilestone => 'Milestone';

  @override
  String get calendarLegendDeadline => 'Deadline';

  @override
  String get calendarLegendMissed => 'Missed';

  @override
  String get projectViewAgenda => 'View agenda';

  @override
  String get projectNoPlanTitle => 'No plan yet';

  @override
  String get projectNoPlanBody =>
      'Once your plan is ready, your calendar and tasks show up here.';

  @override
  String projectDates(String start, String end) {
    return '$start → $end';
  }

  @override
  String projectDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days left',
      one: '1 day left',
      zero: 'Due today',
    );
    return '$_temp0';
  }

  @override
  String get projectOnTrack => 'On track';

  @override
  String get projectAtRisk => 'At risk';

  @override
  String projectPhase(String phase) {
    return 'Phase: $phase';
  }

  @override
  String get projectProgress => 'Progress';

  @override
  String projectTimeSummary(String done, String left) {
    return '$done done · $left to go';
  }

  @override
  String get projectCurrentTasks => 'Current tasks';

  @override
  String get projectTimelinePreview => 'Timeline';

  @override
  String get projectOpenTimeline => 'Open full timeline';

  @override
  String get projectHelpSection => 'Resources and help';

  @override
  String get projectAskCompanion => 'Ask your companion';

  @override
  String projectSavedResources(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saved resources',
      one: '1 saved resource',
      zero: 'No saved resources yet',
    );
    return '$_temp0';
  }

  @override
  String get projectBrowseResources => 'Browse resources';

  @override
  String get projectOpportunities => 'Opportunities near you';

  @override
  String get projectPlanActions => 'Plan actions';

  @override
  String get planActionAdjust => 'Adjust plan';

  @override
  String get planActionAvailability => 'Edit availability';

  @override
  String get planActionDeadline => 'Change deadline';

  @override
  String get planActionRegenerate => 'Regenerate future tasks';

  @override
  String get planActionsNote =>
      'You\'ll see a preview of every change first. Finished work is always kept.';

  @override
  String get previewLockedTitle => 'Unlock your full plan';

  @override
  String get previewLockedBody =>
      'See every task, your calendar and checklists with Standard or Premium.';

  @override
  String get timelineDone => 'Done';

  @override
  String get timelineInProgress => 'In progress';

  @override
  String get timelineUpcoming => 'Upcoming';

  @override
  String get timelineStart => 'Start';

  @override
  String get timelineTarget => 'Target';

  @override
  String get timelineUpcomingDeadlines => 'Upcoming deadlines';

  @override
  String get timelineWork => 'Work';

  @override
  String get timelineEstimated => 'Estimated progress';

  @override
  String get timelineEmpty =>
      'Your timeline will appear once your plan is ready.';

  @override
  String get lockedResourcesBenefit =>
      'Get videos, guides, opportunities and an AI companion who knows your project.';

  @override
  String get resourceProjectTypeFallback => 'project';

  @override
  String get agendaDay => 'Day';

  @override
  String get agendaWeek => 'Week';

  @override
  String get agendaMonth => 'Month';

  @override
  String get agendaPrevious => 'Previous';

  @override
  String get agendaNext => 'Next';

  @override
  String get agendaEmptyDay => 'No work planned. Enjoy your day!';

  @override
  String get agendaOtherTasks => 'Also planned';

  @override
  String agendaMilestoneItem(String title) {
    return 'Milestone: $title';
  }

  @override
  String get agendaDeadlineItem => 'Project deadline';

  @override
  String agendaWeekTotals(int done, int total, String planned) {
    return '$done of $total tasks done · $planned planned';
  }

  @override
  String agendaWeekRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String agendaMonthDaySummary(int sessions, int tasks) {
    String _temp0 = intl.Intl.pluralLogic(
      sessions,
      locale: localeName,
      other: '$sessions sessions',
      one: '1 session',
      zero: '',
    );
    String _temp1 = intl.Intl.pluralLogic(
      tasks,
      locale: localeName,
      other: ' · $tasks tasks',
      one: ' · 1 task',
      zero: '',
    );
    return '$_temp0$_temp1';
  }

  @override
  String get agendaMonthEmpty => 'Nothing planned this month.';

  @override
  String get agendaMoveDay => 'Move to another day';

  @override
  String get agendaFindTime => 'Find a new time for this';

  @override
  String get agendaOpenTask => 'Open task';

  @override
  String get agendaDayFull => 'That day is already full';

  @override
  String agendaDayFullBody(String day, String planned, String available) {
    return '$day has $planned planned out of $available available. Pick another day or let SPARK find a time.';
  }

  @override
  String get agendaFinding => 'Finding a time that fits…';

  @override
  String agendaGcalSynced(String time) {
    return 'Synced to Google Calendar · $time';
  }

  @override
  String get agendaGcalNever => 'Synced to Google Calendar';

  @override
  String agendaGcalError(String message) {
    return 'Google Calendar sync problem: $message';
  }

  @override
  String get agendaGcalSyncing => 'Syncing with Google Calendar…';

  @override
  String get agendaNoAvailability => 'You haven\'t set any available days yet.';

  @override
  String get agendaMissedTag => 'Missed';

  @override
  String get taskDoneWhen => 'You\'re done when…';

  @override
  String get taskEstimate => 'Estimated time';

  @override
  String get taskPriority => 'Priority';

  @override
  String get taskPrerequisites => 'Do these first';

  @override
  String get taskPrereqDone => 'Done';

  @override
  String get taskPrereqPending => 'Not done yet';

  @override
  String get taskSuggestedDate => 'Planned for';

  @override
  String get taskSession => 'Work session';

  @override
  String get taskMilestone => 'Milestone';

  @override
  String get taskMarkComplete => 'Mark complete';

  @override
  String get taskStartFocus => 'Start focus session';

  @override
  String get taskAskCompanion => 'Ask companion about this task';

  @override
  String get taskReschedule => 'Reschedule';

  @override
  String get taskAddJournal => 'Add journal entry';

  @override
  String get taskUndo => 'Mark as not done';

  @override
  String get taskNotFound => 'This task isn\'t in your current plan anymore.';

  @override
  String get taskStatusDone => 'Done';

  @override
  String get taskStatusObsolete => 'Set aside after a plan change';

  @override
  String get taskStatusSkipped => 'Skipped';

  @override
  String get taskNoDescription => 'No extra details for this one.';

  @override
  String get adjustIntro =>
      'Every change shows you a preview first. Finished tasks and journal entries are never deleted.';

  @override
  String get adjustWhatChange => 'What would you like to change?';

  @override
  String get adjustWhatChangeHint =>
      'e.g. \"Make it a 10-page zine instead of 20\" or \"Add a launch event\"';

  @override
  String get adjustKindScope => 'Change the scope';

  @override
  String get adjustKindGoal => 'New goal';

  @override
  String get adjustPreview => 'Preview changes';

  @override
  String adjustCurrentDeadline(String date) {
    return 'Current deadline: $date';
  }

  @override
  String get adjustNewDeadline => 'New deadline';

  @override
  String get adjustPickDeadline => 'Pick a new deadline';

  @override
  String get adjustRegenerateBody =>
      'SPARK will rebuild your upcoming tasks around your current progress and availability. Completed work stays exactly as it is.';

  @override
  String get adjustAvailabilitySaved =>
      'Availability saved. Your plan already fits.';

  @override
  String get adjustSaveAvailability => 'Save availability';

  @override
  String get adjustLoadingPreview => 'Working out what would change…';

  @override
  String get focusTitle => 'Focus mode';

  @override
  String get focusCurrentTask => 'Now working on';

  @override
  String get focusDoneWithTask => 'Done with this task';

  @override
  String get focusPause => 'Pause';

  @override
  String get focusResume => 'Resume';

  @override
  String focusTimerSemantics(String time) {
    return '$time left in this session';
  }

  @override
  String get focusTimeUp => 'Time\'s up! Great focus.';

  @override
  String get focusAskCompanion => 'Ask companion';

  @override
  String get focusEnd => 'End session';

  @override
  String get focusEndConfirmTitle => 'End this session?';

  @override
  String get focusEndConfirmBody =>
      'Your progress is saved. Anything unfinished stays on your list.';

  @override
  String get focusAllDone => 'Every task in this session is done!';

  @override
  String focusUpNext(String title) {
    return 'Up next: $title';
  }

  @override
  String get focusSummaryTitle => 'Session complete';

  @override
  String focusSummaryTasks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You finished $count tasks.',
      one: 'You finished 1 task.',
      zero: 'No tasks checked off this time, and that\'s okay.',
    );
    return '$_temp0';
  }

  @override
  String focusSummaryTime(String time) {
    return 'You focused for $time.';
  }

  @override
  String get focusFinish => 'Finish';

  @override
  String get focusNotFound =>
      'We couldn\'t find this session. It may have been rescheduled.';

  @override
  String get focusClose => 'Close focus mode';

  @override
  String companionKnows(String title) {
    return 'Knows your project: $title';
  }

  @override
  String get companionKnowsTitle => 'What your companion knows';

  @override
  String get companionKnowsBody =>
      'It reads your plan and progress directly, so you never have to paste project details.';

  @override
  String get companionKnowsProject => 'Project';

  @override
  String get companionKnowsPhase => 'Current phase';

  @override
  String get companionKnowsMilestone => 'Current milestone';

  @override
  String get companionKnowsTasks => 'Next tasks';

  @override
  String get companionKnowsDeadline => 'Deadline';

  @override
  String get companionHistory => 'Past chats';

  @override
  String get companionNewChat => 'New chat';

  @override
  String get companionNoHistory => 'No past chats yet.';

  @override
  String get companionHint => 'Ask anything about your project…';

  @override
  String get companionStop => 'Stop';

  @override
  String get companionStopped => 'Stopped';

  @override
  String companionHelpingWith(String title) {
    return 'Helping with: $title';
  }

  @override
  String get companionEmptyTitle => 'Hi! What can I help with?';

  @override
  String get companionEmptyBody =>
      'I know your plan, your progress and what\'s coming up.';

  @override
  String get companionPromptStart => 'Help me start my next task';

  @override
  String get companionPromptResources => 'Find me a good tutorial';

  @override
  String get companionPromptShare => 'How can I share my project?';

  @override
  String get companionToolWorking => 'Checking your project…';

  @override
  String get companionToolTasks => 'Checking your tasks…';

  @override
  String get companionToolCalendar => 'Looking at your calendar…';

  @override
  String get companionToolProgress => 'Checking your progress…';

  @override
  String get companionToolSearch => 'Searching for resources…';

  @override
  String get companionToolOpportunities => 'Looking for opportunities…';

  @override
  String get companionCrisisTitle => 'You\'re not alone';

  @override
  String get companionCrisisBody =>
      'If you\'re in danger or thinking about hurting yourself, please reach out right now. Talking to a trusted adult can help too.';

  @override
  String get companionCrisisCall => 'Call 988';

  @override
  String get companionCrisisText => 'Text 988';

  @override
  String get companionCrisisLine => '988 Suicide & Crisis Lifeline (US)';

  @override
  String get companionLocked => 'Your AI companion is part of Premium.';

  @override
  String get companionYou => 'You';

  @override
  String get companionSaveOpportunity => 'Save to project';

  @override
  String opportunityDeadline(String date) {
    return 'Deadline: $date';
  }

  @override
  String get opportunityRemote => 'Remote';

  @override
  String opportunityEligibility(String text) {
    return 'Who can apply: $text';
  }

  @override
  String get opportunityAiNote =>
      'This is an idea to look into, not a specific listing.';

  @override
  String get resourcesFindTab => 'Find';

  @override
  String get resourcesSavedTab => 'Saved';

  @override
  String get resourcesSearchHint => 'What do you need help with?';

  @override
  String get resourcesSearch => 'Search';

  @override
  String get resourcesCategories => 'Browse by topic';

  @override
  String get resourcesVideos => 'Videos';

  @override
  String get resourcesArticles => 'Articles and guides';

  @override
  String get resourcesPapers => 'Research papers';

  @override
  String get resourcesTools => 'Tools';

  @override
  String get resourcesAskCompanion => 'Ask the companion instead';

  @override
  String get resourcesSearching => 'Finding real, working resources…';

  @override
  String get resourcesNoResults =>
      'Nothing solid came up for that. Try different words or ask your companion.';

  @override
  String get resourcesSavedEmpty =>
      'Save videos, guides and papers here so they\'re easy to find.';

  @override
  String get resourcesNote => 'Note';

  @override
  String get resourcesAddNote => 'Add a note';

  @override
  String get resourcesEditNote => 'Edit note';

  @override
  String get resourcesRemoveConfirm => 'Remove this from your saved resources?';

  @override
  String get resourcesLocked =>
      'The Resource Center is part of Premium: real videos, guides and research picked for your project.';

  @override
  String get opportunitiesIntro =>
      'Find competitions, programs and groups. Type a city or region, or look for remote options.';

  @override
  String get opportunitiesLocationHint => 'City or region (optional)';

  @override
  String get opportunitiesUseSaved => 'Use my saved location';

  @override
  String get opportunitiesRemoteOnly => 'Remote only';

  @override
  String get opportunitiesSearch => 'Find opportunities';

  @override
  String get opportunitiesSearching => 'Looking for real opportunities…';

  @override
  String get opportunitiesEmpty =>
      'Nothing came up. Try a nearby city or include remote options.';

  @override
  String get opportunitiesStrategies => 'Ways to find more';

  @override
  String get opportunitiesTemplate => 'Outreach email you can personalize';

  @override
  String get opportunitiesCopyTemplate => 'Copy template';

  @override
  String get opportunitiesCopied => 'Copied to clipboard';

  @override
  String get opportunitiesLocked => 'Opportunities are part of Premium.';

  @override
  String get oppTypeCompetition => 'Competitions';

  @override
  String get oppTypeGrant => 'Grants';

  @override
  String get oppTypeInternship => 'Internships';

  @override
  String get oppTypeWorkshop => 'Workshops';

  @override
  String get oppTypeShowcase => 'Showcases';

  @override
  String get oppTypeMentorship => 'Mentorship';

  @override
  String get oppTypeResearch => 'Research programs';

  @override
  String get oppTypeCommunity => 'Community orgs';

  @override
  String get journalAddEntry => 'Add to journal';

  @override
  String get journalCamera => 'Take a photo';

  @override
  String get journalLibrary => 'Choose from photos';

  @override
  String get journalFile => 'Upload a PDF';

  @override
  String get journalCaption => 'Caption';

  @override
  String get journalCaptionHint => 'What did you make or learn?';

  @override
  String get journalUpload => 'Add to journal';

  @override
  String journalUploading(String percent) {
    return 'Uploading… $percent';
  }

  @override
  String get journalPreparing => 'Getting your file ready…';

  @override
  String get journalAdded => 'Added to your journal!';

  @override
  String get journalTooBigImage =>
      'That photo is too big (max 10 MB). Try a different one.';

  @override
  String get journalTooBigPdf => 'That PDF is too big (max 15 MB).';

  @override
  String get journalUnsupported =>
      'SPARK can add photos (JPG, PNG, WebP, HEIC) and PDFs.';

  @override
  String get journalProcessing => 'Processing…';

  @override
  String get journalFailed => 'This upload didn\'t work. Try adding it again.';

  @override
  String get journalNewestFirst => 'Newest first';

  @override
  String get journalOldestFirst => 'Oldest first';

  @override
  String get journalEmpty =>
      'Finish a task and snap a photo to start your story.';

  @override
  String journalMilestoneMarker(String title) {
    return 'Milestone reached: $title';
  }

  @override
  String journalBadgeMarker(String title) {
    return 'Badge earned: $title';
  }

  @override
  String journalLinkedTask(String title) {
    return 'From: $title';
  }

  @override
  String get journalScrapbooks => 'Scrapbooks';

  @override
  String get journalScrapbookCompiling => 'Being made…';

  @override
  String get journalMakeYearInReview => 'Make my year in review';

  @override
  String get journalScrapbookRequested =>
      'Your scrapbook is being made. It\'ll show up here when it\'s ready.';

  @override
  String get journalScrapbookLocked => 'Scrapbooks are part of Premium.';

  @override
  String get journalLocked => 'Your progress journal is part of Premium.';

  @override
  String get journalEntryNotFound => 'This entry isn\'t available anymore.';

  @override
  String get journalDelete => 'Delete entry';

  @override
  String get journalDeleteConfirm => 'Delete this journal entry?';

  @override
  String get journalDeleteBody =>
      'The photo or file is removed for good. This can\'t be undone.';

  @override
  String get journalCaptionSaved => 'Caption saved';

  @override
  String get journalPdf => 'PDF';

  @override
  String journalImageSemantics(String caption) {
    return 'Journal photo: $caption';
  }

  @override
  String get journalSelectEntry => 'Pick an entry to see it here.';

  @override
  String get scrapbookNarrative => 'Your story';

  @override
  String get scrapbookHighlights => 'Highlights';

  @override
  String scrapbookYearTitle(int year) {
    return '$year in review';
  }

  @override
  String get scrapbookNoScreenshotNote => 'Scrapbooks stay inside SPARK.';

  @override
  String get scrapbookFailed =>
      'We couldn\'t make this scrapbook. Please try again later.';

  @override
  String scrapbookPage(int current, int total) {
    return 'Page $current of $total';
  }

  @override
  String profileMemberSince(String date) {
    return 'Member since $date';
  }

  @override
  String get profileChangeCharacter => 'Change your companion';

  @override
  String get profileStatsTitle => 'Your wins';

  @override
  String get profileStatTasks => 'Tasks done';

  @override
  String get profileStatHours => 'Hours of work';

  @override
  String get profileStatStreak => 'Day streak';

  @override
  String get profileStatWeekStreak => 'Week streak';

  @override
  String get profileStatMilestones => 'Milestones';

  @override
  String profileHoursValue(String hours) {
    return '$hours';
  }

  @override
  String get profileBadges => 'Badges';

  @override
  String profilePoints(int points) {
    return '$points points';
  }

  @override
  String get profileChallenges => 'Challenges';

  @override
  String get profileChallengeJoin => 'Join';

  @override
  String get profileChallengeJoined => 'Joined';

  @override
  String profileChallengeEnds(String date) {
    return 'Ends $date';
  }

  @override
  String profileChallengeProgress(String percent) {
    return '$percent complete';
  }

  @override
  String get profileNoChallenges => 'No challenges right now. Check back soon!';

  @override
  String get profileLeaderboard => 'Leaderboard';

  @override
  String get profileLeaderboardOff => 'Off. Only you see your points.';

  @override
  String get profileLeaderboardOn => 'On, with your pseudonym';

  @override
  String get profileReflections => 'Reflections and check-ins';

  @override
  String get profilePastProjects => 'Past projects';

  @override
  String get profileSubscription => 'Subscription';

  @override
  String get profileCommunity => 'Community';

  @override
  String get planNameLaunch => 'Premium (launch access)';

  @override
  String get planNameBasic => 'Basic';

  @override
  String get planNameStandard => 'Standard';

  @override
  String get planNamePremium => 'Premium';

  @override
  String badgesEarned(String date) {
    return 'Earned $date';
  }

  @override
  String get badgesLocked => 'Not earned yet';

  @override
  String badgesHowTo(String text) {
    return 'How to earn: $text';
  }

  @override
  String get badgesEmpty => 'Badges will appear here as you make progress.';

  @override
  String get leaderboardTitle => 'Weekly leaderboard';

  @override
  String get leaderboardOptIn => 'Show me on the leaderboard';

  @override
  String get leaderboardPrivacy =>
      'If you join, others see only your pseudonym, your companion\'s picture and your weekly points. Never your name, school, location or project details. You can leave anytime.';

  @override
  String get leaderboardTeen => 'Teen board';

  @override
  String get leaderboardAdult => 'Adult board';

  @override
  String get leaderboardEmpty =>
      'This week\'s board isn\'t ready yet. Points from consistent work count most!';

  @override
  String leaderboardPoints(int points) {
    return '$points pts';
  }

  @override
  String leaderboardRank(int rank) {
    return 'Rank $rank';
  }

  @override
  String get leaderboardOffBody =>
      'The leaderboard is optional and off by default.';

  @override
  String get reflectionsTitle => 'Your reflections';

  @override
  String get reflectionsCheckins => 'Weekly check-ins';

  @override
  String get reflectionsMonthly => 'Monthly reflections';

  @override
  String get reflectionsEmpty =>
      'Nothing here yet. Your check-ins and reflections will show up here.';

  @override
  String get reflectionsStartCheckin => 'Do a weekly check-in';

  @override
  String get reflectionsStartMonthly => 'Write a monthly reflection';

  @override
  String get reflectionLearned => 'What I learned';

  @override
  String get reflectionChange => 'What I\'d change';

  @override
  String get reflectionGoals => 'Goals for next month';

  @override
  String checkinFeeling(int value) {
    return 'Feeling: $value/5';
  }

  @override
  String get pastProjectsEmpty =>
      'Finished and paused projects will live here.';

  @override
  String get pastProjectStatusCompleted => 'Completed';

  @override
  String get pastProjectStatusPaused => 'Paused';

  @override
  String get pastProjectStatusAbandoned => 'Set aside';

  @override
  String get pastProjectStatusActive => 'Active';

  @override
  String get pastProjectOpenScrapbook => 'Open scrapbook';

  @override
  String pastProjectCompletedOn(String date) {
    return 'Finished $date';
  }

  @override
  String get checkinTitle => 'Weekly check-in';

  @override
  String get checkinQ1 => 'How are you feeling about your project?';

  @override
  String get checkinQ2 => 'How\'s progress going this week?';

  @override
  String get checkinQ3 => 'What\'s been hard lately?';

  @override
  String get checkinQ3Hint =>
      'Anything at all. Even \"nothing\" is a good answer.';

  @override
  String get checkinQ4 => 'Is your upcoming schedule still realistic?';

  @override
  String get checkinYes => 'Yes, it works';

  @override
  String get checkinNo => 'Not really';

  @override
  String get checkinFeeling1 => 'Rough';

  @override
  String get checkinFeeling2 => 'Meh';

  @override
  String get checkinFeeling3 => 'Okay';

  @override
  String get checkinFeeling4 => 'Good';

  @override
  String get checkinFeeling5 => 'Great';

  @override
  String get checkinProgress1 => 'Stuck';

  @override
  String get checkinProgress2 => 'Slow';

  @override
  String get checkinProgress3 => 'Steady';

  @override
  String get checkinProgress4 => 'Good';

  @override
  String get checkinProgress5 => 'Flying';

  @override
  String get checkinSubmit => 'Send check-in';

  @override
  String get checkinThanks => 'Thanks for checking in!';

  @override
  String get checkinDone => 'Back to my dashboard';

  @override
  String get checkinNoProject => 'Start a project to do weekly check-ins.';

  @override
  String get monthlyTitle => 'Monthly reflection';

  @override
  String get monthlySummary => 'Your month in numbers';

  @override
  String monthlyTasks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tasks done',
      one: '1 task done',
    );
    return '$_temp0';
  }

  @override
  String monthlyTime(String time) {
    return '$time of work';
  }

  @override
  String get monthlyMilestones => 'Milestones';

  @override
  String get monthlyBadges => 'Badges';

  @override
  String get monthlyChallenges => 'Challenges';

  @override
  String get monthlyPriorities => 'Coming up next';

  @override
  String get monthlyLearnedPrompt => 'What did you learn this month?';

  @override
  String get monthlyChangePrompt => 'What would you do differently?';

  @override
  String get monthlyGoalsPrompt => 'What are your goals for next month?';

  @override
  String get monthlySave => 'Save reflection';

  @override
  String get monthlySaved => 'Reflection saved. Nice work looking back!';

  @override
  String get monthlyPrevMonth => 'Previous month';

  @override
  String get monthlyNextMonth => 'Next month';

  @override
  String get plansTitle => 'Choose your plan';

  @override
  String get plansBody =>
      'Every plan keeps your work safe. Upgrade or cancel anytime.';

  @override
  String get plansAllPremium =>
      'Everything in SPARK is unlocked for you right now. Enjoy!';

  @override
  String get plansFree => 'Free';

  @override
  String plansTrial(int days) {
    return '$days-day free trial';
  }

  @override
  String plansStartTrial(String price, String period) {
    return 'Start free trial · then $price/$period';
  }

  @override
  String plansSubscribe(String price, String period) {
    return 'Subscribe · $price/$period';
  }

  @override
  String get plansCurrent => 'Your plan';

  @override
  String get plansTerms =>
      'Payment is charged to your app store account when you confirm. The subscription renews automatically at the price shown unless you cancel at least 24 hours before the end of the current period. Cancel anytime in your store account settings.';

  @override
  String plansTrialTerms(String price, String period) {
    return 'After the free trial ends you\'ll be charged $price every $period unless you cancel before the trial ends.';
  }

  @override
  String get plansPriceUnavailable => 'Price not available right now';

  @override
  String get plansStoreUnavailable =>
      'Purchases aren\'t available on this device.';

  @override
  String get plansPurchasing => 'Confirming with the store…';

  @override
  String get plansPending => 'Thanks! Your plan will update in a moment.';

  @override
  String get plansRestore => 'Restore purchases';

  @override
  String get plansRestored => 'Purchases restored.';

  @override
  String get plansCompare => 'Compare plans';

  @override
  String get periodWeek => 'week';

  @override
  String get periodMonth => 'month';

  @override
  String get periodYear => 'year';

  @override
  String get subscriptionCurrent => 'Current plan';

  @override
  String subscriptionRenews(String date) {
    return 'Renews $date';
  }

  @override
  String subscriptionExpires(String date) {
    return 'Ends $date';
  }

  @override
  String subscriptionTrialEnds(String date) {
    return 'Free trial ends $date';
  }

  @override
  String get subscriptionManage => 'Manage subscription';

  @override
  String get subscriptionManageUnavailable =>
      'Manage your subscription in your app store account settings.';

  @override
  String get subscriptionLaunch =>
      'During launch every feature is free for everyone.';

  @override
  String subscriptionGrant(String plan, String date) {
    return 'Bonus access: $plan until $date';
  }

  @override
  String get subscriptionDowngradeTitle => 'What changed';

  @override
  String subscriptionDowngradeLocked(String features) {
    return 'Locked for now: $features';
  }

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsAppearanceBody => 'Light, dark, themes and colors';

  @override
  String get settingsThemes => 'Themes';

  @override
  String get settingsThemeDefault => 'SPARK default';

  @override
  String get settingsThemeSeasonal => 'Seasonal';

  @override
  String get settingsThemeEarned => 'Earned';

  @override
  String get settingsThemeLockedEarned => 'Unlock by staying consistent';

  @override
  String get settingsCustomColors => 'Custom colors';

  @override
  String get settingsCustomColorsBody => 'Pick your own colors (Premium)';

  @override
  String get settingsCharacter => 'Companion character';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsBody => 'Reminders, quiet hours and more';

  @override
  String get settingsNotifPermissionOff =>
      'Notifications are turned off for SPARK on this device.';

  @override
  String get settingsOpenSystemSettings => 'Open system settings';

  @override
  String get settingsSchedule => 'Schedule';

  @override
  String get settingsScheduleBody =>
      'Availability, deadline and Google Calendar';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsPrivacyBody => 'Leaderboard, community, location';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsSaved => 'Saved';

  @override
  String get colorsIntro =>
      'Pick a color for each part of the app. We check that text stays easy to read.';

  @override
  String get colorsLightMode => 'Light mode';

  @override
  String get colorsDarkMode => 'Dark mode';

  @override
  String get colorsPreview => 'Preview';

  @override
  String colorsContrastWarning(String fg, String bg, String ratio) {
    return '$fg on $bg is hard to read ($ratio:1, needs 4.5:1).';
  }

  @override
  String get colorsUseSuggested => 'Use a readable shade';

  @override
  String get colorsAllGood => 'All text passes the readability check.';

  @override
  String get colorsSave => 'Save colors';

  @override
  String get colorsReset => 'Reset to default';

  @override
  String get colorsResetDone => 'Colors reset';

  @override
  String get colorsLocked => 'Custom colors are part of Premium.';

  @override
  String colorsPick(String role) {
    return 'Pick a color for $role';
  }

  @override
  String get roleBackground => 'Background';

  @override
  String get roleSurface => 'Sheets and inputs';

  @override
  String get roleCard => 'Cards';

  @override
  String get rolePrimary => 'Buttons';

  @override
  String get roleOnPrimary => 'Button text';

  @override
  String get roleAccent => 'Highlights';

  @override
  String get roleTextPrimary => 'Main text';

  @override
  String get roleTextSecondary => 'Secondary text';

  @override
  String get roleProgressDone => 'Progress (done)';

  @override
  String get roleProgressProjected => 'Progress (projected)';

  @override
  String get scheduleAvailability => 'Weekly availability';

  @override
  String get scheduleDeadline => 'Deadline';

  @override
  String get scheduleChangeDeadline => 'Change deadline';

  @override
  String get scheduleAvailabilitySaved => 'Availability saved.';

  @override
  String get scheduleGcal => 'Google Calendar';

  @override
  String get scheduleGcalConnect => 'Connect Google Calendar';

  @override
  String get scheduleGcalConnectBody =>
      'Add SPARK sessions to your calendar and plan around your busy times. You\'ll sign in with Google in your browser.';

  @override
  String get scheduleGcalOpening => 'Opening Google in your browser…';

  @override
  String get scheduleGcalReturn =>
      'Finish connecting in your browser, then come back here.';

  @override
  String scheduleGcalConnected(String email) {
    return 'Connected as $email';
  }

  @override
  String get scheduleGcalConnectedNoEmail => 'Connected';

  @override
  String get scheduleGcalAddSessions => 'Add SPARK sessions to my calendar';

  @override
  String get scheduleGcalBusy => 'Plan around my busy times';

  @override
  String get scheduleGcalDisconnect => 'Disconnect Google Calendar';

  @override
  String get scheduleGcalDisconnectConfirm => 'Disconnect Google Calendar?';

  @override
  String get scheduleGcalDisconnectBody =>
      'SPARK will stop syncing and revoke its access. Your SPARK plan stays the same.';

  @override
  String get scheduleGcalLocked =>
      'Google Calendar sync is included with Standard and Premium.';

  @override
  String get privacyLeaderboard => 'Leaderboard';

  @override
  String get privacyCommunityVisibility => 'Community profile visibility';

  @override
  String get privacyVisibilityPrivate => 'Only people I connect with';

  @override
  String get privacyVisibilityMembers => 'Members with shared interests';

  @override
  String get privacyLocation => 'Location (city or region only)';

  @override
  String get privacyLocationBody =>
      'Used only to find opportunities near you. Never precise location.';

  @override
  String get privacyCity => 'City';

  @override
  String get privacyRegion => 'State or region';

  @override
  String get privacyConsents => 'Your consents';

  @override
  String get privacyConsentsBody =>
      'Change any of these anytime. Some features turn off without them.';

  @override
  String get privacyConsentLocation => 'Use my city/region for opportunities';

  @override
  String get privacyConsentCalendar => 'Connect calendar data';

  @override
  String get privacyTeenDefaults =>
      'For teens, SPARK starts with the most private settings.';

  @override
  String get accountEmail => 'Email';

  @override
  String get accountNoEmail => 'Signed in with Apple or Google';

  @override
  String get accountDelete => 'Delete account';

  @override
  String get accountDeleteTitle => 'Delete your account?';

  @override
  String get accountDeleteBody =>
      'This permanently deletes your projects, plans, journal photos, scrapbooks, chats, badges and settings, disconnects Google Calendar and removes your sign-in. Subscriptions must be cancelled in your app store account.';

  @override
  String get accountDeleteConfirmTitle => 'Are you absolutely sure?';

  @override
  String get accountDeleteConfirmBody =>
      'Type DELETE to confirm. This can\'t be undone.';

  @override
  String get accountDeleteWord => 'DELETE';

  @override
  String get accountDeleteButton => 'Delete everything';

  @override
  String get accountDeleting => 'Deleting your account…';

  @override
  String get helpReplayTutorial => 'Replay the tour';

  @override
  String get helpContactSupport => 'Contact support';

  @override
  String get helpTerms => 'Terms of Service';

  @override
  String get helpPrivacyPolicy => 'Privacy Policy';

  @override
  String helpVersion(String version) {
    return 'Version $version';
  }

  @override
  String get helpLicenses => 'Open-source licenses';

  @override
  String get helpSupportSubject => 'SPARK help';

  @override
  String get communityUnavailable =>
      'Community isn\'t open yet. Check back soon!';

  @override
  String get communitySafetyTitle => 'Staying safe in the SPARK community';

  @override
  String get communitySafetyPoint1 =>
      'You use a pseudonym and your companion\'s picture. Never share your real name, school, address, phone number or social media.';

  @override
  String get communitySafetyPoint2 =>
      'Messages are only between people your age group who both accepted a connection. Teens can only send text.';

  @override
  String get communitySafetyPoint3 =>
      'Everything is checked for safety before it\'s shown. Report or block anyone, anytime. We review every report.';

  @override
  String get communitySafetyPoint4 =>
      'Mentors are approved adults and only talk with teens in moderated groups, never in private messages.';

  @override
  String get communitySafetyAgree => 'I understand';

  @override
  String get communitySetupTitle => 'Set up your community profile';

  @override
  String get communitySetupBody =>
      'Only a pseudonym, your avatar and interests are shown.';

  @override
  String get communityPseudonym => 'Pseudonym';

  @override
  String get communityPseudonymHint => 'e.g. PixelFox';

  @override
  String get communityInterests => 'Interests';

  @override
  String get communityInterestsHint => 'Add an interest and press enter';

  @override
  String get communityBio => 'Short bio (optional)';

  @override
  String get communityBioWarning =>
      'Please remove contact info, links or real names.';

  @override
  String get communitySaveProfile => 'Save profile';

  @override
  String get communityPeople => 'People';

  @override
  String get communityShowcase => 'Showcase';

  @override
  String get communityGroups => 'Groups';

  @override
  String get communityConnections => 'Connections';

  @override
  String get communityNoMatches =>
      'No matches yet. Add more interests to find people.';

  @override
  String communityShared(String interests) {
    return 'Shared: $interests';
  }

  @override
  String get communityConnect => 'Send connection request';

  @override
  String get communityRequested => 'Request sent';

  @override
  String get communityAccept => 'Accept';

  @override
  String get communityDecline => 'Decline';

  @override
  String get communityPending => 'Waiting for them to accept';

  @override
  String get communityIncoming => 'Wants to connect';

  @override
  String get communityOpenChat => 'Open chat';

  @override
  String get communityNoConnections => 'No connections yet.';

  @override
  String get communityShowcaseEmpty =>
      'No showcases yet. Finish a milestone and share it!';

  @override
  String get communityShareProject => 'Share a showcase';

  @override
  String get communityPostTitle => 'Title';

  @override
  String get communityPostBody => 'What did you make?';

  @override
  String get communityPostConsent => 'I want to share this with the community.';

  @override
  String get communityPostPending =>
      'Thanks! It\'ll appear after a quick safety check.';

  @override
  String get communityPost => 'Post';

  @override
  String get communityJoinGroup => 'Join group';

  @override
  String get communityLeaveGroup => 'Leave group';

  @override
  String get communityGroupEmpty => 'No posts yet.';

  @override
  String get communityWritePost => 'Write something kind…';

  @override
  String get communityMessageHint => 'Message…';

  @override
  String get communityMessagePending => 'Checking…';

  @override
  String get communityMessageBlocked =>
      'Not sent: this message didn\'t pass the safety check.';

  @override
  String get communityReport => 'Report';

  @override
  String get communityReportTitle => 'Report this?';

  @override
  String get communityReportReason => 'What\'s wrong? (optional)';

  @override
  String get communityReported =>
      'Thanks for reporting. Our team will review it.';

  @override
  String get communityBlock => 'Block';

  @override
  String communityBlockTitle(String name) {
    return 'Block $name?';
  }

  @override
  String get communityBlockBody =>
      'They won\'t be able to see your profile or message you.';

  @override
  String get communityBlocked => 'Blocked.';

  @override
  String communityMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get communityModerated => 'Moderated group';

  @override
  String get communityEditProfile => 'Edit community profile';
}
