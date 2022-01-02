import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const Person._();

  const factory Person({
    /// Surname of the person with standard characters
    required String standardisedFamilyName,

    /// Surname of the person
    required String familyName,

    /// Name of the person with standard characters
    required String standardisedGivenName,

    /// Name of the person
    required String givenName,
  }) = _Person;
}
