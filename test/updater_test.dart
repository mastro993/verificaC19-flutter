import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/crl_delta.dart';
import 'package:verificac19/src/data/model/crl_status.dart';
import 'package:verificac19/src/data/updater.dart';
import 'package:verificac19/src/data/updater_impl.dart';

import './mocks.dart';

void main() {
  late MockRemoteRepository remote;
  late MockLocalRepository cache;
  late Updater updater;

  setUp(() {
    remote = MockRemoteRepository();
    cache = MockLocalRepository();
    updater = UpdaterImpl(remote, cache);
  });

  group('updates', () {
    test('Should get updates with right arguments', () async {
      // Arrange
      when(cache.needRulesUpdate()).thenReturn(false);
      when(cache.needSignaturesUpdate()).thenReturn(false);
      when(cache.needSignaturesListUpdate()).thenReturn(false);
      when(cache.needCRLUpdate()).thenReturn(false);

      // act
      await updater.updateAll();
      // assert

      verify(cache.needRulesUpdate()).called(1);
      verify(cache.needSignaturesUpdate()).called(1);
      verify(cache.needSignaturesListUpdate()).called(1);
      verify(cache.needCRLUpdate()).called(1);
      verifyNoMoreInteractions(cache);
    });

    test('Should get updates with right arguments (forced)', () async {
      // Arrange
      when(cache.needRulesUpdate()).thenReturn(false);
      when(cache.needSignaturesUpdate()).thenReturn(false);
      when(cache.needSignaturesListUpdate()).thenReturn(false);
      when(cache.needCRLUpdate()).thenReturn(false);

      // act
      await updater.updateAll();
      // assert

      verify(cache.needRulesUpdate()).called(1);
      verify(cache.needSignaturesUpdate()).called(1);
      verify(cache.needSignaturesListUpdate()).called(1);
      verify(cache.needCRLUpdate()).called(1);
      verifyNoMoreInteractions(cache);
    });
  });

  group('Rules', () {
    test('Should update rules when expired', () async {
      // arrange
      when(cache.needRulesUpdate()).thenAnswer((_) => true);
      when(remote.getValidationRules()).thenAnswer((_) async => []);
      when(cache.storeRules(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateRules();
      // assert
      verify(cache.needRulesUpdate()).called(1);
      verify(remote.getValidationRules()).called(1);
      verify(cache.storeRules(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update rules when not expired', () async {
      // arrange
      when(cache.needRulesUpdate()).thenAnswer((_) => false);
      when(remote.getValidationRules()).thenAnswer((_) async => []);
      when(cache.storeRules(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateRules();
      // assert
      verify(cache.needRulesUpdate()).called(1);
      verifyNever(remote.getValidationRules());
      verifyNever(cache.storeRules(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });

  group('Signatures', () {
    test('Should update signatures when expired', () async {
      // arrange
      when(cache.needSignaturesUpdate()).thenAnswer((_) => true);
      when(remote.getSignatures()).thenAnswer((_) async => {});
      when(cache.storeSignatures(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignatures();
      // assert
      verify(cache.needSignaturesUpdate()).called(1);
      verify(remote.getSignatures()).called(1);
      verify(cache.storeSignatures(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update signatures when not expired', () async {
      // arrange
      when(cache.needSignaturesUpdate()).thenAnswer((_) => false);
      when(remote.getSignatures()).thenAnswer((_) async => {});
      when(cache.storeSignatures(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignatures();
      // assert
      verify(cache.needSignaturesUpdate()).called(1);
      verifyNever(remote.getSignatures());
      verifyNever(cache.storeSignatures(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });

  group('signatures list', () {
    test('Should update signatures list when expired', () async {
      // arrange
      when(cache.needSignaturesListUpdate()).thenAnswer((_) => true);
      when(remote.getSignaturesList()).thenAnswer((_) async => []);
      when(cache.storeSignaturesList(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignaturesList();
      // assert
      verify(cache.needSignaturesListUpdate()).called(1);
      verify(remote.getSignaturesList()).called(1);
      verify(cache.storeSignaturesList(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update signatures list when not expired', () async {
      // arrange
      when(cache.needSignaturesListUpdate()).thenAnswer((_) => false);
      when(remote.getSignaturesList()).thenAnswer((_) async => []);
      when(cache.storeSignaturesList(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignaturesList();
      // assert
      verify(cache.needSignaturesListUpdate()).called(1);
      verifyNever(remote.getSignaturesList());
      verifyNever(cache.storeSignaturesList(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });

  group('revoke list', () {
    test('Should not update revoke list when not expired', () async {
      // arrange
      when(cache.needCRLUpdate()).thenAnswer((_) => false);
      // act
      await updater.updateCRL();
      // assert
      verify(cache.needCRLUpdate()).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update revoke list if same version stored', () async {
      const tVersion = 10;
      // arrange
      when(cache.needCRLUpdate()).thenAnswer((_) => true);
      when(cache.getCRLVersion()).thenAnswer((_) => tVersion);
      when(remote.getCRLStatus(
        version: tVersion,
      )).thenAnswer((_) async => CRLStatus(version: tVersion));

      // act
      await updater.updateCRL();
      // assert
      verify(cache.needCRLUpdate()).called(1);
      verify(cache.getCRLVersion()).called(1);
      verify(remote.getCRLStatus(version: tVersion)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should update revoke list if new version available', () async {
      const tLocalVersion = 9;
      const tRemoteVersion = 10;
      // arrange
      when(cache.needCRLUpdate()).thenAnswer((_) => true);
      when(cache.getCRLVersion()).thenAnswer((_) => tLocalVersion);
      when(cache.storeCRLVersion(tRemoteVersion)).thenAnswer((_) async => Void);
      when(cache.storeCRL(
        insertions: anyNamed('insertions'),
        deletions: anyNamed('deletions'),
      )).thenAnswer((_) async => Void);

      when(remote.getCRLStatus(
        version: tLocalVersion,
      )).thenAnswer((_) async => CRLStatus(version: tRemoteVersion));
      when(remote.getCRLChunk(
        version: tLocalVersion,
        chunk: anyNamed('chunk'),
      )).thenAnswer((_) async => CRL(
            version: tRemoteVersion,
            chunk: 1,
            lastChunk: 1,
            delta: CRLDelta(
              deletions: [],
              insertions: [],
            ),
          ));

      // act
      await updater.updateCRL();
      // assert
      verify(cache.needCRLUpdate()).called(1);
      verify(cache.getCRLVersion()).called(1);
      verify(remote.getCRLStatus(version: tLocalVersion)).called(1);
      verify(remote.getCRLChunk(
        version: tLocalVersion,
        chunk: anyNamed('chunk'),
      )).called(1);
      verify(cache.storeCRL(
        insertions: anyNamed('insertions'),
        deletions: anyNamed('deletions'),
      )).called(1);
      verify(cache.storeCRLVersion(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });
}
