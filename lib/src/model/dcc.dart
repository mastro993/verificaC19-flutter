import 'dart:typed_data';

class DCC {
  /// Raw unprocessed data
  final String raw;

  /// COSE data
  final List<int> coseRaw;

  /// Protected header
  final Uint8List protectedHeader;

  /// Unprotected header
  final Map unprotectedHeader;

  /// Certificate data payload
  final Map payload;

  /// Encoded certificate data payload
  final Uint8List payloadBytes;

  /// Certificate signers
  final Uint8List signers;

  /// Certificate kid
  final String kid;

  /// Certificate algorithm
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
