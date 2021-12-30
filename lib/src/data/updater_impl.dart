import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/src/data/updater.dart';

class UpdaterImpl implements Updater {
  final LocalRepository _cache;
  final RemoteRepository _service;

  UpdaterImpl(this._service, this._cache);

  @override
  Future<void> updateAll({bool forced = false}) async {
    await updateRules(forced: forced);
    await updateSignatures(forced: forced);
    await updateSignaturesList(forced: forced);
    await updateRevokeList(forced: forced);
  }

  @override
  Future<void> updateRules({bool forced = false}) async {
    try {
      bool needsUpdate = _cache.rulesMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final List<ValidationRule> rules = await _service.getValidationRules();
        await _cache.storeRules(rules);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignaturesList({bool forced = false}) async {
    try {
      bool needsUpdate = _cache.signatureListMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final List<String> signaturesList = await _service.getSignaturesList();
        await _cache.storeSignaturesList(signaturesList);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignatures({bool forced = false}) async {
    try {
      bool needsUpdate = _cache.signaturesMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final Map<String, String> signatures = await _service.getSignatures();
        await _cache.storeSignatures(signatures);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateRevokeList({bool forced = false}) async {
    try {
      bool needsUpdate = _cache.revokeListMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final List<String> revokeList = await _service.getRevokeList();
        await _cache.storeRevokeList(revokeList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
