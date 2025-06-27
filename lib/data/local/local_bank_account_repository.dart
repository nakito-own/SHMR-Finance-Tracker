import 'package:shmr_finance/data/local/app_database.dart';
import 'package:shmr_finance/domain/models/account/account.dart';
import 'package:shmr_finance/domain/models/account_create_request/account_create_request.dart';
import 'package:shmr_finance/domain/models/account_update_request/account_update_request.dart';
import 'package:shmr_finance/domain/repositories/bank_account_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalBankAccountRepository implements BankAccountRepository {
  final AppDatabase dbProvider;

  LocalBankAccountRepository(this.dbProvider);

  Future<Database> get _db async => dbProvider.database;

  @override
  Future<List<Account>> getAll() async {
    final db = await _db;
    final maps = await db.query('accounts');
    return maps.map((m) => Account.fromJson(m)).toList();
  }

  @override
  Future<Account> create(AccountCreateRequest request) async {
    final db = await _db;
    final id = await db.insert('accounts', {
      //'userId': request.userId,
      'name': request.name,
      'balance': request.balance,
      'currency': request.currency,
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    });
    final map = await db.query('accounts', where: 'id = ?', whereArgs: [id]);
    return Account.fromJson(map.first);
  }

  @override
  Future<Account> update(int id, AccountUpdateRequest request) async {
    final db = await _db;
    await db.update(
      'accounts',
      {
        'name': request.name,
        'balance': request.balance,
        'currency': request.currency,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
    final map = await db.query('accounts', where: 'id = ?', whereArgs: [id]);
    return Account.fromJson(map.first);
  }

  @override
  Future<void> delete(int id) async {
    final db = await _db;
    await db.delete('accounts', where: 'id = ?', whereArgs: [id]);
  }
}