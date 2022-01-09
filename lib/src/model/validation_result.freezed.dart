// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValidationResultTearOff {
  const _$ValidationResultTearOff();

  _ValidationResult call(
      {required GreenCertificate certificate,
      required GreenCertificateStatus certificateStatus,
      required ValidationMode validationMode,
      required DateTime validationDateTime}) {
    return _ValidationResult(
      certificate: certificate,
      certificateStatus: certificateStatus,
      validationMode: validationMode,
      validationDateTime: validationDateTime,
    );
  }
}

/// @nodoc
const $ValidationResult = _$ValidationResultTearOff();

/// @nodoc
mixin _$ValidationResult {
  /// Validated certificate
  GreenCertificate get certificate => throw _privateConstructorUsedError;

  /// Validation rules result
  GreenCertificateStatus get certificateStatus =>
      throw _privateConstructorUsedError;

  /// Validation mode used for the result
  ValidationMode get validationMode => throw _privateConstructorUsedError;

  /// Date and time of the validation
  DateTime get validationDateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidationResultCopyWith<ValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationResultCopyWith<$Res> {
  factory $ValidationResultCopyWith(
          ValidationResult value, $Res Function(ValidationResult) then) =
      _$ValidationResultCopyWithImpl<$Res>;
  $Res call(
      {GreenCertificate certificate,
      GreenCertificateStatus certificateStatus,
      ValidationMode validationMode,
      DateTime validationDateTime});

  $GreenCertificateCopyWith<$Res> get certificate;
}

/// @nodoc
class _$ValidationResultCopyWithImpl<$Res>
    implements $ValidationResultCopyWith<$Res> {
  _$ValidationResultCopyWithImpl(this._value, this._then);

  final ValidationResult _value;
  // ignore: unused_field
  final $Res Function(ValidationResult) _then;

  @override
  $Res call({
    Object? certificate = freezed,
    Object? certificateStatus = freezed,
    Object? validationMode = freezed,
    Object? validationDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      certificate: certificate == freezed
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as GreenCertificate,
      certificateStatus: certificateStatus == freezed
          ? _value.certificateStatus
          : certificateStatus // ignore: cast_nullable_to_non_nullable
              as GreenCertificateStatus,
      validationMode: validationMode == freezed
          ? _value.validationMode
          : validationMode // ignore: cast_nullable_to_non_nullable
              as ValidationMode,
      validationDateTime: validationDateTime == freezed
          ? _value.validationDateTime
          : validationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $GreenCertificateCopyWith<$Res> get certificate {
    return $GreenCertificateCopyWith<$Res>(_value.certificate, (value) {
      return _then(_value.copyWith(certificate: value));
    });
  }
}

/// @nodoc
abstract class _$ValidationResultCopyWith<$Res>
    implements $ValidationResultCopyWith<$Res> {
  factory _$ValidationResultCopyWith(
          _ValidationResult value, $Res Function(_ValidationResult) then) =
      __$ValidationResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {GreenCertificate certificate,
      GreenCertificateStatus certificateStatus,
      ValidationMode validationMode,
      DateTime validationDateTime});

  @override
  $GreenCertificateCopyWith<$Res> get certificate;
}

/// @nodoc
class __$ValidationResultCopyWithImpl<$Res>
    extends _$ValidationResultCopyWithImpl<$Res>
    implements _$ValidationResultCopyWith<$Res> {
  __$ValidationResultCopyWithImpl(
      _ValidationResult _value, $Res Function(_ValidationResult) _then)
      : super(_value, (v) => _then(v as _ValidationResult));

  @override
  _ValidationResult get _value => super._value as _ValidationResult;

  @override
  $Res call({
    Object? certificate = freezed,
    Object? certificateStatus = freezed,
    Object? validationMode = freezed,
    Object? validationDateTime = freezed,
  }) {
    return _then(_ValidationResult(
      certificate: certificate == freezed
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as GreenCertificate,
      certificateStatus: certificateStatus == freezed
          ? _value.certificateStatus
          : certificateStatus // ignore: cast_nullable_to_non_nullable
              as GreenCertificateStatus,
      validationMode: validationMode == freezed
          ? _value.validationMode
          : validationMode // ignore: cast_nullable_to_non_nullable
              as ValidationMode,
      validationDateTime: validationDateTime == freezed
          ? _value.validationDateTime
          : validationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ValidationResult extends _ValidationResult {
  _$_ValidationResult(
      {required this.certificate,
      required this.certificateStatus,
      required this.validationMode,
      required this.validationDateTime})
      : super._();

  @override

  /// Validated certificate
  final GreenCertificate certificate;
  @override

  /// Validation rules result
  final GreenCertificateStatus certificateStatus;
  @override

  /// Validation mode used for the result
  final ValidationMode validationMode;
  @override

  /// Date and time of the validation
  final DateTime validationDateTime;

  @override
  String toString() {
    return 'ValidationResult(certificate: $certificate, certificateStatus: $certificateStatus, validationMode: $validationMode, validationDateTime: $validationDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValidationResult &&
            const DeepCollectionEquality()
                .equals(other.certificate, certificate) &&
            const DeepCollectionEquality()
                .equals(other.certificateStatus, certificateStatus) &&
            const DeepCollectionEquality()
                .equals(other.validationMode, validationMode) &&
            const DeepCollectionEquality()
                .equals(other.validationDateTime, validationDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(certificate),
      const DeepCollectionEquality().hash(certificateStatus),
      const DeepCollectionEquality().hash(validationMode),
      const DeepCollectionEquality().hash(validationDateTime));

  @JsonKey(ignore: true)
  @override
  _$ValidationResultCopyWith<_ValidationResult> get copyWith =>
      __$ValidationResultCopyWithImpl<_ValidationResult>(this, _$identity);
}

abstract class _ValidationResult extends ValidationResult {
  factory _ValidationResult(
      {required GreenCertificate certificate,
      required GreenCertificateStatus certificateStatus,
      required ValidationMode validationMode,
      required DateTime validationDateTime}) = _$_ValidationResult;
  _ValidationResult._() : super._();

  @override

  /// Validated certificate
  GreenCertificate get certificate;
  @override

  /// Validation rules result
  GreenCertificateStatus get certificateStatus;
  @override

  /// Validation mode used for the result
  ValidationMode get validationMode;
  @override

  /// Date and time of the validation
  DateTime get validationDateTime;
  @override
  @JsonKey(ignore: true)
  _$ValidationResultCopyWith<_ValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}
