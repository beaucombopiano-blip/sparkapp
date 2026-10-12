import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;

/// Global test setup: time zone database, and the bundled Nunito/Inter fonts
/// registered under the family names google_fonts uses, so golden images
/// render real glyphs without any network access.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  tz_data.initializeTimeZones();
  GoogleFonts.config.allowRuntimeFetching = false;

  const fonts = <String, String>{
    'Nunito_regular': 'assets/google_fonts/Nunito-Regular.ttf',
    'Nunito_600': 'assets/google_fonts/Nunito-SemiBold.ttf',
    'Nunito_700': 'assets/google_fonts/Nunito-Bold.ttf',
    'Nunito_800': 'assets/google_fonts/Nunito-ExtraBold.ttf',
    'Inter_regular': 'assets/google_fonts/Inter-Regular.ttf',
    'Inter_500': 'assets/google_fonts/Inter-Medium.ttf',
    'Inter_600': 'assets/google_fonts/Inter-SemiBold.ttf',
    'Inter_700': 'assets/google_fonts/Inter-Bold.ttf',
    // Fallback family names used by google_fonts and by Material defaults.
    'Nunito': 'assets/google_fonts/Nunito-Bold.ttf',
    'Inter': 'assets/google_fonts/Inter-Regular.ttf',
    'Roboto': 'assets/google_fonts/Inter-Regular.ttf',
  };
  for (final entry in fonts.entries) {
    final loader = FontLoader(entry.key)..addFont(rootBundle.load(entry.value));
    await loader.load();
  }
  await testMain();
}
