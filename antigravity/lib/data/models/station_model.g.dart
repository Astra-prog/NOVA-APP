// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationModelImpl _$$StationModelImplFromJson(Map<String, dynamic> json) =>
    _$StationModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      state: json['state'] as String,
      district: json['district'] as String,
      basin: json['basin'] as String?,
      status: json['status'] as String,
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
      latestWaterLevel: (json['latestWaterLevel'] as num).toDouble(),
    );

Map<String, dynamic> _$$StationModelImplToJson(_$StationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'state': instance.state,
      'district': instance.district,
      'basin': instance.basin,
      'status': instance.status,
      'lastUpdatedAt': instance.lastUpdatedAt.toIso8601String(),
      'latestWaterLevel': instance.latestWaterLevel,
    };
