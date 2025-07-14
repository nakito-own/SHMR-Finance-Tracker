import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum OperationType { create, update, delete }

class PendingOperation {
  final OperationType type;
  final Map<String, dynamic> data;

  PendingOperation(this.type, this.data);

  Map<String, dynamic> toJson() => {
    'type': type.index,
    'data': data,
  };

  static PendingOperation fromJson(Map<String, dynamic> json) => PendingOperation(
    OperationType.values[json['type'] as int],
    Map<String, dynamic>.from(json['data'] as Map),
  );
}

class PendingOpsStorage {
  static const _key = 'pending_ops';

  Future<List<PendingOperation>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    final list = json.decode(raw) as List<dynamic>;
    return list
        .map((e) => PendingOperation.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> save(List<PendingOperation> ops) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = json.encode(ops.map((e) => e.toJson()).toList());
    await prefs.setString(_key, raw);
  }

  Future<void> add(PendingOperation op) async {
    final ops = await load();
    ops.add(op);
    await save(ops);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}