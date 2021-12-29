// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_rule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ValidationRuleAdapter extends TypeAdapter<ValidationRule> {
  @override
  final int typeId = 1;

  @override
  ValidationRule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ValidationRule(
      name: fields[0] as String,
      type: fields[1] as String,
      value: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ValidationRule obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValidationRuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
