import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shmr_finance/views/app/daily_transactions_view.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  final bool isIncome;

  const HistoryScreen({super.key, required this.isIncome});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
    return DateFormat.yMMMMd(Localizations.localeOf(context).toLanguageTag()).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myHistory),
          centerTitle: true,
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Column(
                children: [
                  InkWell(
                    onTap: _pickStartDate,
                    child: Container(
                      color: ColorScheme.of(context).secondary,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.startDate,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            _formatDateReadable(_start),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 0, color: Colors.grey),
                  InkWell(
                    onTap: _pickEndDate,
                    child: Container(
                      color: ColorScheme.of(context).secondary,
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.endDate,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            _formatDateReadable(_end),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 0, color: Colors.grey),
                ],
              ),
            ),
            Expanded(
              child: DailyTransactionsView(
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
