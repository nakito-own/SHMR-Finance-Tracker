//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Transaction {
  /// Returns a new [Transaction] instance.
  Transaction({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;

  int accountId;

  int categoryId;

  String amount;

  DateTime transactionDate;

  String? comment;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Transaction &&
    other.id == id &&
    other.accountId == accountId &&
    other.categoryId == categoryId &&
    other.amount == amount &&
    other.transactionDate == transactionDate &&
    other.comment == comment &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (accountId.hashCode) +
    (categoryId.hashCode) +
    (amount.hashCode) +
    (transactionDate.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (createdAt.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'Transaction[id=$id, accountId=$accountId, categoryId=$categoryId, amount=$amount, transactionDate=$transactionDate, comment=$comment, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'accountId'] = this.accountId;
      json[r'categoryId'] = this.categoryId;
      json[r'amount'] = this.amount;
      json[r'transactionDate'] = this.transactionDate.toUtc().toIso8601String();
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
      json[r'updatedAt'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [Transaction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Transaction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Transaction[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Transaction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Transaction(
        id: mapValueOfType<int>(json, r'id')!,
        accountId: mapValueOfType<int>(json, r'accountId')!,
        categoryId: mapValueOfType<int>(json, r'categoryId')!,
        amount: mapValueOfType<String>(json, r'amount')!,
        transactionDate: mapDateTime(json, r'transactionDate', r'')!,
        comment: mapValueOfType<String>(json, r'comment'),
        createdAt: mapDateTime(json, r'createdAt', r'')!,
        updatedAt: mapDateTime(json, r'updatedAt', r'')!,
      );
    }
    return null;
  }

  static List<Transaction> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Transaction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Transaction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Transaction> mapFromJson(dynamic json) {
    final map = <String, Transaction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Transaction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Transaction-objects as value to a dart map
  static Map<String, List<Transaction>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Transaction>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Transaction.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'accountId',
    'categoryId',
    'amount',
    'transactionDate',
    'createdAt',
    'updatedAt',
  };
}

