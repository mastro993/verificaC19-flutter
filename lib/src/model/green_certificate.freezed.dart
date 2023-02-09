// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$GreenCertificateCopyWithImpl<$Res, GreenCertificate>;
  @useResult
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
class _$GreenCertificateCopyWithImpl<$Res, $Val extends GreenCertificate>
    implements $GreenCertificateCopyWith<$Res> {
  _$GreenCertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? dateOfBirth = null,
    Object? vaccinations = null,
    Object? tests = null,
    Object? recoveryStatements = null,
    Object? exemptions = null,
    Object? dcc = null,
  }) {
    return _then(_value.copyWith(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vaccinations: null == vaccinations
          ? _value.vaccinations
          : vaccinations // ignore: cast_nullable_to_non_nullable
              as List<Vaccination>,
      tests: null == tests
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<Test>,
      recoveryStatements: null == recoveryStatements
          ? _value.recoveryStatements
          : recoveryStatements // ignore: cast_nullable_to_non_nullable
              as List<RecoveryStatement>,
      exemptions: null == exemptions
          ? _value.exemptions
          : exemptions // ignore: cast_nullable_to_non_nullable
              as List<Exemption>,
      dcc: null == dcc
          ? _value.dcc
          : dcc // ignore: cast_nullable_to_non_nullable
              as DCC,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get person {
    return $PersonCopyWith<$Res>(_value.person, (value) {
      return _then(_value.copyWith(person: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DCCCopyWith<$Res> get dcc {
    return $DCCCopyWith<$Res>(_value.dcc, (value) {
      return _then(_value.copyWith(dcc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GreenCertificateCopyWith<$Res>
    implements $GreenCertificateCopyWith<$Res> {
  factory _$$_GreenCertificateCopyWith(
          _$_GreenCertificate value, $Res Function(_$_GreenCertificate) then) =
      __$$_GreenCertificateCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_GreenCertificateCopyWithImpl<$Res>
    extends _$GreenCertificateCopyWithImpl<$Res, _$_GreenCertificate>
    implements _$$_GreenCertificateCopyWith<$Res> {
  __$$_GreenCertificateCopyWithImpl(
      _$_GreenCertificate _value, $Res Function(_$_GreenCertificate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? dateOfBirth = null,
    Object? vaccinations = null,
    Object? tests = null,
    Object? recoveryStatements = null,
    Object? exemptions = null,
    Object? dcc = null,
  }) {
    return _then(_$_GreenCertificate(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vaccinations: null == vaccinations
          ? _value._vaccinations
          : vaccinations // ignore: cast_nullable_to_non_nullable
              as List<Vaccination>,
      tests: null == tests
          ? _value._tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<Test>,
      recoveryStatements: null == recoveryStatements
          ? _value._recoveryStatements
          : recoveryStatements // ignore: cast_nullable_to_non_nullable
              as List<RecoveryStatement>,
      exemptions: null == exemptions
          ? _value._exemptions
          : exemptions // ignore: cast_nullable_to_non_nullable
              as List<Exemption>,
      dcc: null == dcc
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
    if (_vaccinations is EqualUnmodifiableListView) return _vaccinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vaccinations);
  }

  /// List of Certificate Test results
  final List<Test> _tests;

  /// List of Certificate Test results
  @override
  List<Test> get tests {
    if (_tests is EqualUnmodifiableListView) return _tests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tests);
  }

  /// List of Certificate Recovery statements
  final List<RecoveryStatement> _recoveryStatements;

  /// List of Certificate Recovery statements
  @override
  List<RecoveryStatement> get recoveryStatements {
    if (_recoveryStatements is EqualUnmodifiableListView)
      return _recoveryStatements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recoveryStatements);
  }

  /// List of Certificate Vaccine exemptions
  final List<Exemption> _exemptions;

  /// List of Certificate Vaccine exemptions
  @override
  List<Exemption> get exemptions {
    if (_exemptions is EqualUnmodifiableListView) return _exemptions;
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
            other is _$_GreenCertificate &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            const DeepCollectionEquality()
                .equals(other._vaccinations, _vaccinations) &&
            const DeepCollectionEquality().equals(other._tests, _tests) &&
            const DeepCollectionEquality()
                .equals(other._recoveryStatements, _recoveryStatements) &&
            const DeepCollectionEquality()
                .equals(other._exemptions, _exemptions) &&
            (identical(other.dcc, dcc) || other.dcc == dcc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      person,
      dateOfBirth,
      const DeepCollectionEquality().hash(_vaccinations),
      const DeepCollectionEquality().hash(_tests),
      const DeepCollectionEquality().hash(_recoveryStatements),
      const DeepCollectionEquality().hash(_exemptions),
      dcc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GreenCertificateCopyWith<_$_GreenCertificate> get copyWith =>
      __$$_GreenCertificateCopyWithImpl<_$_GreenCertificate>(this, _$identity);
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
  Person get person;
  @override

  /// Date of birth of the person
  DateTime get dateOfBirth;
  @override

  /// List of Certificate Vaccinations
  List<Vaccination> get vaccinations;
  @override

  /// List of Certificate Test results
  List<Test> get tests;
  @override

  /// List of Certificate Recovery statements
  List<RecoveryStatement> get recoveryStatements;
  @override

  /// List of Certificate Vaccine exemptions
  List<Exemption> get exemptions;
  @override

  /// Certificate DCC
  DCC get dcc;
  @override
  @JsonKey(ignore: true)
  _$$_GreenCertificateCopyWith<_$_GreenCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}
