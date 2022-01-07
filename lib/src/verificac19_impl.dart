import 'package:injectable/injectable.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/updater.dart';
import 'package:verificac19/src/di/injection.dart';
import 'package:verificac19/src/logic/certificate_validator.dart';
import 'package:verificac19/verificac19.dart';

class VerificaC19Impl implements VerificaC19Interface {
  @override
  Future<void> initialize() async {
    await configureInjection(Environment.prod);
  }

  @override
  bool needsUpdate() {
    final LocalRepository cache = getIt<LocalRepository>();
    return cache.needRulesUpdate() ||
        cache.needCRLUpdate() ||
        cache.needSignaturesListUpdate() ||
        cache.needSignaturesUpdate();
  }

  @override
  Future<DateTime?> getLastUpdateTime() {
    final LocalRepository cache = getIt<LocalRepository>();
    return cache.getLastUpdateTime();
  }

  @override
  Future<void> update() async {
    final Updater updater = getIt<Updater>();
    await updater.updateAll();
  }

  @override
  Future<ValidationResult> validateFromRaw(
    String rawData, {
    ValidationMode mode = ValidationMode.normalDGP,
  }) {
    if (needsUpdate()) {
      throw ValidationException(
        'Expired rules, DSCs and/or CRL. Please update before validating a DGC',
      );
    }
    final CertificateValidator validator = getIt<CertificateValidator>();
    return validator.validateFromRaw(rawData, mode: mode);
  }
}
