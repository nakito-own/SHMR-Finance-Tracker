import 'package:flutter/material.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.account),
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.account,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
