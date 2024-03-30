import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Dark theme data with custom colors and configurations.
final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff629f80), // Custom primary color
    primaryContainer: Color(0xff274033), // Custom primary container color
    secondary: Color(0xff81b39a), // Custom secondary color
    secondaryContainer: Color(0xff4d6b5c), // Custom secondary container color
    tertiary: Color(0xff88c5a6), // Custom tertiary color
    tertiaryContainer: Color(0xff356c50), // Custom tertiary container color
    appBarColor: Color(0xff356c50), // Custom app bar color
    error: Color(0xffcf6679), // Custom error color
  ),
  usedColors: 2, // Number of colors used in the scheme
  surfaceMode:
      FlexSurfaceMode.levelSurfacesLowScaffold, // Surface mode configuration
  blendLevel: 13, // Blend level for surfaces
  subThemesData: const FlexSubThemesData(
    useM2StyleDividerInM3: true, // Use Material 2 style divider in Material 3
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true, // Use secondary color for key colors
  ),
  visualDensity: FlexColorScheme
      .comfortablePlatformDensity, // Visual density configuration
  useMaterial3: true, // Use Material 3 design
  swapLegacyOnMaterial3: true, // Swap legacy styles on Material 3
  fontFamily: GoogleFonts.ubuntu().fontFamily, // Custom font family
);
