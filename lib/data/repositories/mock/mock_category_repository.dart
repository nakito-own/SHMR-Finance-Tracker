import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/domain/repositories/category_repository.dart';

class MockCategoryRepository implements CategoryRepository {
  final _categories = <Category>[
    Category(id: 1, name: 'Food', emoji: '🍔', isIncome: false),
    Category(id: 2, name: 'Transport', emoji: '🚌', isIncome: false),
    Category(id: 3, name: 'Salary', emoji: '💰', isIncome: true),
    Category(id: 4, name: 'Gifts', emoji: '🎁', isIncome: true),
  ];

  @override
  Future<List<Category>> getAll() async => _categories;

  @override
  Future<List<Category>> getByType({required bool isIncome}) async =>
      _categories.where((c) => c.isIncome == isIncome).toList();
}
