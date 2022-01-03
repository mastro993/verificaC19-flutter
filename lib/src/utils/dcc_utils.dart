import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:cbor/cbor.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_base45/dart_base45.dart';
import 'package:ninja/ninja.dart' as ninja;
import 'package:ninja/padder/mgf/mgf.dart';
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
    final Cbor cbor = Cbor();
    Uint8List base45Data;

    try {
      base45Data = Base45.decode(rawData.substring(_prefix.length));
    } catch (e) {
      throw DecodeException('Invalid base45 string');
    }

    final List<int> coseRaw = const ZLibDecoder().decodeBytes(base45Data);

    cbor.decodeFromList(coseRaw);
    final List? messageObject = cbor.getDecodedData();
    cbor.clearDecodeStack();

    if (messageObject == null || messageObject.isEmpty) {
      throw DecodeException('Cbor decoding error');
    }

    final element = messageObject.first;

    if (element is! List) {
      throw DecodeException('Unsupported format');
    }

    List items = element;

    // check if it has exactly 4 items
    if (items.length != _cborDataLength) {
      throw DecodeException('Invalid format');
    }

    final protectedHeader = items[_cborDataProtectedHeaderIndex];
    final unprotectedHeader = items[_cborDataUnprotectedHeaderIndex];
    final payloadBytes = items[_cborDataPayloadBytesIndex];
    final signers = items[_cborDataSignerIndex];

    cbor.decodeFromBuffer(protectedHeader);
    var headerList = cbor.getDecodedData();
    cbor.clearDecodeStack();

    var header = <dynamic, dynamic>{};

    if (headerList != null) {
      if (headerList.isEmpty) {
        throw DecodeException('Cbor decoding error');
      }
      header = headerList.first;
    }

    final kid = HeaderUtils.parseKid(header, unprotectedHeader);
    final algo = HeaderUtils.parseAlg(header, unprotectedHeader);

    cbor.decodeFromBuffer(payloadBytes);
    var payload = cbor.getDecodedData();
    cbor.clearDecodeStack();

    if (payload == null || payload.isEmpty) {
      throw DecodeException('Cbor decoding error');
    }

    var payloadData = payload.first[-260][1];

    return DCC(
      raw: rawData,
      coseRaw: coseRaw,
      payload: payloadData,
      payloadBytes: Uint8List.view(payloadBytes.buffer, 0, payloadBytes.length),
      protectedHeader:
          Uint8List.view(protectedHeader.buffer, 0, protectedHeader.length),
      signers: Uint8List.view(signers.buffer, 0, signers.length),
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

    final sigStructure = Cbor();
    final sigStructureEncoder = sigStructure.encoder;

    sigStructureEncoder.writeArray([
      'Signature1',
      dcc.protectedHeader,
      Uint8List(0),
      dcc.payloadBytes,
    ]);

    sigStructure.decodeFromInput();
    final sigStructureBytes = sigStructure.output.getData();

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
          sigStructureBytes.buffer.asUint8List(),
        );
      } else {
        throw CertificateException("Unsupported algorithm");
      }
    } else {
      throw CertificateException("Unsupported algorithm");
    }

    if (!verified && verifier != null) {
      verified = verifier.verify(
        sigStructureBytes.buffer.asUint8List(),
        Signature(dcc.signers),
      );
    }

    return verified;
  }
}
