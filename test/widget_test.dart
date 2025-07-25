import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shmr_finance/data/local/settings_service.dart';
import 'package:shmr_finance/core/theme_provider.dart';
import 'package:shmr_finance/core/locale_provider.dart';
import 'package:shmr_finance/core/app_settings_provider.dart';
import 'package:shmr_finance/views/screens/settings_screen.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

void main() {

  late SettingsService settingsService;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    settingsService = SettingsService();
  });

  Widget buildTestWidget() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(settingsService)),
        ChangeNotifierProvider(create: (_) => LocaleProvider(settingsService)),
        ChangeNotifierProvider(create: (_) => AppSettingsProvider(settingsService)),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SettingsScreen(),
      ),
    );
  }

  testWidgets('toggling theme switch changes theme mode', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    final switchFinder = find.descendant(
      of: find.widgetWithText(ListTile, 'Dark Mode'),
      matching: find.byType(Switch),
    );

    expect(switchFinder, findsOneWidget);

    final element = tester.element(switchFinder);
    final provider = Provider.of<ThemeProvider>(element, listen: false);
    final initialMode = provider.themeMode;

    await tester.tap(switchFinder);
    await tester.pump();

    expect(provider.themeMode, isNot(initialMode));
  });
}