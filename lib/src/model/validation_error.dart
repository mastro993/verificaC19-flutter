enum ValidationError {
  /// Certificate can't be validated because rules are expired
  outdatedValidationRules,

  /// DGC does not contain valid UVCIs
  emptyOrBlacklisted,

  /// Certificate can't be validated with the provided signature
  invalidSignature,
}
