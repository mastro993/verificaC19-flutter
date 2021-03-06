class UpdateWindowHours {
  static const int max = 24;
  static const int min = 1;
}

class RuleName {
  static const String blackListUvci = 'black_list_uvci';
  static const String vaccineStartDayNotComplete =
      'vaccine_start_day_not_complete';
  static const String vaccineEndDayNotComplete = 'vaccine_end_day_not_complete';
  static const String vaccineStartDayComplete = 'vaccine_start_day_complete';
  static const String vaccineEndDayComplete = 'vaccine_end_day_complete';
  static const String vaccineEndDaySchool = 'vaccine_end_day_school';
  static const String vaccineStartDayCompleteIT =
      'vaccine_start_day_complete_IT';
  static const String vaccineEndDayCompleteIT = 'vaccine_end_day_complete_IT';
  static const String vaccineStartDayBoosterIT = 'vaccine_start_day_booster_IT';
  static const String vaccineEndDayBoosterIT = 'vaccine_end_day_booster_IT';
  static const String vaccineStartDayCompleteNotIT =
      'vaccine_start_day_complete_NOT_IT';
  static const String vaccineEndDayCompleteNotIT =
      'vaccine_end_day_complete_NOT_IT';
  static const String vaccineStartDayBoosterNotIT =
      'vaccine_start_day_booster_NOT_IT';
  static const String vaccineEndDayBoosterNotIT =
      'vaccine_end_day_booster_NOT_IT';
  static const String vaccineEndDayCompleteExtendedEMA =
      'vaccine_end_day_complete_extended_EMA';
  static const String vaccineEndDayCompleteUnder18 =
      "vaccine_end_day_complete_under_18";
  static const String vaccineCompleteUnder18Offset =
      "vaccine_complete_under_18_offset";
  static const String molecularTestStartHours = 'molecular_test_start_hours';
  static const String molecularTestEndHours = 'molecular_test_end_hours';
  static const String rapidTestStartHours = 'rapid_test_start_hours';
  static const String rapidTestEndHours = 'rapid_test_end_hours';
  static const String recoveryCertStartDay = 'recovery_cert_start_day';
  static const String recoveryCertEndDay = 'recovery_cert_end_day';
  static const String recoveryCertPvStartDay = 'recovery_pv_cert_start_day';
  static const String recoveryCertPvEndDay = 'recovery_pv_cert_end_day';
  static const String recoveryCertEndDaySchool = 'recovery_cert_end_day_school';
  static const String recoveryCertStartDayIT = 'recovery_cert_start_day_IT';
  static const String recoveryCertEndDayIT = 'recovery_cert_end_day_IT';
  static const String recoveryCertStartDayNotIT =
      'recovery_cert_start_day_NOT_IT';
  static const String recoveryCertEndDayNotIT = 'recovery_cert_end_day_NOT_IT';
  static const String emaVaccines = 'EMA_vaccines';
}

class RuleValue {
  static const vaccineUnderageAge = 18;
  static const defaultDaysSchool = 120;
  static const defaultDaysStart = 0;
  static const defaultDaysStartJJ = 15;
  static const defaultEndDaysIT = 180;
  static const defaultEndDaysNotIT = 270;
  static const boosterMinimumDosesNumber = 3;
  static const jjBoosterMinimumDosesNumber = 2;
}

class RuleType {
  static const String generic = "GENERIC";
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
  static const String moderna = 'EU/1/20/1507';
  static const String pfizer = 'EU/1/20/1528';
  static const String astrazeneca = 'EU/1/21/1529';
  static const String covishield = 'Covishield';
  static const String rCovi = 'R-COVI';
  static const String covid19Recombinant = 'Covid-19-recombinant';
  static const List<String> emaList = [
    johnson,
    moderna,
    pfizer,
    astrazeneca,
    covishield,
    rCovi,
    covid19Recombinant,
  ];
}

class Country {
  static const String italy = 'IT';
  static const String sanMarino = 'SM';
}

class OID {
  static const String recovery = '1.3.6.1.4.1.1847.2021.1.3';
  static const String altRecovery = '1.3.6.1.4.1.0.1847.2021.1.3';
}
