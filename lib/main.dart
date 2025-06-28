import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shmr_finance/data/local/settings_service.dart';

import 'core/theme_provider.dart';
import 'core/locale_provider.dart';
import 'app.dart';

void main() {
  final settings = SettingsService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(settings)),
        ChangeNotifierProvider(create: (_) => LocaleProvider(settings)),
      ],
      child: const MyApp(),
    ),
  );
}
