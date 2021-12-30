import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:verificac19/src/core/constants.dart';
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
      when(cache.rulesMustBeUpdated(UpdateWindowHours.max)).thenReturn(false);
      when(cache.signaturesMustBeUpdated(UpdateWindowHours.max))
          .thenReturn(false);
      when(cache.signatureListMustBeUpdated(UpdateWindowHours.max))
          .thenReturn(false);
      when(cache.revokeListMustBeUpdated(UpdateWindowHours.max))
          .thenReturn(false);

      // act
      await updater.updateAll();
      // assert

      verify(cache.rulesMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(cache.signaturesMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(cache.signatureListMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(cache.revokeListMustBeUpdated(UpdateWindowHours.max)).called(1);
      verifyNoMoreInteractions(cache);
    });

    test('Should get updates with right arguments (forced)', () async {
      // Arrange
      when(cache.rulesMustBeUpdated(UpdateWindowHours.min)).thenReturn(false);
      when(cache.signaturesMustBeUpdated(UpdateWindowHours.min))
          .thenReturn(false);
      when(cache.signatureListMustBeUpdated(UpdateWindowHours.min))
          .thenReturn(false);
      when(cache.revokeListMustBeUpdated(UpdateWindowHours.min))
          .thenReturn(false);

      // act
      await updater.updateAll(forced: true);
      // assert

      verify(cache.rulesMustBeUpdated(UpdateWindowHours.min)).called(1);
      verify(cache.signaturesMustBeUpdated(UpdateWindowHours.min)).called(1);
      verify(cache.signatureListMustBeUpdated(UpdateWindowHours.min)).called(1);
      verify(cache.revokeListMustBeUpdated(UpdateWindowHours.min)).called(1);
      verifyNoMoreInteractions(cache);
    });
  });

  group('Rules', () {
    test('Should update rules when expired', () async {
      // arrange
      when(cache.rulesMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => true);
      when(remote.getValidationRules()).thenAnswer((_) async => []);
      when(cache.storeRules(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateRules();
      // assert
      verify(cache.rulesMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(remote.getValidationRules()).called(1);
      verify(cache.storeRules(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update rules when not expired', () async {
      // arrange
      when(cache.rulesMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => false);
      when(remote.getValidationRules()).thenAnswer((_) async => []);
      when(cache.storeRules(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateRules();
      // assert
      verify(cache.rulesMustBeUpdated(UpdateWindowHours.max)).called(1);
      verifyNever(remote.getValidationRules());
      verifyNever(cache.storeRules(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });

  group('Signatures', () {
    test('Should update signatures when expired', () async {
      // arrange
      when(cache.signaturesMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => true);
      when(remote.getSignatures()).thenAnswer((_) async => {});
      when(cache.storeSignatures(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignatures();
      // assert
      verify(cache.signaturesMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(remote.getSignatures()).called(1);
      verify(cache.storeSignatures(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update signatures when not expired', () async {
      // arrange
      when(cache.signaturesMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => false);
      when(remote.getSignatures()).thenAnswer((_) async => {});
      when(cache.storeSignatures(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignatures();
      // assert
      verify(cache.signaturesMustBeUpdated(UpdateWindowHours.max)).called(1);
      verifyNever(remote.getSignatures());
      verifyNever(cache.storeSignatures(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });

  group('signatures list', () {
    test('Should update signatures list when expired', () async {
      // arrange
      when(cache.signatureListMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => true);
      when(remote.getSignaturesList()).thenAnswer((_) async => []);
      when(cache.storeSignaturesList(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignaturesList();
      // assert
      verify(cache.signatureListMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(remote.getSignaturesList()).called(1);
      verify(cache.storeSignaturesList(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update signatures list when not expired', () async {
      // arrange
      when(cache.signatureListMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => false);
      when(remote.getSignaturesList()).thenAnswer((_) async => []);
      when(cache.storeSignaturesList(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateSignaturesList();
      // assert
      verify(cache.signatureListMustBeUpdated(UpdateWindowHours.max)).called(1);
      verifyNever(remote.getSignaturesList());
      verifyNever(cache.storeSignaturesList(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });

  group('revoke list', () {
    test('Should update revoke list when expired', () async {
      // arrange
      when(cache.revokeListMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => true);
      when(remote.getRevokeList()).thenAnswer((_) async => []);
      when(cache.storeRevokeList(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateRevokeList();
      // assert
      verify(cache.revokeListMustBeUpdated(UpdateWindowHours.max)).called(1);
      verify(remote.getRevokeList()).called(1);
      verify(cache.storeRevokeList(any)).called(1);
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });

    test('Should not update revoke list when not expired', () async {
      // arrange
      when(cache.revokeListMustBeUpdated(UpdateWindowHours.max))
          .thenAnswer((_) => false);
      when(remote.getRevokeList()).thenAnswer((_) async => []);
      when(cache.storeRevokeList(any)).thenAnswer((_) async => Void);
      // act
      await updater.updateRevokeList();
      // assert
      verify(cache.revokeListMustBeUpdated(UpdateWindowHours.max)).called(1);
      verifyNever(remote.getRevokeList());
      verifyNever(cache.storeRevokeList(any));
      verifyNoMoreInteractions(cache);
      verifyNoMoreInteractions(remote);
    });
  });
}
