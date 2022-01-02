// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CertificateTearOff {
  const _$CertificateTearOff();

  _Certificate call(
      {required Person person,
      required DateTime dateOfBirth,
      required List<Vaccination> vaccinations,
      required List<Test> tests,
      required List<RecoveryStatement> recoveryStatements,
      required DCC dcc}) {
    return _Certificate(
      person: person,
      dateOfBirth: dateOfBirth,
      vaccinations: vaccinations,
      tests: tests,
      recoveryStatements: recoveryStatements,
      dcc: dcc,
    );
  }
}

/// @nodoc
const $Certificate = _$CertificateTearOff();

/// @nodoc
mixin _$Certificate {
  /// Personal information of the certificate subject
  Person get person => throw _privateConstructorUsedError;

  /// Date of birth of the person
  DateTime get dateOfBirth => throw _privateConstructorUsedError;

  /// List of certificate Vaccinations
  List<Vaccination> get vaccinations => throw _privateConstructorUsedError;

  /// List of certificate Test results
  List<Test> get tests => throw _privateConstructorUsedError;

  /// List of certificate Recovery statements
  List<RecoveryStatement> get recoveryStatements =>
      throw _privateConstructorUsedError;

  /// Certificate DCC
  DCC get dcc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CertificateCopyWith<Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateCopyWith<$Res> {
  factory $CertificateCopyWith(
          Certificate value, $Res Function(Certificate) then) =
      _$CertificateCopyWithImpl<$Res>;
  $Res call(
      {Person person,
      DateTime dateOfBirth,
      List<Vaccination> vaccinations,
      List<Test> tests,
      List<RecoveryStatement> recoveryStatements,
      DCC dcc});

  $PersonCopyWith<$Res> get person;
  $DCCCopyWith<$Res> get dcc;
}

/// @nodoc
class _$CertificateCopyWithImpl<$Res> implements $CertificateCopyWith<$Res> {
  _$CertificateCopyWithImpl(this._value, this._then);

  final Certificate _value;
  // ignore: unused_field
  final $Res Function(Certificate) _then;

  @override
  $Res call({
    Object? person = freezed,
    Object? dateOfBirth = freezed,
    Object? vaccinations = freezed,
    Object? tests = freezed,
    Object? recoveryStatements = freezed,
    Object? dcc = freezed,
  }) {
    return _then(_value.copyWith(
      person: person == freezed
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vaccinations: vaccinations == freezed
          ? _value.vaccinations
          : vaccinations // ignore: cast_nullable_to_non_nullable
              as List<Vaccination>,
      tests: tests == freezed
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<Test>,
      recoveryStatements: recoveryStatements == freezed
          ? _value.recoveryStatements
          : recoveryStatements // ignore: cast_nullable_to_non_nullable
              as List<RecoveryStatement>,
      dcc: dcc == freezed
          ? _value.dcc
          : dcc // ignore: cast_nullable_to_non_nullable
              as DCC,
    ));
  }

  @override
  $PersonCopyWith<$Res> get person {
    return $PersonCopyWith<$Res>(_value.person, (value) {
      return _then(_value.copyWith(person: value));
    });
  }

  @override
  $DCCCopyWith<$Res> get dcc {
    return $DCCCopyWith<$Res>(_value.dcc, (value) {
      return _then(_value.copyWith(dcc: value));
    });
  }
}

/// @nodoc
abstract class _$CertificateCopyWith<$Res>
    implements $CertificateCopyWith<$Res> {
  factory _$CertificateCopyWith(
          _Certificate value, $Res Function(_Certificate) then) =
      __$CertificateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Person person,
      DateTime dateOfBirth,
      List<Vaccination> vaccinations,
      List<Test> tests,
      List<RecoveryStatement> recoveryStatements,
      DCC dcc});

  @override
  $PersonCopyWith<$Res> get person;
  @override
  $DCCCopyWith<$Res> get dcc;
}

