import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/core/extensions.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/vaccine_validator.dart';
import 'package:verificac19/src/model/green_certificate_status.dart';
import 'package:verificac19/src/model/vaccination.dart';
import 'package:verificac19/src/model/validation_mode.dart';

@Environment(Environment.prod)
@Injectable(as: VaccineValidator)
class VaccineValidatorImpl implements VaccineValidator {
  final LocalRepository _cache;

  VaccineValidatorImpl(this._cache);

  @override
  Future<GreenCertificateStatus> validate(
    Vaccination vaccination, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    try {
      // In Italy, Sputnik is accepted only for San Marino republic
      if (vaccination.isSputnik && !vaccination.isSM) {
        log('Vaccine ${VaccineType.sputnik} is valid only in San Marino');
        return GreenCertificateStatus.notValid;
      }

      final result = checkDate(vaccination: vaccination, mode: mode);

      if (result != GreenCertificateStatus.valid) {
        return result;
      }

      if (mode == ValidationMode.boosterDGP) {
        if (vaccination.isBooster) {
          return GreenCertificateStatus.valid;
        }
        if (vaccination.isComplete) {
          return GreenCertificateStatus.testNeeded;
        }
        return GreenCertificateStatus.notValid;
      }

      if (mode == ValidationMode.schoolDGP) {
        if (vaccination.isIncomplete) {
          return GreenCertificateStatus.notValid;
        }
        return GreenCertificateStatus.valid;
      }

      return result;
    } catch (e) {
      log('Vaccination is not present or is not a green pass: ${e.toString()}');
      return GreenCertificateStatus.notValid;
    }
  }

  GreenCertificateStatus checkDate({
    required Vaccination vaccination,
    required ValidationMode mode,
  }) {
    final rules = _cache.getRules();

    int? startDays = getStartDays(
      rules: rules,
      vaccination: vaccination,
      mode: mode,
    );

    int? endDays = getEndDays(
      rules: rules,
      vaccination: vaccination,
      mode: mode,
    );

    if (startDays == null || endDays == null) {
      log('Unsupported vaccine type');
      return GreenCertificateStatus.notValid;
    }

    final vaccinationStart = vaccination.dateOfVaccination
        .withoutTime()
        .add(Duration(days: startDays));
    final vaccinationEnd = vaccination.dateOfVaccination
        .withoutTime()
        .add(Duration(days: endDays));

    // JJ vaccine is istantly valid
    final fromDate =
        vaccination.isJJ ? vaccination.dateOfVaccination : vaccinationStart;

    final todayStart = clock.now().withoutTime();
    final todayEnd = todayStart
        .add(const Duration(days: 1))
        .subtract(const Duration(milliseconds: 1));

    if (fromDate > todayEnd) {
      log('Vaccination is not valid yet, starts at ${vaccinationStart.toIso8601String()}');
      return GreenCertificateStatus.notValidYet;
    }

    if (vaccinationEnd < todayStart) {
      log('Vaccination is expired at ${vaccinationEnd.toIso8601String()}');
      return GreenCertificateStatus.notValid;
    }

    log('Vaccination is valid [${vaccinationStart.toIso8601String()} - ${vaccinationEnd.toIso8601String()}]');
    return GreenCertificateStatus.valid;
  }

