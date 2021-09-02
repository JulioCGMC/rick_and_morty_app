import 'package:flutter/material.dart';

class DefaultStyle {
  // final MaterialColor swatch = 
  static LightTheme light = LightTheme();
  static DarkTheme dark = DarkTheme();

  static ColorScheme get currentTheme {
    return light;
  }
}

class LightTheme extends ColorScheme {
  const LightTheme({
    primary = const Color(0xFFAA7BE5),
    primaryVariant = const Color(0xFF772AD5),
    secondary = const Color(0xFF60DBC6),
    secondaryVariant = const Color(0xFF2FD0B5),
    surface = const Color(0xFF3C3E44),
    background = const Color(0xFF24282F),
    error = const Color(0xFFED4954),
    onPrimary = Colors.white,
    onSecondary = Colors.black,
    onSurface = Colors.black,
    onBackground = Colors.black,
    onError = Colors.white,
    brightness = Brightness.light
  }) : super(
    primary: primary,
    primaryVariant: primaryVariant,
    secondary: secondary,
    secondaryVariant: secondaryVariant,
    surface: surface,
    background: background,
    error: error,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    onBackground: onBackground,
    onError: onError,
    brightness: brightness,
  );
}

class DarkTheme extends ColorScheme {
  const DarkTheme({
    primary = const Color(0xFFAA7BE5),
    primaryVariant = const Color(0xFF772AD5),
    secondary = const Color(0xFF60DBC6),
    secondaryVariant = const Color(0xFF2FD0B5),
    surface = const Color(0xFF3C3E44),
    background = const Color(0xFF24282F),
    error = const Color(0xFFED4954),
    onPrimary = Colors.white,
    onSecondary = Colors.black,
    onSurface = Colors.black,
    onBackground = Colors.black,
    onError = Colors.white,
    brightness = Brightness.dark,
  }) : super(
    primary: primary,
    primaryVariant: primaryVariant,
    secondary: secondary,
    secondaryVariant: secondaryVariant,
    surface: surface,
    background: background,
    error: error,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    onBackground: onBackground,
    onError: onError,
    brightness: brightness,
  );
}
