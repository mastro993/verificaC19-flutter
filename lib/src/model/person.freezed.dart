// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Person {
  /// Surname of the person with standard characters
  String get standardisedFamilyName => throw _privateConstructorUsedError;

  /// Surname of the person
  String get familyName => throw _privateConstructorUsedError;

  /// Name of the person with standard characters
  String get standardisedGivenName => throw _privateConstructorUsedError;

  /// Name of the person
  String get givenName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {String standardisedFamilyName,
      String familyName,
      String standardisedGivenName,
      String givenName});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardisedFamilyName = null,
    Object? familyName = null,
    Object? standardisedGivenName = null,
    Object? givenName = null,
  }) {
    return _then(_value.copyWith(
      standardisedFamilyName: null == standardisedFamilyName
          ? _value.standardisedFamilyName
          : standardisedFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      standardisedGivenName: null == standardisedGivenName
          ? _value.standardisedGivenName
          : standardisedGivenName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$_PersonCopyWith(_$_Person value, $Res Function(_$_Person) then) =
      __$$_PersonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String standardisedFamilyName,
      String familyName,
      String standardisedGivenName,
      String givenName});
}

/// @nodoc
class __$$_PersonCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$_Person>
    implements _$$_PersonCopyWith<$Res> {
  __$$_PersonCopyWithImpl(_$_Person _value, $Res Function(_$_Person) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardisedFamilyName = null,
    Object? familyName = null,
    Object? standardisedGivenName = null,
    Object? givenName = null,
  }) {
    return _then(_$_Person(
      standardisedFamilyName: null == standardisedFamilyName
          ? _value.standardisedFamilyName
          : standardisedFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: null == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      standardisedGivenName: null == standardisedGivenName
          ? _value.standardisedGivenName
          : standardisedGivenName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: null == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Person extends _Person {
  const _$_Person(
      {required this.standardisedFamilyName,
      required this.familyName,
      required this.standardisedGivenName,
      required this.givenName})
      : super._();

  /// Surname of the person with standard characters
  @override
  final String standardisedFamilyName;

  /// Surname of the person
  @override
  final String familyName;

  /// Name of the person with standard characters
  @override
  final String standardisedGivenName;

  /// Name of the person
  @override
  final String givenName;

  @override
  String toString() {
    return 'Person(standardisedFamilyName: $standardisedFamilyName, familyName: $familyName, standardisedGivenName: $standardisedGivenName, givenName: $givenName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Person &&
            (identical(other.standardisedFamilyName, standardisedFamilyName) ||
                other.standardisedFamilyName == standardisedFamilyName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.standardisedGivenName, standardisedGivenName) ||
                other.standardisedGivenName == standardisedGivenName) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, standardisedFamilyName,
      familyName, standardisedGivenName, givenName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonCopyWith<_$_Person> get copyWith =>
      __$$_PersonCopyWithImpl<_$_Person>(this, _$identity);
}

abstract class _Person extends Person {
  const factory _Person(
      {required final String standardisedFamilyName,
      required final String familyName,
      required final String standardisedGivenName,
      required final String givenName}) = _$_Person;
  const _Person._() : super._();

  @override

  /// Surname of the person with standard characters
  String get standardisedFamilyName;
  @override

  /// Surname of the person
  String get familyName;
  @override

  /// Name of the person with standard characters
  String get standardisedGivenName;
  @override

  /// Name of the person
  String get givenName;
  @override
  @JsonKey(ignore: true)
  _$$_PersonCopyWith<_$_Person> get copyWith =>
      throw _privateConstructorUsedError;
}
