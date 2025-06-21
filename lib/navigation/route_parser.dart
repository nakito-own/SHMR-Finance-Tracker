import 'package:flutter/material.dart';
import 'pages_enum.dart';

class AppRouteInformationParser extends RouteInformationParser<AppPages> {
  @override
  Future<AppPages> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isNotEmpty) {
      switch (uri.pathSegments.first) {
        case 'settings':
          return AppPages.settings;
        case 'income':
          return AppPages.income;
        case 'expenses':
          return AppPages.expenses;
        case 'account':
          return AppPages.account;
        case 'articles':
          return AppPages.articles;
      }
    }
    return AppPages.income;
  }

  @override
  RouteInformation? restoreRouteInformation(AppPages configuration) {
    switch (configuration) {
      case AppPages.history:
        return RouteInformation(uri: Uri.parse('/history'));
      case AppPages.income:
        return RouteInformation(uri: Uri.parse('/income'));
      case AppPages.expenses:
        return RouteInformation(uri: Uri.parse('/expenses'));
      case AppPages.account:
        return RouteInformation(uri: Uri.parse('/account'));
      case AppPages.articles:
        return RouteInformation(uri: Uri.parse('/articles'));
      case AppPages.settings:
        return RouteInformation(uri: Uri.parse('/settings'));
    }
  }

  @override
  Future<AppPages> parseRouteInformationWithDependencies(
      RouteInformation routeInformation,
      BuildContext context,
      ) {
    return parseRouteInformation(routeInformation);
  }
}
