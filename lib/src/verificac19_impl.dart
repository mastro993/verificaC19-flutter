import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/local/local_repository_impl.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/src/data/remote/remote_repository_impl.dart';
import 'package:verificac19/src/data/updater.dart';
import 'package:verificac19/src/data/updater_impl.dart';
import 'package:verificac19/src/logic/certificate_parser.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/src/logic/certificate_validator_impl.dart';
import 'package:verificac19/src/model/validation_mode.dart';
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
  Future<bool> needsUpdate() {
    return _cache.needsUpdate();
  }

  @override
  Future<DateTime> getLastUpdateTime() {
    return _cache.getLastUpdateTime();
  }

  @override
  Future<void> update({bool forced = false}) async {
    await _updater.updateAll(forced: forced);
  }

  @override
  Future<Certificate> getCertificateFromRaw(String rawData) {
    return CertificateParser.getCertificateFromRawData(rawData);
  }

  @override
  Future<ValidationResult> validateCertificate(
    Certificate certificate, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) {
    return _validator.validate(certificate, mode: mode);
  }

  @override
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) async {
    final cert = await getCertificateFromRaw(rawData);
    return validateCertificate(cert, mode: mode);
  }
}
