import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dcc.freezed.dart';

@freezed
class DCC with _$DCC {
  const DCC._();

  const factory DCC({
    /// Raw unprocessed data
    required String raw,

    /// COSE data
    required List<int> coseRaw,

    /// Protected header
    required Uint8List protectedHeader,

    /// Unprotected header
    required Map unprotectedHeader,

    /// Certificate data payload
    required Map payload,

    /// Encoded certificate data payload
    required Uint8List payloadBytes,

    /// Certificate signers
    required Uint8List signers,

    /// Certificate kid
    required String kid,

    /// Certificate algorithm
    required int algorithm,
  }) = _DCC;
}