  int? getStartDays({
    required List<ValidationRule> rules,
    required Vaccination vaccination,
    required ValidationMode mode,
  }) {
    final type = vaccination.medicinalProduct;
    switch (mode) {
      case ValidationMode.normalDGP:
        if (vaccination.isBooster) {
          return rules.find(RuleName.vaccineStartDayBoosterIT)?.intValue;
        }
        if (vaccination.isIncomplete) {
          return rules
              .find(RuleName.vaccineStartDayNotComplete, type)
              ?.intValue;
        }
        if (vaccination.isJJ) {
          return rules.find(RuleName.vaccineStartDayComplete, type)?.intValue;
        }
        return rules.find(RuleName.vaccineStartDayCompleteIT)?.intValue;
      case ValidationMode.superDGP:
        if (vaccination.isBooster) {
          if (vaccination.isIT) {
            return rules.find(RuleName.vaccineStartDayBoosterIT)?.intValue;
          } else {
            return rules.find(RuleName.vaccineStartDayBoosterNotIT)?.intValue;
          }
        }
        if (vaccination.isIncomplete) {
          return rules
              .find(RuleName.vaccineStartDayNotComplete, type)
              ?.intValue;
        }
        if (vaccination.isJJ) {
          return rules.find(RuleName.vaccineStartDayComplete, type)?.intValue;
        }
        if (vaccination.isIT) {
          return rules.find(RuleName.vaccineStartDayCompleteIT)?.intValue;
        }
        return rules.find(RuleName.vaccineStartDayCompleteNotIT)?.intValue;
      case ValidationMode.boosterDGP:
        if (vaccination.isBooster) {
          return rules.find(RuleName.vaccineStartDayBoosterIT)?.intValue;
        }
        if (vaccination.isIncomplete) {
          return rules
              .find(RuleName.vaccineStartDayNotComplete, type)
              ?.intValue;
        }
        if (vaccination.isJJ) {
          return rules.find(RuleName.vaccineStartDayComplete, type)?.intValue;
        }
        return rules.find(RuleName.vaccineStartDayCompleteIT)?.intValue;
      case ValidationMode.schoolDGP:
        if (vaccination.isBooster) {
          return rules.find(RuleName.vaccineStartDayBoosterIT)?.intValue;
        }
        if (vaccination.isIncomplete) {
          return rules
              .find(RuleName.vaccineStartDayNotComplete, type)
              ?.intValue;
        }
        if (vaccination.isJJ) {
          return rules.find(RuleName.vaccineStartDayComplete, type)?.intValue;
        }
        return rules.find(RuleName.vaccineStartDayCompleteIT)?.intValue;
      case ValidationMode.workDGP:
        return null;
    }
  }

  int? getEndDays({
    required List<ValidationRule> rules,
    required Vaccination vaccination,
    required ValidationMode mode,
  }) {
    final type = vaccination.medicinalProduct;
    switch (mode) {
      case ValidationMode.normalDGP:
        if (vaccination.isBooster) {
          return rules.find(RuleName.vaccineEndDayBoosterIT)?.intValue;
        }
        if (vaccination.isIncomplete) {
          return rules.find(RuleName.vaccineEndDayNotComplete, type)?.intValue;
        }
        return rules.find(RuleName.vaccineEndDayCompleteIT)?.intValue;
      case ValidationMode.superDGP:
        if (vaccination.isBooster) {
          if (vaccination.isIT) {
            return rules.find(RuleName.vaccineEndDayBoosterIT)?.intValue;
          } else {
            return rules.find(RuleName.vaccineEndDayBoosterNotIT)?.intValue;
          }
        }
        if (vaccination.isIncomplete) {
          return rules.find(RuleName.vaccineEndDayNotComplete, type)?.intValue;
        }
        if (vaccination.isIT) {
          return rules.find(RuleName.vaccineEndDayCompleteIT)?.intValue;
        }
        return rules.find(RuleName.vaccineEndDayCompleteNotIT)?.intValue;
      case ValidationMode.boosterDGP:
        if (vaccination.isBooster) {
          return rules.find(RuleName.vaccineEndDayBoosterIT)?.intValue;
        }
        if (vaccination.isIncomplete) {
          return rules.find(RuleName.vaccineEndDayNotComplete, type)?.intValue;
        }
        return rules.find(RuleName.vaccineEndDayCompleteIT)?.intValue;
      case ValidationMode.schoolDGP:
        if (vaccination.isBooster) {
          return rules.find(RuleName.vaccineEndDayBoosterIT)?.intValue;
        }
        if (vaccination.isIncomplete) {
          return rules.find(RuleName.vaccineEndDayNotComplete, type)?.intValue;
        }
        return rules.find(RuleName.vaccineEndDaySchool)?.intValue;
      case ValidationMode.workDGP:
        return null;
    }
  }
}
