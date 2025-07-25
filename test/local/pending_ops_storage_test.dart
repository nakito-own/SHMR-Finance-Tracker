import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shmr_finance/data/local/pending_ops_storage.dart';

void main() {
  late PendingOpsStorage storage;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    storage = PendingOpsStorage();
  });

  test('load returns empty list when no data stored', () async {
    final result = await storage.load();
    expect(result, isEmpty);
  });

  test('save and load roundtrip', () async {
    final ops = [
      PendingOperation(OperationType.create, {'id': 1}),
      PendingOperation(OperationType.update, {'id': 2}),
    ];
    await storage.save(ops);
    final loaded = await storage.load();
    expect(loaded.length, ops.length);
    expect(loaded[0].type, OperationType.create);
    expect(loaded[0].data, {'id': 1});
    expect(loaded[1].type, OperationType.update);
    expect(loaded[1].data, {'id': 2});
  });

  test('add appends new operation', () async {
    final op1 = PendingOperation(OperationType.create, {'id': 1});
    await storage.add(op1);
    final op2 = PendingOperation(OperationType.delete, {'id': 3});
    await storage.add(op2);
    final loaded = await storage.load();
    expect(loaded.length, 2);
    expect(loaded[0].type, OperationType.create);
    expect(loaded[1].type, OperationType.delete);
  });

  test('clear removes all operations', () async {
    await storage.add(PendingOperation(OperationType.create, {'id': 1}));
    await storage.clear();
    final result = await storage.load();
    expect(result, isEmpty);
  });
}
