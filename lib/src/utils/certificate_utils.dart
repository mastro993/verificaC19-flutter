import 'dart:convert';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:crypto/crypto.dart';
import 'package:x509b/x509.dart';

class CertificateUtils {
  const CertificateUtils._();

  static const _beginCert = '-----BEGIN CERTIFICATE-----';
  static const _endCert = '-----END CERTIFICATE-----';

  static Uint8List _decodePem(String pem) {
    var cert = pem.trim();

    if (cert.startsWith(_beginCert) && cert.endsWith(_endCert)) {
      cert = cert.replaceFirst(_beginCert, "");
      cert = cert.replaceFirst(_endCert, "");
      cert = cert.replaceAll("\r\n", "");
      cert = cert.replaceAll("\n", "");
      cert = cert.replaceAll(" ", "");
    }

    final der = base64Decode(cert);
    return der;
  }

  static X509Certificate getX509Certificate(String pem) {
    final der = _decodePem(pem);
    return X509Certificate.fromAsn1(ASN1Sequence.fromBytes(der));
  }

  static String extractKid(String pem) {
    //The kid is defined as the first 8 bytes of the SHA256 hash of the certificate.
    final der = _decodePem(pem);
    return base64Encode(sha256.convert(der).bytes.sublist(0, 8));
  }
}
