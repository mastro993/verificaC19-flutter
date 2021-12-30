import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

abstract class LocalRepository {
  /// Initializes internal depencencies
  Future<void> setup();

  // Checks if rules, CRL or DSCs needs to be updated
  Future<bool> needsUpdate();

  /// Checks if rules are older than the given [updateWindowHours] argument
  bool rulesMustBeUpdated([
    int updateWindowHours = UpdateWindowHours.max,
  ]);

  /// Checks if signatures are older than the given [updateWindowHours] argument
  bool signaturesMustBeUpdated([
    int updateWindowHours = UpdateWindowHours.max,
  ]);

  /// Checks if signatures list is older than the given [updateWindowHours] argument
  bool signatureListMustBeUpdated([
    int updateWindowHours = UpdateWindowHours.max,
  ]);

  /// Checks if revoke list is older than the given [updateWindowHours] argument
  bool revokeListMustBeUpdated([
    int updateWindowHours = UpdateWindowHours.max,
  ]);

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

  /// Stores a [List] of revoked UVCIs locally
  Future<void> storeRevokeList(
    List<String> revokeList,
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

  /// Returns true if the given [uvci] is present in the list of revoked UVCIs, false otherwise.
  bool isUvciRevoked(
    String uvci,
  );
}
