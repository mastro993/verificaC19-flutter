import 'package:freezed_annotation/freezed_annotation.dart';

part 'exemption.freezed.dart';

@freezed
class Exemption with _$Exemption {
  const Exemption._();

  const factory Exemption({
    required String disease,
    required String countryOfVaccination,
    required String certificateIssuer,
    required String certificateIdentifier,
    required DateTime certificateValidFrom,
    required DateTime? certificateValidUntil,
  }) = _Exemption;
}
