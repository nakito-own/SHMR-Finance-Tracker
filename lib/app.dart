import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/auth_provider.dart';
import 'package:shmr_finance/core/bloc/category/category_cubit.dart';
import 'package:shmr_finance/core/dio_client.dart';
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

import 'core/app_settings_provider.dart';
import 'package:local_auth/local_auth.dart';
import 'views/screens/pin_code_screen.dart';
import 'dart:ui';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  late final AppRouterDelegate _routerDelegate;
  late final AppRouteInformationParser _routeInformationParser;
  bool _blur = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = context.read<AppSettingsProvider>();
    if (settings.pinCode != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (settings.biometricUnlock) {
          final auth = LocalAuthentication();
          final ok = await auth.authenticate(localizedReason: 'Unlock');
          if (ok) return;
        }
        if (mounted) {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const PinCodeScreen(isSetup: false)),
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _routerDelegate = AppRouterDelegate();
    _routeInformationParser = AppRouteInformationParser();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _blur = state != AppLifecycleState.resumed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final locale = context.watch<LocaleProvider>();

    final authProvider = AuthProvider();
    ApiTransactionRepository? remoteRepo;

    if (ApiConfig.baseUrl.isNotEmpty) {
      final dioClient = DioClient(authProvider);
      remoteRepo = ApiTransactionRepository(dioClient.dio, authProvider);
    }

    final db = AppDatabase();
    final localRepo = LocalTransactionResponseRepository(db);

    final transactionRepository = CachedTransactionRepository(local: localRepo, remote: remoteRepo);

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
        theme: AppTheme.light(theme.seedColor),
        darkTheme: AppTheme.dark(theme.seedColor),
        locale: locale.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
        builder: (context, child) {
          return Stack(
            children: [
              child!,
              if (_blur)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const ColoredBox(color: Colors.transparent),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
