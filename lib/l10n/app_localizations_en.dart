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

  @override
  String get myHistory => 'My History';

  @override
  String get myIncomeToday => 'Income Today';

  @override
  String get myExpensesToday => 'Expenses Today';

  @override
  String get startDate => 'Start';

  @override
  String get endDate => 'End';

  @override
  String get all => 'All';

  @override
  String get analysis => 'Analysis';

  @override
  String get sum => 'Sum';

  @override
  String get npOperationsForPeriod => 'There is no operation for the selected period';

  @override
  String get myArticles => 'My Articles';

  @override
  String get searchArticles => 'Find an article';

  @override
  String get editName => 'Edit name';

  @override
  String get editCurrency => 'Change currency';

  @override
  String get name => 'Name';

  @override
  String get currency => 'Currency';

  @override
  String get noAccount => 'Account not found';

  @override
  String get balance => 'Balance';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get confirmDeleteAccount => 'Are you sure you want to delete this account?';

  @override
  String get offlineMode => 'No internet connection. Showing cached data';

  @override
  String get onlineMode => 'Connected. Showing data from server';
}
