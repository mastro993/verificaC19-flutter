class RecoveryStatement {
  final String disease;
  final DateTime dateOfFirstPositiveTest;
  final DateTime certificateValidFrom;
  final DateTime certificateValidUntil;
  final String countryOfVaccination;
  final String certificateIssuer;
  final String certificateIdentifier;

  const RecoveryStatement({
    required this.disease,
    required this.dateOfFirstPositiveTest,
    required this.certificateValidFrom,
    required this.certificateValidUntil,
    required this.countryOfVaccination,
    required this.certificateIssuer,
    required this.certificateIdentifier,
  });
}
