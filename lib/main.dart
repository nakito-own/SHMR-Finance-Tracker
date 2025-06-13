import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme_provider.dart';
import 'core/locale_provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
