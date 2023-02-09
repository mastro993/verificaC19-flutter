import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/core/extensions.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/recovery_statement_validator.dart';
import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/recovery_statement.dart';
import 'package:verificac19/src/model/validation_mode.dart';

@Environment(Environment.prod)
@Injectable(as: RecoveryStatementValidator)
class RecoveryStatementValidatorImpl implements RecoveryStatementValidator {
  final LocalRepository _cache;

  RecoveryStatementValidatorImpl(this._cache);

  @override
  Future<GreenCertificateStatus> validate(
    RecoveryStatement statement, {
    ValidationMode mode = ValidationMode.normalDGP,
    bool isRecoveryBis = false,
    required DateTime dateOfBirth,
  }) async {
    try {
      final rules = _cache.getRules();

      int? startDays = getStartDays(
        rules: rules,
        statement: statement,
        mode: mode,
        isRecoveryBis: isRecoveryBis,
        dateOfBirth: dateOfBirth,
      );

      int? endDays = getEndDays(
        rules: rules,
        statement: statement,
        mode: mode,
        isRecoveryBis: isRecoveryBis,
        dateOfBirth: dateOfBirth,
      );

      if (startDays == null || endDays == null) {
        log('Unsupported vaccine type');
        return GreenCertificateStatus.notValid;
      }

      final validityStart =
          statement.certificateValidFrom.add(Duration(days: startDays));
      final validityExtension =
          statement.certificateValidFrom.add(Duration(days: endDays));
      final validityEnd = statement.certificateValidUntil > validityExtension
          ? statement.certificateValidUntil
          : validityExtension;

      final today = clock.now().withoutTime();

      if (today < validityStart) {
        log('Recovery statement is not valid yet, starts at: ${validityStart.toIso8601String()}');
        return GreenCertificateStatus.notValidYet;
      }

      if (today > validityEnd) {
        log('Recovery statement is expired at: ${validityEnd.toIso8601String()}');
        return GreenCertificateStatus.notValid;
      }

      log('Recovery statement is valid [${validityStart.toIso8601String()} - ${validityEnd.toIso8601String()}]');
      return GreenCertificateStatus.valid;
    } catch (e) {
      log('Recovery statement is not present or is not a green pass: ${e.toString()}');
      return GreenCertificateStatus.notValid;
    }
  }

  int? getStartDays({
    required List<ValidationRule> rules,
    required RecoveryStatement statement,
    required ValidationMode mode,
    required bool isRecoveryBis,
    required DateTime dateOfBirth,
  }) {
    switch (mode) {
      case ValidationMode.normalDGP:
        if (isRecoveryBis) {
          return rules.find(RuleName.recoveryCertPvStartDay)?.intValue;
        }
        return rules.find(RuleName.recoveryCertStartDayIT)?.intValue;
      case ValidationMode.superDGP:
        if (isRecoveryBis) {
          return rules.find(RuleName.recoveryCertPvStartDay)?.intValue;
        }
        if (statement.isIT) {
          return rules.find(RuleName.recoveryCertStartDayIT)?.intValue;
        }
        return rules.find(RuleName.recoveryCertStartDayNotIT)?.intValue;
    }
  }

  int? getEndDays({
    required List<ValidationRule> rules,
    required RecoveryStatement statement,
    required ValidationMode mode,
    required bool isRecoveryBis,
    required DateTime dateOfBirth,
  }) {
    switch (mode) {
      case ValidationMode.normalDGP:
        if (isRecoveryBis) {
          return rules.find(RuleName.recoveryCertPvEndDay)?.intValue;
        }
        return rules.find(RuleName.recoveryCertEndDayIT)?.intValue;
      case ValidationMode.superDGP:
        if (isRecoveryBis) {
          return rules.find(RuleName.recoveryCertPvEndDay)?.intValue;
        }
        if (statement.isIT) {
          return rules.find(RuleName.recoveryCertEndDayIT)?.intValue;
        }
        return rules.find(RuleName.recoveryCertEndDayNotIT)?.intValue;
    }
  }
}
