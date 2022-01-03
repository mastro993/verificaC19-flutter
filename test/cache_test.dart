import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/local/local_repository_impl.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

import 'mocks.mocks.dart';

void main() {
  late MockBox dataBox;
  late MockBox updatesBox;
  late MockBox<String> revokeListBox;
  late MockHiveInterface hive;
  late LocalRepository cache;

  setUp(() {
    dataBox = MockBox();
    updatesBox = MockBox<DateTime>();
    revokeListBox = MockBox<String>();
    hive = MockHiveInterface();

    when(hive.box(DbKeys.dbData)).thenAnswer((_) => dataBox);
    when(hive.box(DbKeys.dbRevokeList)).thenAnswer((_) => revokeListBox);
    when(hive.box(DbKeys.dbUpdates)).thenAnswer((_) => updatesBox);

    cache = LocalRepositoryImpl(hive: hive);
  });

  group('Rules', () {
    test('Should store rules', () async {
      // act
      await cache.storeRules([]);
      // assert
      verify(dataBox.put(DbKeys.keyRules, any)).called(1);
      verify(updatesBox.put(DbKeys.keyRulesLastUpdate, any)).called(1);
      verifyNoMoreInteractions(dataBox);
    });

    test('Should get rules', () {
      // arrange
      final List<ValidationRule> tResult = [];
      when(dataBox.get(DbKeys.keyRules, defaultValue: [])).thenReturn(tResult);
      // act
      final result = cache.getRules();
      // assert
      verify(dataBox.get(DbKeys.keyRules, defaultValue: [])).called(1);
      verifyNoMoreInteractions(dataBox);
      expect(result, equals(tResult));
    });

    test('Should return that rules must be updated if rules are not yet stored',
        () {
      // arrange
      when(updatesBox.get(DbKeys.keyRulesLastUpdate)).thenReturn(null);
      // act
      final result = cache.rulesMustBeUpdated();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that rules must not be updated if rules are not yet expired',
        () async {
      // arrange
      when(updatesBox.get(DbKeys.keyRulesLastUpdate)).thenReturn(clock.now());
      // act
      await cache.storeRules([]);
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.rulesMustBeUpdated();
        expect(result, equals(false));
      });
    });

    test('Should return that rules must be updated if are expired', () async {
      // arrange
      when(updatesBox.get(DbKeys.keyRulesLastUpdate)).thenReturn(clock.now());
      // act
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.rulesMustBeUpdated();
        expect(result, equals(true));
      });
    });
  });

  group('Signatures', () {
    test('Should store signatures', () async {
      // act
      await cache.storeSignatures({});
      // assert
      verify(dataBox.put(DbKeys.keySignatures, any)).called(1);
      verify(updatesBox.put(DbKeys.keySignaturesLastUpdate, any)).called(1);
      verifyNoMoreInteractions(dataBox);
    });

    test('Should get signatures', () {
      // arrange
      final Map<String, String> tResult = {};
      when(dataBox.get(DbKeys.keySignatures, defaultValue: {}))
          .thenReturn(tResult);
      // act
      final result = cache.getSignatures();
      // assert
      verify(dataBox.get(DbKeys.keySignatures, defaultValue: {})).called(1);
      verifyNoMoreInteractions(dataBox);
      expect(result, equals(tResult));
    });

    test('Should return that rules must be updated if rules are not yet stored',
        () {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesLastUpdate)).thenReturn(null);
      // act
      final result = cache.signaturesMustBeUpdated();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that signatures must not be updated if rules are not yet expired',
        () async {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesLastUpdate))
          .thenReturn(clock.now());
      // act
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.signaturesMustBeUpdated();
        expect(result, equals(false));
      });
    });

    test('Should return that signatures must be updated if are expired',
        () async {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesLastUpdate))
          .thenReturn(clock.now());
      // act
      // assert

      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.signaturesMustBeUpdated();
        expect(result, equals(true));
      });
    });
  });

  group('Signatures list', () {
    test('Should store signatures list', () async {
      // act
      await cache.storeSignaturesList([]);
      // assert
      verify(dataBox.put(DbKeys.keySignaturesList, any)).called(1);
      verify(updatesBox.put(DbKeys.keySignaturesListLastUpdate, any)).called(1);
      verifyNoMoreInteractions(dataBox);
    });

    test('Should get signatures list', () {
      // arrange
      final List<String> tResult = [];
      when(dataBox.get(DbKeys.keySignaturesList, defaultValue: []))
          .thenReturn(tResult);
      // act
      final result = cache.getSignaturesList();
      // assert
      verify(dataBox.get(DbKeys.keySignaturesList, defaultValue: [])).called(1);
      verifyNoMoreInteractions(dataBox);
      expect(result, equals(tResult));
    });

    test(
        'Should return that signatures list must be updated if rules are not yet stored',
        () {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesListLastUpdate)).thenReturn(null);
      // act
      final result = cache.signatureListMustBeUpdated();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that signatures list must not be updated if rules are not yet expired',
        () async {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesListLastUpdate))
          .thenReturn(clock.now());
      // act
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.signatureListMustBeUpdated();
        expect(result, equals(false));
      });
    });

    test('Should return that rules must be updated if are expired', () async {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesListLastUpdate))
          .thenReturn(clock.now());
      // act
      // assert

      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.signatureListMustBeUpdated();
        expect(result, equals(true));
      });
    });
  });

  group('Signatures', () {
    test('Should store signatures', () async {
      // act
      await cache.storeSignatures({});
      // assert
      verify(dataBox.put(DbKeys.keySignatures, any)).called(1);
      verify(updatesBox.put(DbKeys.keySignaturesLastUpdate, any)).called(1);
      verifyNoMoreInteractions(dataBox);
    });

    test('Should get signatures', () {
      // arrange
      final Map<String, String> tResult = {};
      when(dataBox.get(DbKeys.keySignatures, defaultValue: {}))
          .thenReturn(tResult);
      // act
      final result = cache.getSignatures();
      // assert
      verify(dataBox.get(DbKeys.keySignatures, defaultValue: {})).called(1);
      verifyNoMoreInteractions(dataBox);
      expect(result, equals(tResult));
    });

    test('Should return that rules must be updated if rules are not yet stored',
        () {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesLastUpdate)).thenReturn(null);
      // act
      final result = cache.signaturesMustBeUpdated();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that signatures must not be updated if rules are not yet expired',
        () async {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesLastUpdate))
          .thenReturn(clock.now());
      // act
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.signaturesMustBeUpdated();
        expect(result, equals(false));
      });
    });

    test('Should return that signatures must be updated if are expired',
        () async {
      // arrange
      when(updatesBox.get(DbKeys.keySignaturesLastUpdate))
          .thenReturn(clock.now());
      // act
      // assert

      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.signaturesMustBeUpdated();
        expect(result, equals(true));
      });
    });
  });

  group('Revoke list', () {
    test('Should store revoke list', () async {
      // arrange
      when(revokeListBox.clear()).thenAnswer((_) async => 0);
      when(revokeListBox.addAll(any)).thenAnswer((_) async => []);
      // act
      await cache.storeRevokeList([]);
      // assert
      verify(revokeListBox.clear()).called(1);
      verify(revokeListBox.addAll(any)).called(1);
      verifyNoMoreInteractions(revokeListBox);
      verify(updatesBox.put(DbKeys.keyRevokeListLastUpdate, any)).called(1);
      verifyNoMoreInteractions(dataBox);
    });

    test('Should get revoke list', () {
      // arrange
      final List<String> tRevokeList = [];
      when(revokeListBox.values).thenReturn(tRevokeList);
      // act
      final result = cache.getRevokeList();
      // assert
      verify(revokeListBox.values).called(1);
      verifyNoMoreInteractions(revokeListBox);
      expect(result, equals(tRevokeList));
    });

    test('Should return that UVCI is revoked', () {
      // arrange
      final List<String> tRevokeListRaw = ['A', 'B', 'C'];
      final List<String> tRevokeList = tRevokeListRaw
          .map((a) => base64Encode(sha256.convert(utf8.encode(a)).bytes))
          .toList();
      when(revokeListBox.values).thenReturn(tRevokeList);
      // act
      final result = cache.isUvciRevoked('A');
      // assert
      verify(revokeListBox.values).called(1);
      verifyNoMoreInteractions(revokeListBox);
      expect(result, equals(true));
    });

    test('Should return that UVCI is not revoked', () {
      // arrange
      final List<String> tRevokeList = ['A', 'B', 'C'];
      when(revokeListBox.values).thenReturn(tRevokeList);
      // act
      final result = cache.isUvciRevoked('D');
      // assert
      verify(revokeListBox.values).called(1);
      verifyNoMoreInteractions(revokeListBox);
      expect(result, equals(false));
    });
  });
}
