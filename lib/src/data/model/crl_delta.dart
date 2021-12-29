import 'package:json_annotation/json_annotation.dart';

part 'crl_delta.g.dart';

@JsonSerializable()
class CRLDelta {
  List<String>? insertions;
  List<String>? deletions;

  CRLDelta({
    required this.insertions,
    required this.deletions,
  });

  factory CRLDelta.fromJson(Map<String, dynamic> json) =>
      _$CRLDeltaFromJson(json);

  Map<String, dynamic> toJson() => _$CRLDeltaToJson(this);
}
