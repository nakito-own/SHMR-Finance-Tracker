import 'package:flutter_test/flutter_test.dart';
import 'package:shmr_finance/data/repositories/mock/mock_transaction_repository.dart';
import 'package:shmr_finance/domain/models/transaction/transaction.dart';

void main() {
  late MockTransactionRepository repository;

  setUp(() {
    repository = MockTransactionRepository();
  });

  test('add, update and delete transaction flow', () async {
    final initial = await repository.getAll();
    expect(initial.length, greaterThan(0));

    // Add a new transaction
    final newTx = Transaction(
      id: 999,
      accountId: 1,
      categoryId: 3,
      amount: '50.00',
      transactionDate: DateTime.parse('2024-06-05T10:00:00Z'),
      comment: 'Test',
      createdAt: DateTime.parse('2024-06-05T10:00:00Z'),
      updatedAt: DateTime.parse('2024-06-05T10:00:00Z'),
    );

    await repository.add(newTx);
    var all = await repository.getAll();
    expect(all.any((t) => t.id == newTx.id), isTrue);

    final updated = newTx.copyWith(comment: 'Updated');
    await repository.update(updated);
    all = await repository.getAll();
    final found = all.firstWhere((t) => t.id == newTx.id);
    expect(found.comment, 'Updated');

    await repository.delete(newTx.id.toString());
    all = await repository.getAll();
    expect(all.any((t) => t.id == newTx.id), isFalse);
  });
}