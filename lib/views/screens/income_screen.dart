import 'package:flutter/material.dart';
import 'package:shmr_finance/views/app/daily_transactions_view.dart';
import 'package:shmr_finance/views/screens/history_screen.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const HistoryScreen(isIncome: true)),
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
