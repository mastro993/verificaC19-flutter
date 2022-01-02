import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verificac19/src/model/dcc.dart';
import 'package:verificac19/src/model/person.dart';
import 'package:verificac19/src/model/recovery_statement.dart';
import 'package:verificac19/src/model/test.dart';
import 'package:verificac19/src/model/vaccination.dart';

part 'certificate.freezed.dart';

@freezed
class Certificate with _$Certificate {
  const Certificate._();

  const factory Certificate({
    /// Personal information of the certificate subject
    required Person person,

    /// Date of birth of the person
    required DateTime dateOfBirth,

    /// List of certificate Vaccinations
    required List<Vaccination> vaccinations,

    /// List of certificate Test results
    required List<Test> tests,

    /// List of certificate Recovery statements
    required List<RecoveryStatement> recoveryStatements,

    /// Certificate DCC
    required DCC dcc,
  }) = _Certificate;
}
