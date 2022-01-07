abstract class Updater {
  /// Updates all the data
  Future<void> updateAll();

  /// Updates the validation rules list
  Future<void> updateRules();

  /// Updates the signatures kid list
  Future<void> updateSignaturesList();

  /// Updates the signatures list
  Future<void> updateSignatures();

  /// Updates the revoked UVCI list
  Future<void> updateCRL();
}
