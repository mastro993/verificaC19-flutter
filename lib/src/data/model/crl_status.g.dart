// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crl_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CRLStatus _$CRLStatusFromJson(Map<String, dynamic> json) => CRLStatus(
      version: json['version'] as int?,
      chunk: json['chunk'] as int?,
      numDidAdd: json['numDidAdd'] as int?,
      totalSizeInByte: json['totalSizeInByte'] as int?,
      sizeSingleChunkByte: json['sizeSingleChunkByte'] as int?,
      totalChunk: json['totalChunk'] as int?,
      totalNumberUCVI: json['totalNumberUCVI'] as int?,
    );

Map<String, dynamic> _$CRLStatusToJson(CRLStatus instance) => <String, dynamic>{
      'version': instance.version,
      'chunk': instance.chunk,
      'numDidAdd': instance.numDidAdd,
      'totalSizeInByte': instance.totalSizeInByte,
      'sizeSingleChunkByte': instance.sizeSingleChunkByte,
      'totalChunk': instance.totalChunk,
      'totalNumberUCVI': instance.totalNumberUCVI,
    };
