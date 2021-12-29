import 'package:verificac19/src/data/model/validation_rule.dart';

abstract class LocalRepository {
  bool rulesMustBeUpdated();
  bool signaturesMustBeUpdated();
  bool signatureListMustBeUpdated();
  bool revokeListMustBeUpdated();
  Future<void> storeRules(List<ValidationRule> rules);
  Future<void> storeSignatures(Map<String, String> signatures);
  Future<void> storeSignaturesList(List<String> signaturesList);
  Future<void> storeRevokeList(List<String> revokeList);
  List<ValidationRule> getRules();
  Map<String, String> getSignatures();
  List<String> getSignaturesList();
  List<String> getRevokeList();
  bool isUvciRevoked(String uvci);
}
