import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/domain/repositories/transaction_repository.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository repository;

  TransactionBloc(this.repository) : super(TransactionInitial()) {
    on<LoadTransactions>(_onLoad);
    on<AddTransaction>(_onAdd);
    on<UpdateTransaction>(_onUpdate);
    on<DeleteTransaction>(_onDelete);
  }

  Future<void> _onLoad(
      LoadTransactions event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());
    try {
      final txs = await repository.getAll();
      emit(TransactionLoaded(txs));
    } catch (_) {
      emit(TransactionError("Не удалось загрузить операции"));
    }
  }

  Future<void> _onAdd(
      AddTransaction event, Emitter<TransactionState> emit) async {
    if (state is TransactionLoaded) {
      try {
        await repository.add(event.transaction);
        add(LoadTransactions());
      } catch (_) {
        emit(TransactionError("Не удалось добавить операцию"));
      }
    }
  }

  Future<void> _onUpdate(
      UpdateTransaction event, Emitter<TransactionState> emit) async {
    if (state is TransactionLoaded) {
      try {
        await repository.update(event.transaction);
        add(LoadTransactions());
      } catch (_) {
        emit(TransactionError("Не удалось обновить операцию"));
      }
    }
  }

  Future<void> _onDelete(
      DeleteTransaction event, Emitter<TransactionState> emit) async {
    if (state is TransactionLoaded) {
      try {
        await repository.delete(event.id);
        add(LoadTransactions());
      } catch (_) {
        emit(TransactionError("Не удалось удалить операцию"));
      }
    }
  }
}
