import 'package:flutter/material.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.income),
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.income,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
