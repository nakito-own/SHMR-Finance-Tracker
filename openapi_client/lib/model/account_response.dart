//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountResponse {
  /// Returns a new [AccountResponse] instance.
  AccountResponse({
    required this.id,
    required this.name,
    required this.balance,
    required this.currency,
    this.incomeStats = const [],
    this.expenseStats = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  int id;

  String name;

  String balance;

  String currency;

  List<StatItem> incomeStats;

  List<StatItem> expenseStats;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountResponse &&
    other.id == id &&
    other.name == name &&
    other.balance == balance &&
    other.currency == currency &&
    _deepEquality.equals(other.incomeStats, incomeStats) &&
    _deepEquality.equals(other.expenseStats, expenseStats) &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (balance.hashCode) +
    (currency.hashCode) +
    (incomeStats.hashCode) +
    (expenseStats.hashCode) +
    (createdAt.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'AccountResponse[id=$id, name=$name, balance=$balance, currency=$currency, incomeStats=$incomeStats, expenseStats=$expenseStats, createdAt=$createdAt, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'balance'] = this.balance;
      json[r'currency'] = this.currency;
      json[r'incomeStats'] = this.incomeStats;
      json[r'expenseStats'] = this.expenseStats;
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
      json[r'updatedAt'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [AccountResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AccountResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AccountResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AccountResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AccountResponse(
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        balance: mapValueOfType<String>(json, r'balance')!,
        currency: mapValueOfType<String>(json, r'currency')!,
        incomeStats: StatItem.listFromJson(json[r'incomeStats']),
        expenseStats: StatItem.listFromJson(json[r'expenseStats']),
        createdAt: mapDateTime(json, r'createdAt', r'')!,
        updatedAt: mapDateTime(json, r'updatedAt', r'')!,
      );
    }
    return null;
  }

  static List<AccountResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AccountResponse> mapFromJson(dynamic json) {
    final map = <String, AccountResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AccountResponse-objects as value to a dart map
  static Map<String, List<AccountResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AccountResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AccountResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'balance',
    'currency',
    'incomeStats',
    'expenseStats',
    'createdAt',
    'updatedAt',
  };
}

