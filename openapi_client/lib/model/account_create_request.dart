//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountCreateRequest {
  /// Returns a new [AccountCreateRequest] instance.
  AccountCreateRequest({
    required this.name,
    required this.balance,
    required this.currency,
  });

  String name;

  String balance;

  String currency;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountCreateRequest &&
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
  String toString() => 'AccountCreateRequest[name=$name, balance=$balance, currency=$currency]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'balance'] = this.balance;
      json[r'currency'] = this.currency;
    return json;
  }

  /// Returns a new [AccountCreateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AccountCreateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AccountCreateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AccountCreateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AccountCreateRequest(
        name: mapValueOfType<String>(json, r'name')!,
        balance: mapValueOfType<String>(json, r'balance')!,
        currency: mapValueOfType<String>(json, r'currency')!,
      );
    }
    return null;
  }

  static List<AccountCreateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountCreateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountCreateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AccountCreateRequest> mapFromJson(dynamic json) {
    final map = <String, AccountCreateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountCreateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AccountCreateRequest-objects as value to a dart map
  static Map<String, List<AccountCreateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AccountCreateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AccountCreateRequest.listFromJson(entry.value, growable: growable,);
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

