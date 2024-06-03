import 'package:flutter/material.dart';

abstract class StylesServices {
  static ThemeData defaultTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white.withAlpha(190),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[800]!),
      useMaterial3: true,
    );
  }

  static const String fontFamily = 'Poppins';

  static const double defaultPadding = 20.0;

  static const double defaultBorderRadius = 8.0;

  static const double defaultBorderWidth = 2.0;

  static const double defaultElevation = 4.0;

  static const double defaultIconSize = 24.0;

  static const double defaultFontSize = 16.0;

  static const double defaultFontSizeSmall = 12.0;

  static const double defaultFontSizeMedium = 14.0;

  static const double defaultFontSizeLarge = 16.0;

  static const double defaultFontSizeXLarge = 18.0;

  static const double defaultFontSizeXXLarge = 20.0;

  static const ThemeMode defaultThemeMode = ThemeMode.dark;

  static const ColorScheme defaultColorScheme = ColorScheme(
    primary: Colors.red,
    secondary: Colors.blue,
    surface: Colors.green,
    background: Colors.yellow,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static const ColorScheme defaultDarkColorScheme = ColorScheme(
    primary: Colors.red,
    secondary: Colors.blue,
    surface: Colors.green,
    background: Colors.yellow,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  );
}
