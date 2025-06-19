import 'package:shmr_finance/domain/models/account/account.dart';
import 'package:shmr_finance/domain/models/account_create_request/account_create_request.dart';
import 'package:shmr_finance/domain/models/account_update_request/account_update_request.dart';
import 'package:shmr_finance/domain/repositories/bank_account_repository.dart';

class MockBankAccountRepository implements BankAccountRepository {
  final _accounts = <Account>[
    Account(
      id: 1,
      userId: 1,
      name: 'Main Account',
      balance: '1000.00',
      currency: 'USD',
      createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
      updatedAt: DateTime.parse('2024-06-01T00:00:00Z'),
    ),
  ];

  @override
  Future<List<Account>> getAll() async => _accounts;

  @override
  Future<Account> create(AccountCreateRequest request) async {
    final newAccount = Account(
      id: _accounts.length + 1,
      userId: 1,
      name: request.name,
      balance: request.balance,
      currency: request.currency,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _accounts.add(newAccount);
    return newAccount;
  }

  @override
  Future<Account> update(int id, AccountUpdateRequest request) async {
    final index = _accounts.indexWhere((a) => a.id == id);
    if (index == -1) throw Exception('Account not found');

    final updated = _accounts[index].copyWith(
      name: request.name,
      balance: request.balance,
      currency: request.currency,
      updatedAt: DateTime.now(),
    );
    _accounts[index] = updated;
    return updated;
  }
}
