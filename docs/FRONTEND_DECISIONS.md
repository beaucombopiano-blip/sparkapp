# SPARK Frontend Decisions

Judgment calls made while building the Flutter client. Anything the brief or
the backend contract left open is recorded here, together with the repository
method the UI is built against so the backend can be connected (or the
contract adjusted) in one place.

## 0. Source of the backend contract

`docs/API.md` and `docs/DATA_MODEL.md` were **not** present in this
repository when the client was built. The contract was therefore derived from
the backend brief ("SPARK Backend (Firebase)"), which names every collection,
callable and HTTPS endpoint. Field names follow that brief (camelCase,
Timestamps). Where the brief is silent, the assumed shape is written in
section 3 below and implemented in exactly one repository method.

The backend brief mentions an Expo client and a TypeScript `packages/shared`
package. The client here is Flutter, so the shared TypeScript types cannot be
imported; the Dart models in `lib/data/models/` mirror them instead. When the
backend's `docs/DATA_MODEL.md` lands, diff it against those models.

## 1. Platform and library choices

* **material_ui / cupertino_ui.** Flutter 3.47 moved Material and Cupertino
  into the standalone `material_ui` and `cupertino_ui` packages, and go_router
  18, google_fonts 9, shimmer 4 and flex_color_picker 4 already depend on
  them. The app imports `package:material_ui/material_ui.dart`. A handful of
  dependencies (`table_calendar`, `flutter_markdown_plus`, `pdfx`) still use
  the legacy `package:flutter/material.dart`; they are wrapped in
  `LegacyMaterialBridge` (`lib/core/widgets/legacy_material_bridge.dart`), a
  single wrapper around Flutter's temporary `MaterialUiCompatibilityBridge`.
  Remove it once those packages migrate.
* **Lottie over Rive** for the animated logo and celebration files: Lottie
  JSON is the format most motion designers already export from After Effects,
  the `lottie` package renders it in pure Dart on every platform (including
  web) with no native runtime, and it supports per-layer colour overrides so
  celebrations can use the active palette. Until real files are delivered the
  logo face is drawn with `CustomPainter` (`SparkLogoFace`) and confetti is a
  palette-coloured particle painter. Swapping in the delivered logo is a
  one-line change in `lib/core/config/brand_assets.dart`.
* **Fonts are bundled** (`assets/google_fonts/`, SIL Open Font License) and
  `GoogleFonts.config.allowRuntimeFetching = false`, so no font request leaves
  the device and golden tests render real glyphs.
