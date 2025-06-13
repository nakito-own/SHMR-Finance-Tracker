//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountHistoryResponse {
  /// Returns a new [AccountHistoryResponse] instance.
  AccountHistoryResponse({
    required this.accountId,
    required this.accountName,
    required this.currency,
    required this.currentBalance,
    this.history = const [],
  });

  int accountId;

  String accountName;

  String currency;

  String currentBalance;

  List<AccountHistory> history;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountHistoryResponse &&
    other.accountId == accountId &&
    other.accountName == accountName &&
    other.currency == currency &&
    other.currentBalance == currentBalance &&
    _deepEquality.equals(other.history, history);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId.hashCode) +
    (accountName.hashCode) +
    (currency.hashCode) +
    (currentBalance.hashCode) +
    (history.hashCode);

  @override
  String toString() => 'AccountHistoryResponse[accountId=$accountId, accountName=$accountName, currency=$currency, currentBalance=$currentBalance, history=$history]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accountId'] = this.accountId;
      json[r'accountName'] = this.accountName;
      json[r'currency'] = this.currency;
      json[r'currentBalance'] = this.currentBalance;
      json[r'history'] = this.history;
    return json;
  }

  /// Returns a new [AccountHistoryResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AccountHistoryResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AccountHistoryResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AccountHistoryResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AccountHistoryResponse(
        accountId: mapValueOfType<int>(json, r'accountId')!,
        accountName: mapValueOfType<String>(json, r'accountName')!,
        currency: mapValueOfType<String>(json, r'currency')!,
        currentBalance: mapValueOfType<String>(json, r'currentBalance')!,
        history: AccountHistory.listFromJson(json[r'history']),
      );
    }
    return null;
  }

  static List<AccountHistoryResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountHistoryResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountHistoryResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AccountHistoryResponse> mapFromJson(dynamic json) {
    final map = <String, AccountHistoryResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountHistoryResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AccountHistoryResponse-objects as value to a dart map
  static Map<String, List<AccountHistoryResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AccountHistoryResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AccountHistoryResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accountId',
    'accountName',
    'currency',
    'currentBalance',
    'history',
  };
}

