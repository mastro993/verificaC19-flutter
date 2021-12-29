class C {
  static final dbKeys = _DbKeys();
  static final testResult = _TestResult();
  static final testType = _TestType();
}

class _DbKeys {
  final String dbData = 'verificac19_data_box';
  final String dbRevokeList = 'verificac19_revoke_list_box';

  final String keySignatures = 'signatures';
  final String keyRules = 'rules';
  final String keySignaturesList = 'signatures_list';
  final String keyRulesLastUpdate = 'rules_last_update';
  final String keySignaturesLastUpdate = 'signatures_last_update';
  final String keySignaturesListLastUpdate = 'signatures_list_last_update';
  final String keyRevokeListLastUpdate = 'revoke_list_last_update';
  final String keyRevokeListVersion = 'revoke_list_version';
}

class _TestResult {
  final String detected = "260373001";
}

class _TestType {
  final String rapid = 'LP217198-3';
  final String molecular = 'LP6464-4';
}
