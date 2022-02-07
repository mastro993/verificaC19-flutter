import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/core/extensions.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/certificate_decoder.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/model/certificate_info.dart';
import 'package:verificac19/src/model/exemption.dart';
import 'package:verificac19/src/utils/dcc_utils.dart';
import 'package:verificac19/verificac19.dart';

@Environment(Environment.prod)
@LazySingleton(as: CertificateValidator)
class CertificateValidatorImpl implements CertificateValidator {
  final LocalRepository _cache;

  CertificateValidatorImpl(this._cache);

  bool _uvciIsRevoked(List<dynamic> items) {
    final List<ValidationRule> rules = _cache.getRules();

    final ValidationRule? uvciRule = rules.find(
      RuleName.blackListUvci,
      RuleName.blackListUvci,
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
  Future<GreenCertificateStatus> checkVaccinations(
    List<Vaccination> vaccinations, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    try {
      final Vaccination last = vaccinations.last;
      final String? type = last.medicinalProduct;

      // In Italy, Sputnik is accepted only for San Marino republic
      if (type == VaccineType.sputnik &&
          last.countryOfVaccination != Country.sanMarino) {
        log('Vaccine ${VaccineType.sputnik} is valid only in San Marino');
        return GreenCertificateStatus.notValid;
      }

      final rules = _cache.getRules();

      var vaccinationStartDays = 0;
      var vaccinationEndDays = 0;

      // Check for partial or complete vaccine
      if (last.doseNumber < last.totalSeriesOfDoses) {
        // Partial vaccination is not valid if Booster or School validation mode
        // Booster doses are only for complete vaccination
        if (mode == ValidationMode.boosterDGP ||
            mode == ValidationMode.schoolDGP) {
          log('Vaccine is not valid in Booster or School mode');
          return GreenCertificateStatus.notValid;
        }

        final startDays = rules.find(RuleName.vaccineStartDayNotComplete, type);
        final endDays = rules.find(RuleName.vaccineEndDayNotComplete, type);

        vaccinationStartDays = int.parse(startDays!.value);
        vaccinationEndDays = int.parse(endDays!.value);
      } else if (last.doseNumber >= last.totalSeriesOfDoses) {
        final startDays = rules.find(RuleName.vaccineStartDayComplete, type);
        var endDays = rules.find(RuleName.vaccineEndDayComplete, type);

        if (mode == ValidationMode.schoolDGP) {
          endDays = rules.find(RuleName.vaccineEndDaySchool, type);
        }

        vaccinationStartDays = int.parse(startDays!.value);
        vaccinationEndDays = int.parse(endDays!.value);

        if (type == VaccineType.johnson) {
          // - Janssen TYPE_EU_1_20_1525 with doseNumber greater than totalSeriesOfDoses (second dose or more)
          //   is valid from now, skip start validity check because Janssen does not have partially condition (single dose vaccine)
          //   and rule of completed vaccine has validity of 15 days after dose injection (but this is not true for recall)
          vaccinationStartDays = 0;
        }
      }

      final vaccinationStart = last.dateOfVaccination
          .withoutTime()
          .add(Duration(days: vaccinationStartDays));
      final vaccinationEnd = last.dateOfVaccination
          .withoutTime()
          .add(Duration(days: vaccinationEndDays));

      final todayStart = clock.now().withoutTime();
      final todayEnd = todayStart
          .add(const Duration(days: 1))
          .subtract(const Duration(milliseconds: 1));

      final String doses = '${last.doseNumber}/${last.totalSeriesOfDoses}';

      if (vaccinationStart > todayEnd) {
        log('Doses $doses - Vaccination is not valid yet, starts at ${vaccinationStart.toIso8601String()}');
        return GreenCertificateStatus.notValidYet;
      }

      if (vaccinationEnd < todayStart) {
        log('Doses $doses - Vaccination is expired at ${vaccinationEnd.toIso8601String()}');
        return GreenCertificateStatus.notValid;
      }

      // Completed cycle without booster

      if (mode == ValidationMode.boosterDGP) {
        if (type == VaccineType.johnson) {
          if (last.doseNumber == last.totalSeriesOfDoses &&
              last.doseNumber < 2) {
            return GreenCertificateStatus.testNeeded;
          }
        } else if (last.doseNumber == last.totalSeriesOfDoses &&
            last.doseNumber < 3) {
          return GreenCertificateStatus.testNeeded;
        }
      }

      log('Doses $doses - Vaccination is valid [${vaccinationStart.toIso8601String()} - ${vaccinationEnd.toIso8601String()}]');
      return GreenCertificateStatus.valid;
    } catch (e) {
      log('Vaccination is not present or is not a green pass: ${e.toString()}');
      return GreenCertificateStatus.notValid;
    }
  }

  @override
  Future<GreenCertificateStatus> checkTests(
    List<Test> tests, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    if (mode != ValidationMode.normalDGP) {
      log('Not valid. Super DGP or Booster required.');
      return GreenCertificateStatus.notValid;
    }

    try {
      final lastTest = tests.last;

      if (lastTest.testResult == TestResult.detected) {
        log('Test result is DETECTED');
        return GreenCertificateStatus.notValid;
      }

      final rules = _cache.getRules();

      int testStartHours;
      int testEndHours;

      if (lastTest.typeOfTest == TestType.molecular) {
        String startHours = rules.find(RuleName.molecularTestStartHours)!.value;
        String endHours = rules.find(RuleName.molecularTestEndHours)!.value;
        testStartHours = int.parse(startHours);
        testEndHours = int.parse(endHours);
      } else if (lastTest.typeOfTest == TestType.rapid) {
        String startHours = rules.find(RuleName.rapidTestStartHours)!.value;
        String endHours = rules.find(RuleName.rapidTestEndHours)!.value;
        testStartHours = int.parse(startHours);
        testEndHours = int.parse(endHours);
      } else {
        log('Test type is not valid');
        return GreenCertificateStatus.notValid;
      }

      final startDate = lastTest.dateTimeOfCollection.add(
        Duration(hours: testStartHours),
      );
      final endDate = lastTest.dateTimeOfCollection.add(
        Duration(hours: testEndHours),
      );

      if (clock.now() < startDate) {
        log('Test result is not valid yet, starts at: ${startDate.toIso8601String()}');
        return GreenCertificateStatus.notValidYet;
      }

      if (clock.now() > endDate) {
        log('Test result is expired at: ${endDate.toIso8601String()}');
        return GreenCertificateStatus.notValid;
      }

      log('Test result is valid [${startDate.toIso8601String()} - ${endDate.toIso8601String()}]');
      return GreenCertificateStatus.valid;
    } catch (e) {
      log('Test Result is not present or is not a green pass: ${e.toString()}');
      return GreenCertificateStatus.notValid;
    }
  }

  @override
  Future<GreenCertificateStatus> checkRecoveryStatements(
    List<RecoveryStatement> recoveryStatements, {
    ValidationMode mode = ValidationMode.normalDGP,
    bool isRecoveryBis = false,
  }) async {
    try {
      if (mode == ValidationMode.boosterDGP) {
        log('Test needed');
        return GreenCertificateStatus.testNeeded;
      }

      final rules = _cache.getRules();
      final RecoveryStatement lastRecovery = recoveryStatements.last;

      ValidationRule? startDaysRule;
      ValidationRule? endDaysRule;

      if (mode == ValidationMode.schoolDGP) {
        startDaysRule = rules.find(RuleName.recoveryCertPvStartDay);
        endDaysRule = rules.find(RuleName.recoveryCertEndDaySchool);
      } else if (isRecoveryBis) {
        startDaysRule = rules.find(RuleName.recoveryCertPvStartDay);
        endDaysRule = rules.find(RuleName.recoveryCertPvEndDay);
      } else {
        startDaysRule = rules.find(RuleName.recoveryCertStartDay);
        endDaysRule = rules.find(RuleName.recoveryCertEndDay);
      }

      final recoveryFromDay = lastRecovery.certificateValidFrom.withoutTime();
      final recoveryUntilDay = lastRecovery.certificateValidUntil.withoutTime();

      final startDays = int.parse(startDaysRule!.value);
      final endDays = int.parse(endDaysRule!.value);

      final startDateValidation = recoveryFromDay.add(
        Duration(days: startDays),
      );
      final endDateValidation = recoveryFromDay.add(
        Duration(days: endDays),
      );

      final today = clock.now().withoutTime();

      if (today < startDateValidation) {
        log('Recovery statement is not valid yet, starts at: ${startDateValidation.toIso8601String()}');
        return GreenCertificateStatus.notValidYet;
      }

      if (today > recoveryUntilDay && today > endDateValidation) {
        log('Recovery statement is expired at: ${endDateValidation.toIso8601String()}');
        return GreenCertificateStatus.notValid;
      }

      log('Recovery statement is valid [${recoveryFromDay.toIso8601String()} - ${recoveryUntilDay.toIso8601String()}]');
      return GreenCertificateStatus.valid;
    } catch (e) {
      log('Recovery statement is not present or is not a green pass: ${e.toString()}');
      return GreenCertificateStatus.notValid;
    }
  }

  @override
  Future<GreenCertificateStatus> checkExemptions(
    List<Exemption> exemptions, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    try {
      final Exemption lastExemption = exemptions.last;

      final exemptionFromDay = lastExemption.certificateValidFrom.withoutTime();
      final exemptionUntilDay =
          lastExemption.certificateValidUntil?.withoutTime();

      if (exemptionFromDay > clock.now()) {
        return GreenCertificateStatus.notValidYet;
      }

      if (exemptionUntilDay != null && exemptionUntilDay < clock.now()) {
        return GreenCertificateStatus.notValid;
      }

      if (mode == ValidationMode.boosterDGP) {
        return GreenCertificateStatus.testNeeded;
      }

      return GreenCertificateStatus.valid;
    } catch (e) {
      return GreenCertificateStatus.notEuDCC;
    }
  }

  @override
  Future<GreenCertificateStatus> checkValidationRules(
    GreenCertificate certificate, {
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
      return GreenCertificateStatus.revoked;
    }

    final signingCertificateInfo = await getCertificatesignatureInfo(
      certificate,
    );

    if (certificate.exemptions.isNotEmpty) {
      return checkExemptions(
        certificate.exemptions,
        mode: mode,
      );
    }

    if (certificate.recoveryStatements.isNotEmpty) {
      final isRecoveryBis = signingCertificateInfo.country == Country.italy &&
          signingCertificateInfo.extendedKeyUsage == true;

      return checkRecoveryStatements(
        certificate.recoveryStatements,
        mode: mode,
        isRecoveryBis: isRecoveryBis,
      );
    }

    if (certificate.tests.isNotEmpty) {
      if (mode == ValidationMode.superDGP ||
          mode == ValidationMode.boosterDGP ||
          mode == ValidationMode.schoolDGP) {
        log('Not valid. Super DGP required');
        return GreenCertificateStatus.notValid;
      }
      return checkTests(
        certificate.tests,
        mode: mode,
      );
    }

    if (certificate.vaccinations.isNotEmpty) {
      return checkVaccinations(
        certificate.vaccinations,
        mode: mode,
      );
    }

    log('No vaccination, test or recovery statement found in payload or UVCI is in blacklist');
    return GreenCertificateStatus.notEuDCC;
  }

  Future<String?> getCertificateSignature(GreenCertificate certificate) async {
    final List<String> signaturesList = _cache.getSignaturesList();
    final Map<String, String> signatures = _cache.getSignatures();

    if (signaturesList.contains(certificate.dcc.kid)) {
      return signatures[certificate.dcc.kid];
    }
  }

  @override
  Future<bool> checkCertificateSignature(GreenCertificate certificate) async {
    try {
      final String? signature = await getCertificateSignature(certificate);
      return DccUtils.checkSignatureWithCertificate(
        signature!,
        certificate.dcc,
      );
    } catch (e) {
      return false;
    }
  }

  Future<CertificateInfo> getCertificatesignatureInfo(
    GreenCertificate certificate,
  ) async {
    try {
      final String? signature = await getCertificateSignature(certificate);
      return DccUtils.getCertificateInfo(signature!);
    } catch (e) {
      return CertificateInfo.empty();
    }
  }

  @override
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    final certificate = await CertificateDecoder.getCertificateFromRawData(
      rawData,
    );

    bool signatureIsOk = await checkCertificateSignature(certificate);

    if (!signatureIsOk) {
      log("Certificate has an invalid signature");

      return ValidationResult(
        certificate: certificate,
        certificateStatus: GreenCertificateStatus.notValid,
        validationMode: mode,
        validationDateTime: clock.now(),
      );
    }

    final GreenCertificateStatus rulesResult = await checkValidationRules(
      certificate,
      mode: mode,
    );

    return ValidationResult(
      certificate: certificate,
      certificateStatus: rulesResult,
      validationMode: mode,
      validationDateTime: clock.now(),
    );
  }
}
