import 'package:json_annotation/json_annotation.dart';

part 'crl_status.g.dart';

@JsonSerializable()
class CRLStatus {
  int? version;
  int? chunk;
  int? numDidAdd;
  int? totalSizeInByte;
  int? sizeSingleChunkByte;
  int? totalChunk;
  int? totalNumberUCVI;

  CRLStatus({
    this.version,
    this.chunk,
    this.numDidAdd,
    this.totalSizeInByte,
    this.sizeSingleChunkByte,
    this.totalChunk,
    this.totalNumberUCVI,
  });

  factory CRLStatus.fromJson(Map<String, dynamic> json) =>
      _$CRLStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CRLStatusToJson(this);
}
