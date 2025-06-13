import 'package:flutter/material.dart';
import '../views/app/navigation_bar.dart';
import '../views/screens/settings_screen.dart';
import '../views/screens/income_screen.dart';
import '../views/screens/expenses_screen.dart';
import '../views/screens/account_screen.dart';
import '../views/screens/articles_screen.dart';
import 'pages_enum.dart';

class AppRouterDelegate extends RouterDelegate<AppPages>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPages> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppPages _currentPage = AppPages.income;

  @override
  AppPages? get currentConfiguration => _currentPage;

  void _handlePageChange(AppPages page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_currentPage) {
      case AppPages.settings:
        body = const SettingsScreen();
        break;
      case AppPages.income:
        body = const IncomeScreen();
        break;
      case AppPages.expenses:
        body = const ExpensesScreen();
        break;
      case AppPages.account:
        body = const AccountScreen();
        break;
      case AppPages.articles:
        body = const ArticlesScreen();
        break;
    }

    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey(_currentPage),
          child: Scaffold(
            body: body,
            bottomNavigationBar: AppNavigationBar(
              selectedPage: _currentPage,
              onDestinationSelected: _handlePageChange,
            ),
          ),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _handlePageChange(AppPages.income);
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppPages configuration) async {
    _currentPage = configuration;
  }
}
