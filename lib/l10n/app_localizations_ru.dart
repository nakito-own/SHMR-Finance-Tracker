// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get homeTitle => 'Главная';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get toggleTheme => 'Тёмная тема';

  @override
  String get switchLanguage => 'Сменить язык';

  @override
  String get goToSettings => 'Перейти к настройкам';

  @override
  String get backToHome => 'Назад на главную';

  @override
  String currentTheme(Object theme) {
    return 'Текущая тема: $theme';
  }

  @override
  String get income => 'Доходы';

  @override
  String get expenses => 'Расходы';

  @override
  String get account => 'Счет';

  @override
  String get articles => 'Статьи';

  @override
  String get settings => 'Настройки';

  @override
  String get myHistory => 'Моя история';

  @override
  String get myIncomeToday => 'Доходы сегодня';

  @override
  String get myExpensesToday => 'Расходы сегодня';

  @override
  String get startDate => 'Начало';

  @override
  String get endDate => 'Конец';

  @override
  String get all => 'Всего';

  @override
  String get npOperationsForPeriod => 'Операций за выбранный период нет';
}
