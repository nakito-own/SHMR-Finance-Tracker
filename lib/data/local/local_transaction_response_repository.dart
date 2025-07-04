import 'package:shmr_finance/data/local/app_database.dart';
import 'package:shmr_finance/domain/models/account_brief/account_brief.dart';
import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';
import 'package:shmr_finance/domain/repositories/transaction_response_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalTransactionResponseRepository implements TransactionResponseRepository {
  final AppDatabase dbProvider;

  LocalTransactionResponseRepository(this.dbProvider);

  Future<Database> get _db async => dbProvider.database;

  @override
  Future<List<TransactionResponse>> getByPeriod({required int accountId, required DateTime start, required DateTime end}) async {
    final db = await _db;
    final maps = await db.rawQuery('''
      SELECT t.*, a.id as a_id, a.name as a_name, a.balance as a_balance, a.currency as a_currency,
             c.id as c_id, c.name as c_name, c.emoji as c_emoji, c.isIncome as c_isIncome
      FROM transactions t
      JOIN accounts a ON t.accountId = a.id
      JOIN categories c ON t.categoryId = c.id
      WHERE t.accountId = ? AND t.transactionDate BETWEEN ? AND ?
    ''', [accountId, start.toIso8601String(), end.toIso8601String()]);

    return maps.map((m) {
      final account = AccountBrief(
        id: m['a_id'] as int,
        name: m['a_name'] as String,
        balance: m['a_balance'] as String,
        currency: m['a_currency'] as String,
      );
      final category = Category(
        id: m['c_id'] as int,
        name: m['c_name'] as String,
        emoji: m['c_emoji'] as String,
        isIncome: (m['c_isIncome'] as int) == 1,
      );
      return TransactionResponse(
        id: m['id'] as int,
        account: account,
        category: category,
        amount: m['amount'] as String,
        transactionDate: DateTime.parse(m['transactionDate'] as String),
        comment: m['comment'] as String?,
        createdAt: DateTime.parse(m['createdAt'] as String),
        updatedAt: DateTime.parse(m['updatedAt'] as String),
      );
    }).toList();
  }

  Future<void> saveAll(List<TransactionResponse> list) async {
    final db = await _db;
    final batch = db.batch();
    for (final tx in list) {
      batch.insert(
        'accounts',
        {
          'id': tx.account.id,
          'name': tx.account.name,
          'balance': tx.account.balance,
          'currency': tx.account.currency,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      batch.insert(
        'categories',
        {
          'id': tx.category.id,
          'name': tx.category.name,
          'emoji': tx.category.emoji,
          'isIncome': tx.category.isIncome ? 1 : 0,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      batch.insert(
        'transactions',
        {
          'id': tx.id,
          'accountId': tx.account.id,
          'categoryId': tx.category.id,
          'amount': tx.amount,
          'transactionDate': tx.transactionDate.toIso8601String(),
          'comment': tx.comment,
          'createdAt': tx.createdAt.toIso8601String(),
          'updatedAt': tx.updatedAt.toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }
}