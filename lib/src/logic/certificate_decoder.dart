import 'package:verificac19/src/utils/dcc_utils.dart';
import 'package:verificac19/verificac19.dart';

class CertificateDecoder {
  static Future<Certificate> getCertificateFromRawData(String rawData) async {
    try {
      final DCC dcc = await DccUtils.getDCCFromRawData(rawData);
      final dateOfBirth = DateTime.parse(dcc.payload['dob']);

      final person = Person(
        standardisedFamilyName: dcc.payload['nam']['fnt'],
        familyName: dcc.payload['nam']['fn'],
        standardisedGivenName: dcc.payload['nam']['gnt'],
        givenName: dcc.payload['nam']['gn'],
      );

      // Vaccinations

      final List vList = dcc.payload['v'] ?? [];
      final List<Vaccination> vaccinations = [];

      for (final v in vList) {
        final vaccination = Vaccination(
          disease: v['tg'],
          vaccine: v['vp'],
          medicinalProduct: v['mp'],
          manufacturer: v['ma'],
          doseNumber: v['dn'],
          totalSeriesOfDoses: v['sd'],
          dateOfVaccination: DateTime.parse(v['dt']),
          countryOfVaccination: v['co'],
          certificateIssuer: v['is'],
          certificateIdentifier: v['ci'],
        );
        vaccinations.add(vaccination);
      }

      // Tests

      final List tList = dcc.payload['t'] ?? [];
      final List<Test> tests = [];

      for (final t in tList) {
        final test = Test(
          disease: t['tg'],
          typeOfTest: t['tt'],
          testName: t['nm'],
          testNameAndManufacturer: null,
          dateTimeOfCollection: DateTime.parse(t['sc']),
          dateTimeOfTestResult: null,
          testResult: t['tr'],
          testingCentre: t['tc'],
          countryOfVaccination: t['co'],
          certificateIssuer: t['is'],
          certificateIdentifier: t['ci'],
        );
        tests.add(test);
      }

      // Recovery statements

      final List rList = dcc.payload['r'] ?? [];
      final List<RecoveryStatement> recoveryStatements = [];

      for (final r in rList) {
        final recoveryStatement = RecoveryStatement(
          disease: r['tg'],
          dateOfFirstPositiveTest: DateTime.parse(r['fr']),
          countryOfVaccination: r['co'],
          certificateIssuer: r['is'],
          certificateValidFrom: DateTime.parse(r['df']),
          certificateValidUntil: DateTime.parse(r['du']),
          certificateIdentifier: r['ci'],
        );
        recoveryStatements.add(recoveryStatement);
      }

      return Certificate(
        person: person,
        dateOfBirth: dateOfBirth,
        vaccinations: vaccinations,
        tests: tests,
        recoveryStatements: recoveryStatements,
        dcc: dcc,
      );
    } catch (e) {
      throw DecodeException();
    }
  }
}
