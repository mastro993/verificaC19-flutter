// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crl_delta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CRLDelta _$CRLDeltaFromJson(Map<String, dynamic> json) => CRLDelta(
      insertions: (json['insertions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      deletions: (json['deletions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CRLDeltaToJson(CRLDelta instance) => <String, dynamic>{
      'insertions': instance.insertions,
      'deletions': instance.deletions,
    };
