// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PersonCopyWithImpl<$Res>;
  $Res call(
      {String standardisedFamilyName,
      String familyName,
      String standardisedGivenName,
      String givenName});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res> implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  final Person _value;
  // ignore: unused_field
  final $Res Function(Person) _then;

  @override
  $Res call({
    Object? standardisedFamilyName = freezed,
    Object? familyName = freezed,
    Object? standardisedGivenName = freezed,
    Object? givenName = freezed,
  }) {
    return _then(_value.copyWith(
      standardisedFamilyName: standardisedFamilyName == freezed
          ? _value.standardisedFamilyName
          : standardisedFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      standardisedGivenName: standardisedGivenName == freezed
          ? _value.standardisedGivenName
          : standardisedGivenName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$_PersonCopyWith(_$_Person value, $Res Function(_$_Person) then) =
      __$$_PersonCopyWithImpl<$Res>;
  @override
  $Res call(
      {String standardisedFamilyName,
      String familyName,
      String standardisedGivenName,
      String givenName});
}

/// @nodoc
class __$$_PersonCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements _$$_PersonCopyWith<$Res> {
  __$$_PersonCopyWithImpl(_$_Person _value, $Res Function(_$_Person) _then)
      : super(_value, (v) => _then(v as _$_Person));

  @override
  _$_Person get _value => super._value as _$_Person;

  @override
  $Res call({
    Object? standardisedFamilyName = freezed,
    Object? familyName = freezed,
    Object? standardisedGivenName = freezed,
    Object? givenName = freezed,
  }) {
    return _then(_$_Person(
      standardisedFamilyName: standardisedFamilyName == freezed
          ? _value.standardisedFamilyName
          : standardisedFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String,
      standardisedGivenName: standardisedGivenName == freezed
          ? _value.standardisedGivenName
          : standardisedGivenName // ignore: cast_nullable_to_non_nullable
              as String,
      givenName: givenName == freezed
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
            const DeepCollectionEquality()
                .equals(other.standardisedFamilyName, standardisedFamilyName) &&
            const DeepCollectionEquality()
                .equals(other.familyName, familyName) &&
            const DeepCollectionEquality()
                .equals(other.standardisedGivenName, standardisedGivenName) &&
            const DeepCollectionEquality().equals(other.givenName, givenName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(standardisedFamilyName),
      const DeepCollectionEquality().hash(familyName),
      const DeepCollectionEquality().hash(standardisedGivenName),
      const DeepCollectionEquality().hash(givenName));

  @JsonKey(ignore: true)
  @override
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
