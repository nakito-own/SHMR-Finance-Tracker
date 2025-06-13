import '../models/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getAll();
  Future<void> add(Transaction tx);
  Future<void> update(Transaction tx);
  Future<void> delete(String id);
}
