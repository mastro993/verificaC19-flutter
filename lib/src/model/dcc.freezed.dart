// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dcc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DCCTearOff {
  const _$DCCTearOff();

  _DCC call(
      {required String raw,
      required List<int> coseRaw,
      required Uint8List protectedHeader,
      required Map<dynamic, dynamic> unprotectedHeader,
      required Map<dynamic, dynamic> payload,
      required Uint8List payloadBytes,
      required Uint8List signers,
      required String kid,
      required int algorithm}) {
    return _DCC(
      raw: raw,
      coseRaw: coseRaw,
      protectedHeader: protectedHeader,
      unprotectedHeader: unprotectedHeader,
      payload: payload,
      payloadBytes: payloadBytes,
      signers: signers,
      kid: kid,
      algorithm: algorithm,
    );
  }
}

/// @nodoc
const $DCC = _$DCCTearOff();

/// @nodoc
mixin _$DCC {
  /// Raw unprocessed data
  String get raw => throw _privateConstructorUsedError;

  /// COSE data
  List<int> get coseRaw => throw _privateConstructorUsedError;

  /// Protected header
  Uint8List get protectedHeader => throw _privateConstructorUsedError;

  /// Unprotected header
  Map<dynamic, dynamic> get unprotectedHeader =>
      throw _privateConstructorUsedError;

  /// Certificate data payload
  Map<dynamic, dynamic> get payload => throw _privateConstructorUsedError;

  /// Encoded certificate data payload
  Uint8List get payloadBytes => throw _privateConstructorUsedError;

  /// Certificate signers
  Uint8List get signers => throw _privateConstructorUsedError;

  /// Certificate kid
  String get kid => throw _privateConstructorUsedError;

  /// Certificate algorithm
  int get algorithm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DCCCopyWith<DCC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DCCCopyWith<$Res> {
  factory $DCCCopyWith(DCC value, $Res Function(DCC) then) =
      _$DCCCopyWithImpl<$Res>;
  $Res call(
      {String raw,
      List<int> coseRaw,
      Uint8List protectedHeader,
      Map<dynamic, dynamic> unprotectedHeader,
      Map<dynamic, dynamic> payload,
      Uint8List payloadBytes,
      Uint8List signers,
      String kid,
      int algorithm});
}

/// @nodoc
class _$DCCCopyWithImpl<$Res> implements $DCCCopyWith<$Res> {
  _$DCCCopyWithImpl(this._value, this._then);

  final DCC _value;
  // ignore: unused_field
  final $Res Function(DCC) _then;

  @override
  $Res call({
    Object? raw = freezed,
    Object? coseRaw = freezed,
    Object? protectedHeader = freezed,
    Object? unprotectedHeader = freezed,
    Object? payload = freezed,
    Object? payloadBytes = freezed,
    Object? signers = freezed,
    Object? kid = freezed,
    Object? algorithm = freezed,
  }) {
    return _then(_value.copyWith(
      raw: raw == freezed
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      coseRaw: coseRaw == freezed
          ? _value.coseRaw
          : coseRaw // ignore: cast_nullable_to_non_nullable
              as List<int>,
      protectedHeader: protectedHeader == freezed
          ? _value.protectedHeader
          : protectedHeader // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      unprotectedHeader: unprotectedHeader == freezed
          ? _value.unprotectedHeader
          : unprotectedHeader // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payloadBytes: payloadBytes == freezed
          ? _value.payloadBytes
          : payloadBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signers: signers == freezed
          ? _value.signers
          : signers // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      kid: kid == freezed
          ? _value.kid
          : kid // ignore: cast_nullable_to_non_nullable
              as String,
      algorithm: algorithm == freezed
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DCCCopyWith<$Res> implements $DCCCopyWith<$Res> {
  factory _$DCCCopyWith(_DCC value, $Res Function(_DCC) then) =
      __$DCCCopyWithImpl<$Res>;
  @override
  $Res call(
      {String raw,
      List<int> coseRaw,
      Uint8List protectedHeader,
      Map<dynamic, dynamic> unprotectedHeader,
      Map<dynamic, dynamic> payload,
      Uint8List payloadBytes,
      Uint8List signers,
      String kid,
      int algorithm});
}

/// @nodoc
class __$DCCCopyWithImpl<$Res> extends _$DCCCopyWithImpl<$Res>
    implements _$DCCCopyWith<$Res> {
  __$DCCCopyWithImpl(_DCC _value, $Res Function(_DCC) _then)
      : super(_value, (v) => _then(v as _DCC));

  @override
  _DCC get _value => super._value as _DCC;

  @override
  $Res call({
    Object? raw = freezed,
    Object? coseRaw = freezed,
    Object? protectedHeader = freezed,
    Object? unprotectedHeader = freezed,
    Object? payload = freezed,
    Object? payloadBytes = freezed,
    Object? signers = freezed,
    Object? kid = freezed,
    Object? algorithm = freezed,
  }) {
    return _then(_DCC(
      raw: raw == freezed
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      coseRaw: coseRaw == freezed
          ? _value.coseRaw
          : coseRaw // ignore: cast_nullable_to_non_nullable
              as List<int>,
      protectedHeader: protectedHeader == freezed
          ? _value.protectedHeader
          : protectedHeader // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      unprotectedHeader: unprotectedHeader == freezed
          ? _value.unprotectedHeader
          : unprotectedHeader // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payloadBytes: payloadBytes == freezed
          ? _value.payloadBytes
          : payloadBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signers: signers == freezed
          ? _value.signers
          : signers // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      kid: kid == freezed
          ? _value.kid
          : kid // ignore: cast_nullable_to_non_nullable
              as String,
      algorithm: algorithm == freezed
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DCC extends _DCC {
  const _$_DCC(
      {required this.raw,
      required this.coseRaw,
      required this.protectedHeader,
      required this.unprotectedHeader,
      required this.payload,
      required this.payloadBytes,
      required this.signers,
      required this.kid,
      required this.algorithm})
      : super._();

  @override

  /// Raw unprocessed data
  final String raw;
  @override

  /// COSE data
  final List<int> coseRaw;
  @override

  /// Protected header
  final Uint8List protectedHeader;
  @override

  /// Unprotected header
  final Map<dynamic, dynamic> unprotectedHeader;
  @override

  /// Certificate data payload
  final Map<dynamic, dynamic> payload;
  @override

  /// Encoded certificate data payload
  final Uint8List payloadBytes;
  @override

  /// Certificate signers
  final Uint8List signers;
  @override

  /// Certificate kid
  final String kid;
  @override

  /// Certificate algorithm
  final int algorithm;

  @override
  String toString() {
    return 'DCC(raw: $raw, coseRaw: $coseRaw, protectedHeader: $protectedHeader, unprotectedHeader: $unprotectedHeader, payload: $payload, payloadBytes: $payloadBytes, signers: $signers, kid: $kid, algorithm: $algorithm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DCC &&
            const DeepCollectionEquality().equals(other.raw, raw) &&
            const DeepCollectionEquality().equals(other.coseRaw, coseRaw) &&
            const DeepCollectionEquality()
                .equals(other.protectedHeader, protectedHeader) &&
            const DeepCollectionEquality()
                .equals(other.unprotectedHeader, unprotectedHeader) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            const DeepCollectionEquality()
                .equals(other.payloadBytes, payloadBytes) &&
            const DeepCollectionEquality().equals(other.signers, signers) &&
            const DeepCollectionEquality().equals(other.kid, kid) &&
            const DeepCollectionEquality().equals(other.algorithm, algorithm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(raw),
      const DeepCollectionEquality().hash(coseRaw),
      const DeepCollectionEquality().hash(protectedHeader),
      const DeepCollectionEquality().hash(unprotectedHeader),
      const DeepCollectionEquality().hash(payload),
      const DeepCollectionEquality().hash(payloadBytes),
      const DeepCollectionEquality().hash(signers),
      const DeepCollectionEquality().hash(kid),
      const DeepCollectionEquality().hash(algorithm));

  @JsonKey(ignore: true)
  @override
  _$DCCCopyWith<_DCC> get copyWith =>
      __$DCCCopyWithImpl<_DCC>(this, _$identity);
}

abstract class _DCC extends DCC {
  const factory _DCC(
      {required String raw,
      required List<int> coseRaw,
      required Uint8List protectedHeader,
      required Map<dynamic, dynamic> unprotectedHeader,
      required Map<dynamic, dynamic> payload,
      required Uint8List payloadBytes,
      required Uint8List signers,
      required String kid,
      required int algorithm}) = _$_DCC;
  const _DCC._() : super._();

  @override

  /// Raw unprocessed data
  String get raw;
  @override

  /// COSE data
  List<int> get coseRaw;
  @override

  /// Protected header
  Uint8List get protectedHeader;
  @override

  /// Unprotected header
  Map<dynamic, dynamic> get unprotectedHeader;
  @override

  /// Certificate data payload
  Map<dynamic, dynamic> get payload;
  @override

  /// Encoded certificate data payload
  Uint8List get payloadBytes;
  @override

  /// Certificate signers
  Uint8List get signers;
  @override

  /// Certificate kid
  String get kid;
  @override

  /// Certificate algorithm
  int get algorithm;
  @override
  @JsonKey(ignore: true)
  _$DCCCopyWith<_DCC> get copyWith => throw _privateConstructorUsedError;
}
