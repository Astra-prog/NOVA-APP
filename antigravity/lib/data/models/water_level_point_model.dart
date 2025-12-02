import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/water_level_point.dart';

part 'water_level_point_model.freezed.dart';
part 'water_level_point_model.g.dart';

@freezed
class WaterLevelPointModel with _$WaterLevelPointModel {
  const WaterLevelPointModel._();

  const factory WaterLevelPointModel({
    required String stationId,
    required DateTime timestamp,
    required double waterLevel,
    String? qualityFlag,
  }) = _WaterLevelPointModel;

  factory WaterLevelPointModel.fromJson(Map<String, dynamic> json) =>
      _$WaterLevelPointModelFromJson(json);

  WaterLevelPoint toEntity() {
    return WaterLevelPoint(
      stationId: stationId,
      timestamp: timestamp,
      waterLevel: waterLevel,
      qualityFlag: qualityFlag,
    );
  }
}
