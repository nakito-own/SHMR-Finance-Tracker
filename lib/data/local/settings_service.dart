import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _themeKey = 'theme_mode';
  static const _localeKey = 'locale_code';
  static const _useSystemThemeKey = 'use_system_theme';
  static const _seedColorKey = 'seed_color';
  static const _hapticsKey = 'haptics_enabled';
  static const _soundKey = 'sound_enabled';
  static const _pinCodeKey = 'pin_code';
  static const _biometricKey = 'biometric_unlock';

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
  Future<void> setHapticsEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, value);
  }

  Future<bool?> getHapticsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticsKey);
  }

  Future<void> setSoundEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundKey, value);
  }

  Future<bool?> getSoundEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_soundKey);
  }

  Future<void> setPinCode(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value == null) {
      await prefs.remove(_pinCodeKey);
    } else {
      await prefs.setString(_pinCodeKey, value);
    }
  }

  Future<String?> getPinCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pinCodeKey);
  }

  Future<void> setBiometricUnlock(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_biometricKey, value);
  }

  Future<bool?> getBiometricUnlock() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_biometricKey);
  }
}