import 'package:verificac19/src/data/model/crl.dart';
import 'package:verificac19/src/data/model/crl_status.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';

abstract class RemoteRepository {
  Future<List<ValidationRule>> getValidationRules();
  Future<Map<String, String>> getSignatures();
  Future<List<String>> getSignaturesList();

  Future<CRLStatus> getCRLStatus({
    int? version,
  });
  Future<CRL> getCRLChunk({
    int? version,
    int? chunk,
  });
}
