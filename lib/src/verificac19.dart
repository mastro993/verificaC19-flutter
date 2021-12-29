import 'package:verificac19/src/model/certificate.dart';
import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/src/model/validation_result.dart';

abstract class VerificaC19Interface {
  Future<void> initialize();

  Future<void> update();

  Future<Certificate> getCertificateFromRaw(
    String rawData,
  );

  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  });

  Future<ValidationResult> validateCertificate(
    Certificate certificate, {
    ValidationMode mode = ValidationMode.normalDGP,
  });
}
