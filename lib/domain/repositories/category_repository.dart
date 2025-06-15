import '../models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAll();
  Future<List<Category>> getByType({required bool isIncome});
}
