import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccination.freezed.dart';

@freezed
class Vaccination with _$Vaccination {
  const Vaccination._();

  const factory Vaccination({
    required String disease,
    required String vaccine,
    required String medicinalProduct,
    required String manufacturer,
    required int doseNumber,
    required int totalSeriesOfDoses,
    required DateTime dateOfVaccination,
    required String countryOfVaccination,
    required String certificateIssuer,
    required String certificateIdentifier,
  }) = _Vaccination;
}
