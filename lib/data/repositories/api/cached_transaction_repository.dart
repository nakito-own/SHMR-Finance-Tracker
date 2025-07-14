import 'package:shmr_finance/core/network_utils.dart';
import 'package:shmr_finance/data/local/local_transaction_response_repository.dart';
import 'package:shmr_finance/data/repositories/api/api_transaction_repository.dart';
import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';
import 'package:shmr_finance/domain/repositories/transaction_response_repository.dart';

class CachedTransactionRepository implements TransactionResponseRepository {
  final ApiTransactionRepository? remote;
  final LocalTransactionResponseRepository local;

  CachedTransactionRepository({required this.local, this.remote});

  @override
  Future<List<TransactionResponse>> getByPeriod({
    required int accountId,
    required DateTime start,
    required DateTime end,
  }) async {
    final online = await hasNetwork();
    if (online && remote != null) {
      try {
        final list = await remote!.getByPeriod(accountId: accountId, start: start, end: end);
        await local.saveAll(list);
        return list;
      } catch (_) {
        return await local.getByPeriod(accountId: accountId, start: start, end: end);
      }
    }
    return await local.getByPeriod(accountId: accountId, start: start, end: end);
  }
}