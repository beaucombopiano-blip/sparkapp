# SPARK

**By Teens. For Teens.** SPARK helps teens pick a passion project, turns it
into a realistic plan that fits their week, and keeps them going with a
calendar, an AI companion, a journal and celebrations along the way.

This repository is the Flutter client (iOS, Android, web). The backend
(Firebase: Auth, Firestore, Cloud Functions, Storage) is a separate project;
the client is built against its contract.

## Quick start

```bash
flutter pub get
flutter run --dart-define-from-file=dart_defines.local.json
```

`dart_defines.local.json` holds the Firebase options and app settings listed
in [docs/FRONTEND_DECISIONS.md → Configuration](docs/FRONTEND_DECISIONS.md#5-configuration).
Without them the app opens on a "not configured" screen. Add
`--dart-define=SPARK_USE_EMULATORS=true` to use the Firebase Emulator Suite.

Generated code is committed. After changing models, providers or strings:

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## Tests

```bash
flutter analyze
flutter test                          # unit, widget, app-flow and golden tests
flutter test --exclude-tags golden    # off Linux (goldens are Linux-rendered)
```

End-to-end flows in `integration_test/` run against the emulators with the
backend deployed; see [docs/FRONTEND_PLAN.md → Integration tests](docs/FRONTEND_PLAN.md#integration-tests-firebase-emulator-suite).

## Docs

* [docs/FRONTEND_PLAN.md](docs/FRONTEND_PLAN.md): structure, routes, state
  management, build order, running.
* [docs/FRONTEND_DECISIONS.md](docs/FRONTEND_DECISIONS.md): judgment calls,
  backend contract additions and assumptions, configuration, theming, tests.
