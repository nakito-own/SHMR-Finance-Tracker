import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';

abstract class TransactionResponseRepository {
  Future<List<TransactionResponse>> getByPeriod({
    required int accountId,
    required DateTime start,
    required DateTime end,
  });
}
