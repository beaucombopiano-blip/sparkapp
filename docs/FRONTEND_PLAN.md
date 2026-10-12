# SPARK Frontend Plan (Flutter)

SPARK is an AI-powered passion-project planner ("By Teens. For Teens."). This
document describes how the Flutter client is organised and the order it was
built in. Judgment calls and assumptions about the backend contract are
recorded separately in [`FRONTEND_DECISIONS.md`](FRONTEND_DECISIONS.md).

## 1. Toolchain

| Concern | Choice |
| --- | --- |
| Flutter / Dart | Flutter 3.47 stable, Dart 3.13 |
| Material library | `material_ui` + `cupertino_ui` (the decoupled Material/Cupertino packages that Flutter 3.47 and go_router 18 use) |
| State | `flutter_riverpod` 3 + `riverpod_generator` 4 (`@riverpod` functions/classes) |
| Navigation | `go_router` 18, `StatefulShellRoute.indexedStack` for the four tabs |
| Models | `freezed` 4 + `json_serializable`; Firestore `withConverter` for typed reads |
| Firebase | core, auth, firestore, functions, storage, messaging, app_check, analytics, crashlytics |
| Streaming AI | `http` streamed requests parsed by `core/network/sse_client.dart` |
| Calendar | `table_calendar` (custom builders for SPARK markers) |
| Notifications | `firebase_messaging` + `flutter_local_notifications` + `timezone` + `flutter_timezone` |
| Billing / ads | `purchases_flutter` (RevenueCat, appUserID = uid), `google_mobile_ads` |
| Media | `image_picker`, `file_picker`, `flutter_image_compress`, `pdfx` (PDF first-page preview) |
| Motion | `flutter_animate`; `lottie` for the brand logo / celebration files once delivered |
| Fonts | `google_fonts` (Nunito headings, Inter body) with the TTFs bundled under `assets/google_fonts/` and runtime fetching disabled |
| Strings | `intl` + `flutter gen-l10n`; every user-facing string lives in `lib/l10n/app_en.arb` |
| Tests | `flutter_test`, goldens, `mocktail`, `fake_cloud_firestore`, `integration_test` (Firebase Emulator Suite) |

## 2. Folder structure

```
lib/
  main.dart                     Firebase init, App Check, Crashlytics, ProviderScope
  firebase_options.dart         Overwritten by `flutterfire configure`; reads --dart-define until then
  app/
    app.dart                    MaterialApp.router, themes, localization
    router.dart                 go_router config + redirect logic (auth, signup, onboarding, greeting)
    routes.dart                 Route path constants and helpers
    shell/                      AppShell, SparkTopBar, nav bar / rail, companion button, tutorial overlay
    theme/                      SparkPalette tokens, SparkColors ThemeExtension, theme builder,
                                contrast utils, seasonal decorations
  core/
    config/                     AppConfig (dart-define), brand asset switches
    firebase/                   Firebase service providers, FunctionsClient
    network/sse_client.dart     Server-sent-events client for companionChat / ideaInterview
    errors/                     AppException + mapping from Firebase/HTTP errors
    utils/                      JSON normalisation, user clock (IANA tz), breakpoints, formatters
    widgets/                    Shared UI kit (section 4 of the brief)
  data/
    models/                     freezed models mirroring docs/DATA_MODEL.md
    repositories/               One per domain; the only code that touches Firestore/Functions/Storage
  features/
    splash_greeting/ auth/ onboarding/ discovery/ dashboard/ project/ agenda/ task/ focus/
    companion/ resources/ opportunities/ journal/ profile/ settings/ checkins/ reflections/
    gamification/ characters/ notifications/ community/ billing/
  l10n/                         app_en.arb (+ generated/)
assets/
  brand/ characters/ celebrations/ seasonal/ google_fonts/
test/                           unit, widget and golden tests (fakes live only here)
integration_test/               end-to-end flows against the Firebase Emulator Suite
```

Rules:

* Widgets never import Firebase packages. They read Riverpod providers that are
  backed by repositories.
* Repositories expose `Stream`s for live Firestore data, so completing a task
  anywhere updates the dashboard, project tab, calendar and agenda.
* Writes that change plans, progress, billing or rewards always go through
  Cloud Functions callables. Clients only write simple preference fields.
* No hex colours in widgets: everything reads `context.spark` (the
  `SparkColors` theme extension). No user-facing literals in widgets:
  everything reads `context.l10n`.

## 3. Routes

```
/splash                                   auth-state skeleton (no flash of the wrong screen)
/greeting                                 daily animated logo greeting
/auth, /auth/email-link, /auth/complete-signup
/onboarding/:step                         welcome, pathChoice, discovery, recommendations,
                                          projectSelected, deadline, availability, character,
                                          notifications, appearance, plan
/plans                                    billing module (hidden in all_premium mode)
/ (StatefulShellRoute, 4 branches)
  /dashboard
  /project
    /project/agenda?date=YYYY-MM-DD&view=day|week|month
    /project/task/:taskId
    /project/timeline
    /project/resources
    /project/opportunities
    /project/adjust
  /journal
    /journal/entry/:entryId
    /journal/scrapbook/:id
  /profile
    /profile/badges, /profile/leaderboard, /profile/reflections,
    /profile/subscription, /profile/projects, /profile/community/*
/companion?conversationId=&taskId=
/focus?sessionId=                         focus mode (full screen, coach mode)
/settings (+ /settings/appearance, /settings/colors, /settings/character,
           /settings/notifications, /settings/schedule, /settings/privacy,
           /settings/account, /settings/help)
/checkin/weekly, /reflection/monthly
```

