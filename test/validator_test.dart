import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/certificate_parser.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/logic/certificate_validator_impl.dart';
import 'package:verificac19/src/model/validation_error.dart';

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

  test('Should not validate unvalid certificate', () async {
    when(cache.needsUpdate()).thenAnswer((_) async => false);

    final base45 = fixture('shit.txt');
    final cert = await CertificateParser.getCertificateFromRawData(base45);
    final result = await validator.validate(cert);

    expect(result.result, equals(false));
    expect(result.error, equals(ValidationError.emptyOrBlacklisted));
  });

  test('Should not validate unsigned certificate', () async {
    when(cache.needsUpdate()).thenAnswer((_) async => false);

    final base45 = fixture('2.txt');
    final cert = await CertificateParser.getCertificateFromRawData(base45);
    final result = await validator.validate(cert);

    expect(result.error, equals(ValidationError.invalidSignature));
  });
}
