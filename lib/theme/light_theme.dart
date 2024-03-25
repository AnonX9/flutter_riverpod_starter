import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Light theme data with custom colors and configurations.
final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff065808), // Custom primary color
    primaryContainer: Color(0xff9ee29f), // Custom primary container color
    secondary: Color(0xff365b37), // Custom secondary color
    secondaryContainer: Color(0xffaebdaf), // Custom secondary container color
    tertiary: Color(0xff2c7e2e), // Custom tertiary color
    tertiaryContainer: Color(0xffb8e6b9), // Custom tertiary container color
    appBarColor: Color(0xffb8e6b9), // Custom app bar color
    error: Color(0xffb00020), // Custom error color
  ),
  usedColors: 2, // Number of colors used in the scheme
  surfaceMode:
      FlexSurfaceMode.levelSurfacesLowScaffold, // Surface mode configuration
  blendLevel: 7, // Blend level for surfaces
  subThemesData: const FlexSubThemesData(
    useM2StyleDividerInM3: true, // Use Material 2 style divider in Material 3
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true, // Use secondary color for key colors
    keepPrimary: true, // Keep the primary color when changing scheme
    keepSecondary: true, // Keep the secondary color when changing scheme
    keepPrimaryContainer:
        true, // Keep the primary container color when changing scheme
  ),
  visualDensity: FlexColorScheme
      .comfortablePlatformDensity, // Visual density configuration
  useMaterial3: true, // Use Material 3 design
  swapLegacyOnMaterial3: true, // Swap legacy styles on Material 3
  fontFamily: GoogleFonts.ubuntu().fontFamily, // Custom font family
);