Redirects (pure function `computeRedirect`, unit tested):

1. Auth state unresolved → `/splash`.
2. Not signed in → `/auth` (auth sub-routes allowed).
3. Signed in, `profileComplete` claim false → `/auth/complete-signup`.
4. Onboarding not complete → `/onboarding/<server step>` (during the
   `tutorial` step the shell is allowed so coach marks run over the real app).
5. Complete users hitting `/auth*` or `/onboarding*` → `/dashboard`.
6. First open of the day → `/greeting` (only when the launch target is the
   dashboard, so notification deep links are never delayed).

## 4. State management

* `firebase/` providers expose the SDK singletons (overridable in tests).
* Repositories are `keepAlive` providers.
* Live data: `StreamProvider`s generated from `@riverpod Stream<T> foo(Ref ref, ...)`.
* Computed views (`getProgress`, `getTimeline`, `getHomeDashboard`) are
  `FutureProvider`s that watch the relevant Firestore streams so they
  re-fetch when the underlying documents change.
* Commands (complete task, confirm proposal, upload journal entry…) are
  `@riverpod` notifier classes exposing `AsyncValue` state so buttons can
  show loading and the UI never claims success before the backend confirms.
* Riverpod's automatic retry is disabled in `ProviderScope` so failures surface
  as error states with an explicit Retry button.

## 5. Build order (brief section 20)

1. Project setup, FlutterFire config, App Check, router skeleton, design tokens,
   light/dark themes, shared UI kit
2. App shell: top bar (logo, tab title, settings gear), four-tab bottom bar,
   navigation rail for wide screens, companion button
3. Daily logo greeting, auth, complete signup
4. Onboarding steps 1–3 (path choice, idea interview, assessment)
5. Recommendations, celebration, deadline, availability, character,
   notifications, appearance, plan generation, tutorial
6. Dashboard
7. Project tab with monthly calendar on top, Agenda (day/week/month), task
   detail, timeline, plan adjustment flows
8. Focus mode
9. Companion chat with streaming, attachments and proposal confirmation
10. Resources and opportunities
11. Journal and scrapbooks
12. Profile, badges, leaderboard, challenges, reflections
13. Settings (Google Calendar connect, custom colours)
14. Notifications, check-ins, monthly reflections, celebrations
15. Billing module (all_premium default) and ads rules
16. Community (behind the backend flag)
17. Responsive polish, accessibility pass, golden and integration tests, review

Each phase ends with `flutter analyze` (zero issues) and `flutter test`.

## 6. Running

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # models + providers
flutter gen-l10n                                           # strings
flutterfire configure                                      # writes lib/firebase_options.dart
flutter run --dart-define-from-file=dart_defines.local.json
```

See `docs/FRONTEND_DECISIONS.md` → "Configuration" for every `--dart-define`.

To run against the Firebase Emulator Suite add
`--dart-define=SPARK_USE_EMULATORS=true` (and `SPARK_EMULATOR_HOST` when the
emulators are not on `localhost`/`10.0.2.2`).

### Tests

```bash
flutter analyze                       # zero issues expected
flutter test                          # unit, widget, app-flow and golden tests
flutter test --exclude-tags golden    # on macOS/Windows (goldens are Linux-rendered)
```

### Integration tests (Firebase Emulator Suite)

The flows in `integration_test/` drive the real UI against the emulators with
the SPARK backend deployed to them. The backend should run in its emulator
test mode with deterministic AI responses so recommendations, plans and
companion proposals are produced quickly.

```bash
# In the backend repo
firebase emulators:start --only auth,firestore,functions,storage

# Here, with an Android emulator or iOS simulator running
flutter test integration_test \
  --dart-define-from-file=dart_defines.local.json \
  --dart-define=SPARK_USE_EMULATORS=true
```

| File | Flow |
| --- | --- |
| `onboarding_path_b_test.dart` | email-link signup → Path B assessment → pick a project → deadline → availability → plan → tutorial → complete a task → progress moves |
| `onboarding_path_a_test.dart` | Path A idea interview → review → confirm → setup → plan |
| `companion_proposal_test.dart` | ask the companion to move a session → proposal card → Confirm → Done only after `applyProposal` |
| `journal_upload_test.dart` | add a photo (generated PNG via a fake image picker) → upload to the Storage emulator → entry appears when processed |

Each test wipes the Auth and Firestore emulators first and reads the
sign-in link from the Auth emulator's `oobCodes` endpoint, so no real email
is sent.

