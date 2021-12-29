import 'dart:typed_data';

class DCC {
  final String raw;
  final List<int> coseRaw;
  final Uint8List protectedHeader;
  final Map unprotectedHeader;
  final Map payload;
  final Uint8List payloadBytes;
  final Uint8List signers;
  final String kid;
  final int algorithm;

  const DCC({
    required this.raw,
    required this.coseRaw,
    required this.protectedHeader,
    required this.unprotectedHeader,
    required this.signers,
    required this.payload,
    required this.payloadBytes,
    required this.kid,
    required this.algorithm,
  });
}
