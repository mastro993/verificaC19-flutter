import 'package:clock/clock.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/model/test_result.dart';
import 'package:verificac19/src/model/test_type.dart';
import 'package:verificac19/src/model/validation_mode.dart';
import 'package:verificac19/src/utils/dcc_utils.dart';
import 'package:verificac19/verificac19.dart';

class CertificateValidatorImpl implements CertificateValidator {
  final LocalRepository _repo;

  CertificateValidatorImpl(this._repo);

  ValidationResult _checkVaccinations(
    Certificate cert,
    List<ValidationRule> rules,
  ) {
    try {
      final Vaccination lastVaccination = cert.vaccinations.last;
      final String? type = lastVaccination.medicinalProduct;

      final vaccineStartDayNotComplete = rules.find(
        'vaccine_end_day_not_complete',
        type,
      );

      final vaccineEndDayNotComplete = rules.find(
        'vaccine_end_day_not_complete',
        type,
      );

      final vaccineStartDayComplete = rules.find(
        'vaccine_start_day_complete',
        type,
      );

      final vaccineEndDayComplete = rules.find(
        'vaccine_end_day_complete',
        type,
      );

      if (type == 'Sputnik-V' && lastVaccination.countryOfVaccination != 'SM') {
        return const ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message: 'Vaccine Sputnik-V is valid only in San Marino',
        );
      }

      if (type == null && vaccineEndDayComplete == null) {
        return const ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message: 'Vaccine Type is not in list',
        );
      }

      final String doses =
          'Doses ${lastVaccination.doseNumber}/${lastVaccination.totalSeriesOfDoses}';

