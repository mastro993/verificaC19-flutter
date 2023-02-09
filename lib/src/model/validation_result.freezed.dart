// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$ValidationResultCopyWithImpl<$Res, ValidationResult>;
  @useResult
  $Res call(
      {GreenCertificate certificate,
      GreenCertificateStatus certificateStatus,
      ValidationMode validationMode,
      DateTime validationDateTime});

  $GreenCertificateCopyWith<$Res> get certificate;
}

/// @nodoc
class _$ValidationResultCopyWithImpl<$Res, $Val extends ValidationResult>
    implements $ValidationResultCopyWith<$Res> {
  _$ValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificate = null,
    Object? certificateStatus = null,
    Object? validationMode = null,
    Object? validationDateTime = null,
  }) {
    return _then(_value.copyWith(
      certificate: null == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as GreenCertificate,
      certificateStatus: null == certificateStatus
          ? _value.certificateStatus
          : certificateStatus // ignore: cast_nullable_to_non_nullable
              as GreenCertificateStatus,
      validationMode: null == validationMode
          ? _value.validationMode
          : validationMode // ignore: cast_nullable_to_non_nullable
              as ValidationMode,
      validationDateTime: null == validationDateTime
          ? _value.validationDateTime
          : validationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GreenCertificateCopyWith<$Res> get certificate {
    return $GreenCertificateCopyWith<$Res>(_value.certificate, (value) {
      return _then(_value.copyWith(certificate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ValidationResultCopyWith<$Res>
    implements $ValidationResultCopyWith<$Res> {
  factory _$$_ValidationResultCopyWith(
          _$_ValidationResult value, $Res Function(_$_ValidationResult) then) =
      __$$_ValidationResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GreenCertificate certificate,
      GreenCertificateStatus certificateStatus,
      ValidationMode validationMode,
      DateTime validationDateTime});

  @override
  $GreenCertificateCopyWith<$Res> get certificate;
}

/// @nodoc
class __$$_ValidationResultCopyWithImpl<$Res>
    extends _$ValidationResultCopyWithImpl<$Res, _$_ValidationResult>
    implements _$$_ValidationResultCopyWith<$Res> {
  __$$_ValidationResultCopyWithImpl(
      _$_ValidationResult _value, $Res Function(_$_ValidationResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificate = null,
    Object? certificateStatus = null,
    Object? validationMode = null,
    Object? validationDateTime = null,
  }) {
    return _then(_$_ValidationResult(
      certificate: null == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as GreenCertificate,
      certificateStatus: null == certificateStatus
          ? _value.certificateStatus
          : certificateStatus // ignore: cast_nullable_to_non_nullable
              as GreenCertificateStatus,
      validationMode: null == validationMode
          ? _value.validationMode
          : validationMode // ignore: cast_nullable_to_non_nullable
              as ValidationMode,
      validationDateTime: null == validationDateTime
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

  /// Validated certificate
  @override
  final GreenCertificate certificate;

  /// Validation rules result
  @override
  final GreenCertificateStatus certificateStatus;

  /// Validation mode used for the result
  @override
  final ValidationMode validationMode;

  /// Date and time of the validation
  @override
  final DateTime validationDateTime;

  @override
  String toString() {
    return 'ValidationResult(certificate: $certificate, certificateStatus: $certificateStatus, validationMode: $validationMode, validationDateTime: $validationDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidationResult &&
            (identical(other.certificate, certificate) ||
                other.certificate == certificate) &&
            (identical(other.certificateStatus, certificateStatus) ||
                other.certificateStatus == certificateStatus) &&
            (identical(other.validationMode, validationMode) ||
                other.validationMode == validationMode) &&
            (identical(other.validationDateTime, validationDateTime) ||
                other.validationDateTime == validationDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, certificate, certificateStatus,
      validationMode, validationDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidationResultCopyWith<_$_ValidationResult> get copyWith =>
      __$$_ValidationResultCopyWithImpl<_$_ValidationResult>(this, _$identity);
}

abstract class _ValidationResult extends ValidationResult {
  factory _ValidationResult(
      {required final GreenCertificate certificate,
      required final GreenCertificateStatus certificateStatus,
      required final ValidationMode validationMode,
      required final DateTime validationDateTime}) = _$_ValidationResult;
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
  _$$_ValidationResultCopyWith<_$_ValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}
