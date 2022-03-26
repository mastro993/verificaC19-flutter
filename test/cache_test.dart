import 'dart:convert';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository_impl.dart';
import 'package:verificac19/src/data/model/revoked_cert.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

import 'isar_utils.dart';
import 'mocks.mocks.dart';

void main() {
  late MockSharedPreferences prefs;
  late Isar isar;
  late LocalRepositoryImpl cache;
  late Directory tempDir;
  late Directory cacheDir;

  setUp(() async {
    prefs = MockSharedPreferences();

    isar = await openTempIsar(
      schemas: [RevokedCertSchema],
    );

    tempDir = Directory(path.join(Directory.current.path, 'test', 'tmp'));
    await tempDir.create();

    cacheDir = Directory(path.join(Directory.current.path, 'test', 'cache'));

    cache = LocalRepositoryImpl(tempDir.path, prefs, isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    await tempDir.delete(recursive: true);
  });

  group('Rules', () {
    test('Should store rules', () async {
      // arrange
      final tRulesRaw =
          await File(path.join(cacheDir.path, 'rules.json')).readAsString();
      final tRulesJson = jsonDecode(tRulesRaw) as List<dynamic>;
      final tRules = tRulesJson.map((e) => ValidationRule.fromJson(e)).toList();
      // act
      await cache.storeRules(tRules);
      final rules = cache.getRules();
      // assert
      assert(rules.length == tRules.length);
    });

    test('Should return that rules must be updated if rules are not yet stored',
        () {
      // arrange
      // act
      final result = cache.needRulesUpdate();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that rules must not be updated if rules are not yet expired',
        () async {
      // arrange
      // act
      await cache.storeRules([]);
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.needRulesUpdate();
        expect(result, equals(false));
      });
    });

    test('Should return that rules must be updated if are expired', () async {
      // arrange
      // act
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.needRulesUpdate();
        expect(result, equals(true));
      });
    });
  });

  group('Signatures', () {
    test('Should store signatures', () async {
      // arrange
      final tSignaturesRaw =
          await File(path.join(cacheDir.path, 'signatures.json'))
              .readAsString();
      final tSignaturesJson =
          jsonDecode(tSignaturesRaw) as Map<String, dynamic>;
      final tSignatures =
          tSignaturesJson.map((key, value) => MapEntry(key, value as String));
      // act
      await cache.storeSignatures(tSignatures);
      final signatures = cache.getSignatures();
      // assert
      assert(signatures.length == tSignatures.length);
    });

    test('Should return that rules must be updated if rules are not yet stored',
        () {
      // arrange
      // act
      final result = cache.needSignaturesUpdate();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that signatures must not be updated if rules are not yet expired',
        () async {
      // arrange
      // act
      await cache.storeSignatures({});
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.needSignaturesUpdate();
        expect(result, equals(false));
      });
    });

    test('Should return that signatures must be updated if are expired',
        () async {
      // arrange
      // act
      // assert

      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.needSignaturesUpdate();
        expect(result, equals(true));
      });
    });
  });

  group('Signatures list', () {
    test('Should store signatures list', () async {
      final tSignaturesRaw =
          await File(path.join(cacheDir.path, 'signaturesList.json'))
              .readAsString();
      final tSignaturesJson = jsonDecode(tSignaturesRaw) as List<dynamic>;
      final tSignatures = tSignaturesJson.map((e) => e as String).toList();
      // act
      await cache.storeSignaturesList(tSignatures);
      final signatures = cache.getSignaturesList();
      // assert
      assert(signatures.length == tSignatures.length);
    });

    test(
        'Should return that signatures list must be updated if rules are not yet stored',
        () {
      // arrange
      // act
      final result = cache.needSignaturesListUpdate();
      // assert
      expect(result, equals(true));
    });

    test(
        'Should return that signatures list must not be updated if rules are not yet expired',
        () async {
      // arrange
      // act
      await cache.storeSignaturesList([]);
      // assert
      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 - 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.needSignaturesListUpdate();
        expect(result, equals(false));
      });
    });

    test('Should return that rules must be updated if are expired', () async {
      // arrange
      // act
      // assert

      final now = clock.now();
      final testDate = now.add(const Duration(
        seconds: UpdateWindowHours.max * 3600 + 1,
      ));

      withClock(Clock.fixed(testDate), () {
        final result = cache.needSignaturesListUpdate();
        expect(result, equals(true));
      });
    });
  });
  group('Revoke list', () {
    test('Should store revoke list', () async {
      final tCrlRaw = await File(path.join(cacheDir.path, 'revokedList.json'))
          .readAsString();
      final tCrlJson = jsonDecode(tCrlRaw) as List<dynamic>;
      final tCrl = tCrlJson.map((e) => e as String).toList();
      // act
      await cache.storeCRL(insertions: tCrl);
      final crl = cache.getCRL();
      // assert
      assert(crl.length == tCrl.length);
    });

    test('Should return that UVCI is revoked', () async {
      // arrange
      final List<String> tRevokeListRaw = ['A', 'B', 'C'];
      final List<String> tRevokeList = tRevokeListRaw
          .map((a) => base64Encode(sha256.convert(utf8.encode(a)).bytes))
          .toList();
      // act
      await cache.storeCRL(insertions: tRevokeList);
      final result = cache.isUvciRevoked('A');
      // assert
      assert(result);
    });

    test('Should return that UVCI is not revoked', () async {
      // arrange
      final List<String> tRevokeListRaw = ['A', 'B', 'C'];
      final List<String> tRevokeList = tRevokeListRaw
          .map((a) => base64Encode(sha256.convert(utf8.encode(a)).bytes))
          .toList();
      // act
      await cache.storeCRL(insertions: tRevokeList);
      final result = cache.isUvciRevoked('D');
      // assert
      assert(!result);
    });
  });
}
