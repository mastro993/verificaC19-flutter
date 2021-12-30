import 'package:flutter_test/flutter_test.dart';
import 'package:verificac19/src/logic/certificate_parser.dart';
import 'package:verificac19/verificac19.dart';

import './fixtures/fixture_reader.dart';

void main() {
  group('Parse certificates data', () {
    test('Should parse EC 256 key certificate', () async {
      final base45 = fixture('test_certificate_ec256.txt');
      final result = await CertificateParser.getCertificateFromRawData(base45);
      assert(result.person.givenName == "Gabriele");
    });

    test('Should parse RSA 2048 key certificate', () async {
      final base45 = fixture('test_certificate_rsa2048.txt');
      final result = await CertificateParser.getCertificateFromRawData(base45);
      assert(result.person.givenName == "Gabriele");
    });

    test('Should parse RSA 3072 key certificate', () async {
      final base45 = fixture('test_certificate_rsa3072.txt');
      final result = await CertificateParser.getCertificateFromRawData(base45);
      assert(result.person.givenName == "Gabriele");
    });

    test('Should not parse faulty CWT certificate', () async {
      final base45 = fixture('test_certificate_faulty_cwt.txt');
      expect(
        () async => await CertificateParser.getCertificateFromRawData(base45),
        throwsA(isA<ParseException>()),
      );
    });

    test('Should not parse No-op compressor certificate', () async {
      final base45 = fixture('test_certificate_noop_comp.txt');
      expect(
        () async => await CertificateParser.getCertificateFromRawData(base45),
        throwsA(isA<ParseException>()),
      );
    });
  });
}
