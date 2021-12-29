import 'package:verificac19/src/model/certificate_status.dart';

class ValidationResult {
  /// Indicates if DGC is valid or not
  final bool result;

  /// Validity status
  final CertificateStatus status;

  /// Validity details
  final String? message;

  const ValidationResult({
    required this.result,
    required this.status,
    required this.message,
  });
}
