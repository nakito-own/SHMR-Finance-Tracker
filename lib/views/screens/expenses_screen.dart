import 'package:flutter/material.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.expenses),
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.expenses,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
