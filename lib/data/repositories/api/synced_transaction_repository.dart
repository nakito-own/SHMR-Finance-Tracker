import 'package:shmr_finance/core/network_utils.dart';
import 'package:shmr_finance/data/local/local_transaction_repository.dart';
import 'package:shmr_finance/data/local/pending_ops_storage.dart';
import 'package:shmr_finance/data/repositories/api/api_transaction_repository.dart';
import 'package:shmr_finance/domain/models/transaction/transaction.dart';
import 'package:shmr_finance/domain/repositories/transaction_repository.dart';

class SyncedTransactionRepository implements TransactionRepository {
  final LocalTransactionRepository local;
  final ApiTransactionRepository? remote;
  final PendingOpsStorage storage;

  SyncedTransactionRepository({
    required this.local,
    required this.storage,
    this.remote,
  });

  Future<void> _sync() async {
    if (remote == null) return;
    if (!await hasNetwork()) return;
    final ops = await storage.load();
    for (final op in ops) {
      try {
        final data = op.data;
        final tx = Transaction.fromJson(Map<String, dynamic>.from(data['tx']));
        switch (op.type) {
          case OperationType.create:
            await remote!.add(tx);
            break;
          case OperationType.update:
            await remote!.update(tx);
            break;
          case OperationType.delete:
            await remote!.delete(tx.id.toString());
            break;
        }
      } catch (_) {
        return;
      }
    }
    await storage.clear();
  }

  @override
  Future<List<Transaction>> getAll() async {
    await _sync();
    return local.getAll();
  }

  @override
  Future<void> add(Transaction tx) async {
    await local.add(tx);
    if (remote != null && await hasNetwork()) {
      try {
        await remote!.add(tx);
        return;
      } catch (_) {}
    }
    await storage.add(PendingOperation(OperationType.create, {'tx': tx.toJson()}));
  }

  @override
  Future<void> update(Transaction tx) async {
    await local.update(tx);
    if (remote != null && await hasNetwork()) {
      try {
        await remote!.update(tx);
        return;
      } catch (_) {}
    }
    await storage.add(PendingOperation(OperationType.update, {'tx': tx.toJson()}));
  }

  @override
  Future<void> delete(String id) async {
    await local.delete(id);
    if (remote != null && await hasNetwork()) {
      try {
        await remote!.delete(id);
        return;
      } catch (_) {}
    }
    await storage.add(PendingOperation(OperationType.delete, {'tx': {'id': int.parse(id)}}));
  }
}