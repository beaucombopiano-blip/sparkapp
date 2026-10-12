import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoPageTransitionsBuilder;
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'spark_colors.dart';
import 'tokens.dart';

/// Builds [ThemeData] from a single [SparkColors] instance so light, dark,
/// preset, seasonal and custom palettes all share one code path.
ThemeData buildSparkTheme(SparkColors c) {
  final isDark = c.isDark;
  final scheme = ColorScheme(
    brightness: c.brightness,
    primary: c.primary,
    onPrimary: c.onPrimary,
    primaryContainer: c.surfaceAlt,
    onPrimaryContainer: c.textPrimary,
    secondary: c.secondary,
    onSecondary: c.onPrimary,
    secondaryContainer: c.surfaceAlt,
    onSecondaryContainer: c.textPrimary,
    tertiary: c.accent,
    onTertiary: c.onAccent,
    error: c.danger,
    onError: c.onDanger,
    surface: c.surface,
    onSurface: c.textPrimary,
    onSurfaceVariant: c.textSecondary,
    surfaceContainerLowest: c.surface,
    surfaceContainerLow: c.surface,
    surfaceContainer: c.card,
    surfaceContainerHigh: c.surfaceAlt,
    surfaceContainerHighest: c.surfaceAlt,
    outline: c.iconMuted,
    outlineVariant: c.border,
    shadow: c.shadow,
    inverseSurface: c.textPrimary,
    onInverseSurface: c.surface,
    inversePrimary: c.surfaceAlt,
    surfaceTint: const Color(0x00000000),
  );

  final textTheme = buildSparkTextTheme(c);

  const buttonShape = RoundedRectangleBorder(borderRadius: Radii.buttonAll);
  const buttonPadding = EdgeInsets.symmetric(horizontal: Space.l, vertical: 14);
  const minButton = Size(Space.minTouch, Space.minTouch);

  return ThemeData(
    useMaterial3: true,
    brightness: c.brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: c.background,
    canvasColor: c.background,
    textTheme: textTheme,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    visualDensity: VisualDensity.standard,
    extensions: <ThemeExtension<dynamic>>[c],
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(color: c.textPrimary, size: 24),
    dividerTheme: DividerThemeData(color: c.border, thickness: 1, space: 1),
    cardTheme: CardThemeData(
      color: c.card,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardAll,
        side: isDark ? BorderSide(color: c.border) : BorderSide.none,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: c.surfaceAlt,
      selectedColor: c.primary,
      labelStyle: textTheme.labelMedium?.copyWith(color: c.textPrimary),
      secondaryLabelStyle: textTheme.labelMedium?.copyWith(color: c.onPrimary),
      side: BorderSide(color: c.border),
      shape: const RoundedRectangleBorder(borderRadius: Radii.chipAll),
      checkmarkColor: c.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: Space.s, vertical: Space.xs),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
        disabledBackgroundColor: c.border,
        disabledForegroundColor: c.textSecondary,
        minimumSize: minButton,
        padding: buttonPadding,
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
        minimumSize: minButton,
        padding: buttonPadding,
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? c.secondary : c.primary,
        side: BorderSide(color: isDark ? c.secondary : c.primary, width: 1.5),
        minimumSize: minButton,
        padding: buttonPadding,
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: c.link,
        minimumSize: minButton,
        padding: const EdgeInsets.symmetric(horizontal: Space.m, vertical: Space.s),
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: c.textPrimary,
        minimumSize: minButton,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: c.surface,
      foregroundColor: c.primary,
      elevation: 3,
      shape: const CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: c.surface,
      labelStyle: textTheme.bodyMedium?.copyWith(color: c.textSecondary),
      hintStyle: textTheme.bodyMedium?.copyWith(color: c.textSecondary),
      contentPadding: const EdgeInsets.symmetric(horizontal: Space.m, vertical: 14),
      border: OutlineInputBorder(borderRadius: Radii.buttonAll, borderSide: BorderSide(color: c.border)),
      enabledBorder:
          OutlineInputBorder(borderRadius: Radii.buttonAll, borderSide: BorderSide(color: c.border)),
      focusedBorder: OutlineInputBorder(
        borderRadius: Radii.buttonAll,
        borderSide: BorderSide(color: c.primary, width: 2),
      ),
      errorBorder:
          OutlineInputBorder(borderRadius: Radii.buttonAll, borderSide: BorderSide(color: c.danger)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: c.surface,
      indicatorColor: c.navIndicator,
      surfaceTintColor: const Color(0x00000000),
      elevation: 0,
      height: 72,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected) ? c.navSelected : c.navUnselected,
          size: 26,
        ),
      ),
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => textTheme.labelMedium?.copyWith(
          color: states.contains(WidgetState.selected) ? c.navSelected : c.navUnselected,
          fontWeight: states.contains(WidgetState.selected) ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: c.surface,
      indicatorColor: c.navIndicator,
      selectedIconTheme: IconThemeData(color: c.navSelected, size: 26),
      unselectedIconTheme: IconThemeData(color: c.navUnselected, size: 26),
      selectedLabelTextStyle:
          textTheme.labelMedium?.copyWith(color: c.navSelected, fontWeight: FontWeight.w700),
      unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(color: c.navUnselected),
      labelType: NavigationRailLabelType.all,
      useIndicator: true,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: c.surface,
      modalBackgroundColor: c.surface,
      surfaceTintColor: const Color(0x00000000),
      showDragHandle: true,
      dragHandleColor: c.iconMuted,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Radii.sheet)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: c.surface,
      surfaceTintColor: const Color(0x00000000),
      shape: const RoundedRectangleBorder(borderRadius: Radii.cardAll),
      titleTextStyle: textTheme.titleLarge,
      contentTextStyle: textTheme.bodyMedium,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: c.textPrimary,
      contentTextStyle: textTheme.bodyMedium?.copyWith(color: c.surface),
      actionTextColor: c.isDark ? c.primary : c.surfaceAlt,
      shape: const RoundedRectangleBorder(borderRadius: Radii.buttonAll),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.surfaceAlt : c.surface,
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.textPrimary : c.textSecondary,
        ),
        side: WidgetStatePropertyAll(BorderSide(color: c.border)),
        minimumSize: const WidgetStatePropertyAll(minButton),
        textStyle: WidgetStatePropertyAll(textTheme.labelLarge),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? c.primary : const Color(0x00000000),
      ),
      checkColor: WidgetStatePropertyAll(c.onPrimary),
      side: BorderSide(color: c.iconMuted, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? c.onPrimary : c.iconMuted,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? c.primary : c.surfaceAlt,
      ),
      trackOutlineColor: WidgetStatePropertyAll(c.border),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? c.primary : c.iconMuted,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: c.primary,
      linearTrackColor: c.progressTrack,
      circularTrackColor: c.progressTrack,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: c.textPrimary,
      textColor: c.textPrimary,
      titleTextStyle: textTheme.bodyLarge?.copyWith(color: c.textPrimary, fontWeight: FontWeight.w600),
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(color: c.textSecondary),
      minVerticalPadding: Space.s,
      contentPadding: const EdgeInsets.symmetric(horizontal: Space.m),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(color: c.textPrimary, borderRadius: Radii.smallAll),
      textStyle: textTheme.bodySmall?.copyWith(color: c.surface),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: c.surface,
      surfaceTintColor: const Color(0x00000000),
      headerBackgroundColor: c.primary,
      headerForegroundColor: c.onPrimary,
      todayBorder: BorderSide(color: c.primary, width: 1.5),
      shape: const RoundedRectangleBorder(borderRadius: Radii.cardAll),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: c.surface,
      shape: const RoundedRectangleBorder(borderRadius: Radii.cardAll),
    ),
    badgeTheme: BadgeThemeData(backgroundColor: c.accent, textColor: c.onAccent),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(c.iconMuted.withValues(alpha: 0.6)),
    ),
  );
}