/// @nodoc
class __$CertificateCopyWithImpl<$Res> extends _$CertificateCopyWithImpl<$Res>
    implements _$CertificateCopyWith<$Res> {
  __$CertificateCopyWithImpl(
      _Certificate _value, $Res Function(_Certificate) _then)
      : super(_value, (v) => _then(v as _Certificate));

  @override
  _Certificate get _value => super._value as _Certificate;

  @override
  $Res call({
    Object? person = freezed,
    Object? dateOfBirth = freezed,
    Object? vaccinations = freezed,
    Object? tests = freezed,
    Object? recoveryStatements = freezed,
    Object? dcc = freezed,
  }) {
    return _then(_Certificate(
      person: person == freezed
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vaccinations: vaccinations == freezed
          ? _value.vaccinations
          : vaccinations // ignore: cast_nullable_to_non_nullable
              as List<Vaccination>,
      tests: tests == freezed
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<Test>,
      recoveryStatements: recoveryStatements == freezed
          ? _value.recoveryStatements
          : recoveryStatements // ignore: cast_nullable_to_non_nullable
              as List<RecoveryStatement>,
      dcc: dcc == freezed
          ? _value.dcc
          : dcc // ignore: cast_nullable_to_non_nullable
              as DCC,
    ));
  }
}

/// @nodoc

class _$_Certificate extends _Certificate {
  const _$_Certificate(
      {required this.person,
      required this.dateOfBirth,
      required this.vaccinations,
      required this.tests,
      required this.recoveryStatements,
      required this.dcc})
      : super._();

  @override

  /// Personal information of the certificate subject
  final Person person;
  @override

  /// Date of birth of the person
  final DateTime dateOfBirth;
  @override

  /// List of certificate Vaccinations
  final List<Vaccination> vaccinations;
  @override

  /// List of certificate Test results
  final List<Test> tests;
  @override

  /// List of certificate Recovery statements
  final List<RecoveryStatement> recoveryStatements;
  @override

  /// Certificate DCC
  final DCC dcc;

  @override
  String toString() {
    return 'Certificate(person: $person, dateOfBirth: $dateOfBirth, vaccinations: $vaccinations, tests: $tests, recoveryStatements: $recoveryStatements, dcc: $dcc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Certificate &&
            const DeepCollectionEquality().equals(other.person, person) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other.vaccinations, vaccinations) &&
            const DeepCollectionEquality().equals(other.tests, tests) &&
            const DeepCollectionEquality()
                .equals(other.recoveryStatements, recoveryStatements) &&
            const DeepCollectionEquality().equals(other.dcc, dcc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(person),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(vaccinations),
      const DeepCollectionEquality().hash(tests),
      const DeepCollectionEquality().hash(recoveryStatements),
      const DeepCollectionEquality().hash(dcc));

  @JsonKey(ignore: true)
  @override
  _$CertificateCopyWith<_Certificate> get copyWith =>
      __$CertificateCopyWithImpl<_Certificate>(this, _$identity);
}

abstract class _Certificate extends Certificate {
  const factory _Certificate(
      {required Person person,
      required DateTime dateOfBirth,
      required List<Vaccination> vaccinations,
      required List<Test> tests,
      required List<RecoveryStatement> recoveryStatements,
      required DCC dcc}) = _$_Certificate;
  const _Certificate._() : super._();

  @override

  /// Personal information of the certificate subject
  Person get person;
  @override

  /// Date of birth of the person
  DateTime get dateOfBirth;
  @override

  /// List of certificate Vaccinations
  List<Vaccination> get vaccinations;
  @override

  /// List of certificate Test results
  List<Test> get tests;
  @override

  /// List of certificate Recovery statements
  List<RecoveryStatement> get recoveryStatements;
  @override

  /// Certificate DCC
  DCC get dcc;
  @override
  @JsonKey(ignore: true)
  _$CertificateCopyWith<_Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}