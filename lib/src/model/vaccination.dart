class Vaccination {
  final String disease;
  final String vaccine;
  final String medicinalProduct;
  final String manufacturer;
  final int doseNumber;
  final int totalSeriesOfDoses;
  final DateTime dateOfVaccination;
  final String countryOfVaccination;
  final String certificateIssuer;
  final String certificateIdentifier;

  const Vaccination({
    required this.disease,
    required this.vaccine,
    required this.medicinalProduct,
    required this.manufacturer,
    required this.doseNumber,
    required this.totalSeriesOfDoses,
    required this.dateOfVaccination,
    required this.countryOfVaccination,
    required this.certificateIssuer,
    required this.certificateIdentifier,
  });
}
