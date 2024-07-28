import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme
{
  ThemeData get themData
  {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  static ColorScheme get _colorScheme
  {
    return const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff909cdf),
        onPrimary: Color(0xffFFFFDE),
        primaryContainer: Color(0xffF2F3FB),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xff9C254D),
        onSecondary: Color(0xffFFFFEC),
        secondaryContainer: Color(0xffdfa3b7),
        tertiary: Color(0xffb6c2ff),
        tertiaryContainer: Color(0xffFFFFDE),
        error: Color(0xff5e162e),
        errorContainer: Color(0xffFCD8DF),
        onError: Color(0xffF5E9ED),
        surface: Color(0xffF4F5FC),
        onSurface: Color(0xff0E1016),
        surfaceTint: Color(0xff909CDF),
        inverseSurface: Color(0xff121212),
        outline: Color(0xff737373),
        outlineVariant: Color(0xffBFBFBF),
    );
  }

  static TextTheme get _textTheme
  {
      const textTheme = TextTheme();

      final bodyFont = GoogleFonts.ibmPlexSansTextTheme(textTheme);
      final headingFont = GoogleFonts.syneMonoTextTheme(textTheme);

      return bodyFont.copyWith(
        displayLarge: headingFont.displayLarge,
        displayMedium: headingFont.displayMedium,
        displaySmall: headingFont.displaySmall,
        headlineLarge: headingFont.headlineLarge,
        headlineMedium: headingFont.headlineMedium,
        headlineSmall: headingFont.headlineSmall,
        bodyLarge: bodyFont.bodyLarge,
        bodyMedium: bodyFont.bodyMedium,
        bodySmall: bodyFont.bodySmall
      );
  }

  static InputDecorationTheme get _inputTheme
  {
    return InputDecorationTheme(
      filled: true,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    );
  }

  static FilledButtonThemeData get _filledButtonTheme
  {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Color(0xffb6c2ff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}