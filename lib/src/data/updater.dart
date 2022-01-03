abstract class Updater {
  /// Updates all the data
  /// Optional paramter [forced] can be passed to force the update before the 24 hours expiry window
  Future<void> updateAll({bool forced});

  /// Updates the validation rules list
  /// Optional paramter [forced] can be passed to force the update before the 24 hours expiry window
  Future<void> updateRules({bool forced});

  /// Updates the signatures kid list
  /// Optional paramter [forced] can be passed to force the update before the 24 hours expiry window
  Future<void> updateSignaturesList({bool forced});

  /// Updates the signatures list
  /// Optional paramter [forced] can be passed to force the update before the 24 hours expiry window
  Future<void> updateSignatures({bool forced});

  /// Updates the revoked UVCI list
  /// Optional paramter [forced] can be passed to force the update before the 24 hours expiry window
  Future<void> updateRevokeList({bool forced});
}
