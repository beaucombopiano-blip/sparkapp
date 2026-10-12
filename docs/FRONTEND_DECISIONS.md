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
