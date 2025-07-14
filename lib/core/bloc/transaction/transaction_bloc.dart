import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_event.dart';
import 'package:shmr_finance/core/bloc/transaction/transaction_state.dart';
import 'package:shmr_finance/core/network_utils.dart';
import 'package:shmr_finance/data/repositories/api/cached_transaction_repository.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final CachedTransactionRepository repository;

  TransactionBloc({required this.repository}) : super(TransactionInitial()) {
    on<LoadTransactionsByPeriod>(_onLoadTransactionsByPeriod);
  }

  Future<void> _onLoadTransactionsByPeriod(
      LoadTransactionsByPeriod event,
      Emitter<TransactionState> emit,
      ) async {
    emit(TransactionLoading());

    try {
      final localTxs = await repository.local.getByPeriod(
        accountId: event.accountId,
        start: event.start,
        end: event.end,
      );
      emit(TransactionLoaded(localTxs, fromCache: true));

      final online = await hasNetwork();
      if (online && repository.remote != null) {
        final remoteTxs = await repository.remote!.getByPeriod(
          accountId: event.accountId,
          start: event.start,
          end: event.end,
        );
        await repository.local.saveAll(remoteTxs);
        emit(TransactionLoaded(remoteTxs, fromCache: false));
      }
    } catch (_) {
      emit(TransactionError("Не удалось загрузить транзакции в BLoC вот конкретно тут"));
    }
  }
}
