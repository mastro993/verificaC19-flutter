import 'dart:convert';
import 'dart:typed_data';

class HeaderUtils {
  const HeaderUtils._();

  static const _algHeader = 1;
  static const _kidHeader = 4;

  static String parseKid(
    Map<dynamic, dynamic> header,
    Map<dynamic, dynamic> unprotectedHeader,
  ) {
    // fall back to unprotected header if protected is not provided.
    final kidBuffer = header[_kidHeader] ?? unprotectedHeader[_kidHeader];
    var kid = Uint8List.view(kidBuffer.buffer, 0, kidBuffer.length);
    // Allow more than 8 bytes for UK. Take the entire value and evaluate.
    //if (kid.length > 8) {
    //  kid = kid.sublist(0, 8);
    //}
    return base64.encode(kid);
  }

  static int parseAlg(
    Map<dynamic, dynamic> header,
    Map<dynamic, dynamic> unprotectedHeader,
  ) {
    return header[_algHeader] ?? unprotectedHeader[_algHeader];
  }
}
