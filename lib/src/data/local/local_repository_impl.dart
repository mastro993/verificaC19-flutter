import 'dart:convert';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verificac19/src/core/constants.dart';
import 'package:verificac19/src/data/local/local_repository.dart';
import 'package:verificac19/src/data/model/revoked_cert.dart';
import 'package:verificac19/src/data/model/validation_rule.dart';
import 'package:verificac19/verificac19.dart';

@Environment(Environment.prod)
@preResolve
@Singleton(as: LocalRepository)
class LocalRepositoryImpl implements LocalRepository {
  final String _basePath;
  final SharedPreferences _preferences;
  final Isar _isar;

  LocalRepositoryImpl(this._basePath, this._preferences, this._isar);

  @factoryMethod
  static Future<LocalRepository> create() async {
    final baseDir = await getApplicationSupportDirectory();
    final basePath = path.join(baseDir.path, 'verificaC19');
    final preferences = await SharedPreferences.getInstance();

    final isar = await Isar.open(
      schemas: [RevokedCertSchema],
      directory: basePath,
    );

    return LocalRepositoryImpl(basePath, preferences, isar);
  }

  File get _rulesFile => File(path.join(_basePath, "rules.json"));
  File get _signatureListFile =>
      File(path.join(_basePath, "signatureList.json"));
  File get _signaturesFile => File(path.join(_basePath, "signatures.json"));

  @override
  Future<DateTime?> getLastUpdateTime() async {
    if (!_rulesFile.existsSync() ||
        !_signatureListFile.existsSync() ||
        !_signaturesFile.existsSync()) {
      return null;
    }

    final List<DateTime> latestUpdates = [
      _rulesFile.lastModifiedSync(),
      _signatureListFile.lastModifiedSync(),
      _signaturesFile.lastModifiedSync(),
    ];

    return latestUpdates.reduce(
      (value, element) => value.compareTo(element) > 0 ? value : element,
    );
  }

  bool _isExpired(DateTime? lastUpdate) {
    try {
      if (lastUpdate == null) {
        return true;
      }
      final DateTime expiryDate = lastUpdate.add(
        const Duration(hours: UpdateWindowHours.max),
      );
      return clock.now().isAfter(expiryDate);
    } catch (e) {
      throw CacheException('Unable to check expiration date');
    }
  }

  bool _isFileExpired(File file) {
    try {
      if (!file.existsSync()) {
        return true;
      }
      final DateTime? lastUpdate = file.lastModifiedSync();
      return _isExpired(lastUpdate);
    } catch (e) {
      throw CacheException('Unable to get ${file.path} from cache');
    }
  }

  @override
  List<ValidationRule> getRules() {
    try {
      if (!_rulesFile.existsSync()) {
        return [];
      }
      final rawData = _rulesFile.readAsStringSync();
      final jsonData = jsonDecode(rawData) as List<dynamic>;
      return jsonData.map((e) => ValidationRule.fromJson(e)).toList();
    } catch (e) {
      throw CacheException('Unable to get rules from cache');
    }
  }

  @override
  List<String> getSignaturesList() {
    try {
      if (!_signatureListFile.existsSync()) {
        return [];
      }
      final rawData = _signatureListFile.readAsStringSync();
      final jsonData = jsonDecode(rawData) as List<dynamic>;
      return jsonData.map((e) => e as String).toList();
    } catch (e) {
      throw CacheException('Unable to get signatures list from cache');
    }
  }

  @override
  Map<String, String> getSignatures() {
    try {
      if (!_signaturesFile.existsSync()) {
        return {};
      }
      final rawData = _signaturesFile.readAsStringSync();
      final jsonData = jsonDecode(rawData) as Map<dynamic, dynamic>;
      return jsonData.map(
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
      return _isar.revokedCerts
          .where()
          .findAllSync()
          .map((e) => e.cert)
          .toList();
    } catch (e) {
      throw CacheException('Unable to get revoke list from cache');
    }
  }

  @override
  bool needRulesUpdate() => _isFileExpired(_rulesFile);

  @override
  bool needSignaturesListUpdate() => _isFileExpired(_signatureListFile);

  @override
  bool needSignaturesUpdate() => _isFileExpired(_signaturesFile);

  @override
  bool needCRLUpdate() {
    final String? value = _preferences.getString('verificac19_crl_last_update');
    final DateTime? lastUpdate = DateTime.tryParse(value ?? '');
    return _isExpired(lastUpdate);
  }

  @override
  Future<void> storeRules(
    List<ValidationRule> rules,
  ) async {
    try {
      final jsonData = rules.map((e) => e.toJson()).toList();
      final rawData = jsonEncode(jsonData);

      if (!_rulesFile.existsSync()) {
        _rulesFile.createSync();
      }

      await _rulesFile.writeAsString(rawData);
    } catch (e) {
      throw CacheException('Unable to store rules to cache');
    }
  }

  @override
  Future<void> storeSignaturesList(
    List<String> signaturesList,
  ) async {
    try {
      final rawData = jsonEncode(signaturesList);
      await _signatureListFile.writeAsString(rawData);
    } catch (e) {
      throw CacheException('Unable to store signatures list to cache');
    }
  }

  @override
  Future<void> storeSignatures(
    Map<String, String> signatures,
  ) async {
    try {
      final rawData = jsonEncode(signatures);
      await _signaturesFile.writeAsString(rawData);
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
      await _isar.writeTxn((isar) async {
        if (insertions != null && insertions.isNotEmpty) {
          await isar.revokedCerts.putAll(
            insertions.map((c) => RevokedCert()..cert = c).toList(),
          );
        }

        if (deletions != null && deletions.isNotEmpty) {
          // ignore: invalid_use_of_protected_member
          await isar.revokedCerts.deleteByIndex('cert', deletions);
        }
      });
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
      final Digest uvciDigest = sha256.convert(utf8.encode(uvci));
      final String hashedUvci = base64Encode(uvciDigest.bytes);
      return _isar.revokedCerts
              .where()
              .certEqualTo(hashedUvci)
              .findFirstSync() !=
          null;
    } catch (e) {
      throw CacheException('Unable to check uvci from cached revoke list');
    }
  }

  @override
  int getCRLVersion() {
    try {
      final version = _preferences.getInt('verificac19_crl_version');
      return version ?? 0;
    } catch (e) {
      throw CacheException('Unable to get revoke list version from cache');
    }
  }

  @override
  Future<void> storeCRLVersion(
    int version,
  ) async {
    try {
      final lastUpdate = clock.now().toIso8601String();
      await _preferences.setInt('verificac19_crl_version', version);
      await _preferences.setString('verificac19_crl_last_update', lastUpdate);
    } catch (e) {
      throw CacheException('Unable to store revoke list version to cache');
    }
  }
}
