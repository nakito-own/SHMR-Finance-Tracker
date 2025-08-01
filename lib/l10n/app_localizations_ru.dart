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
  String get analysis => 'Анализ';

  @override
  String get sum => 'Сумма';

  @override
  String get npOperationsForPeriod => 'Операций за выбранный период нет';

  @override
  String get myArticles => 'Мои статьи';

  @override
  String get searchArticles => 'Найти статью';

  @override
  String get editName => 'Изменить имя';

  @override
  String get editCurrency => 'Изменить валюту';

  @override
  String get name => 'Название';

  @override
  String get currency => 'Валюта';

  @override
  String get noAccount => 'Счет не найден';

  @override
  String get balance => 'Баланс';

  @override
  String get deleteAccount => 'Удалить счет';

  @override
  String get confirmDeleteAccount => 'Удалить этот счет?';

  @override
  String get offlineMode => 'Нет соединения с интернетом. Показаны сохраненные данные';

  @override
  String get onlineMode => 'Соединение установлено';

  @override
  String get editOperation => 'Редактировать операцию';

  @override
  String get createOperation => 'Создать операцию';

  @override
  String get category => 'Статья';

  @override
  String get date => 'Дата';

  @override
  String get comment => 'Комментарий';

  @override
  String get save => 'Сохранить';

  @override
  String get fillAllFields => 'Не все поля заполнены';

  @override
  String get myAccount => 'Мой счет';

  @override
  String get days => 'По дням';

  @override
  String get months => 'По месяцам';

  @override
  String get useSystemTheme => 'Использовать системную тему';

  @override
  String get pickTintColor => 'Выбрать основной цвет';

  @override
  String get cancel => 'Отмена';

  @override
  String get haptics => 'Вибрация';

  @override
  String get sound => 'Звук';

  @override
  String get pinCode => 'Код-пароль';

  @override
  String get unlockWithBiometrics => 'Разблокировка по биометрии';

  @override
  String get setPin => 'Установить PIN';

  @override
  String get enterPin => 'Введите PIN';

  @override
  String get wrongPin => 'Неверный код';
}
