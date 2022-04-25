// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'green_certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GreenCertificate {
  /// Personal information of the Green Certificate subject
  Person get person => throw _privateConstructorUsedError;

  /// Date of birth of the person
  DateTime get dateOfBirth => throw _privateConstructorUsedError;

  /// List of Certificate Vaccinations
  List<Vaccination> get vaccinations => throw _privateConstructorUsedError;

  /// List of Certificate Test results
  List<Test> get tests => throw _privateConstructorUsedError;

  /// List of Certificate Recovery statements
  List<RecoveryStatement> get recoveryStatements =>
      throw _privateConstructorUsedError;

  /// List of Certificate Vaccine exemptions
  List<Exemption> get exemptions => throw _privateConstructorUsedError;

  /// Certificate DCC
  DCC get dcc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GreenCertificateCopyWith<GreenCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GreenCertificateCopyWith<$Res> {
  factory $GreenCertificateCopyWith(
          GreenCertificate value, $Res Function(GreenCertificate) then) =
      _$GreenCertificateCopyWithImpl<$Res>;
  $Res call(
      {Person person,
      DateTime dateOfBirth,
      List<Vaccination> vaccinations,
      List<Test> tests,
      List<RecoveryStatement> recoveryStatements,
      List<Exemption> exemptions,
      DCC dcc});

  $PersonCopyWith<$Res> get person;
  $DCCCopyWith<$Res> get dcc;
}

/// @nodoc
class _$GreenCertificateCopyWithImpl<$Res>
    implements $GreenCertificateCopyWith<$Res> {
  _$GreenCertificateCopyWithImpl(this._value, this._then);

  final GreenCertificate _value;
  // ignore: unused_field
  final $Res Function(GreenCertificate) _then;

  @override
  $Res call({
    Object? person = freezed,
    Object? dateOfBirth = freezed,
    Object? vaccinations = freezed,
    Object? tests = freezed,
    Object? recoveryStatements = freezed,
    Object? exemptions = freezed,
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
      exemptions: exemptions == freezed
          ? _value.exemptions
          : exemptions // ignore: cast_nullable_to_non_nullable
              as List<Exemption>,
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
abstract class _$GreenCertificateCopyWith<$Res>
    implements $GreenCertificateCopyWith<$Res> {
  factory _$GreenCertificateCopyWith(
          _GreenCertificate value, $Res Function(_GreenCertificate) then) =
      __$GreenCertificateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Person person,
      DateTime dateOfBirth,
      List<Vaccination> vaccinations,
      List<Test> tests,
      List<RecoveryStatement> recoveryStatements,
      List<Exemption> exemptions,
      DCC dcc});

  @override
  $PersonCopyWith<$Res> get person;
  @override
  $DCCCopyWith<$Res> get dcc;
}

/// @nodoc
class __$GreenCertificateCopyWithImpl<$Res>
    extends _$GreenCertificateCopyWithImpl<$Res>
    implements _$GreenCertificateCopyWith<$Res> {
  __$GreenCertificateCopyWithImpl(
      _GreenCertificate _value, $Res Function(_GreenCertificate) _then)
      : super(_value, (v) => _then(v as _GreenCertificate));

  @override
  _GreenCertificate get _value => super._value as _GreenCertificate;

  @override
  $Res call({
    Object? person = freezed,
    Object? dateOfBirth = freezed,
    Object? vaccinations = freezed,
    Object? tests = freezed,
    Object? recoveryStatements = freezed,
    Object? exemptions = freezed,
    Object? dcc = freezed,
  }) {
    return _then(_GreenCertificate(
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
      exemptions: exemptions == freezed
          ? _value.exemptions
          : exemptions // ignore: cast_nullable_to_non_nullable
              as List<Exemption>,
      dcc: dcc == freezed
          ? _value.dcc
          : dcc // ignore: cast_nullable_to_non_nullable
              as DCC,
    ));
  }
}

/// @nodoc

class _$_GreenCertificate extends _GreenCertificate {
  const _$_GreenCertificate(
      {required this.person,
      required this.dateOfBirth,
      required final List<Vaccination> vaccinations,
      required final List<Test> tests,
      required final List<RecoveryStatement> recoveryStatements,
      required final List<Exemption> exemptions,
      required this.dcc})
      : _vaccinations = vaccinations,
        _tests = tests,
        _recoveryStatements = recoveryStatements,
        _exemptions = exemptions,
        super._();

  /// Personal information of the Green Certificate subject
  @override
  final Person person;

  /// Date of birth of the person
  @override
  final DateTime dateOfBirth;

  /// List of Certificate Vaccinations
  final List<Vaccination> _vaccinations;

  /// List of Certificate Vaccinations
  @override
  List<Vaccination> get vaccinations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vaccinations);
  }

  /// List of Certificate Test results
  final List<Test> _tests;

  /// List of Certificate Test results
  @override
  List<Test> get tests {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tests);
  }

  /// List of Certificate Recovery statements
  final List<RecoveryStatement> _recoveryStatements;

  /// List of Certificate Recovery statements
  @override
  List<RecoveryStatement> get recoveryStatements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryStatements);
  }

  /// List of Certificate Vaccine exemptions
  final List<Exemption> _exemptions;

  /// List of Certificate Vaccine exemptions
  @override
  List<Exemption> get exemptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exemptions);
  }

  /// Certificate DCC
  @override
  final DCC dcc;

  @override
  String toString() {
    return 'GreenCertificate(person: $person, dateOfBirth: $dateOfBirth, vaccinations: $vaccinations, tests: $tests, recoveryStatements: $recoveryStatements, exemptions: $exemptions, dcc: $dcc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GreenCertificate &&
            const DeepCollectionEquality().equals(other.person, person) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other.vaccinations, vaccinations) &&
            const DeepCollectionEquality().equals(other.tests, tests) &&
            const DeepCollectionEquality()
                .equals(other.recoveryStatements, recoveryStatements) &&
            const DeepCollectionEquality()
                .equals(other.exemptions, exemptions) &&
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
      const DeepCollectionEquality().hash(exemptions),
      const DeepCollectionEquality().hash(dcc));

  @JsonKey(ignore: true)
  @override
  _$GreenCertificateCopyWith<_GreenCertificate> get copyWith =>
      __$GreenCertificateCopyWithImpl<_GreenCertificate>(this, _$identity);
}

abstract class _GreenCertificate extends GreenCertificate {
  const factory _GreenCertificate(
      {required final Person person,
      required final DateTime dateOfBirth,
      required final List<Vaccination> vaccinations,
      required final List<Test> tests,
      required final List<RecoveryStatement> recoveryStatements,
      required final List<Exemption> exemptions,
      required final DCC dcc}) = _$_GreenCertificate;
  const _GreenCertificate._() : super._();

  @override

  /// Personal information of the Green Certificate subject
  Person get person => throw _privateConstructorUsedError;
  @override

  /// Date of birth of the person
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  @override

  /// List of Certificate Vaccinations
  List<Vaccination> get vaccinations => throw _privateConstructorUsedError;
  @override

  /// List of Certificate Test results
  List<Test> get tests => throw _privateConstructorUsedError;
  @override

  /// List of Certificate Recovery statements
  List<RecoveryStatement> get recoveryStatements =>
      throw _privateConstructorUsedError;
  @override

  /// List of Certificate Vaccine exemptions
  List<Exemption> get exemptions => throw _privateConstructorUsedError;
  @override

  /// Certificate DCC
  DCC get dcc => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GreenCertificateCopyWith<_GreenCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}
