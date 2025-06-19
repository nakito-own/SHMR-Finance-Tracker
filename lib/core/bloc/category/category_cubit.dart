import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/domain/repositories/category_repository.dart';

class CategoryCubit extends Cubit<List<Category>> {
  final CategoryRepository repository;

  CategoryCubit(this.repository) : super([]);

  Future<void> loadAll() async {
    try {
      final list = await repository.getAll();
      emit(list);
    } catch (_) {
      emit([]);
    }
  }

  Future<void> loadByType(bool isIncome) async {
    try {
      final list = await repository.getByType(isIncome: isIncome);
      emit(list);
    } catch (_) {
      emit([]);
    }
  }
}
