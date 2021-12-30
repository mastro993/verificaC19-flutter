import 'package:verificac19/src/model/certificate_status.dart';
import 'package:verificac19/src/model/validation_error.dart';

class ValidationResult {
  /// Indicates if DGC is valid or not
  final bool result;

  /// Validity status
  final CertificateStatus status;

  final ValidationError? error;

  /// Validity details
  final String? message;

  const ValidationResult({
    required this.result,
    required this.status,
    this.message,
    this.error,
  });
}
