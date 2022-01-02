import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/verificac19.dart';

abstract class CertificateValidator {
  /// Checks the given [certificate] with cached signatures
  Future<bool> checkCertificateSignature(
    Certificate certificate,
  );

  /// Cecks the validity of the given [certificate] using cached validation rules.
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<CertificateStatus> checkValidationRules(
    Certificate certificate, {
    ValidationMode mode,
  });

  /// Checks the validity of a [List] of [RecoveryStatement] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<CertificateStatus> checkRecoveryStatements(
    List<RecoveryStatement> recoveryStatements, {
    ValidationMode mode,
  });

  /// Cecks the validity of a [List] of [Test] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<CertificateStatus> checkTests(
    List<Test> tests, {
    ValidationMode mode,
  });

  /// Cecks the validity of a [List] of [Vaccination] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<CertificateStatus> checkVaccinations(
    List<Vaccination> vaccinations, {
    ValidationMode mode,
  });
}
