import 'package:verificac19/src/model/certificate.dart';
import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/src/model/validation_result.dart';

abstract class VerificaC19Interface {
  /// Initializes dependencies
  Future<void> initialize();

  /// Check if rules, CRL and/or DSCs are expired (older than 24 hours)
  Future<bool> needsUpdate();

  /// Download and cache rules, CRL data and DSCs
  ///
  /// Optional parameter [forced] can be passed to force the update before the 24 hours expiry window
  Future<void> update({bool forced});

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
