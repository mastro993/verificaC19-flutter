import 'dart:developer';

import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/logic/certificate_decoder.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/logic/exemption_validator.dart';
import 'package:verificac19/src/logic/recovery_statement_validator.dart';
import 'package:verificac19/src/logic/test_validator.dart';
import 'package:verificac19/src/logic/vaccine_validator.dart';
import 'package:verificac19/src/model/certificate_info.dart';
import 'package:verificac19/src/utils/dcc_utils.dart';
import 'package:verificac19/verificac19.dart';

@Environment(Environment.prod)
@LazySingleton(as: CertificateValidator)
class CertificateValidatorImpl implements CertificateValidator {
  final LocalRepository _cache;
  final VaccineValidator _vaccineValidator;
  final RecoveryStatementValidator _recoveryStatementValidator;
  final TestValidator _testValidator;
  final ExemptionValidator _exemptionValidator;

  CertificateValidatorImpl(
    this._cache,
    this._vaccineValidator,
    this._recoveryStatementValidator,
    this._testValidator,
    this._exemptionValidator,
  );

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
      return _exemptionValidator.validate(
        certificate.exemptions.last,
        mode: mode,
      );
    }

    if (certificate.recoveryStatements.isNotEmpty) {
      final isRecoveryBis = signingCertificateInfo.country == Country.italy &&
          signingCertificateInfo.extendedKeyUsage == true;

      return _recoveryStatementValidator.validate(
        certificate.recoveryStatements.last,
        mode: mode,
        isRecoveryBis: isRecoveryBis,
        dateOfBirth: certificate.dateOfBirth,
      );
    }

    if (certificate.tests.isNotEmpty) {
      return _testValidator.validate(
        certificate.tests.last,
        mode: mode,
        dateOfBirth: certificate.dateOfBirth,
      );
    }

    if (certificate.vaccinations.isNotEmpty) {
      return _vaccineValidator.validate(
        certificate.vaccinations.last,
        mode: mode,
        dateOfBirth: certificate.dateOfBirth,
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
    return null;
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
