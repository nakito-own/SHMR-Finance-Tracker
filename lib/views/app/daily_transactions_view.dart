import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_event.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_state.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class DailyTransactionsView extends StatefulWidget {
  final bool isIncome;
  final DateTime startDate;
  final DateTime endDate;

  const DailyTransactionsView({
    super.key,
    required this.isIncome,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<DailyTransactionsView> createState() => _DailyTransactionsViewState();
}

class _DailyTransactionsViewState extends State<DailyTransactionsView> {
  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  @override
  void didUpdateWidget(covariant DailyTransactionsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startDate != oldWidget.startDate || widget.endDate != oldWidget.endDate) {
      _fetchTransactions();
    }
  }

  void _fetchTransactions() {
    context.read<TransactionBloc>().add(
      LoadTransactionsByPeriod(
        accountId: 1,
        start: widget.startDate,
        end: widget.endDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TransactionError) {
          return Center(child: Text(state.message));
        } else if (state is TransactionLoaded) {
          final filtered = state.transactions
              .where((tx) => tx.category.isIncome == widget.isIncome)
              .toList();

          final total = filtered.fold<double>(
            0.0,
                (sum, tx) => sum + (double.tryParse(tx.amount) ?? 0),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)!.all, style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    Text('${total.toStringAsFixed(2)} ₽', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              if (filtered.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.npOperationsForPeriod),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final tx = filtered[index];
                      final category = tx.category;
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: ColorScheme.of(context).secondary,
                              child: Text(category.emoji),
                            ),
                            title: Text(category.name),
                            subtitle: Text(tx.comment ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${tx.amount} ₽', style: TextTheme.of(context).titleMedium),
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 0, color: Colors.grey[200]),
                        ],
                      );
                    },
                  ),
                ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
