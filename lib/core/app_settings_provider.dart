import 'dart:async';

import 'package:flutter/material.dart';
import '../data/local/settings_service.dart';

class AppSettingsProvider with ChangeNotifier {
  final SettingsService settingsService;
  final Completer<void> _initCompleter = Completer<void>();

  bool _hapticsEnabled = true;
  bool _soundEnabled = true;
  bool _biometricUnlock = false;
  String? _pinCode;

  AppSettingsProvider(this.settingsService) {
    _load();
  }

  Future<void> _load() async {
    _hapticsEnabled = await settingsService.getHapticsEnabled() ?? true;
    _soundEnabled = await settingsService.getSoundEnabled() ?? true;
    _biometricUnlock = await settingsService.getBiometricUnlock() ?? false;
    _pinCode = await settingsService.getPinCode();
    _initCompleter.complete();
    notifyListeners();
  }

  bool get hapticsEnabled => _hapticsEnabled;
  bool get soundEnabled => _soundEnabled;
  bool get biometricUnlock => _biometricUnlock;
  Future<void> get initialized => _initCompleter.future;
  String? get pinCode => _pinCode;

  set biometricUnlock(bool value) {
    _biometricUnlock = value;
    settingsService.setBiometricUnlock(value);
    notifyListeners();
  }

  set hapticsEnabled(bool value) {
    _hapticsEnabled = value;
    settingsService.setHapticsEnabled(value);
    notifyListeners();
  }

  set soundEnabled(bool value) {
    _soundEnabled = value;
    settingsService.setSoundEnabled(value);
    notifyListeners();
  }

  Future<void> setPinCode(String? code) async {
    _pinCode = code;
    await settingsService.setPinCode(code);
    notifyListeners();
  }
}