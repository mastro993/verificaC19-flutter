abstract class Updater {
  Future<void> updateAll({bool forced});
  Future<void> updateRules({bool forced});
  Future<void> updateSignaturesList({bool forced});
  Future<void> updateSignatures({bool forced});
  Future<void> updateRevokeList({bool forced});
}
