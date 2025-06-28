import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/domain/models/account/account.dart';
import 'package:shmr_finance/domain/models/account_create_request/account_create_request.dart';
import 'package:shmr_finance/domain/models/account_update_request/account_update_request.dart';
import 'package:shmr_finance/domain/repositories/bank_account_repository.dart';

class BankAccountCubit extends Cubit<Account?> {
  final BankAccountRepository repository;

  BankAccountCubit(this.repository) : super(null);

  Future<void> load() async {
    try {
      final list = await repository.getAll();
      emit(list.isNotEmpty ? list.first : null);
    } catch (_) {
      emit(null);
    }
  }

  Future<void> create(AccountCreateRequest request) async {
    try {
      final acc = await repository.create(request);
      emit(acc);
    } catch (_) {
      emit(null);
    }
  }

  Future<void> update(AccountUpdateRequest request) async {
    if (state == null) return;
    try {
      final updated = await repository.update(state!.id, request);
      emit(updated);
    } catch (_) {
      emit(null);
    }
  }

  Future<void> delete() async {
    if (state == null) return;
    try {
      await repository.delete(state!.id);
      emit(null);
    } catch (_) {
      emit(null);
    }
  }
}
