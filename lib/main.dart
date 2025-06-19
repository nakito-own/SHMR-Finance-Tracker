import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_event.dart';
import 'package:shmr_finance/data/repositories/mock/mock_bank_account_repository.dart';
import 'package:shmr_finance/data/repositories/mock/mock_category_repository.dart';
import 'package:shmr_finance/data/repositories/mock/mock_transaction_repository.dart';

import 'core/bloc/bank_account/bank_account_cubit.dart';
import 'core/bloc/category/category_cubit.dart';
import 'core/bloc/transaction/transaction_bloc.dart';
import 'core/theme_provider.dart';
import 'core/locale_provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        BlocProvider(create: (_) => CategoryCubit(MockCategoryRepository())..loadAll()),
        BlocProvider(create: (_) => BankAccountCubit(MockBankAccountRepository())..load()),
        BlocProvider(create: (_) => TransactionBloc(MockTransactionRepository())..add(LoadTransactions())),
      ],
      child: const MyApp(),
    ),
  );
}
