import 'package:flutter/material.dart';

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

  static ThemeData light(Color seedColor) {
    final base = _base;
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    );

    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      appBarTheme: base.appBarTheme.copyWith(
        foregroundColor: scheme.onSurface,
        backgroundColor: scheme.surface,
        iconTheme: IconThemeData(color: scheme.onSurface),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: IconThemeData(color: scheme.surface),
      cardColor: scheme.surface,
      textTheme: base.textTheme.apply(
        bodyColor: scheme.surface,
        displayColor: scheme.surface,
      ), colorScheme: scheme.copyWith(surface: scheme.surface),
    );
  }

  static ThemeData dark(Color seedColor) {
    final base = _base;
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );

    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      appBarTheme: base.appBarTheme.copyWith(
        foregroundColor: scheme.onSurface,
        backgroundColor: scheme.surface,
        iconTheme: IconThemeData(color: scheme.onSurface),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: IconThemeData(color: scheme.surface),
      cardColor: scheme.surface,
      textTheme: base.textTheme.apply(
        bodyColor: scheme.surface,
        displayColor: scheme.surface,
      ), colorScheme: scheme.copyWith(surface: scheme.surface),
    );
  }
}
