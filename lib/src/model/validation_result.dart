import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verificac19/src/model/certificate_status.dart';
import 'package:verificac19/verificac19.dart';

part 'validation_result.freezed.dart';

@freezed
class ValidationResult with _$ValidationResult {
  const ValidationResult._();

  factory ValidationResult({
    /// Validated certificate
    required Certificate certificate,

    /// Validation rules result
    required CertificateStatus status,
  }) = _ValidationResult;
}
