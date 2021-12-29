import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

import 'fixtures/fixture_reader.dart';
import 'mocks.mocks.dart';

void main() {
  late MockLocalRepository cache;

  setUp(() {
    cache = MockLocalRepository();

    final revokedListFixture = fixture('../service/revokedList.json');
    final rulesFixture = fixture('../service/rules.json');
    final signaturesFixture = fixture('../service/signatures.json');
    final signaturesListFixture = fixture('../service/signaturesList.json');

    final List<String> revokedList =
        (jsonDecode(revokedListFixture) as List<dynamic>)
            .map((e) => e as String)
            .toList();
    final List<ValidationRule> rules =
        (jsonDecode(rulesFixture) as List<dynamic>)
            .map((e) => ValidationRule.fromJson(e))
            .toList();
    final Map<String, String> signatures = (jsonDecode(signaturesFixture)
            as Map<String, dynamic>)
        .map((key, value) => MapEntry<String, String>(key, value as String));
    final List<String> signaturesList =
        (jsonDecode(signaturesListFixture) as List<dynamic>)
            .map((e) => e as String)
            .toList();

    when(cache.getRevokeList()).thenReturn(revokedList);
    when(cache.getRules()).thenReturn(rules);
    when(cache.getSignatures()).thenReturn(signatures);
    when(cache.getSignaturesList()).thenReturn(signaturesList);
    when(cache.isUvciRevoked(any))
        .thenAnswer((i) => revokedList.contains(i.positionalArguments[0]));
  });

  test('validate', () async {});
}
