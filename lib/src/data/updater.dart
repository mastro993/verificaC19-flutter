abstract class Updater {
  Future<bool> needsUpdate();
  Future<void> updateRules();
  Future<void> updateSignaturesList();
  Future<void> updateSignatures();
  Future<void> updateRevokeList();
}
