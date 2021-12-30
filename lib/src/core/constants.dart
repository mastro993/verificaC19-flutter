class UpdateWindowHours {
  static const int max = 24;
  static const int min = 1;
}

class DbKeys {
  static const String dbData = 'verificac19_data_box';
  static const String dbRevokeList = 'verificac19_revoke_list_box';
  static const String dbUpdates = 'verificac19_updates_box';

  static const String keySignatures = 'signatures';
  static const String keyRules = 'rules';
  static const String keySignaturesList = 'signatures_list';
  static const String keyRulesLastUpdate = 'rules_last_update';
  static const String keySignaturesLastUpdate = 'signatures_last_update';
  static const String keySignaturesListLastUpdate =
      'signatures_list_last_update';
  static const String keyRevokeListLastUpdate = 'revoke_list_last_update';
  static const String keyRevokeListVersion = 'revoke_list_version';
}

class TestResult {
  static const String detected = "260373001";
}

class TestType {
  static const String rapid = 'LP217198-3';
  static const String molecular = 'LP6464-4';
}
