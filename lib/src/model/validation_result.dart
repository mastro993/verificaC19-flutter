import 'package:verificac19/src/model/certificate_status.dart';

class ValidationResult {
  final bool result;
  final CertificateStatus status;
  final String? message;

  const ValidationResult({
    required this.result,
    required this.status,
    required this.message,
  });
}
