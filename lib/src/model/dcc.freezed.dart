// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dcc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$DCCCopyWithImpl<$Res, DCC>;
  @useResult
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
class _$DCCCopyWithImpl<$Res, $Val extends DCC> implements $DCCCopyWith<$Res> {
  _$DCCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? coseRaw = null,
    Object? protectedHeader = null,
    Object? unprotectedHeader = null,
    Object? payload = null,
    Object? payloadBytes = null,
    Object? signers = null,
    Object? kid = null,
    Object? algorithm = null,
  }) {
    return _then(_value.copyWith(
      raw: null == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      coseRaw: null == coseRaw
          ? _value.coseRaw
          : coseRaw // ignore: cast_nullable_to_non_nullable
              as List<int>,
      protectedHeader: null == protectedHeader
          ? _value.protectedHeader
          : protectedHeader // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      unprotectedHeader: null == unprotectedHeader
          ? _value.unprotectedHeader
          : unprotectedHeader // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payloadBytes: null == payloadBytes
          ? _value.payloadBytes
          : payloadBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signers: null == signers
          ? _value.signers
          : signers // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      kid: null == kid
          ? _value.kid
          : kid // ignore: cast_nullable_to_non_nullable
              as String,
      algorithm: null == algorithm
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DCCCopyWith<$Res> implements $DCCCopyWith<$Res> {
  factory _$$_DCCCopyWith(_$_DCC value, $Res Function(_$_DCC) then) =
      __$$_DCCCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_DCCCopyWithImpl<$Res> extends _$DCCCopyWithImpl<$Res, _$_DCC>
    implements _$$_DCCCopyWith<$Res> {
  __$$_DCCCopyWithImpl(_$_DCC _value, $Res Function(_$_DCC) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? coseRaw = null,
    Object? protectedHeader = null,
    Object? unprotectedHeader = null,
    Object? payload = null,
    Object? payloadBytes = null,
    Object? signers = null,
    Object? kid = null,
    Object? algorithm = null,
  }) {
    return _then(_$_DCC(
      raw: null == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      coseRaw: null == coseRaw
          ? _value._coseRaw
          : coseRaw // ignore: cast_nullable_to_non_nullable
              as List<int>,
      protectedHeader: null == protectedHeader
          ? _value.protectedHeader
          : protectedHeader // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      unprotectedHeader: null == unprotectedHeader
          ? _value._unprotectedHeader
          : unprotectedHeader // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      payloadBytes: null == payloadBytes
          ? _value.payloadBytes
          : payloadBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      signers: null == signers
          ? _value.signers
          : signers // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      kid: null == kid
          ? _value.kid
          : kid // ignore: cast_nullable_to_non_nullable
              as String,
      algorithm: null == algorithm
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
      required final List<int> coseRaw,
      required this.protectedHeader,
      required final Map<dynamic, dynamic> unprotectedHeader,
      required final Map<dynamic, dynamic> payload,
      required this.payloadBytes,
      required this.signers,
      required this.kid,
      required this.algorithm})
      : _coseRaw = coseRaw,
        _unprotectedHeader = unprotectedHeader,
        _payload = payload,
        super._();

  /// Raw unprocessed data
  @override
  final String raw;

  /// COSE data
  final List<int> _coseRaw;

  /// COSE data
  @override
  List<int> get coseRaw {
    if (_coseRaw is EqualUnmodifiableListView) return _coseRaw;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coseRaw);
  }

  /// Protected header
  @override
  final Uint8List protectedHeader;

  /// Unprotected header
  final Map<dynamic, dynamic> _unprotectedHeader;

  /// Unprotected header
  @override
  Map<dynamic, dynamic> get unprotectedHeader {
    if (_unprotectedHeader is EqualUnmodifiableMapView)
      return _unprotectedHeader;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unprotectedHeader);
  }

  /// Certificate data payload
  final Map<dynamic, dynamic> _payload;

  /// Certificate data payload
  @override
  Map<dynamic, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  /// Encoded certificate data payload
  @override
  final Uint8List payloadBytes;

  /// Certificate signers
  @override
  final Uint8List signers;

  /// Certificate kid
  @override
  final String kid;

  /// Certificate algorithm
  @override
  final int algorithm;

  @override
  String toString() {
    return 'DCC(raw: $raw, coseRaw: $coseRaw, protectedHeader: $protectedHeader, unprotectedHeader: $unprotectedHeader, payload: $payload, payloadBytes: $payloadBytes, signers: $signers, kid: $kid, algorithm: $algorithm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DCC &&
            (identical(other.raw, raw) || other.raw == raw) &&
            const DeepCollectionEquality().equals(other._coseRaw, _coseRaw) &&
            const DeepCollectionEquality()
                .equals(other.protectedHeader, protectedHeader) &&
            const DeepCollectionEquality()
                .equals(other._unprotectedHeader, _unprotectedHeader) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            const DeepCollectionEquality()
                .equals(other.payloadBytes, payloadBytes) &&
            const DeepCollectionEquality().equals(other.signers, signers) &&
            (identical(other.kid, kid) || other.kid == kid) &&
            (identical(other.algorithm, algorithm) ||
                other.algorithm == algorithm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      raw,
      const DeepCollectionEquality().hash(_coseRaw),
      const DeepCollectionEquality().hash(protectedHeader),
      const DeepCollectionEquality().hash(_unprotectedHeader),
      const DeepCollectionEquality().hash(_payload),
      const DeepCollectionEquality().hash(payloadBytes),
      const DeepCollectionEquality().hash(signers),
      kid,
      algorithm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DCCCopyWith<_$_DCC> get copyWith =>
      __$$_DCCCopyWithImpl<_$_DCC>(this, _$identity);
}

abstract class _DCC extends DCC {
  const factory _DCC(
      {required final String raw,
      required final List<int> coseRaw,
      required final Uint8List protectedHeader,
      required final Map<dynamic, dynamic> unprotectedHeader,
      required final Map<dynamic, dynamic> payload,
      required final Uint8List payloadBytes,
      required final Uint8List signers,
      required final String kid,
      required final int algorithm}) = _$_DCC;
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
  _$$_DCCCopyWith<_$_DCC> get copyWith => throw _privateConstructorUsedError;
}
