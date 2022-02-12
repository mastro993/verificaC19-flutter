import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:verificac19/src/core/constants.dart';

part 'validation_rule.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class ValidationRule {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String value;

  const ValidationRule({
    required this.name,
    required this.type,
    required this.value,
  });

  int? get intValue => int.parse(value);

  factory ValidationRule.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationRuleToJson(this);
}

extension RulesExtensions on List<ValidationRule> {
  ValidationRule? find(String name, [String? type]) {
    type ??= RuleType.generic;
    try {
      return firstWhere((r) => r.name == name && r.type == type);
    } catch (e) {
      return null;
    }
  }
}
