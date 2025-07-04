import 'package:shmr_finance/domain/models/transaction_response/transaction_response.dart';

abstract class TransactionState {
  const TransactionState();
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionResponse> transactions;
  final bool fromCache;

  const TransactionLoaded(this.transactions, {this.fromCache = false});
}

class TransactionError extends TransactionState {
  final String message;

  const TransactionError(this.message);
}
