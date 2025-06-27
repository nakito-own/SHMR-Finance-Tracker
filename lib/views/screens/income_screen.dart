import 'package:flutter/material.dart';
import 'package:shmr_finance/views/app/daily_transactions_view.dart';
import 'package:shmr_finance/views/screens/history_screen.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_event.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myIncomeToday),
          centerTitle: true,
          backgroundColor: ColorScheme.of(context).primary,
          actions: [
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const HistoryScreen(isIncome: true)),
                );
                final now = DateTime.now();
                context.read<TransactionBloc>().add(
                  LoadTransactionsByPeriod(
                    accountId: 1,
                    start: DateTime(now.year, now.month, now.day),
                    end: DateTime(now.year, now.month, now.day, 23, 59, 59),
                  ),
                );
              },
            ),
          ],
        ),
        body: DailyTransactionsView(
          isIncome: true,
          startDate: todayStart,
          endDate: todayEnd,
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {},
          child: Icon(Icons.add, color: ColorScheme.of(context).surface),
        ),
      ),
    );
  }
}