/// Nunito (friendly, rounded) for display and titles; Inter for body text.
TextTheme buildSparkTextTheme(SparkColors c) {
  TextStyle heading(double size, FontWeight weight, {double height = 1.2}) => GoogleFonts.nunito(
        fontSize: size,
        fontWeight: weight,
        height: height,
        color: c.textPrimary,
      );
  TextStyle body(double size, FontWeight weight, Color color, {double height = 1.4}) =>
      GoogleFonts.inter(fontSize: size, fontWeight: weight, height: height, color: color);

  return TextTheme(
    displayLarge: heading(40, FontWeight.w800),
    displayMedium: heading(34, FontWeight.w800),
    displaySmall: heading(28, FontWeight.w800),
    headlineLarge: heading(28, FontWeight.w800),
    headlineMedium: heading(24, FontWeight.w800),
    headlineSmall: heading(22, FontWeight.w700),
    titleLarge: heading(20, FontWeight.w700),
    titleMedium: heading(17, FontWeight.w700),
    titleSmall: heading(15, FontWeight.w700),
    bodyLarge: body(16, FontWeight.w400, c.textPrimary),
    bodyMedium: body(15, FontWeight.w400, c.textSecondary),
    bodySmall: body(13, FontWeight.w400, c.textSecondary),
    labelLarge: body(15, FontWeight.w600, c.textPrimary, height: 1.2),
    labelMedium: body(13, FontWeight.w600, c.textPrimary, height: 1.2),
    labelSmall: body(12, FontWeight.w600, c.textSecondary, height: 1.2),
  );
}

/// Disables runtime font downloads: Nunito and Inter are bundled under
/// assets/google_fonts/ (OFL licensed).
void configureFonts() {
  GoogleFonts.config.allowRuntimeFetching = false;
}
