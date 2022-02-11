import 'package:verificac19/verificac19.dart';

abstract class CertificateValidator {
  /// Checks the given [certificate] with cached signatures.
  /// Returns true if certificate signature is valid.
  Future<bool> checkCertificateSignature(
    GreenCertificate certificate,
  );

  /// Cecks the validity of the given [certificate] using cached validation rules.
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> checkValidationRules(
    GreenCertificate certificate, {
    ValidationMode mode,
  });

  /// Validates and a certificate with the cached rules and checks its signature.
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  });
}
