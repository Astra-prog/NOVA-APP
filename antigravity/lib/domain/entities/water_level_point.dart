import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_level_point.freezed.dart';
part 'water_level_point.g.dart';

@freezed
class WaterLevelPoint with _$WaterLevelPoint {
  const factory WaterLevelPoint({
    required String stationId,
    required DateTime timestamp,
    required double waterLevel,
    String? qualityFlag,
  }) = _WaterLevelPoint;

  factory WaterLevelPoint.fromJson(Map<String, dynamic> json) =>
      _$WaterLevelPointFromJson(json);
}
