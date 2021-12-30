import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/src/data/updater.dart';

class UpdaterImpl implements Updater {
  final LocalRepository _local;
  final RemoteRepository _remote;

  UpdaterImpl(this._remote, this._local);

  @override
  Future<bool> needsUpdate() {
    return _local.needsUpdate();
  }

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
      bool needsUpdate = _local.rulesMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final List<ValidationRule> rules = await _remote.getValidationRules();
        await _local.storeRules(rules);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignaturesList({bool forced = false}) async {
    try {
      bool needsUpdate = _local.signatureListMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final List<String> signaturesList = await _remote.getSignaturesList();
        await _local.storeSignaturesList(signaturesList);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignatures({bool forced = false}) async {
    try {
      bool needsUpdate = _local.signaturesMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final Map<String, String> signatures = await _remote.getSignatures();
        await _local.storeSignatures(signatures);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateRevokeList({bool forced = false}) async {
    try {
      bool needsUpdate = _local.revokeListMustBeUpdated(
        forced ? UpdateWindowHours.min : UpdateWindowHours.max,
      );

      if (needsUpdate) {
        final List<String> revokeList = await _remote.getRevokeList();
        await _local.storeRevokeList(revokeList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
