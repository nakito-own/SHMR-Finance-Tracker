import 'package:shmr_finance/domain/models/category/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAll();
  Future<List<Category>> getByType({required bool isIncome});
}
