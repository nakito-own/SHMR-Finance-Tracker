//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TransactionResponse {
  /// Returns a new [TransactionResponse] instance.
  TransactionResponse({
    required this.id,
    required this.account,
    required this.category,
    required this.amount,
    required this.transactionDate,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;

  AccountBrief account;

  Category category;

  String amount;

  DateTime transactionDate;

  String? comment;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TransactionResponse &&
    other.id == id &&
    other.account == account &&
    other.category == category &&
    other.amount == amount &&
    other.transactionDate == transactionDate &&
    other.comment == comment &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (account.hashCode) +
    (category.hashCode) +
    (amount.hashCode) +
    (transactionDate.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (createdAt.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'TransactionResponse[id=$id, account=$account, category=$category, amount=$amount, transactionDate=$transactionDate, comment=$comment, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'account'] = this.account;
      json[r'category'] = this.category;
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

  /// Returns a new [TransactionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TransactionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TransactionResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TransactionResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TransactionResponse(
        id: mapValueOfType<int>(json, r'id')!,
        account: AccountBrief.fromJson(json[r'account'])!,
        category: Category.fromJson(json[r'category'])!,
        amount: mapValueOfType<String>(json, r'amount')!,
        transactionDate: mapDateTime(json, r'transactionDate', r'')!,
        comment: mapValueOfType<String>(json, r'comment'),
        createdAt: mapDateTime(json, r'createdAt', r'')!,
        updatedAt: mapDateTime(json, r'updatedAt', r'')!,
      );
    }
    return null;
  }

  static List<TransactionResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransactionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransactionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TransactionResponse> mapFromJson(dynamic json) {
    final map = <String, TransactionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TransactionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TransactionResponse-objects as value to a dart map
  static Map<String, List<TransactionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TransactionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TransactionResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'account',
    'category',
    'amount',
    'transactionDate',
    'createdAt',
    'updatedAt',
  };
}

