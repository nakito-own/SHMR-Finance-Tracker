import 'package:flutter/material.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.articles),
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.articles,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
