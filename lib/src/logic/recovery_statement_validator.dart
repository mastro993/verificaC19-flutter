import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/recovery_statement.dart';
import 'package:verificac19/src/model/validation_mode.dart';

abstract class RecoveryStatementValidator {
  /// Checks the validity of a [RecoveryStatement] using cached validation rules
  /// A [mode] can be passed optionally. Default is [ValidationMode.normalDGP]
  Future<GreenCertificateStatus> validate(
    RecoveryStatement statement, {
    ValidationMode mode,
    bool isRecoveryBis,
    required DateTime dateOfBirth,
  });
}
