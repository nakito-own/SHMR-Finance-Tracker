import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shmr_finance/core/auth_provider.dart';
import 'package:shmr_finance/core/bloc/category/category_cubit.dart';
import 'package:shmr_finance/core/theme/app_theme.dart';
import 'package:shmr_finance/data/local/app_database.dart';
import 'package:shmr_finance/data/local/local_transaction_response_repository.dart';
import 'package:shmr_finance/data/repositories/api/cached_transaction_repository.dart';
import 'package:shmr_finance/data/repositories/mock/mock_category_repository.dart';

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

    final remoteRepo = ApiTransactionRepository(dio, authProvider);
    final db = AppDatabase();
    final localRepo = LocalTransactionResponseRepository(db);
    final transactionRepository = CachedTransactionRepository(remote: remoteRepo, local: localRepo);
    final bankAccountRepository = MockBankAccountRepository();
    final categoryRepository = MockCategoryRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BankAccountCubit(bankAccountRepository)..load()),
        BlocProvider(create: (_) => CategoryCubit(categoryRepository)..loadAll()),
        BlocProvider(
          create: (_) => TransactionBloc(repository: transactionRepository),
        ),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: theme.themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        locale: locale.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      ),
    );
  }
}
