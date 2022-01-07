import 'package:verificac19/src/data/model/validation_rule.dart';

abstract class LocalRepository {
  /// Returns a [DateTime] with the date and time of the last completed update.
  /// Returns null if no date is available
  Future<DateTime?> getLastUpdateTime();

  /// Checks if cached rules are expired
  bool needRulesUpdate();

  /// Checks if cached signatures are expired
  bool needSignaturesUpdate();

  /// Checks if cached signatures list is expired
  bool needSignaturesListUpdate();

  /// Checks if cached certificate revocation list (CRL) is expired
  bool needCRLUpdate();

  /// Stores a [List] of [ValidationRule] in the local cache
  Future<void> storeRules(
    List<ValidationRule> rules,
  );

  /// Stores a [Map] of kid and signatures in the local cache
  Future<void> storeSignatures(
    Map<String, String> signatures,
  );

  /// Stores a [List] of signatures in the local cache
  Future<void> storeSignaturesList(
    List<String> signaturesList,
  );

  /// Stores the UVCIs contained in [insertions] and removes the ones in [deletions] from the cached CRL.
  Future<void> storeCRL({
    List<String>? insertions,
    List<String>? deletions,
  });

  /// Stores the [version] for the cached certificate revocation list
  Future<void> storeCRLVersion(
    int version,
  );

  /// Gets the cached list of [ValidationRule].
  /// Returns an empty list if no rules are yet been stored.
  List<ValidationRule> getRules();

  /// Gets the cached map of kid and signatures.
  /// Returns an empty map if no rules are yet been stored.
  Map<String, String> getSignatures();

  /// Gets the cached list of signatures.
  /// Returns an empty list if no signatures are yet been stored.
  List<String> getSignaturesList();

  /// Gets the cached certificate revocation list.
  /// Returns an empty list if no revoked UVCI are yet been stored.
  List<String> getCRL();

  /// Gets the version of the cached certificate revocation list (CRL).
  /// Returns 0 if no CRL was not yet been stored.
  int getCRLVersion();

  /// Returns true if the given [uvci] is present in the cached CRL, false otherwise.
  bool isUvciRevoked(
    String uvci,
  );
}
