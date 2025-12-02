// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_level_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterLevelPointModelImpl _$$WaterLevelPointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WaterLevelPointModelImpl(
      stationId: json['stationId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      waterLevel: (json['waterLevel'] as num).toDouble(),
      qualityFlag: json['qualityFlag'] as String?,
    );

Map<String, dynamic> _$$WaterLevelPointModelImplToJson(
        _$WaterLevelPointModelImpl instance) =>
    <String, dynamic>{
      'stationId': instance.stationId,
      'timestamp': instance.timestamp.toIso8601String(),
      'waterLevel': instance.waterLevel,
      'qualityFlag': instance.qualityFlag,
    };
