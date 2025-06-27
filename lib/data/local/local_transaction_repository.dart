import 'package:shmr_finance/data/local/app_database.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;
import '../../../domain/models/transaction/transaction.dart';
import '../../../domain/repositories/transaction_repository.dart';

class LocalTransactionRepository implements TransactionRepository {
  final AppDatabase dbProvider;

  LocalTransactionRepository(this.dbProvider);

  Future<Database> get _db async => dbProvider.database;

  @override
  Future<List<Transaction>> getAll() async {
    final db = await _db;
    final maps = await db.query('transactions');
    return maps.map((m) => Transaction.fromJson(m)).toList();
  }

  @override
  Future<void> add(Transaction tx) async {
    final db = await _db;
    await db.insert('transactions', tx.toJson());
  }

  @override
  Future<void> update(Transaction tx) async {
    final db = await _db;
    await db.update('transactions', tx.toJson(), where: 'id = ?', whereArgs: [tx.id]);
  }

  @override
  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }
}