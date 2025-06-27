import 'package:flutter/material.dart';
import '../data/local/settings_service.dart';

class LocaleProvider with ChangeNotifier {
  final SettingsService settingsService;
  Locale _locale = const Locale('ru');

  LocaleProvider(this.settingsService) {
    _load();
  }

  Future<void> _load() async {
    final code = await settingsService.getLocaleCode();
    if (code != null) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  Locale get locale => _locale;

  void toggleLocale() {
    _locale = _locale.languageCode == 'en' ? const Locale('ru') : const Locale('en');
    settingsService.setLocaleCode(_locale.languageCode);
    notifyListeners();
  }
}