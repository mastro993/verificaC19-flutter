import 'package:verificac19/src/model/dcc.dart';
import 'package:verificac19/src/model/person.dart';
import 'package:verificac19/src/model/recovery_statement.dart';
import 'package:verificac19/src/model/test.dart';
import 'package:verificac19/src/model/vaccination.dart';

class Certificate {
  /// Personal information of the certificate subject
  final Person person;

  /// Date of birth of the person
  final DateTime dateOfBirth;

  /// Certificate KID
  final String kid;

  /// List of certificate Vaccinations
  final List<Vaccination> vaccinations;

  /// List of certificate Test results
  final List<Test> tests;

  /// List of certificate Recovery statements
  final List<RecoveryStatement> recoveryStatements;

  /// Certificate DCC
  final DCC dcc;

  const Certificate({
    required this.person,
    required this.dateOfBirth,
    required this.kid,
    required this.vaccinations,
    required this.tests,
    required this.recoveryStatements,
    required this.dcc,
  });
}
