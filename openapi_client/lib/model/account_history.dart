//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountHistory {
  /// Returns a new [AccountHistory] instance.
  AccountHistory({
    required this.id,
    required this.accountId,
    required this.changeType,
    this.previousState,
    required this.newState,
    required this.changeTimestamp,
    required this.createdAt,
  });

  int id;

  int accountId;

  AccountHistoryChangeTypeEnum changeType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AccountState? previousState;

  AccountState newState;

  DateTime changeTimestamp;

  DateTime createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountHistory &&
    other.id == id &&
    other.accountId == accountId &&
    other.changeType == changeType &&
    other.previousState == previousState &&
    other.newState == newState &&
    other.changeTimestamp == changeTimestamp &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (accountId.hashCode) +
    (changeType.hashCode) +
    (previousState == null ? 0 : previousState!.hashCode) +
    (newState.hashCode) +
    (changeTimestamp.hashCode) +
    (createdAt.hashCode);

  @override
  String toString() => 'AccountHistory[id=$id, accountId=$accountId, changeType=$changeType, previousState=$previousState, newState=$newState, changeTimestamp=$changeTimestamp, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'accountId'] = this.accountId;
      json[r'changeType'] = this.changeType;
    if (this.previousState != null) {
      json[r'previousState'] = this.previousState;
    } else {
      json[r'previousState'] = null;
    }
      json[r'newState'] = this.newState;
      json[r'changeTimestamp'] = this.changeTimestamp.toUtc().toIso8601String();
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [AccountHistory] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AccountHistory? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AccountHistory[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AccountHistory[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AccountHistory(
        id: mapValueOfType<int>(json, r'id')!,
        accountId: mapValueOfType<int>(json, r'accountId')!,
        changeType: AccountHistoryChangeTypeEnum.fromJson(json[r'changeType'])!,
        previousState: AccountState.fromJson(json[r'previousState']),
        newState: AccountState.fromJson(json[r'newState'])!,
        changeTimestamp: mapDateTime(json, r'changeTimestamp', r'')!,
        createdAt: mapDateTime(json, r'createdAt', r'')!,
      );
    }
    return null;
  }

  static List<AccountHistory> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountHistory>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountHistory.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AccountHistory> mapFromJson(dynamic json) {
    final map = <String, AccountHistory>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AccountHistory.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AccountHistory-objects as value to a dart map
  static Map<String, List<AccountHistory>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AccountHistory>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AccountHistory.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'accountId',
    'changeType',
    'newState',
    'changeTimestamp',
    'createdAt',
  };
}


class AccountHistoryChangeTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const AccountHistoryChangeTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const CREATION = AccountHistoryChangeTypeEnum._(r'CREATION');
  static const MODIFICATION = AccountHistoryChangeTypeEnum._(r'MODIFICATION');

  /// List of all possible values in this [enum][AccountHistoryChangeTypeEnum].
  static const values = <AccountHistoryChangeTypeEnum>[
    CREATION,
    MODIFICATION,
  ];

  static AccountHistoryChangeTypeEnum? fromJson(dynamic value) => AccountHistoryChangeTypeEnumTypeTransformer().decode(value);

  static List<AccountHistoryChangeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AccountHistoryChangeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AccountHistoryChangeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AccountHistoryChangeTypeEnum] to String,
/// and [decode] dynamic data back to [AccountHistoryChangeTypeEnum].
class AccountHistoryChangeTypeEnumTypeTransformer {
  factory AccountHistoryChangeTypeEnumTypeTransformer() => _instance ??= const AccountHistoryChangeTypeEnumTypeTransformer._();

  const AccountHistoryChangeTypeEnumTypeTransformer._();

  String encode(AccountHistoryChangeTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AccountHistoryChangeTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AccountHistoryChangeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'CREATION': return AccountHistoryChangeTypeEnum.CREATION;
        case r'MODIFICATION': return AccountHistoryChangeTypeEnum.MODIFICATION;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AccountHistoryChangeTypeEnumTypeTransformer] instance.
  static AccountHistoryChangeTypeEnumTypeTransformer? _instance;
}


