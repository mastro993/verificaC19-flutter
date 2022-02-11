import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/test.dart';
import 'package:verificac19/src/model/validation_mode.dart';

abstract class TestValidator {
  /// Cecks the validity of a [Test] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> validate(
    Test test, {
    ValidationMode mode,
    required DateTime dateOfBirth,
  });
}
