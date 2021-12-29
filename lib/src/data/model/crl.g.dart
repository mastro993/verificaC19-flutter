// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CRL _$CRLFromJson(Map<String, dynamic> json) => CRL(
      fromVersion: json['fromVersion'] as int?,
      version: json['version'] as int?,
      chunk: json['chunk'] as int?,
      lastChunk: json['lastChunk'] as int?,
      delta: json['delta'] == null
          ? null
          : CRLDelta.fromJson(json['delta'] as Map<String, dynamic>),
      revokedUcvi: (json['revokedUcvi'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sizeSingleChunkInByte: json['sizeSingleChunkInByte'] as int?,
      totalNumberUCVI: json['totalNumberUCVI'] as int?,
    );

Map<String, dynamic> _$CRLToJson(CRL instance) => <String, dynamic>{
      'fromVersion': instance.fromVersion,
      'version': instance.version,
      'chunk': instance.chunk,
      'lastChunk': instance.lastChunk,
      'delta': instance.delta,
      'revokedUcvi': instance.revokedUcvi,
      'sizeSingleChunkInByte': instance.sizeSingleChunkInByte,
      'totalNumberUCVI': instance.totalNumberUCVI,
    };
