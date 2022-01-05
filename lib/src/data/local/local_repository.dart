import 'package:verificac19/src/data/model/validation_rule.dart';

abstract class LocalRepository {
  /// Returns a [DateTime] with the date and time of the last completed update.
  /// Returns null if not date is available
  Future<DateTime?> getLastUpdateTime();

  /// Checks if rules  are expired
  bool needRulesUpdate();

  /// Checks if signatures  are expired
  bool needSignaturesUpdate();

  /// Checks if signatures list is expired
  bool needSignaturesListUpdate();

  /// Checks if revoke list is expired
  bool needRevokeListUpdate();

  /// Stores a [List] of [ValidationRule] locally
  Future<void> storeRules(
    List<ValidationRule> rules,
  );

  /// Stores a [Map] of kid and signatures locally
  Future<void> storeSignatures(
    Map<String, String> signatures,
  );

  /// Stores a [List] of signatures locally
  Future<void> storeSignaturesList(
    List<String> signaturesList,
  );

  /// Stores the UVCIs contained in [insertions] and removed the ones in [deletions]
  Future<void> storeRevokeList({
    List<String>? insertions,
    List<String>? deletions,
  });

  /// Stores the [version] for the cached list of revoked UVCIs
  Future<void> storeRevokeListVersion(
    int version,
  );

  /// Gets the locally stored list of [ValidationRule].
  /// Returns an empty list if no rules are yet been stored.
  List<ValidationRule> getRules();

  /// Gets the locally stored map of kid and signatures.
  /// Returns an empty map if no rules are yet been stored.
  Map<String, String> getSignatures();

  /// Gets the locally stored list of signatures.
  /// Returns an empty list if no signatures are yet been stored.
  List<String> getSignaturesList();

  /// Gets the locally stored list of revoked UVCIs.
  /// Returns an empty list if no revoked UVCI are yet been stored.
  List<String> getRevokeList();

  /// Gets the version of the locally stored list of revoked UVCIs.
  /// Returns 0 no revoked UVCI are yet been stored.
  int getRevokeListVersion();

  /// Returns true if the given [uvci] is present in the list of revoked UVCIs, false otherwise.
  bool isUvciRevoked(
    String uvci,
  );
}
