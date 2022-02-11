import 'package:verificac19/src/model/exemption.dart';
import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/validation_mode.dart';

abstract class ExemptionValidator {
  /// Cecks the validity of an [Exemption]
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> validate(
    Exemption exemption, {
    ValidationMode mode,
  });
}
