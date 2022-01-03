import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/core/extensions.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/utils/dcc_utils.dart';
import 'package:verificac19/verificac19.dart';

class CertificateValidatorImpl implements CertificateValidator {
  final LocalRepository _cache;

  CertificateValidatorImpl(this._cache);

  bool _uvciIsRevoked(List<dynamic> items) {
    final List<ValidationRule> rules = _cache.getRules();

    final ValidationRule? uvciRule = rules.find(
      'black_list_uvci',
      'black_list_uvci',
    );
    final List<String> blacklistedUvciList = uvciRule!.value
        .split(';')
        .where((element) => element.isNotEmpty)
        .toList();

    for (final s in items) {
      if (s is Vaccination || s is Test || s is RecoveryStatement) {
        if (blacklistedUvciList.contains(s.certificateIdentifier)) {
          return true;
        }
        if (_cache.isUvciRevoked(s.certificateIdentifier)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Future<CertificateStatus> checkVaccinations(
    List<Vaccination> vaccinations, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    try {
      final Vaccination lastVaccination = vaccinations.last;
      final String? type = lastVaccination.medicinalProduct;

      // In Italy, Sputnik is accepted only for San Marino republic
      if (type == VaccineType.sputnik &&
          lastVaccination.countryOfVaccination != Country.sanMarino) {
        log('Vaccine ${VaccineType.sputnik} is valid only in San Marino');
        return CertificateStatus.notValid;
      }

      final rules = _cache.getRules();

      var vaccinationStartDays = 0;
      var vaccinationEndDays = 0;

      // Check for partial or complete vaccine
      if (lastVaccination.doseNumber < lastVaccination.totalSeriesOfDoses) {
        final startDays = rules.find('vaccine_start_day_not_complete', type);
        final endDays = rules.find('vaccine_end_day_not_complete', type);
        vaccinationStartDays = int.parse(startDays!.value);
        vaccinationEndDays = int.parse(endDays!.value);

        // Paertial vaccination is not valid if Booster validation mode
        // Booster doses are only for complete vaccination
        if (mode == ValidationMode.boosterDGP) {
          log('Vaccine is not valid in Booster mode');
          return CertificateStatus.notValid;
        }
      } else if (lastVaccination.doseNumber >=
          lastVaccination.totalSeriesOfDoses) {
        final startDays = rules.find('vaccine_start_day_complete', type);
        final endDays = rules.find('vaccine_end_day_complete', type);
        vaccinationStartDays = int.parse(startDays!.value);
        vaccinationEndDays = int.parse(endDays!.value);

        if (type == VaccineType.johnson) {
          // - Janssen TYPE_EU_1_20_1525 with doseNumber greater than totalSeriesOfDoses (second dose or more)
          //   is valid from now, skip start validity check because Janssen does not have partially condition (single dose vaccine)
          //   and rule of completed vaccine has validity of 15 days after dose injection (but this is not true for recall)
          vaccinationStartDays = 0;
        }
      }

      final vaccinationStart = lastVaccination.dateOfVaccination
          .withoutTime()
          .add(Duration(days: vaccinationStartDays));
      final vaccinationEnd = lastVaccination.dateOfVaccination
          .withoutTime()
          .add(Duration(days: vaccinationEndDays));

      final todayStart = clock.now().withoutTime();
      final todayEnd = todayStart
          .add(const Duration(days: 1))
          .subtract(const Duration(milliseconds: 1));

      if (vaccinationStart > todayEnd) {
        log('Doses ${lastVaccination.doseNumber}/${lastVaccination.totalSeriesOfDoses} - Vaccination is not valid yet, starts at ${vaccinationStart.toIso8601String()}');
        return CertificateStatus.notValidYet;
      }

      if (vaccinationEnd < todayStart) {
        log('Doses ${lastVaccination.doseNumber}/${lastVaccination.totalSeriesOfDoses} - Vaccination is expired at ${vaccinationEnd.toIso8601String()}');
        return CertificateStatus.notValid;
      }

      log('Doses ${lastVaccination.doseNumber}/${lastVaccination.totalSeriesOfDoses} - Vaccination is valid [${vaccinationStart.toIso8601String()} - ${vaccinationEnd.toIso8601String()}]');
      return CertificateStatus.valid;
    } catch (e) {
      log('Vaccination is not present or is not a green pass: ${e.toString()}');
      return CertificateStatus.notValid;
    }
  }

  @override
  Future<CertificateStatus> checkTests(
    List<Test> tests, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    if (mode != ValidationMode.normalDGP) {
      log('Not valid. Super DGP or Booster required.');
      return CertificateStatus.notValid;
    }

    try {
      final lastTest = tests.last;

      if (lastTest.testResult == TestResult.detected) {
        log('Test result is DETECTED');
        return CertificateStatus.notValid;
      }

      final rules = _cache.getRules();

      int testStartHours;
      int testEndHours;

      if (lastTest.typeOfTest == TestType.molecular) {
        String startHours = rules.find('molecular_test_start_hours')!.value;
        String endHours = rules.find('molecular_test_end_hours')!.value;
        testStartHours = int.parse(startHours);
        testEndHours = int.parse(endHours);
      } else if (lastTest.typeOfTest == TestType.rapid) {
        String startHours = rules.find('rapid_test_start_hours')!.value;
        String endHours = rules.find('rapid_test_end_hours')!.value;
        testStartHours = int.parse(startHours);
        testEndHours = int.parse(endHours);
      } else {
        log('Test type is not valid');
        return CertificateStatus.notValid;
      }

      final startDate = lastTest.dateTimeOfCollection.add(
        Duration(hours: testStartHours),
      );
      final endDate = lastTest.dateTimeOfCollection.add(
        Duration(hours: testEndHours),
      );

      if (clock.now() < startDate) {
        log('Test result is not valid yet, starts at: ${startDate.toIso8601String()}');
        return CertificateStatus.notValidYet;
      }

      if (clock.now() > endDate) {
        log('Test result is expired at: ${endDate.toIso8601String()}');
        return CertificateStatus.notValid;
      }

      log('Test result is valid [${startDate.toIso8601String()} - ${endDate.toIso8601String()}]');
      return CertificateStatus.valid;
    } catch (e) {
      log('Test Result is not present or is not a green pass: ${e.toString()}');
      return CertificateStatus.notValid;
    }
  }

  @override
  Future<CertificateStatus> checkRecoveryStatements(
    List<RecoveryStatement> recoveryStatements, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    try {
      final rules = _cache.getRules();

      final startDays = rules.find('recovery_cert_start_day')!.value;
      final endDays = rules.find('recovery_cert_end_day')!.value;

      final RecoveryStatement lastRecovery = recoveryStatements.last;

      final recoveryFromDay = lastRecovery.certificateValidFrom.withoutTime();
      final recoveryUntilDay = lastRecovery.certificateValidUntil.withoutTime();

      final startDateValidation = recoveryFromDay.add(
        Duration(days: int.parse(startDays)),
      );
      final endDateValidation = recoveryFromDay.add(
        Duration(days: int.parse(endDays)),
      );

      final today = clock.now().withoutTime();

      if (today < startDateValidation) {
        log('Recovery statement is not valid yet, starts at: ${startDateValidation.toIso8601String()}');
        return CertificateStatus.notValidYet;
      }

      if (today > recoveryUntilDay && today > endDateValidation) {
        log('Recovery statement is expired at: ${endDateValidation.toIso8601String()}');
        return CertificateStatus.notValid;
      }

      if (mode == ValidationMode.boosterDGP) {
        log('Test needed');
        return CertificateStatus.testNeeded;
      }

      log('Recovery statement is valid [${recoveryFromDay.toIso8601String()} - ${recoveryUntilDay.toIso8601String()}]');
      return CertificateStatus.valid;
    } catch (e) {
      log('Recovery statement is not present or is not a green pass: ${e.toString()}');
      return CertificateStatus.notValid;
    }
  }

  @override
  Future<CertificateStatus> checkValidationRules(
    Certificate certificate, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    final List<dynamic> uvciList = [
      ...certificate.tests,
      ...certificate.recoveryStatements,
      ...certificate.vaccinations,
    ];
    final bool isRevoked = _uvciIsRevoked(uvciList);

    if (isRevoked) {
      log('UVCI is in blacklist');
      return CertificateStatus.revoked;
    }

    if (certificate.recoveryStatements.isNotEmpty) {
      return checkRecoveryStatements(certificate.recoveryStatements);
    }

    if (certificate.tests.isNotEmpty) {
      if (mode == ValidationMode.superDGP) {
        log('Not valid. Super DGP required');
        return CertificateStatus.notValid;
      }
      return checkTests(certificate.tests);
    }

    if (certificate.vaccinations.isNotEmpty) {
      return checkVaccinations(certificate.vaccinations, mode: mode);
    }

    log('No vaccination, test or recovery statement found in payload or UVCI is in blacklist');
    return CertificateStatus.notEuDCC;
  }

  @override
  Future<bool> checkCertificateSignature(Certificate certificate) async {
    final List<String> signaturesList = _cache.getSignaturesList();
    final Map<String, String> signatures = _cache.getSignatures();

    if (signaturesList.contains(certificate.dcc.kid)) {
      try {
        String signature = signatures[certificate.dcc.kid]!;
        return DccUtils.checkSignatureWithCertificate(
          signature,
          certificate.dcc,
        );
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}
