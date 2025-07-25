import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shmr_finance/core/app_settings_provider.dart';
import 'package:shmr_finance/data/local/settings_service.dart';
import 'package:shmr_finance/views/app/navigation_bar.dart';
import 'package:shmr_finance/navigation/pages_enum.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigation bar golden', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final settings = SettingsService();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppSettingsProvider(settings)),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(
            bottomNavigationBar: AppNavigationBar(
              selectedPage: AppPages.income,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(AppNavigationBar),
      matchesGoldenFile('test/goldens/navigation_bar.png'),
    );
  });
}