import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verificac19/verificac19.dart';

part 'validation_result.freezed.dart';

@freezed
class ValidationResult with _$ValidationResult {
  const ValidationResult._();

  factory ValidationResult({
    /// Validated certificate
    required GreenCertificate certificate,

    /// Validation rules result
    required GreenCertificateStatus certificateStatus,

    /// Validation mode used for the result
    required ValidationMode validationMode,

    /// Date and time of the validation
    required DateTime validationDateTime,
  }) = _ValidationResult;
}
