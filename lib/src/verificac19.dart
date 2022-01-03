import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/src/model/validation_result.dart';

abstract class VerificaC19Interface {
  /// Initializes dependencies
  Future<void> initialize();

  /// Check if rules, CRL and/or DSCs are expired (older than 24 hours)
  /// The maximum update window is 24 hour.
  Future<bool> needsUpdate();

  /// Returns a [DateTime] with the date and time of the last completed rules update
  /// Returns null if no date is available
  Future<DateTime?> getLastUpdateTime();

  /// Download and cache rules, CRL data and DSCs
  ///
  /// Optional parameter [forced] can be passed to force the update before the 24 hours expiry window
  /// The minimun update window is 1 hour.
  Future<void> update({bool forced});

  /// Parses and validates a DCG from [rawData].
  /// A [mode] con be optionally provided.
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  });
}
