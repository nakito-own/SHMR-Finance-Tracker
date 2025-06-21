import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_event.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_state.dart';
import 'package:shmr_finance/domain/repositories/transaction_response_repository.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionResponseRepository repository;

  TransactionBloc({required this.repository}) : super(TransactionInitial()) {
    on<LoadTransactionsByPeriod>(_onLoadTransactionsByPeriod);
  }

  Future<void> _onLoadTransactionsByPeriod(
      LoadTransactionsByPeriod event,
      Emitter<TransactionState> emit,
      ) async {
    emit(TransactionLoading());

    try {
      final txs = await repository.getByPeriod(
        accountId: event.accountId,
        start: event.start,
        end: event.end,
      );

      emit(TransactionLoaded(txs));
    } catch (_) {
      emit(TransactionError("Не удалось загрузить транзакции"));
    }
  }
}
