import 'dart:developer';

import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/local/local_repository_impl.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/src/data/remote/remote_repository_impl.dart';
import 'package:verificac19/src/data/updater.dart';
import 'package:verificac19/src/data/updater_impl.dart';
import 'package:verificac19/src/logic/certificate_decoder.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/logic/certificate_validator_impl.dart';
import 'package:verificac19/verificac19.dart';

class VerificaC19Impl implements VerificaC19Interface {
  late RemoteRepository _service;
  late LocalRepository _cache;
  late CertificateValidator _validator;
  late Updater _updater;

  @override
  Future<void> initialize() async {
    _service = RemoteRepositoryImpl();
    _cache = LocalRepositoryImpl();
    _validator = CertificateValidatorImpl(_cache);
    _updater = UpdaterImpl(_service, _cache);

    await _cache.setup();
  }

  @override
  bool needsUpdate() {
    return _cache.needRulesUpdate() ||
        _cache.needRevokeListUpdate() ||
        _cache.needSignaturesListUpdate() ||
        _cache.needSignaturesUpdate();
  }

  @override
  Future<DateTime?> getLastUpdateTime() {
    return _cache.getLastUpdateTime();
  }

  @override
  Future<void> update() async {
    await _updater.updateAll();
  }

  @override
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    if (needsUpdate()) {
      throw ValidationException(
        'Expired validation rules. Please update the rules before validating a DGC',
      );
    }

    final certificate = await CertificateDecoder.getCertificateFromRawData(
      rawData,
    );

    final bool signatureIsOk = await _validator.checkCertificateSignature(
      certificate,
    );

    if (!signatureIsOk) {
      log("Certificate has an invalid signature");
      return ValidationResult(
        certificate: certificate,
        status: CertificateStatus.notValid,
      );
    }

    final CertificateStatus rulesResult = await _validator.checkValidationRules(
      certificate,
      mode: mode,
    );

    return ValidationResult(
      certificate: certificate,
      status: rulesResult,
    );
  }
}
