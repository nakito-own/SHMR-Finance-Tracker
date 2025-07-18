import 'package:flutter/material.dart';
import '../data/local/settings_service.dart';

class ThemeProvider with ChangeNotifier {
  final SettingsService settingsService;

  ThemeMode _themeMode = ThemeMode.system;
  Color _seedColor = Colors.green;

  ThemeProvider(this.settingsService) {
    _load();
  }

  Future<void> _load() async {
    final savedMode = await settingsService.getThemeMode();
    final savedColor = await settingsService.getSeedColor();

    if (savedMode != null) {
      _themeMode = savedMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    } else {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      _themeMode =
      brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }

    if (savedColor != null) {
      _seedColor = Color(savedColor);
    }

    notifyListeners();
  }

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  void toggleTheme() {
    _themeMode =
    _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    settingsService.setThemeMode(_themeMode == ThemeMode.dark ? 'dark' : 'light');;
    notifyListeners();
  }

  void setSeedColor(Color color) {
    _seedColor = color;
    settingsService.setSeedColor(color.value);
    notifyListeners();
  }
}