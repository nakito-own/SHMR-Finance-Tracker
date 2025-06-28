import 'package:flutter/material.dart';
import '../data/local/settings_service.dart';

class ThemeProvider with ChangeNotifier {
  final SettingsService settingsService;
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider(this.settingsService) {
    _load();
  }

  Future<void> _load() async {
    final saved = await settingsService.getThemeMode();
    if (saved != null) {
      _themeMode = saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
    _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    settingsService.setThemeMode(_themeMode == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }
}