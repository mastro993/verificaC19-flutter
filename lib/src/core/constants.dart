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
  static const String keyRulesUpdate = 'rules_update';
  static const String keySignaturesUpdate = 'signatures_update';
  static const String keySignaturesListUpdate = 'signatures_list_update';
  static const String keyRevokeListUpdate = 'revoke_list_update';
  static const String keyRevokeListVersion = 'revoke_list_version';
}

class TestResult {
  static const String detected = "260373001";
}

class TestType {
  static const String rapid = 'LP217198-3';
  static const String molecular = 'LP6464-4';
}

class VaccineType {
  static const String johnson = 'EU/1/20/1525';
  static const String sputnik = 'Sputnik-V';
}

class Country {
  static const String sanMarino = 'SM';
}
