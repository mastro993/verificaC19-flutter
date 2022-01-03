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
    this.fromVersion,
    this.version,
    this.chunk,
    this.lastChunk,
    this.delta,
    this.revokedUcvi,
    this.sizeSingleChunkInByte,
    this.totalNumberUCVI,
  });

  factory CRL.fromJson(Map<String, dynamic> json) => _$CRLFromJson(json);

  Map<String, dynamic> toJson() => _$CRLToJson(this);
}
