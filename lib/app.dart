import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shmr_finance/core/auth_provider.dart';

import 'core/theme_provider.dart';
import 'core/locale_provider.dart';

import 'core/bloc/bank_account/bank_account_cubit.dart';
import 'core/bloc/transaction/transaction_bloc.dart';

import 'config/api_config.dart';
import 'navigation/router_delegate.dart';
import 'navigation/route_parser.dart';
import 'l10n/app_localizations.dart';

import 'data/repositories/api/api_transaction_repository.dart';
import 'data/repositories/mock/mock_bank_account_repository.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouterDelegate _routerDelegate;
  late final AppRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _routerDelegate = AppRouterDelegate();
    _routeInformationParser = AppRouteInformationParser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final locale = context.watch<LocaleProvider>();

    final authProvider = AuthProvider();
    final dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));

    final transactionRepository = ApiTransactionRepository(dio, authProvider);
    final bankAccountRepository = MockBankAccountRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BankAccountCubit(bankAccountRepository)..load()),
        BlocProvider(
          create: (_) => TransactionBloc(repository: transactionRepository),
        ),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: theme.themeMode,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromRGBO(42, 232, 129, 1),
            secondary: Color.fromRGBO(243, 237, 247, 1),
            surface: Color.fromRGBO(254, 247, 255, 1),
            onPrimary: Colors.black,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
          ),
        ),
        locale: locale.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      ),
    );
  }
}
