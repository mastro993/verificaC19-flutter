import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/certificate_decoder.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/logic/certificate_validator_impl.dart';
import 'package:verificac19/verificac19.dart';

import 'fixtures/fixture_reader.dart';
import 'mocks.mocks.dart';

void main() {
  late MockLocalRepository cache;
  late CertificateValidator validator;

  setUp(() {
    cache = MockLocalRepository();
    validator = CertificateValidatorImpl(cache);

    final revokedListFixture = fixture('../cache/revokedList.json');
    final rulesFixture = fixture('../cache/rules.json');
    final signaturesFixture = fixture('../cache/signatures.json');
    final signaturesListFixture = fixture('../cache/signaturesList.json');

    final revokedListRaw = jsonDecode(revokedListFixture) as List<dynamic>;
    final revokedList = revokedListRaw.map((e) => e as String).toList();

    final rulesRaw = jsonDecode(rulesFixture) as List<dynamic>;
    final rules = rulesRaw.map((e) => ValidationRule.fromJson(e)).toList();

    final sigRaw = jsonDecode(signaturesFixture) as Map<String, dynamic>;
    final signatures = sigRaw.map((k, v) => MapEntry<String, String>(k, v));

    final sigListRaw = jsonDecode(signaturesListFixture) as List<dynamic>;
    final signaturesList = sigListRaw.map((e) => e as String).toList();

    when(cache.getRevokeList()).thenReturn(revokedList);
    when(cache.getRules()).thenReturn(rules);
    when(cache.getSignatures()).thenReturn(signatures);
    when(cache.getSignaturesList()).thenReturn(signaturesList);
    when(cache.isUvciRevoked(any)).thenAnswer(
      (i) => revokedList.contains(i.positionalArguments[0]),
    );
  });

  Future<void> validateRules(
    String certFixture,
    CertificateStatus expectedStatus, {
    ValidationMode? mode,
    DateTime? withDate,
  }) async {
    withClock(Clock.fixed(withDate ?? clock.now()), () async {
      final base45 = fixture(certFixture);
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      final result = await validator.checkValidationRules(
        cert,
        mode: mode ?? ValidationMode.normalDGP,
      );
      expect(result, equals(expectedStatus));
    });
  }

  Future<void> validateSignature(
    String certFixture,
    bool expectedResult,
  ) async {
    final base45 = fixture(certFixture);
    final cert = await CertificateDecoder.getCertificateFromRawData(base45);
    final sigOk = await validator.checkCertificateSignature(cert);

    expect(sigOk, equals(expectedResult));
  }

  test('Should not validate revoked or blacklisted certificate', () async {
    await validateRules('shit.txt', CertificateStatus.revoked);
  });

  test('Should not validate unsigned certificate', () async {
    await validateSignature('2.txt', false);
  });

  group('Rules verification on testing certificates', () {
    test('Should not validate certificate with expired vaccination (1/2)',
        () async {
      await validateRules(
        'eu_test_certificates/sk_1.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should not validate certificate with expired vaccination (1/2)',
        () async {
      await validateRules(
        'eu_test_certificates/sk_2.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should validate certificate with completed vaccination (2/2)',
        () async {
      await validateRules(
        'eu_test_certificates/sk_3.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should validate certificate with completed vaccination (2/2)',
        () async {
      await validateRules(
        'eu_test_certificates/sk_4.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should validate certificate with completed vaccination (1/1)',
        () async {
      await validateRules(
        'eu_test_certificates/sk_5.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should not validate certificate with expired recovery statement',
        () async {
      await validateRules(
        'eu_test_certificates/sk_6.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should not validate certificate with expired test result', () async {
      await validateRules(
        'eu_test_certificates/sk_7.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test('Should not validate certificate with expired test result', () async {
      await validateRules(
        'eu_test_certificates/sk_8.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2021, 12, 1),
      );
    });
  });

  group('Rules verification with special cases', () {
    test('Should validate certificate with test result', () async {
      await validateRules(
        'eu_test_certificates/sk_7.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 5, 22),
      );
    });

    test('Should validate certificate with test result', () async {
      await validateRules(
        'eu_test_certificates/sk_8.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 5, 22),
      );
    });

    test('Should not validate certificate without Super DGP', () async {
      await validateRules(
        'eu_test_certificates/sk_8.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2021, 5, 22),
        mode: ValidationMode.superDGP,
      );
    });

    test(
        'Should validate certificate with partial vaccination (1/2) only in Italy',
        () async {
      await validateRules(
        'eu_test_certificates/sk_1.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 6, 24),
      );
    });

    test('Should not validate certificate with test result not yet valid',
        () async {
      await validateRules(
        'eu_test_certificates/sk_7.txt',
        CertificateStatus.notValidYet,
        withDate: DateTime(2021, 4, 22),
      );
    });

    test('Should not validate certificate with vaccination not yet valid',
        () async {
      await validateRules(
        'eu_test_certificates/sk_1.txt',
        CertificateStatus.notValidYet,
        withDate: DateTime(2021, 5, 24),
      );
    });

    test('Should not validate certificate with vaccination not yet valid',
        () async {
      await validateRules(
        'eu_test_certificates/sk_3.txt',
        CertificateStatus.notValidYet,
        withDate: DateTime(2021, 5, 18),
      );
    });

    test('Should not validate certificate with vaccination expired', () async {
      await validateRules(
        'eu_test_certificates/sk_4.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2022, 6, 17),
      );
    });

    test('Should validate certificate with valid recovery statement', () async {
      await validateRules(
        'eu_test_certificates/sk_6.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 10, 20),
      );
    });

    test(
        'Should not validate certificate with recovery statement not yet valid',
        () async {
      await validateRules(
        'eu_test_certificates/sk_6.txt',
        CertificateStatus.notValidYet,
        withDate: DateTime(2021, 4, 22),
      );
    });

    test('Should not validate certificate with recovery statement expired',
        () async {
      await validateRules(
        'eu_test_certificates/sk_6.txt',
        CertificateStatus.notValid,
        withDate: DateTime(2022, 4, 22),
      );
    });

    test('Should not validate certificate without recovery statements',
        () async {
      final base45 = fixture('eu_test_certificates/sk_6.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.recoveryStatements.clear();
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notEuDCC));
    });

    test('Should not validate certificate without tests', () async {
      final base45 = fixture('eu_test_certificates/sk_7.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.tests.clear();
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notEuDCC));
    });

    test('Should not validate certificate without vaccinations', () async {
      final base45 = fixture('eu_test_certificates/sk_3.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.vaccinations.clear();
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notEuDCC));
    });

    test('Should not validate certificate with negative vaccination', () async {
      final base45 = fixture('eu_test_certificates/sk_3.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.vaccinations.add(cert.vaccinations.last.copyWith(doseNumber: -1));
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notValid));
    });

    test(
        'Should validate certificatw with Sputnik-V Vaccination from San Marino',
        () async {
      await validateRules(
        'eu_test_certificates/sm_1.txt',
        CertificateStatus.valid,
        withDate: DateTime(2021, 12, 1),
      );
    });

    test(
        'Should not validate certificate with Sputnik-V Vaccination from other countries',
        () async {
      final base45 = fixture('eu_test_certificates/sm_1.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.vaccinations
          .add(cert.vaccinations.last.copyWith(countryOfVaccination: 'IT'));
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notValid));
    });

    test('Should not validate certificate with fake tests', () async {
      final base45 = fixture('eu_test_certificates/sk_8.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.tests.add(cert.tests.last.copyWith(typeOfTest: 'Fake'));
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notValid));
    });

    test('Should not validate certificate with fake tests', () async {
      final base45 = fixture('eu_test_certificates/sm_1.txt');
      final cert = await CertificateDecoder.getCertificateFromRawData(base45);
      cert.vaccinations
          .add(cert.vaccinations.last.copyWith(medicinalProduct: 'Fake'));
      final result = await validator.checkValidationRules(cert);
      expect(result, equals(CertificateStatus.notValid));
    });
  });
}
