import 'package:verificac19/src/data/model/validation_rule.dart';

abstract class RemoteRepository {
  Future<List<ValidationRule>> getValidationRules();
  Future<Map<String, String>> getSignatures();
  Future<List<String>> getSignaturesList();
  Future<List<String>> getRevokeList();
}
