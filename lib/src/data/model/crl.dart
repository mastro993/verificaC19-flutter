import 'package:json_annotation/json_annotation.dart';
import 'package:verificac19/src/data/model/crl_delta.dart';

part 'crl.g.dart';

@JsonSerializable()
class CRL {
  int? fromVersion;
  int? version;
  int? chunk;
  int? lastChunk;
  CRLDelta? delta;
  List<String>? revokedUcvi;
  int? sizeSingleChunkInByte;
  int? totalNumberUCVI;

  CRL({
    required this.fromVersion,
    required this.version,
    required this.chunk,
    required this.lastChunk,
    required this.delta,
    required this.revokedUcvi,
    required this.sizeSingleChunkInByte,
    required this.totalNumberUCVI,
  });

  factory CRL.fromJson(Map<String, dynamic> json) => _$CRLFromJson(json);

  Map<String, dynamic> toJson() => _$CRLToJson(this);
}
