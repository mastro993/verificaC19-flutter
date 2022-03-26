// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationRule _$ValidationRuleFromJson(Map<String, dynamic> json) =>
    ValidationRule(
      name: json['name'] as String,
      type: json['type'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ValidationRuleToJson(ValidationRule instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
    };
