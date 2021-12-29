import 'package:flutter_test/flutter_test.dart';
import 'package:verificac19/src/logic/certificate_parser.dart';
import 'package:verificac19/verificac19.dart';

import './fixtures/fixture_reader.dart';

void main() {
  test('Should get certificate from image', () async {
    // arrange
    // act
    // assert
  });

  test('Should get certificate from raw data', () async {
    // arrange
    // act
    Certificate result = await CertificateParser.getCertificateFromRawData(
        fixture('qrcode_valid.txt'));
    // assert
    assert(result.person.familyName == "Mustermann");
  });

  test('Should not get certificate from an invalid image', () async {
    // arrange
    // act
    // assert
  });

  test('Should not get certificate from an invalid raw data', () async {
    // arrange
    // act
    // assert
    expect(
      () async => await CertificateParser.getCertificateFromRawData(
          fixture('qrcode_invalid.txt')),
      throwsA(isA<ParseException>()),
    );
  });
}
