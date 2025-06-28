import 'package:shmr_finance/data/local/app_database.dart';
import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/domain/repositories/category_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalCategoryRepository implements CategoryRepository {
  final AppDatabase dbProvider;

  LocalCategoryRepository(this.dbProvider);

  Future<Database> get _db async => dbProvider.database;

  @override
  Future<List<Category>> getAll() async {
    final db = await _db;
    final maps = await db.query('categories');
    return maps.map((m) => Category.fromJson(m)).toList();
  }

  @override
  Future<List<Category>> getByType({required bool isIncome}) async {
    final db = await _db;
    final maps = await db.query('categories', where: 'isIncome = ?', whereArgs: [isIncome ? 1 : 0]);
    return maps.map((m) => Category.fromJson(m)).toList();
  }
}