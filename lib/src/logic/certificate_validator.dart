import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/verificac19.dart';

abstract class CertificateValidator {
  Future<ValidationResult> validate(
    Certificate certificate, {
    ValidationMode mode,
  });
}
