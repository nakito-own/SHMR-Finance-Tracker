//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountUpdateRequest {
  /// Returns a new [AccountUpdateRequest] instance.
  AccountUpdateRequest({
    required this.name,
    required this.balance,
    required this.currency,
  });

  String name;

  String balance;

  String currency;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountUpdateRequest &&
    other.name == name &&
    other.balance == balance &&
    other.currency == currency;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (balance.hashCode) +
    (currency.hashCode);

  @override
  String toString() => 'AccountUpdateRequest[name=$name, balance=$balance, currency=$currency]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'balance'] = this.balance;
      json[r'currency'] = this.currency;
    return json;
  }

  /// Returns a new [AccountUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AccountUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AccountUpdateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AccountUpdateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AccountUpdateRequest(
        name: mapValueOfType<String>(json, r'name')!,
        balance: mapValueOfType<String>(json, r'balance')!,
        currency: mapValueOfType<String>(json, r'currency')!,
      );
    }
    return null;
  }

  static List<AccountUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AccountUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, AccountUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AccountUpdateRequest-objects as value to a dart map
  static Map<String, List<AccountUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AccountUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AccountUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'balance',
    'currency',
  };
}

