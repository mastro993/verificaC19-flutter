import 'package:injectable/injectable.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/crl_status.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/src/data/updater.dart';

@Environment(Environment.prod)
@LazySingleton(as: Updater)
class UpdaterImpl implements Updater {
  final LocalRepository _cache;
  final RemoteRepository _service;

  UpdaterImpl(this._service, this._cache);

  @override
  Future<void> updateAll() async {
    await updateRules();
    await updateSignatures();
    await updateSignaturesList();
    await updateCRL();
  }

  @override
  Future<void> updateRules() async {
    try {
      final List<ValidationRule> rules = await _service.getValidationRules();
      await _cache.storeRules(rules);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignaturesList() async {
    try {
      final List<String> signaturesList = await _service.getSignaturesList();
      await _cache.storeSignaturesList(signaturesList);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignatures() async {
    try {
      final Map<String, String> signatures = await _service.getSignatures();
      await _cache.storeSignatures(signatures);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCRL() async {
    try {
      int currentVersion = _cache.getCRLVersion();
      CRLStatus status = await _service.getCRLStatus(
        version: currentVersion,
      );

      if (status.version! == currentVersion) {
        return;
      }

      CRL crl;
      int currentChunk = 0;

      do {
        crl = await _service.getCRLChunk(
          version: currentVersion,
          chunk: currentChunk + 1,
        );

        if (crl.delta != null) {
          _cache.storeCRL(
            insertions: crl.delta!.insertions,
            deletions: crl.delta!.deletions,
          );
        } else if (crl.revokedUcvi != null) {
          _cache.storeCRL(
            insertions: crl.revokedUcvi,
          );
        }

        currentChunk = crl.chunk!;
      } while (currentChunk != crl.lastChunk);

      _cache.storeCRLVersion(status.version!);
    } catch (e) {
      rethrow;
    }
  }
}
