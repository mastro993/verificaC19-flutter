import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:crypto/crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/verificac19.dart';

@Environment(Environment.prod)
@preResolve
@Singleton(as: LocalRepository)
class LocalRepositoryImpl implements LocalRepository {
  final HiveInterface _hive;

  LocalRepositoryImpl({HiveInterface? hive}) : _hive = hive ?? Hive;

  @factoryMethod
  static Future<LocalRepository> create() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ValidationRuleAdapter());

    await Hive.openBox<dynamic>(DbKeys.dbData);
    await Hive.openBox<String>(DbKeys.dbCRL);
    await Hive.openBox<DateTime>(DbKeys.dbUpdates);

    return LocalRepositoryImpl();
  }

  @override
  Future<DateTime?> getLastUpdateTime() async {
    final Box<DateTime> box = _hive.box(DbKeys.dbUpdates);
    if (box.isEmpty) {
      return null;
    }
    return box.values.reduce(
      (value, element) => value.compareTo(element) > 0 ? value : element,
    );
  }

  bool _isExpired(String key) {
    try {
      final Box<DateTime> box = _hive.box(DbKeys.dbUpdates);
      final DateTime? lastUpdate = box.get(key);
      if (lastUpdate == null) {
        return true;
      }
      final DateTime expiryDate = lastUpdate.add(
        const Duration(hours: UpdateWindowHours.max),
      );
      return clock.now().isAfter(expiryDate);
    } catch (e) {
      throw CacheException('Unable to get $key from cache');
    }
  }

  @override
  List<ValidationRule> getRules() {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final List<dynamic> data = box.get(
        DbKeys.keyRules,
        defaultValue: [],
      );
      return data.map((e) => e as ValidationRule).toList();
    } catch (e) {
      throw CacheException('Unable to get rules from cache');
    }
  }

  @override
  List<String> getSignaturesList() {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final List<dynamic> data = box.get(
        DbKeys.keySignaturesList,
        defaultValue: [],
      );
      return data.map((e) => e as String).toList();
    } catch (e) {
      throw CacheException('Unable to get signatures list from cache');
    }
  }

  @override
  Map<String, String> getSignatures() {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final Map<dynamic, dynamic> data = box.get(
        DbKeys.keySignatures,
        defaultValue: {},
      );
      return data.map(
        (key, value) =>
            MapEntry<String, String>(key as String, value as String),
      );
    } catch (e) {
      throw CacheException('Unable to get signatures from cache');
    }
  }

  @override
  List<String> getCRL() {
    try {
      final Box<String> box = _hive.box(DbKeys.dbCRL);
      return box.values.toList();
    } catch (e) {
      throw CacheException('Unable to get revoke list from cache');
    }
  }

  @override
  bool needRulesUpdate() => _isExpired(DbKeys.keyRulesUpdate);

  @override
  bool needSignaturesListUpdate() => _isExpired(DbKeys.keySignaturesListUpdate);

  @override
  bool needSignaturesUpdate() => _isExpired(DbKeys.keySignaturesUpdate);

  @override
  bool needCRLUpdate() => _isExpired(DbKeys.keyCRLUpdate);

  @override
  Future<void> storeRules(
    List<ValidationRule> rules,
  ) async {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final Box<DateTime> updatesBox = _hive.box(DbKeys.dbUpdates);
      await box.put(DbKeys.keyRules, rules);
      await updatesBox.put(DbKeys.keyRulesUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store rules to cache');
    }
  }

  @override
  Future<void> storeSignaturesList(
    List<String> signaturesList,
  ) async {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final Box<DateTime> updatesBox = _hive.box(DbKeys.dbUpdates);
      await box.put(DbKeys.keySignaturesList, signaturesList);
      await updatesBox.put(DbKeys.keySignaturesListUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store signatures list to cache');
    }
  }

  @override
  Future<void> storeSignatures(
    Map<String, String> signatures,
  ) async {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final Box<DateTime> updatesBox = _hive.box(DbKeys.dbUpdates);
      await box.put(DbKeys.keySignatures, signatures);
      await updatesBox.put(DbKeys.keySignaturesUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store signatures to cache');
    }
  }

  @override
  Future<void> storeCRL({
    List<String>? insertions,
    List<String>? deletions,
  }) async {
    try {
      final Box<String> revokeListBox = _hive.box(DbKeys.dbCRL);

      if (insertions != null) {
        await revokeListBox.addAll(insertions);
      }

      if (deletions != null) {
        await revokeListBox.deleteAll(deletions);
      }
    } catch (e) {
      throw CacheException('Unable to store revoke list to cache');
    }
  }

  @override
  bool isUvciRevoked(
    String uvci,
  ) {
    /// https://github.com/ministero-salute/it-dgc-documentation/blob/master/DRL.md#panoramica
    try {
      final Box<String> box = _hive.box(DbKeys.dbCRL);
      final Digest uvciDigest = sha256.convert(utf8.encode(uvci));
      final String hashedUvci = base64Encode(uvciDigest.bytes);
      return box.values.contains(hashedUvci);
    } catch (e) {
      throw CacheException('Unable to check uvci from cached revoke list');
    }
  }

  @override
  int getCRLVersion() {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      return box.get(DbKeys.keyCRLVersion, defaultValue: 0);
    } catch (e) {
      throw CacheException('Unable to get revoke list version from cache');
    }
  }

  @override
  Future<void> storeCRLVersion(
    int version,
  ) async {
    try {
      final Box box = _hive.box(DbKeys.dbData);
      final Box<DateTime> updatesBox = _hive.box(DbKeys.dbUpdates);
      await box.put(DbKeys.keyCRLVersion, version);
      await updatesBox.put(DbKeys.keyCRLUpdate, clock.now());
    } catch (e) {
      throw CacheException('Unable to store revoke list version to cache');
    }
  }
}
