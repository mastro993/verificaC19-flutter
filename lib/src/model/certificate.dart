import 'package:verificac19/src/model/dcc.dart';
import 'package:verificac19/src/model/person.dart';
import 'package:verificac19/src/model/recovery_statement.dart';
import 'package:verificac19/src/model/test.dart';
import 'package:verificac19/src/model/vaccination.dart';

class Certificate {
  final Person person;
  final DateTime dateOfBirth;
  final String kid;
  final List<Vaccination> vaccinations;
  final List<Test> tests;
  final List<RecoveryStatement> recoveryStatements;
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
