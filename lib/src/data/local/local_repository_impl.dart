import 'package:clock/clock.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/verificac19.dart';

class LocalRepositoryImpl implements LocalRepository {
  final int updateWindowHours = 24;

  final HiveInterface _hive;

  LocalRepositoryImpl({HiveInterface? hive}) : _hive = hive ?? Hive;

  bool _needsUpdate(String key) {
    try {
      final box = _hive.box(C.dbKeys.dbData);
      final DateTime? lastUpdate = box.get(key);
      if (lastUpdate == null) {
        return true;
      }
      final DateTime expiryDate = lastUpdate.add(
        Duration(hours: updateWindowHours),
      );
      return clock.now().isAfter(expiryDate);
    } catch (e) {
      throw CacheException('Unable to get $key from cache');
    }
  }

  @override
  List<ValidationRule> getRules() {
    try {
      final Box box = _hive.box(C.dbKeys.dbData);
      return box.get(C.dbKeys.keyRules, defaultValue: []);
    } catch (e) {
      throw CacheException('Unable to get rules from cache');
    }
  }

  @override
  List<String> getSignaturesList() {
    try {
      final Box box = _hive.box(C.dbKeys.dbData);
      return box.get(C.dbKeys.keySignaturesList, defaultValue: []);
    } catch (e) {
      throw CacheException('Unable to get signatures list from cache');
    }
  }

  @override
  Map<String, String> getSignatures() {
    try {
      final Box box = _hive.box(C.dbKeys.dbData);
      return box.get(C.dbKeys.keySignatures, defaultValue: {});
    } catch (e) {
      throw CacheException('Unable to get signatures from cache');
    }
  }

  @override
  List<String> getRevokeList() {
    try {
      final Box<String> box = _hive.box(C.dbKeys.dbRevokeList);
      return box.values.toList();
    } catch (e) {
      throw CacheException('Unable to get revoke list from cache');
    }
  }

  @override
  bool rulesMustBeUpdated() => _needsUpdate(C.dbKeys.keyRulesLastUpdate);

  @override
  bool signatureListMustBeUpdated() =>
      _needsUpdate(C.dbKeys.keySignaturesListLastUpdate);

  @override
  bool signaturesMustBeUpdated() =>
      _needsUpdate(C.dbKeys.keySignaturesLastUpdate);

  @override
  bool revokeListMustBeUpdated() =>
      _needsUpdate(C.dbKeys.keyRevokeListLastUpdate);

  @override
  Future<void> storeRules(List<ValidationRule> rules) async {
    try {
      final Box box = _hive.box(C.dbKeys.dbData);
      await box.put(C.dbKeys.keyRules, rules);
      await box.put(C.dbKeys.keyRulesLastUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store rules to cache');
    }
  }

  @override
  Future<void> storeSignaturesList(List<String> signaturesList) async {
    try {
      final Box box = _hive.box(C.dbKeys.dbData);
      await box.put(C.dbKeys.keySignaturesList, signaturesList);
      await box.put(C.dbKeys.keySignaturesListLastUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store signatures list to cache');
    }
  }

  @override
  Future<void> storeSignatures(Map<String, String> signatures) async {
    try {
      final Box box = _hive.box(C.dbKeys.dbData);
      await box.put(C.dbKeys.keySignatures, signatures);
      await box.put(C.dbKeys.keySignaturesLastUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store signatures to cache');
    }
  }

  @override
  Future<void> storeRevokeList(List<String> revokeList) async {
    try {
      final Box<String> revokeListBox = _hive.box(C.dbKeys.dbRevokeList);
      final Box dataBox = _hive.box(C.dbKeys.dbData);
      await revokeListBox.clear();
      await revokeListBox.addAll(revokeList);
      await dataBox.put(C.dbKeys.keyRevokeListLastUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store revoke list to cache');
    }
  }

  @override
  bool isUvciRevoked(String uvci) {
    try {
      final Box<String> box = _hive.box(C.dbKeys.dbRevokeList);
      return box.values.contains(uvci);
    } catch (e) {
      throw CacheException('Unable to check uvci from cached revoke list');
    }
  }
}
