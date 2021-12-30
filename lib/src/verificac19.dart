import 'package:verificac19/src/model/certificate.dart';
import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/src/model/validation_result.dart';

abstract class VerificaC19Interface {
  /// Initializes dependencies
  Future<void> initialize();

  /// Check if rules, CRL and/or DSCs need to be updated
  Future<bool> needsUpdate();

  /// Download and cache rules, CRL data and DSCs
  Future<void> update();

  /// Retrives a [Certificate] from a Base45 encoded string provided by [rawData] parameter.
  ///
  /// Throws a [ParseException] if no Certificate is found.
  Future<Certificate> getCertificateFromRaw(
    String rawData,
  );

  /// Parses and validates a DCG from [rawData].
  /// A [mode] con be optionally provided.
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  });

  /// Validates a DCG from [certificate].
  /// A [mode] con be optionally provided.
  Future<ValidationResult> validateCertificate(
    Certificate certificate, {
    ValidationMode mode = ValidationMode.normalDGP,
  });
}
