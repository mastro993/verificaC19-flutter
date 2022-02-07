import 'package:verificac19/src/model/exemption.dart';
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

  /// Checks the validity of a [List] of [RecoveryStatement] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> checkRecoveryStatement(
    RecoveryStatement recoveryStatement, {
    ValidationMode mode,
    bool isRecoveryBis,
  });

  /// Cecks the validity of a [List] of [Test] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> checkTest(
    Test test, {
    ValidationMode mode,
  });

  /// Cecks the validity of a [List] of [Vaccination] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> checkVaccination(
    Vaccination vaccination, {
    ValidationMode mode,
  });

  /// Cecks the validity of a [List] of [Exemption] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> checkExemption(
    Exemption exemption, {
    ValidationMode mode,
  });

  /// Validates and a certificate with the cached rules and checks its signature.
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  });
}
