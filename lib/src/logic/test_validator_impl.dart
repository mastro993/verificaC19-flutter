import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/core/extensions.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/test_validator.dart';
import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/test.dart';
import 'package:verificac19/src/model/validation_mode.dart';

@Environment(Environment.prod)
@Injectable(as: TestValidator)
class TestValidatorImpl implements TestValidator {
  final LocalRepository _cache;

  TestValidatorImpl(this._cache);

  @override
  Future<GreenCertificateStatus> validate(
    Test test, {
    ValidationMode mode = ValidationMode.normalDGP,
    required DateTime dateOfBirth,
  }) async {
    try {
      if (mode == ValidationMode.superDGP ||
          mode == ValidationMode.boosterDGP ||
          mode == ValidationMode.visitorsRSADGP) {
        log('Not valid. Super or Booster DGP required');
        return GreenCertificateStatus.notValid;
      }

      if (test.testResult == TestResult.detected) {
        log('Test result is DETECTED');
        return GreenCertificateStatus.notValid;
      }

      return checkDate(test: test, mode: mode);
    } catch (e) {
      log('Test Result is not present or is not a green pass: ${e.toString()}');
      return GreenCertificateStatus.notValid;
    }
  }

  GreenCertificateStatus checkDate({
    required Test test,
    required ValidationMode mode,
  }) {
    final rules = _cache.getRules();

    int? startHours = getStartHours(
      rules: rules,
      test: test,
      mode: mode,
    );

    int? endHours = getEndHours(
      rules: rules,
      test: test,
      mode: mode,
    );

    if (startHours == null || endHours == null) {
      log('Unsupported vaccine type');
      return GreenCertificateStatus.notValid;
    }

    final validityStart =
        test.dateTimeOfCollection.add(Duration(hours: startHours));
    final validityEnd =
        test.dateTimeOfCollection.add(Duration(hours: endHours));

    if (validityStart > clock.now()) {
      log('Test result is not valid yet, starts at ${validityStart.toIso8601String()}');
      return GreenCertificateStatus.notValidYet;
    }

    if (validityEnd < clock.now()) {
      log('Test result is expired at ${validityEnd.toIso8601String()}');
      return GreenCertificateStatus.notValid;
    }

    return GreenCertificateStatus.valid;
  }

  int? getStartHours({
    required List<ValidationRule> rules,
    required Test test,
    required ValidationMode mode,
  }) {
    if (test.isMolecular) {
      return rules.find(RuleName.molecularTestStartHours)?.intValue;
    }
    if (test.isRapid) {
      return rules.find(RuleName.rapidTestStartHours)?.intValue;
    }
    return null;
  }

  int? getEndHours({
    required List<ValidationRule> rules,
    required Test test,
    required ValidationMode mode,
  }) {
    if (test.isMolecular) {
      return rules.find(RuleName.molecularTestEndHours)?.intValue;
    }
    if (test.isRapid) {
      return rules.find(RuleName.rapidTestEndHours)?.intValue;
    }
    return null;
  }
}
