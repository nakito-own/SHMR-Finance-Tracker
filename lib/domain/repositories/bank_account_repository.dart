import '../models/account.dart';
import '../models/account_create_request.dart';
import '../models/account_update_request.dart';

abstract class BankAccountRepository {
  Future<List<Account>> getAll();
  Future<Account> create(AccountCreateRequest request);
  Future<Account> update(int id, AccountUpdateRequest request);
}
