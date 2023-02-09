// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exemption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Exemption {
  String get disease => throw _privateConstructorUsedError;
  String get countryOfVaccination => throw _privateConstructorUsedError;
  String get certificateIssuer => throw _privateConstructorUsedError;
  String get certificateIdentifier => throw _privateConstructorUsedError;
  DateTime get certificateValidFrom => throw _privateConstructorUsedError;
  DateTime? get certificateValidUntil => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExemptionCopyWith<Exemption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExemptionCopyWith<$Res> {
  factory $ExemptionCopyWith(Exemption value, $Res Function(Exemption) then) =
      _$ExemptionCopyWithImpl<$Res>;
  $Res call(
      {String disease,
      String countryOfVaccination,
      String certificateIssuer,
      String certificateIdentifier,
      DateTime certificateValidFrom,
      DateTime? certificateValidUntil});
}

/// @nodoc
class _$ExemptionCopyWithImpl<$Res> implements $ExemptionCopyWith<$Res> {
  _$ExemptionCopyWithImpl(this._value, this._then);

  final Exemption _value;
  // ignore: unused_field
  final $Res Function(Exemption) _then;

  @override
  $Res call({
    Object? disease = freezed,
    Object? countryOfVaccination = freezed,
    Object? certificateIssuer = freezed,
    Object? certificateIdentifier = freezed,
    Object? certificateValidFrom = freezed,
    Object? certificateValidUntil = freezed,
  }) {
    return _then(_value.copyWith(
      disease: disease == freezed
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      countryOfVaccination: countryOfVaccination == freezed
          ? _value.countryOfVaccination
          : countryOfVaccination // ignore: cast_nullable_to_non_nullable
              as String,
      certificateIssuer: certificateIssuer == freezed
          ? _value.certificateIssuer
          : certificateIssuer // ignore: cast_nullable_to_non_nullable
              as String,
      certificateIdentifier: certificateIdentifier == freezed
          ? _value.certificateIdentifier
          : certificateIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      certificateValidFrom: certificateValidFrom == freezed
          ? _value.certificateValidFrom
          : certificateValidFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      certificateValidUntil: certificateValidUntil == freezed
          ? _value.certificateValidUntil
          : certificateValidUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_ExemptionCopyWith<$Res> implements $ExemptionCopyWith<$Res> {
  factory _$$_ExemptionCopyWith(
          _$_Exemption value, $Res Function(_$_Exemption) then) =
      __$$_ExemptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String disease,
      String countryOfVaccination,
      String certificateIssuer,
      String certificateIdentifier,
      DateTime certificateValidFrom,
      DateTime? certificateValidUntil});
}

/// @nodoc
class __$$_ExemptionCopyWithImpl<$Res> extends _$ExemptionCopyWithImpl<$Res>
    implements _$$_ExemptionCopyWith<$Res> {
  __$$_ExemptionCopyWithImpl(
      _$_Exemption _value, $Res Function(_$_Exemption) _then)
      : super(_value, (v) => _then(v as _$_Exemption));

  @override
  _$_Exemption get _value => super._value as _$_Exemption;

  @override
  $Res call({
    Object? disease = freezed,
    Object? countryOfVaccination = freezed,
    Object? certificateIssuer = freezed,
    Object? certificateIdentifier = freezed,
    Object? certificateValidFrom = freezed,
    Object? certificateValidUntil = freezed,
  }) {
    return _then(_$_Exemption(
      disease: disease == freezed
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      countryOfVaccination: countryOfVaccination == freezed
          ? _value.countryOfVaccination
          : countryOfVaccination // ignore: cast_nullable_to_non_nullable
              as String,
      certificateIssuer: certificateIssuer == freezed
          ? _value.certificateIssuer
          : certificateIssuer // ignore: cast_nullable_to_non_nullable
              as String,
      certificateIdentifier: certificateIdentifier == freezed
          ? _value.certificateIdentifier
          : certificateIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      certificateValidFrom: certificateValidFrom == freezed
          ? _value.certificateValidFrom
          : certificateValidFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      certificateValidUntil: certificateValidUntil == freezed
          ? _value.certificateValidUntil
          : certificateValidUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Exemption extends _Exemption {
  const _$_Exemption(
      {required this.disease,
      required this.countryOfVaccination,
      required this.certificateIssuer,
      required this.certificateIdentifier,
      required this.certificateValidFrom,
      required this.certificateValidUntil})
      : super._();

  @override
  final String disease;
  @override
  final String countryOfVaccination;
  @override
  final String certificateIssuer;
  @override
  final String certificateIdentifier;
  @override
  final DateTime certificateValidFrom;
  @override
  final DateTime? certificateValidUntil;

  @override
  String toString() {
    return 'Exemption(disease: $disease, countryOfVaccination: $countryOfVaccination, certificateIssuer: $certificateIssuer, certificateIdentifier: $certificateIdentifier, certificateValidFrom: $certificateValidFrom, certificateValidUntil: $certificateValidUntil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exemption &&
            const DeepCollectionEquality().equals(other.disease, disease) &&
            const DeepCollectionEquality()
                .equals(other.countryOfVaccination, countryOfVaccination) &&
            const DeepCollectionEquality()
                .equals(other.certificateIssuer, certificateIssuer) &&
            const DeepCollectionEquality()
                .equals(other.certificateIdentifier, certificateIdentifier) &&
            const DeepCollectionEquality()
                .equals(other.certificateValidFrom, certificateValidFrom) &&
            const DeepCollectionEquality()
                .equals(other.certificateValidUntil, certificateValidUntil));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(disease),
      const DeepCollectionEquality().hash(countryOfVaccination),
      const DeepCollectionEquality().hash(certificateIssuer),
      const DeepCollectionEquality().hash(certificateIdentifier),
      const DeepCollectionEquality().hash(certificateValidFrom),
      const DeepCollectionEquality().hash(certificateValidUntil));

  @JsonKey(ignore: true)
  @override
  _$$_ExemptionCopyWith<_$_Exemption> get copyWith =>
      __$$_ExemptionCopyWithImpl<_$_Exemption>(this, _$identity);
}

abstract class _Exemption extends Exemption {
  const factory _Exemption(
      {required final String disease,
      required final String countryOfVaccination,
      required final String certificateIssuer,
      required final String certificateIdentifier,
      required final DateTime certificateValidFrom,
      required final DateTime? certificateValidUntil}) = _$_Exemption;
  const _Exemption._() : super._();

  @override
  String get disease;
  @override
  String get countryOfVaccination;
  @override
  String get certificateIssuer;
  @override
  String get certificateIdentifier;
  @override
  DateTime get certificateValidFrom;
  @override
  DateTime? get certificateValidUntil;
  @override
  @JsonKey(ignore: true)
  _$$_ExemptionCopyWith<_$_Exemption> get copyWith =>
      throw _privateConstructorUsedError;
}
