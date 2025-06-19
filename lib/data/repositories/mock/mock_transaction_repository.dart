import 'package:shmr_finance/domain/models/transaction/transaction.dart';
import 'package:shmr_finance/domain/repositories/transaction_repository.dart';

class MockTransactionRepository implements TransactionRepository {
  final _transactions = <Transaction>[
    Transaction(
      id: 1,
      accountId: 1,
      categoryId: 1,
      amount: '100.00',
      transactionDate: DateTime.parse('2024-06-01T12:00:00Z'),
      comment: 'Lunch',
      createdAt: DateTime.parse('2024-06-01T12:00:00Z'),
      updatedAt: DateTime.parse('2024-06-01T12:00:00Z'),
    ),
    Transaction(
      id: 2,
      accountId: 1,
      categoryId: 2,
      amount: '200.00',
      transactionDate: DateTime.parse('2024-06-03T15:00:00Z'),
      comment: 'Metro',
      createdAt: DateTime.parse('2024-06-03T15:00:00Z'),
      updatedAt: DateTime.parse('2024-06-03T15:00:00Z'),
    ),
  ];

  @override
  Future<List<Transaction>> getAll() async => _transactions;

  @override
  Future<void> add(Transaction tx) async {
    _transactions.add(tx);
  }

  @override
  Future<void> update(Transaction tx) async {
    final index = _transactions.indexWhere((t) => t.id == tx.id);
    if (index != -1) _transactions[index] = tx;
  }

  @override
  Future<void> delete(String id) async {
    _transactions.removeWhere((t) => t.id.toString() == id);
  }
}
