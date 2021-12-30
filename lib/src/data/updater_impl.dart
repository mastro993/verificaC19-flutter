import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/src/data/remote/remote_repository.dart';
import 'package:verificac19/src/data/updater.dart';

class UpdaterImpl implements Updater {
  final LocalRepository _local;
  final RemoteRepository _remote;

  UpdaterImpl(this._remote, this._local);

  @override
  Future<bool> needsUpdate() async {
    return _local.rulesMustBeUpdated() ||
        _local.signatureListMustBeUpdated() ||
        _local.signaturesMustBeUpdated() ||
        _local.revokeListMustBeUpdated();
  }

  @override
  Future<void> updateRules() async {
    try {
      if (_local.rulesMustBeUpdated()) {
        final List<ValidationRule> rules = await _remote.getValidationRules();
        await _local.storeRules(rules);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignaturesList() async {
    try {
      if (_local.signatureListMustBeUpdated()) {
        final List<String> signaturesList = await _remote.getSignaturesList();
        await _local.storeSignaturesList(signaturesList);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSignatures() async {
    try {
      if (_local.signaturesMustBeUpdated()) {
        final Map<String, String> signatures = await _remote.getSignatures();
        await _local.storeSignatures(signatures);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateRevokeList() async {
    try {
      if (_local.revokeListMustBeUpdated()) {
        final List<String> revokeList = await _remote.getRevokeList();
        await _local.storeRevokeList(revokeList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
