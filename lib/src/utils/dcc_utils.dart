import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:cbor/cbor.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_base45/dart_base45.dart';
import 'package:ninja/ninja.dart' as ninja;
import 'package:ninja/padder/mgf/mgf.dart';
import 'package:verificac19/src/model/certificate_info.dart';
import 'package:verificac19/src/utils/certificate_utils.dart';
import 'package:verificac19/src/utils/header_utils.dart';
import 'package:verificac19/verificac19.dart';
import 'package:x509b/x509.dart';

class DccUtils {
  DccUtils._();

  static const String _prefix = "HC1:";

  static const _cborDataLength = 4;
  static const _cborDataProtectedHeaderIndex = 0;
  static const _cborDataUnprotectedHeaderIndex = 1;
  static const _cborDataPayloadBytesIndex = 2;
  static const _cborDataSignerIndex = 3;

  static Future<DCC> getDCCFromRawData(String rawData) async {
    Uint8List base45Data;

    try {
      base45Data = Base45.decode(rawData.substring(_prefix.length));
    } catch (e) {
      throw DecodeException('Invalid base45 string');
    }

    final List<int> coseRaw = const ZLibDecoder().decodeBytes(base45Data);
    final CborList? cborData = cborDecode(coseRaw) as CborList?;

    if (cborData == null || cborData.isEmpty) {
      throw DecodeException('Cbor decoding error');
    }

    // check if it has exactly 4 items
    if (cborData.length != _cborDataLength) {
      throw DecodeException('Invalid format');
    }

    final protectedHeader =
        cborData[_cborDataProtectedHeaderIndex] as CborBytes;
    final unprotectedHeader =
        cborData[_cborDataUnprotectedHeaderIndex] as CborMap;
    final payloadBytes = cborData[_cborDataPayloadBytesIndex] as CborBytes;
    final signers = cborData[_cborDataSignerIndex] as CborBytes;

    final header = cborDecode(protectedHeader.bytes) as CborMap?;
    if (header == null || header.isEmpty) {
      throw DecodeException('Cbor decoding error');
    }

    final kid = HeaderUtils.parseKid(
      header.toObject() as Map<dynamic, dynamic>,
      unprotectedHeader.toObject() as Map<dynamic, dynamic>,
    );
    final algo = HeaderUtils.parseAlg(
      header.toObject() as Map<dynamic, dynamic>,
      unprotectedHeader.toObject() as Map<dynamic, dynamic>,
    );

    var payload = cborDecode(payloadBytes.bytes) as CborMap?;

    if (payload == null || payload.isEmpty) {
      throw DecodeException('Cbor decoding error');
    }

    var payloadData = (payload.toObject() as Map<dynamic, dynamic>)[-260][1];

    return DCC(
      raw: rawData,
      coseRaw: coseRaw,
      payload: payloadData,
      payloadBytes: Uint8List.fromList(payloadBytes.bytes),
      protectedHeader: Uint8List.fromList(protectedHeader.bytes),
      signers: Uint8List.fromList(signers.bytes),
      unprotectedHeader: unprotectedHeader,
      kid: kid,
      algorithm: algo,
    );
  }

  static Future<bool> checkSignatureWithCertificate(
    String signature,
    DCC dcc,
  ) async {
    PublicKey publicKey;
    X509Certificate? x509cert;

    try {
      x509cert = CertificateUtils.getX509Certificate(signature);
      final certKid = CertificateUtils.extractKid(signature);
      if (certKid != dcc.kid) {
        return false;
      }
      publicKey = x509cert.publicKey;
    } on Error {
      SubjectPublicKeyInfo publicKeyInfo = SubjectPublicKeyInfo.fromAsn1(
        ASN1Sequence.fromBytes(base64Decode(signature)),
      );
      x509cert = null;
      publicKey = publicKeyInfo.subjectPublicKey;
    }

    final sigStructureBytes = cborEncode(CborValue([
      'Signature1',
      dcc.protectedHeader,
      Uint8List(0),
      dcc.payloadBytes,
    ]));

    Verifier? verifier;

    bool verified = false;
    if (publicKey is EcPublicKey) {
      if (-7 == dcc.algorithm) {
        verifier = publicKey.createVerifier(algorithms.signing.ecdsa.sha256);
      } else if (-35 == dcc.algorithm) {
        verifier = publicKey.createVerifier(algorithms.signing.ecdsa.sha384);
      } else if (-36 == dcc.algorithm) {
        verifier = publicKey.createVerifier(algorithms.signing.ecdsa.sha512);
      } else {
        throw CertificateException("Unsupported algorithm");
      }
    } else if (publicKey is RsaPublicKey) {
      if (-7 == dcc.algorithm) {
        verifier = publicKey.createVerifier(algorithms.signing.rsa.sha256);
      } else if (-35 == dcc.algorithm) {
        verifier = publicKey.createVerifier(algorithms.signing.rsa.sha384);
      } else if (-36 == dcc.algorithm) {
        verifier = publicKey.createVerifier(algorithms.signing.rsa.sha512);
      } else if (-37 == dcc.algorithm) {
        ninja.RsaSsaPssVerifier ninv = ninja.RsaSsaPssVerifier(
            hasher: sha256, mgf: Mgf1(hasher: sha256), saltLength: 32);

        var npk = ninja.RSAPublicKey(publicKey.modulus, publicKey.exponent);
        verified = ninv.verify(
          npk,
          dcc.signers,
          sigStructureBytes,
        );
      } else {
        throw CertificateException("Unsupported algorithm");
      }
    } else {
      throw CertificateException("Unsupported algorithm");
    }

    if (!verified && verifier != null) {
      verified = verifier.verify(
        Uint8List.fromList(sigStructureBytes),
        Signature(dcc.signers),
      );
    }

    return verified;
  }

  static CertificateInfo getCertificateInfo(String certificate) {
    String country = '';
    bool extendedKeyUsage = false;

    try {
      final cert = CertificateUtils.getX509Certificate(certificate);
      final TbsCertificate tbsCertificate = cert.tbsCertificate;
      final Name issuer = tbsCertificate.issuer!;
      final List<Extension> extensions = tbsCertificate.extensions!;

      country = issuer.names
          .firstWhere((name) => name.entries.first.key?.name == 'countryName')
          .entries
          .first
          .value;

      extendedKeyUsage = extensions.any((e) => e.extnId.name == 'extKeyUsage');
    } catch (e) {
      // Error during certificate parsing
    }

    return CertificateInfo(
      country: country,
      extendedKeyUsage: extendedKeyUsage,
    );
  }
}
