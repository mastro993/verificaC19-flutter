import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_statement.freezed.dart';

@freezed
class RecoveryStatement with _$RecoveryStatement {
  const RecoveryStatement._();

  const factory RecoveryStatement({
    required String disease,
    required DateTime dateOfFirstPositiveTest,
    required DateTime certificateValidFrom,
    required DateTime certificateValidUntil,
    required String countryOfVaccination,
    required String certificateIssuer,
    required String certificateIdentifier,
  }) = _RecoveryStatement;
}
