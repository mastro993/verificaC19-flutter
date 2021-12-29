abstract class Updater {
  Future<void> updateRules();
  Future<void> updateSignaturesList();
  Future<void> updateSignatures();
  Future<void> updateRevokeList();
}
