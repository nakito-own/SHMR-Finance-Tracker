import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shmr_finance/core/app_settings_provider.dart';
import 'package:shmr_finance/views/screens/pin_code_screen.dart';

import '../../core/locale_provider.dart';
import '../../core/theme_provider.dart';
import '../../l10n/app_localizations.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;
    final settingsProvider = Provider.of<AppSettingsProvider>(context);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
          centerTitle: true,
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 6),
              ListTile(
                title: Text(AppLocalizations.of(context)!.toggleTheme),
                trailing: Switch(
                  value: isDark,
                  onChanged: (_) => themeProvider.toggleTheme(),
                ),
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.pickTintColor),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Color current = themeProvider.seedColor;
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.pickTintColor),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: current,
                            onColorChanged: (c) => current = c,
                            enableAlpha: false,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),
                          TextButton(
                            onPressed: () {
                              themeProvider.setSeedColor(current);
                              Navigator.pop(context);
                            },
                            child: Text(AppLocalizations.of(context)!.save),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.switchLanguage),
                trailing: const Icon(Icons.chevron_right),
                onTap: localeProvider.toggleLocale,
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.haptics),
                trailing: Switch(
                  value: settingsProvider.hapticsEnabled,
                  onChanged: (v) => settingsProvider.hapticsEnabled = v,
                ),
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.sound),
                trailing: Switch(
                  value: settingsProvider.soundEnabled,
                  onChanged: (v) => settingsProvider.soundEnabled = v,
                ),
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.pinCode),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PinCodeScreen(isSetup: true),
                    ),
                  );
                },
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.unlockWithBiometrics),
                trailing: Switch(
                  value: settingsProvider.biometricUnlock,
                  onChanged: (v) => settingsProvider.biometricUnlock = v,
                ),
              ),
              Divider(color: ColorScheme.of(context).secondary),
            ],
          ),
        ),
      ),
    );
  }
}
