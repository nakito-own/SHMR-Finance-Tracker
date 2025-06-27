import 'package:shmr_finance/domain/models/account/account.dart';
import 'package:shmr_finance/domain/models/account_create_request/account_create_request.dart';
import 'package:shmr_finance/domain/models/account_update_request/account_update_request.dart';

abstract class BankAccountRepository {
  Future<List<Account>> getAll();
  Future<Account> create(AccountCreateRequest request);
  Future<Account> update(int id, AccountUpdateRequest request);
  Future<void> delete(int id);
}
