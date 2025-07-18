import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';
import '../app/category_stats_view.dart';

class AnalysisScreen extends StatefulWidget {
  final bool isIncome;

  const AnalysisScreen({super.key, required this.isIncome});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  late DateTime _start;
  late DateTime _end;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _end = DateTime(now.year, now.month, now.day, 23, 59, 59);
    _start = DateTime(now.year, now.month - 1, now.day);
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _start,
      firstDate: DateTime(2020),
      lastDate: _end,
      locale: Localizations.localeOf(context),
    );

    if (picked != null) {
      setState(() {
        _start = DateTime(picked.year, picked.month, picked.day);
        if (_end.isBefore(_start)) {
          _end = DateTime(picked.year, picked.month, picked.day, 23, 59, 59);
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _end,
      firstDate: _start,
      lastDate: DateTime.now(),
      locale: Localizations.localeOf(context),
    );

    if (picked != null) {
      setState(() {
        _end = DateTime(picked.year, picked.month, picked.day, 23, 59, 59);
      });
    }
  }

  String _formatDateReadable(DateTime date) {
    return DateFormat.yMMMMd(Localizations.localeOf(context).toLanguageTag())
        .format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.analysis),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Column(
                children: [
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.startDate,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        FilledButton(
                          onPressed: _pickStartDate,
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(0, 35),
                          ),
                          child: Text(
                            _formatDateReadable(_start),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.endDate,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        FilledButton(
                          onPressed: _pickEndDate,
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(0, 35),
                          ),
                          child: Text(
                            _formatDateReadable(_end),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ],
              ),
            ),
            Expanded(
              child: CategoryStatsView(
                isIncome: widget.isIncome,
                startDate: _start,
                endDate: _end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}