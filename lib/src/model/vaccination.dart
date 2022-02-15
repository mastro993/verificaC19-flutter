import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verificac19/src/core/constants.dart';

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

  bool get isIT => countryOfVaccination == Country.italy;
  bool get isSM => countryOfVaccination == Country.sanMarino;
  bool get isJJ => medicinalProduct == VaccineType.johnson;
  bool get isSputnik => medicinalProduct == VaccineType.sputnik;
  bool get isJJBooster =>
      isJJ && (doseNumber >= RuleValue.jjBoosterMinimumDosesNumber);
  bool get isNotJJBooster =>
      !isJJ && (doseNumber >= RuleValue.boosterMinimumDosesNumber);

  bool get isIncomplete => doseNumber < totalSeriesOfDoses;
  bool get isComplete =>
      (doseNumber == totalSeriesOfDoses) && !isJJBooster && !isNotJJBooster;
  bool get isBooster =>
      (doseNumber > totalSeriesOfDoses) || (isJJBooster || isNotJJBooster);

  bool get isEma => VaccineType.emaList.contains(medicinalProduct);
}
