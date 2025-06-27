import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

abstract class AppTheme {
  static final ThemeData _base = ThemeData(
    useMaterial3: true,

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
      elevation: 0,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 16),
      labelLarge: TextStyle(fontSize: 14, letterSpacing: 0.5),
    ),
  );

  static ThemeData get light => _base.copyWith(
    colorScheme: lightColorScheme,
    appBarTheme: _base.appBarTheme.copyWith(
      foregroundColor: Colors.black,
    ),
  );

  static ThemeData get dark => _base.copyWith(
    colorScheme: darkColorScheme,
    appBarTheme: _base.appBarTheme.copyWith(
      foregroundColor: Colors.white,
    ),
  );
}
