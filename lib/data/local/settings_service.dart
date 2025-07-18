import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _themeKey = 'theme_mode';
  static const _localeKey = 'locale_code';
  static const _useSystemThemeKey = 'use_system_theme';
  static const _seedColorKey = 'seed_color';

  Future<void> setThemeMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode);
  }

  Future<String?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }

  Future<void> setUseSystemTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_useSystemThemeKey, value);
  }

  Future<bool?> getUseSystemTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_useSystemThemeKey);
  }

  Future<void> setSeedColor(int color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_seedColorKey, color);
  }

  Future<int?> getSeedColor() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_seedColorKey);
  }

  Future<void> setLocaleCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, code);
  }

  Future<String?> getLocaleCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localeKey);
  }
}