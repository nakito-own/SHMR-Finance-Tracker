// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'Home';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get toggleTheme => 'Dark Mode';

  @override
  String get switchLanguage => 'Switch Language';

  @override
  String get goToSettings => 'Go to Settings';

  @override
  String get backToHome => 'Back to Home';

  @override
  String currentTheme(Object theme) {
    return 'Current theme: $theme';
  }

  @override
  String get income => 'Income';

  @override
  String get expenses => 'Expenses';

  @override
  String get account => 'Account';

  @override
  String get articles => 'Articles';

  @override
  String get settings => 'Settings';
}
