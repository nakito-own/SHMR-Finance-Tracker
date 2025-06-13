//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatItem {
  /// Returns a new [StatItem] instance.
  StatItem({
    required this.categoryId,
    required this.categoryName,
    required this.emoji,
    required this.amount,
  });

  int categoryId;

  String categoryName;

  String emoji;

  String amount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatItem &&
    other.categoryId == categoryId &&
    other.categoryName == categoryName &&
    other.emoji == emoji &&
    other.amount == amount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (categoryId.hashCode) +
    (categoryName.hashCode) +
    (emoji.hashCode) +
    (amount.hashCode);

  @override
  String toString() => 'StatItem[categoryId=$categoryId, categoryName=$categoryName, emoji=$emoji, amount=$amount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'categoryId'] = this.categoryId;
      json[r'categoryName'] = this.categoryName;
      json[r'emoji'] = this.emoji;
      json[r'amount'] = this.amount;
    return json;
  }

  /// Returns a new [StatItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StatItem[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StatItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StatItem(
        categoryId: mapValueOfType<int>(json, r'categoryId')!,
        categoryName: mapValueOfType<String>(json, r'categoryName')!,
        emoji: mapValueOfType<String>(json, r'emoji')!,
        amount: mapValueOfType<String>(json, r'amount')!,
      );
    }
    return null;
  }

  static List<StatItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatItem> mapFromJson(dynamic json) {
    final map = <String, StatItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatItem-objects as value to a dart map
  static Map<String, List<StatItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'categoryId',
    'categoryName',
    'emoji',
    'amount',
  };
}

