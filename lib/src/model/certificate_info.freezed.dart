// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'certificate_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CertificateInfoTearOff {
  const _$CertificateInfoTearOff();

  _CertificateInfo call(
      {required String country, required bool extendedKeyUsage}) {
    return _CertificateInfo(
      country: country,
      extendedKeyUsage: extendedKeyUsage,
    );
  }
}

/// @nodoc
const $CertificateInfo = _$CertificateInfoTearOff();

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
      _$CertificateInfoCopyWithImpl<$Res>;
  $Res call({String country, bool extendedKeyUsage});
}

/// @nodoc
class _$CertificateInfoCopyWithImpl<$Res>
    implements $CertificateInfoCopyWith<$Res> {
  _$CertificateInfoCopyWithImpl(this._value, this._then);

  final CertificateInfo _value;
  // ignore: unused_field
  final $Res Function(CertificateInfo) _then;

  @override
  $Res call({
    Object? country = freezed,
    Object? extendedKeyUsage = freezed,
  }) {
    return _then(_value.copyWith(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      extendedKeyUsage: extendedKeyUsage == freezed
          ? _value.extendedKeyUsage
          : extendedKeyUsage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CertificateInfoCopyWith<$Res>
    implements $CertificateInfoCopyWith<$Res> {
  factory _$CertificateInfoCopyWith(
          _CertificateInfo value, $Res Function(_CertificateInfo) then) =
      __$CertificateInfoCopyWithImpl<$Res>;
  @override
  $Res call({String country, bool extendedKeyUsage});
}

/// @nodoc
class __$CertificateInfoCopyWithImpl<$Res>
    extends _$CertificateInfoCopyWithImpl<$Res>
    implements _$CertificateInfoCopyWith<$Res> {
  __$CertificateInfoCopyWithImpl(
      _CertificateInfo _value, $Res Function(_CertificateInfo) _then)
      : super(_value, (v) => _then(v as _CertificateInfo));

  @override
  _CertificateInfo get _value => super._value as _CertificateInfo;

  @override
  $Res call({
    Object? country = freezed,
    Object? extendedKeyUsage = freezed,
  }) {
    return _then(_CertificateInfo(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      extendedKeyUsage: extendedKeyUsage == freezed
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
            other is _CertificateInfo &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.extendedKeyUsage, extendedKeyUsage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(extendedKeyUsage));

  @JsonKey(ignore: true)
  @override
  _$CertificateInfoCopyWith<_CertificateInfo> get copyWith =>
      __$CertificateInfoCopyWithImpl<_CertificateInfo>(this, _$identity);
}

abstract class _CertificateInfo extends CertificateInfo {
  const factory _CertificateInfo(
      {required String country,
      required bool extendedKeyUsage}) = _$_CertificateInfo;
  const _CertificateInfo._() : super._();

  @override
  String get country;
  @override
  bool get extendedKeyUsage;
  @override
  @JsonKey(ignore: true)
  _$CertificateInfoCopyWith<_CertificateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
