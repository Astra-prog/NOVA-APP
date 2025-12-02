// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      regionType: json['regionType'] as String,
      regionName: json['regionName'] as String,
      stationCount: (json['stationCount'] as num).toInt(),
      stationsOnline: (json['stationsOnline'] as num).toInt(),
      percentageCritical: (json['percentageCritical'] as num).toDouble(),
      percentageWarning: (json['percentageWarning'] as num).toDouble(),
      percentageNormal: (json['percentageNormal'] as num).toDouble(),
      overallTrend: json['overallTrend'] as String,
      narrativeSummary: json['narrativeSummary'] as String,
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'regionType': instance.regionType,
      'regionName': instance.regionName,
      'stationCount': instance.stationCount,
      'stationsOnline': instance.stationsOnline,
      'percentageCritical': instance.percentageCritical,
      'percentageWarning': instance.percentageWarning,
      'percentageNormal': instance.percentageNormal,
      'overallTrend': instance.overallTrend,
      'narrativeSummary': instance.narrativeSummary,
    };
