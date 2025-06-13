import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/locale_provider.dart';
import '../../core/theme_provider.dart';
import '../../l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.toggleTheme),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (_) => themeProvider.toggleTheme(),
                ),
              ),
              Divider(color: ColorScheme.of(context).secondary),
              ListTile(
                title: Text(AppLocalizations.of(context)!.switchLanguage),
                trailing: FilledButton(
                  onPressed: localeProvider.toggleLocale,
                  child: Text(localeProvider.locale.languageCode.toUpperCase()),
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
