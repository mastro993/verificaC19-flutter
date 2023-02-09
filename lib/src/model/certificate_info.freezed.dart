// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CertificateInfo {
  String get country => throw _privateConstructorUsedError;
  bool get extendedKeyUsage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CertificateInfoCopyWith<CertificateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateInfoCopyWith<$Res> {
  factory $CertificateInfoCopyWith(
          CertificateInfo value, $Res Function(CertificateInfo) then) =
      _$CertificateInfoCopyWithImpl<$Res, CertificateInfo>;
  @useResult
  $Res call({String country, bool extendedKeyUsage});
}

/// @nodoc
class _$CertificateInfoCopyWithImpl<$Res, $Val extends CertificateInfo>
    implements $CertificateInfoCopyWith<$Res> {
  _$CertificateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? extendedKeyUsage = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      extendedKeyUsage: null == extendedKeyUsage
          ? _value.extendedKeyUsage
          : extendedKeyUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CertificateInfoCopyWith<$Res>
    implements $CertificateInfoCopyWith<$Res> {
  factory _$$_CertificateInfoCopyWith(
          _$_CertificateInfo value, $Res Function(_$_CertificateInfo) then) =
      __$$_CertificateInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String country, bool extendedKeyUsage});
}

/// @nodoc
class __$$_CertificateInfoCopyWithImpl<$Res>
    extends _$CertificateInfoCopyWithImpl<$Res, _$_CertificateInfo>
    implements _$$_CertificateInfoCopyWith<$Res> {
  __$$_CertificateInfoCopyWithImpl(
      _$_CertificateInfo _value, $Res Function(_$_CertificateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? extendedKeyUsage = null,
  }) {
    return _then(_$_CertificateInfo(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      extendedKeyUsage: null == extendedKeyUsage
          ? _value.extendedKeyUsage
          : extendedKeyUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CertificateInfo extends _CertificateInfo {
  const _$_CertificateInfo(
      {required this.country, required this.extendedKeyUsage})
      : super._();

  @override
  final String country;
  @override
  final bool extendedKeyUsage;

  @override
  String toString() {
    return 'CertificateInfo(country: $country, extendedKeyUsage: $extendedKeyUsage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CertificateInfo &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.extendedKeyUsage, extendedKeyUsage) ||
                other.extendedKeyUsage == extendedKeyUsage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country, extendedKeyUsage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CertificateInfoCopyWith<_$_CertificateInfo> get copyWith =>
      __$$_CertificateInfoCopyWithImpl<_$_CertificateInfo>(this, _$identity);
}

abstract class _CertificateInfo extends CertificateInfo {
  const factory _CertificateInfo(
      {required final String country,
      required final bool extendedKeyUsage}) = _$_CertificateInfo;
  const _CertificateInfo._() : super._();

  @override
  String get country;
  @override
  bool get extendedKeyUsage;
  @override
  @JsonKey(ignore: true)
  _$$_CertificateInfoCopyWith<_$_CertificateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