      if (lastVaccination.doseNumber <= 0) {
        return ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message: '$doses - Invalid number of doses',
        );
      }

      final today = clock.now();

      final todayStart = DateTime(today.year, today.month, today.day);
      final todayEnd =
          DateTime(today.year, today.month, today.day, 23, 59, 59, 9999);

      if (lastVaccination.doseNumber < lastVaccination.totalSeriesOfDoses) {
        final startDate = todayStart.add(
          Duration(days: int.parse(vaccineStartDayNotComplete!.value)),
        );
        final endDate = todayEnd.add(
          Duration(days: int.parse(vaccineEndDayNotComplete!.value)),
        );

        if (startDate.compareTo(todayEnd) > 0) {
          return ValidationResult(
            status: CertificateStatus.notValidYet,
            result: false,
            message:
                '$doses - Vaccination is not valid yet, starts at ${startDate.toIso8601String()}',
          );
        }

        if (todayStart.compareTo(endDate) > 0) {
          return ValidationResult(
            status: CertificateStatus.notValidYet,
            result: false,
            message:
                '$doses - Vaccination is expired at ${endDate.toIso8601String()}',
          );
        }

        return ValidationResult(
          status: CertificateStatus.valid,
          result: true,
          message:
              '$doses - Vaccination is valid [${startDate.toIso8601String()} - ${endDate.toIso8601String()}]',
        );
      }

      if (lastVaccination.doseNumber >= lastVaccination.totalSeriesOfDoses) {
        final startDate = todayStart.add(
          Duration(days: int.parse(vaccineStartDayComplete!.value)),
        );
        final endDate = todayEnd.add(
          Duration(days: int.parse(vaccineEndDayComplete!.value)),
        );

        if (startDate.compareTo(todayEnd) > 0) {
          return ValidationResult(
            status: CertificateStatus.notValidYet,
            result: false,
            message:
                '$doses - Vaccination is not valid yet, starts at ${startDate.toIso8601String()}',
          );
        }

        if (todayStart.compareTo(endDate) > 0) {
          return ValidationResult(
            status: CertificateStatus.notValidYet,
            result: false,
            message:
                '$doses - Vaccination is expired at ${endDate.toIso8601String()}',
          );
        }

        return ValidationResult(
          status: CertificateStatus.valid,
          result: true,
          message:
              '$doses - Vaccination is valid [${startDate.toIso8601String()} - ${endDate.toIso8601String()}]',
        );
      }

      return const ValidationResult(
        status: CertificateStatus.notValid,
        result: false,
        message: 'Vaccination format is not valid',
      );
    } catch (e) {
      return ValidationResult(
        status: CertificateStatus.notValid,
        result: false,
        message:
            'Vaccination is not present or is not a green pass: ${e.toString()}',
      );
    }
  }

  ValidationResult _checkTests(
    Certificate cert,
    List<ValidationRule> rules,
  ) {
    try {
      final lastTest = cert.tests.last;

      if (lastTest.testResult == TestResult.detected) {
        return const ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message: 'Test result is DETECTED',
        );
      }

      ValidationRule testStartHours;
      ValidationRule testEndHours;

      if (lastTest.typeOfTest == TestType.molecular) {
        testStartHours = rules.find('molecular_test_start_hours')!;
        testEndHours = rules.find('molecular_test_end_hours')!;
      } else if (lastTest.typeOfTest == TestType.rapid) {
        testStartHours = rules.find('rapid_test_start_hours')!;
        testEndHours = rules.find('rapid_test_end_hours')!;
      } else {
        return const ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message: 'Test type is not valid',
        );
      }

      final now = clock.now();
      final startDate = lastTest.dateTimeOfCollection.add(
        Duration(hours: int.parse(testStartHours.value)),
      );
      final endDate = lastTest.dateTimeOfCollection.add(
        Duration(hours: int.parse(testEndHours.value)),
      );

      if (startDate.compareTo(now) > 1) {
        return ValidationResult(
          status: CertificateStatus.notValidYet,
          result: false,
          message:
              'Test result is not valid yet, starts at: ${startDate.toIso8601String()}',
        );
      }

      if (endDate.compareTo(now) < 1) {
        return ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message: 'Test result is expired at: ${endDate.toIso8601String()}',
        );
      }

      return ValidationResult(
        status: CertificateStatus.valid,
        result: false,
        message:
            'Test result is valid [${startDate.toIso8601String()} - ${endDate.toIso8601String()}]',
      );
    } catch (e) {
      return ValidationResult(
        status: CertificateStatus.notValid,
        result: false,
        message:
            'Test Result is not present or is not a green pass: ${e.toString()}',
      );
    }
  }

  ValidationResult _checkRecovery(
    Certificate cert,
    List<ValidationRule> rules,
  ) {
    try {
      final ValidationRule recoveryCertStartDay =
          rules.find('recovery_cert_start_day')!;
      final ValidationRule recoveryCertEndDay =
          rules.find('recovery_cert_end_day')!;

      final RecoveryStatement lastRecovery = cert.recoveryStatements.last;

      final now = clock.now();

      final startDate = lastRecovery.certificateValidFrom;
      final endDate = lastRecovery.certificateValidUntil;

      final startDateValidation = startDate.add(
        Duration(days: int.parse(recoveryCertStartDay.value)),
      );
      final endDateValidation = startDateValidation.add(
        Duration(days: int.parse(recoveryCertEndDay.value)),
      );

      if (startDateValidation.compareTo(now) > 1) {
        return ValidationResult(
          status: CertificateStatus.notValidYet,
          result: false,
          message:
              'Recovery statement is not valid yet, starts at: ${startDate.toIso8601String()}',
        );
      }

      if (endDateValidation.compareTo(now) < 1) {
        return ValidationResult(
          status: CertificateStatus.notValid,
          result: false,
          message:
              'Recovery statement is expired at: ${endDate.toIso8601String()}',
        );
      }

      return ValidationResult(
        status: CertificateStatus.valid,
        result: false,
        message:
            'Recovery statement is valid [${startDate.toIso8601String()} - ${endDate.toIso8601String()}]',
      );
    } catch (e) {
      return ValidationResult(
        status: CertificateStatus.notValid,
        result: false,
        message:
            'Recovery statement is not present or is not a green pass: ${e.toString()}',
      );
    }
  }

  bool _checkUVCI(
    List<dynamic> items,
    List<String> uvciList,
  ) {
    for (final s in items) {
      if (uvciList.contains(s.certificateIdentifier)) {
        return false;
      }
      if (_repo.isUvciRevoked(s)) {
        return false;
      }
    }
    return true;
  }

  Future<ValidationResult> _checkRules(
    Certificate certificate,
    ValidationMode mode,
  ) async {
    final List<ValidationRule> rules = _repo.getRules();

    final ValidationRule? uvciRule = rules.find(
      'black_list_uvci',
      'black_list_uvci',
    );
    final List<String> blacklistedUvciList = uvciRule!.value
        .split(';')
        .where((element) => element.isNotEmpty)
        .toList();

    if (certificate.recoveryStatements.isNotEmpty &&
        _checkUVCI(certificate.recoveryStatements, blacklistedUvciList)) {
      return _checkRecovery(certificate, rules);
    }

    if (certificate.tests.isNotEmpty &&
        _checkUVCI(certificate.tests, blacklistedUvciList)) {
      if (mode == ValidationMode.superDGP) {
        return const ValidationResult(
          result: false,
          status: CertificateStatus.notValid,
          message: 'Not valid. Super DGP required',
        );
      }
      return _checkTests(certificate, rules);
    }

    if (certificate.vaccinations.isNotEmpty &&
        _checkUVCI(certificate.vaccinations, blacklistedUvciList)) {
      return _checkVaccinations(certificate, rules);
    }

    return const ValidationResult(
      result: false,
      status: CertificateStatus.notEuDCC,
      message:
          'No vaccination, test or recovery statement found in payload or UVCI is in blacklist',
    );
  }

  Future<bool> _checkSignature(
    Certificate certificate,
  ) async {
    final List<String> signaturesList = _repo.getSignaturesList();
    final Map<String, String> signatures = _repo.getSignatures();

    if (signaturesList.contains(certificate.kid)) {
      try {
        String signature = signatures[certificate.kid]!;
        return DccUtils.checkSignatureWithCertificate(
            signature, certificate.dcc);
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  @override
  Future<ValidationResult> validate(
    Certificate certificate, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    final bool signatureIsOk = await _checkSignature(certificate);

    if (!signatureIsOk) {
      return const ValidationResult(
        status: CertificateStatus.notValid,
        result: false,
        message: 'Invalid signature',
      );
    }

    final result = await _checkRules(certificate, mode);

    return result;
  }
}
