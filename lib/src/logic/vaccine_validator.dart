import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/vaccination.dart';
import 'package:verificac19/src/model/validation_mode.dart';

abstract class VaccineValidator {
  /// Cecks the validity of a [Vaccination] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> validate(
    Vaccination vaccination, {
    ValidationMode mode,
    required DateTime dateOfBirth,
  });
}
