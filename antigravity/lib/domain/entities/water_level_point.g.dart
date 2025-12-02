// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_level_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterLevelPointImpl _$$WaterLevelPointImplFromJson(
        Map<String, dynamic> json) =>
    _$WaterLevelPointImpl(
      stationId: json['stationId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      waterLevel: (json['waterLevel'] as num).toDouble(),
      qualityFlag: json['qualityFlag'] as String?,
    );

Map<String, dynamic> _$$WaterLevelPointImplToJson(
        _$WaterLevelPointImpl instance) =>
    <String, dynamic>{
      'stationId': instance.stationId,
      'timestamp': instance.timestamp.toIso8601String(),
      'waterLevel': instance.waterLevel,
      'qualityFlag': instance.qualityFlag,
    };
