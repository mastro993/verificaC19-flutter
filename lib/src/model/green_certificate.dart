import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verificac19/src/model/dcc.dart';
import 'package:verificac19/src/model/person.dart';
import 'package:verificac19/src/model/recovery_statement.dart';
import 'package:verificac19/src/model/test.dart';
import 'package:verificac19/src/model/vaccination.dart';

part 'green_certificate.freezed.dart';

@freezed
class GreenCertificate with _$GreenCertificate {
  const GreenCertificate._();

  const factory GreenCertificate({
    /// Personal information of the Green Certificate subject
    required Person person,

    /// Date of birth of the person
    required DateTime dateOfBirth,

    /// List of Certificate Vaccinations
    required List<Vaccination> vaccinations,

    /// List of Certificate Test results
    required List<Test> tests,

    /// List of Certificate Recovery statements
    required List<RecoveryStatement> recoveryStatements,

    /// Certificate DCC
    required DCC dcc,
  }) = _GreenCertificate;
}