* **shared_preferences** (not in the brief's list) stores device-local UI
  conveniences only: the date of the last daily greeting, the journal sort
  order and whether the coach-mark tutorial was replayed. No user data.
* **flutter_markdown_plus** (community fork of the discontinued
  `flutter_markdown`) renders companion replies.
* **Riverpod automatic retry is disabled** (`ProviderScope(retry: ...)`), so a
  failure is shown as an error state with an explicit Retry button instead of
  being silently retried.
* Generated code (`*.g.dart`, `*.freezed.dart`, `lib/l10n/generated/`) is
  committed so the project analyses and builds right after `flutter pub get`.

## 2. Time zones

All Timestamps are UTC. The client converts them to the user's profile
time zone (`users/{uid}.timezone`, IANA) using the `timezone` package
(`UserClock`). Day grouping on the calendar/agenda and "today" use that zone,
so a plan built for America/Chicago still lines up when the phone is set to a
different zone. If the profile has no zone yet the device zone is used.

Availability weekdays use the JavaScript convention the backend is written in:
`0 = Sunday … 6 = Saturday`.

## 3. Backend contract: additions and assumptions

The client calls 53 callables and 2 streaming endpoints. Each one lives in
exactly one repository method under `lib/data/repositories/`, so a rename or
shape change on the backend is a one-line change here.

### 3.1 Callables the brief does not define

The UI needs these and the backend brief does not name them. Request shapes
are what the client sends; responses are only read where noted.

| Callable | Request | Used for |
| --- | --- | --- |
| `startNewProject` | `{}` | Profile → "Start a new project" (archives the active one, restarts onboarding at path choice) |
| `dismissProposal` | `{proposalId}` | "Not now" on a reschedule / plan proposal |
| `cancelAction` | `{actionId}` | "Not now" on a companion proposed action |
| `deleteJournalEntry` | `{projectId, entryId}` | Journal entry → Delete (also removes Storage files) |
| `saveResource` / `unsaveResource` | `{projectId, resource, note?}` / `{projectId, savedResourceId}` | Save a resource to the project |
| `joinChallenge` | `{challengeId}` | Profile → Challenges; progress read from `users/{uid}/challengeParticipation` |
| `setConsent` | `{type, granted}` | Privacy toggles that need a server-side audit trail (location, community) |
| `markCelebrationsSeen` | `{ids}` | After the celebration overlay is dismissed |
| `saveCommunityProfile`, `findCommunityMatches`, `createShowcasePost`, `createGroupPost`, `joinGroup`, `leaveGroup`, `sendConnectionRequest`, `respondConnectionRequest`, `sendCommunityMessage`, `reportContent`, `blockUser` | see `community_repository.dart` | Community (behind `config/app.communityEnabled`) |

### 3.2 Shapes the client relies on

* `selectProject` accepts `{recommendationId?, interviewId?, profile?}`; the
  optional `profile` carries the user's edits from the interview review screen.
* `generatePlan` accepts `{projectId, mode: 'preview'|'full', overrides?: {targetEndDate?, acceptedScopeCuts?}}`
  so the "this doesn't fit" choices (extend deadline / cut scope) can be applied.
* `adjustPlan` takes `{projectId, change: {kind, targetEndDate?, description?}}`
  with `kind` one of `newDeadline | scope | goal | regenerateFuture`, and returns
  `{proposal}`. Nothing changes until `applyProposal`.
* `reschedule` takes `{projectId, scope}` where `scope.kind` is `all`,
  `session` (`sessionId`, `toDate?`), `tasks` (`taskIds`, `toDate?`) or
  `missed` (`sessionIds?`), and returns `{proposal}`.
* `createJournalEntry` returns `{entryId, uploadPath, previewUploadPath?}`.
  The client uploads to those Storage paths, then the backend's Storage
  trigger moves the entry from `processing` to `ready`.
* `getScrapbook` returns the scrapbook plus `mediaUrls` (10-minute signed URLs).
  When a signed URL fails the client refetches at most once a minute
  (`SignedUrlRefresh`), so a broken file can't cause a request loop.
* `completeTask` returns `{currentTasks, progress?, newlyEarnedBadges, milestoneCompleted?, projectCompleted, streaks?, promptJournal}`.
  The task only shows as done when the Firestore stream says so.
* Percentages from `getProgress` / `getTimeline` are 0–100.
* Proposals and proposed actions are watched live (`users/{uid}/proposals/{id}`,
  `users/{uid}/proposedActions/{id}`). `applied` (proposals) and `executed`
  (actions) count as backend confirmation even if this device's request
  timed out; `dismissed` / `cancelled` show as skipped.

### 3.3 Streaming (SSE)

`companionChat` and `ideaInterview` are HTTPS functions that respond with
`text/event-stream`, authenticated with `Authorization: Bearer <ID token>` and
`X-Firebase-AppCheck`. Events the client handles:

* companion: `meta` (`conversationId`), `token`/`delta` (`text`), `tool`
  (status line), `attachment` (resource cards), `proposal` (proposed action
  id), `safety` (crisis card), `done`, `error` (`message`, `code`, `retryable`).
* interview: `token`/`delta`, `profile` (draft profile), `turn`, `done`, `error`.

Errors before the stream starts use the same JSON body as callables
(`{error: {message, code|status, details, retryable}}`) and map to the same
friendly messages. **Web:** browsers buffer `fetch` streams on some proxies;
the reply then appears all at once at the end, which is acceptable.

### 3.4 Data assumptions

* `config/app` holds client flags: `entitlementsMode` (`all_premium` default,
  or `enforced`), `communityEnabled`, and optional `supportEmail`, `termsUrl`
  and `privacyUrl` that override the build-time values.
* Theme/badge/character unlocks are read from `users/{uid}/unlocks`.
* "Current tasks" are fetched with Firestore ordering (`suggestedDate`,
  `order`), then re-sorted on the device by the user's local day, then
  priority, then plan order (`sortCurrentTasks`), so tasks on the same local
  day but different UTC days still sort by priority.
* **Fields the client writes directly** (everything else goes through
  callables): `users/{uid}`: `displayName`, `timezone`, `locationCity`,
  `locationRegion`, `locationCountry`, `appearanceMode`, `themeId`;
  `users/{uid}/private/settings`: `notifications.*`, `calendar.*` preferences,
  `privacy.*` visibility; journal `caption`; saved-resource `note`. Security
  rules must allow exactly these.

## 4. Colour and theming

* Every colour comes from the eight palette tokens through semantic roles
  (`SparkRole`, `context.spark`). Widgets never use hex values. The only
  fixed colours are the status colours (`SparkStatusColors`: success, warning,
  danger in light and dark), so errors stay recognisable under any palette.
* Cards are white (light) rather than `blueLight`. On `blueLight`, links in
  `blueMedium` are 4.0:1 (below AA for text) and `blueMuted` icons 2.8:1, and
  the card barely separates from the `blueVeryLight` background (1.15:1). On
  white they are 5.5:1 and 3.9:1. `blueLight` is used for chips, tinted cards,
  the selected calendar day, the nav indicator and the progress track.
* Custom colours (Settings → Custom colors) edit ten roles. Each
  text/background pair is checked against WCAG AA (4.5:1) before saving, and
  the editor suggests the closest passing colour. `setCustomPalette` validates
  again on the server.
* Dark mode is derived from the same palette (navy base, lightened blues), so
  seasonal and premium themes get a dark variant for free.
* With `entitlementsMode: enforced` and a plan without `appearanceMode`, the
  app follows the system setting and the mode picker shows the lock card.

## 5. Configuration

Pass values with `--dart-define` or `--dart-define-from-file=<file>.json`.
Nothing here is secret (Firebase API keys, RevenueCat public keys and OAuth
client IDs ship in every app).

### 5.1 Firebase (`lib/firebase_options.dart`)

`SPARK_FIREBASE_PROJECT_ID`, `SPARK_FIREBASE_MESSAGING_SENDER_ID`,
`SPARK_FIREBASE_STORAGE_BUCKET`, `SPARK_FIREBASE_AUTH_DOMAIN`,
`SPARK_FIREBASE_ANDROID_API_KEY`, `SPARK_FIREBASE_ANDROID_APP_ID`,
`SPARK_FIREBASE_IOS_API_KEY`, `SPARK_FIREBASE_IOS_APP_ID`,
`SPARK_FIREBASE_WEB_API_KEY`, `SPARK_FIREBASE_WEB_APP_ID`,
`SPARK_FIREBASE_MEASUREMENT_ID`.

Without them the app starts on a "not configured" screen instead of crashing.
Running `flutterfire configure` replaces the file with generated values. That
works too, but then add the `com.google.gms.google-services` Gradle plugin it
asks for (it is not added here so the project builds without
`google-services.json`).

### 5.2 App (`lib/core/config/app_config.dart`)

| Define | Default | Purpose |
| --- | --- | --- |
| `SPARK_USE_EMULATORS` | `false` | Use the Auth/Firestore/Functions/Storage emulators |
| `SPARK_EMULATOR_HOST` | `10.0.2.2` on Android, else `localhost` | Emulator host |
| `SPARK_FUNCTIONS_REGION` | `us-east1` | Functions region |
| `SPARK_FUNCTIONS_BASE_URL` | `https://<region>-<project>.cloudfunctions.net` | Base URL for the SSE endpoints (custom domain) |
| `SPARK_EMAIL_LINK_URL` | — | Continue URL in sign-in emails (an authorised domain handled as an app link) |
| `SPARK_EMAIL_LINK_DOMAIN` | — | `ActionCodeSettings.linkDomain` (Hosting domain) |
| `SPARK_IOS_BUNDLE_ID` / `SPARK_ANDROID_PACKAGE` | `app.sparkteens.spark` | For email-link `ActionCodeSettings` |
| `SPARK_GOOGLE_SERVER_CLIENT_ID` | — | Web OAuth client ID (`serverClientId` for Google Sign-In on Android) |
| `SPARK_GOOGLE_IOS_CLIENT_ID` | — | iOS OAuth client ID (if not in `GoogleService-Info.plist`) |
| `SPARK_APP_CHECK_WEB_SITE_KEY` | — | reCAPTCHA Enterprise key for App Check on web |
| `SPARK_APP_CHECK_DEBUG` | `false` | App Check debug providers (always on in debug builds) |
| `SPARK_REVENUECAT_APPLE_KEY` / `_GOOGLE_KEY` / `_WEB_KEY` | — | RevenueCat public SDK keys; purchases are hidden when empty |
| `SPARK_ADMOB_BANNER_ANDROID` / `_IOS` | — | Banner unit IDs; only used when the plan has `adsEnabled` |
| `SPARK_SUPPORT_EMAIL`, `SPARK_TERMS_URL`, `SPARK_PRIVACY_URL` | — | Help and legal links (`config/app` can override) |
| `SPARK_URL_SCHEME` | `spark` | Custom scheme for notification deep links and the Google Calendar OAuth return |

### 5.3 Platform files

* **Android** (`android/gradle.properties`): `sparkLinkHost` (app-link host
  for email sign-in, default `spark-app.web.app`) and `admobAppId` (default:
  Google's public **sample** ID, which must be replaced before release).
  `minSdk` 23, core library desugaring for local notifications.
* **iOS** (`ios/Flutter/Spark.xcconfig`, included by Debug and Release):
  `GOOGLE_REVERSED_CLIENT_ID` (Google Sign-In URL scheme), `ADMOB_APP_ID`
  (sample ID by default), `SPARK_LINK_DOMAIN` (associated domain for email
  links). `Runner.entitlements` declares push and associated domains.
* Flutter's own deep-link handling is off on both platforms
  (`flutter_deeplinking_enabled=false`, `FlutterDeepLinkingEnabled=false`);
  `app_links` delivers links to `DeepLinkListener`, which recognises email
  sign-in links before routing.

## 6. Platform limitations

* **Screenshots:** the scrapbook viewer sets `FLAG_SECURE` on Android while
  open. iOS has no API to block screenshots, so nothing is done there.
* **Notifications** are scheduled locally from `getNotificationPlan` (quiet
  hours and the daily cap are applied by the server). FCM is used for
  server-initiated pushes; tapping either opens the route in the payload.
* **Ads** (AdMob) appear as one labelled banner on the recommendations list
  and on Profile, and only for plans with `adsEnabled`. Never in focus mode,
  the companion or the journal.

## 7. Tests

* `test/unit` covers pure logic: redirects, time zones and DST, SSE parsing,
  JSON/Timestamp normalisation, error mapping, palettes and contrast, calendar
  markers, agenda grouping, task ordering, notification ids and preferences,
  community contact-info detection, deep links and onboarding helpers.
* `test/widgets` covers every shared widget, plus a dedicated suite that
  proves a proposal card never shows "Done ✓" unless the backend confirmed.
* `test/app` pumps the **real app** (router, shell, theme) on a fake backend
  (`fake_cloud_firestore` + scripted callables, `test/helpers/test_env.dart`)
  with a pinned clock: shell layout, tabs, rail, offline banner, calendar
  markers (including what screen readers hear), agenda views, task completion
  (success and failure) and reschedule proposals.
* `test/goldens` (tag `golden`): Dashboard, Project, Agenda day/week/month,
  Journal, Profile and Settings in light, dark and a custom palette, on phone
  and tablet, plus 200% text. They are generated on Linux, so run them on
  Linux CI; regenerate with `flutter test --tags golden --update-goldens`.
* `fake_cloud_firestore` never re-emits updates on `withConverter` document
  references, so document streams map raw snapshots (`watchDoc`) instead. The
  behaviour is identical on real Firestore.
* `integration_test/` runs the real app against the Firebase Emulator Suite
  with the backend deployed to it (see `FRONTEND_PLAN.md` → Integration
  tests). These flows could not be executed in the environment this client
  was built in (no device or emulator, no backend), so expect to adjust waits
  and labels on the first run.
