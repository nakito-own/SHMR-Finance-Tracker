import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_event.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_state.dart';
import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';
import 'package:shmr_finance/views/screens/transaction_form_screen.dart';
import 'package:category_chart/category_chart.dart';

class CategoryStatsView extends StatefulWidget {
  final bool isIncome;
  final DateTime startDate;
  final DateTime endDate;

  const CategoryStatsView({
    super.key,
    required this.isIncome,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<CategoryStatsView> createState() => _CategoryStatsViewState();
}

class _CategoryStatsViewState extends State<CategoryStatsView> {
  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  @override
  void didUpdateWidget(covariant CategoryStatsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startDate != oldWidget.startDate ||
        widget.endDate != oldWidget.endDate) {
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

          final totalSum = filtered.fold<double>(
            0.0,
                (sum, tx) => sum + (double.tryParse(tx.amount) ?? 0),
          );

          final Map<Category, List<TransactionResponse>> grouped = {};
          for (final tx in filtered) {
            grouped.putIfAbsent(tx.category, () => []).add(tx);
          }

          final groups = grouped.entries.map((entry) {
            final total = entry.value.fold<double>(
              0.0,
                  (sum, tx) => sum + (double.tryParse(tx.amount) ?? 0),
            );
            entry.value.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
            return _CategoryGroup(
              category: entry.key,
              total: total,
              transactions: entry.value,
            );
          }).toList();

          if (groups.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.npOperationsForPeriod,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          final chartData = <PieData>[];
          for (var i = 0; i < groups.length; i++) {
            chartData.add(
              PieData(
                label: groups[i].category.name,
                value: groups[i].total,
                color: Colors.primaries[i % Colors.primaries.length],
              ),
            );
          }

          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(AppLocalizations.of(context)!.sum,
                            style: Theme.of(context).textTheme.titleMedium),
                        const Spacer(),
                        Text('${totalSum.toStringAsFixed(0)} ₽',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),
                  const Divider(height: 0, color: Colors.grey),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: CategoryPieChart(data: chartData),
                    ),
                  ),
                  const Divider(height: 0, color: Colors.grey),
                  Expanded(
                    child: ListView.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        final lastTx = group.transactions.first;
                        final percent =
                        totalSum == 0 ? 0 : (group.total / totalSum * 100);
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: ColorScheme.of(context).secondary,
                                child: Text(group.category.emoji),
                              ),
                              title: Text(group.category.name),
                              subtitle: Text(lastTx.comment ?? ''),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('${group.total.toStringAsFixed(0)} ₽', style: Theme.of(context).textTheme.bodyLarge),
                                      Text('${percent.toStringAsFixed(1)}%', style: Theme.of(context).textTheme.bodySmall),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios,
                                        size: 16, color: Colors.grey),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => _CategoryTransactionsScreen(
                                            category: group.category,
                                            transactions: group.transactions,
                                          ),
                                        ),
                                      );
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

class _CategoryGroup {
  final Category category;
  final double total;
  final List<TransactionResponse> transactions;

  _CategoryGroup({
    required this.category,
    required this.total,
    required this.transactions,
  });
}

class _CategoryTransactionsScreen extends StatelessWidget {
  final Category category;
  final List<TransactionResponse> transactions;

  const _CategoryTransactionsScreen({
    Key? key,
    required this.category,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return ListTile(
            title: Text('${tx.amount} ₽'),
            subtitle: Text(DateFormat.yMMMd().add_Hm().format(tx.transactionDate)),
            trailing: Text(tx.comment ?? ''),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => TransactionFormScreen(transaction: tx, isIncome: category.isIncome),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
