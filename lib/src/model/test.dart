class Test {
  final String disease;
  final String typeOfTest;
  final String? testName;
  final String? testNameAndManufacturer;
  final DateTime dateTimeOfCollection;
  final DateTime? dateTimeOfTestResult;
  final String testResult;
  final String testingCentre;
  final String countryOfVaccination;
  final String certificateIssuer;
  final String certificateIdentifier;

  const Test({
    required this.disease,
    required this.typeOfTest,
    required this.testName,
    this.testNameAndManufacturer,
    required this.dateTimeOfCollection,
    this.dateTimeOfTestResult,
    required this.testResult,
    required this.testingCentre,
    required this.countryOfVaccination,
    required this.certificateIssuer,
    required this.certificateIdentifier,
  });
}
