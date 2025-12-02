import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/station.dart';

part 'station_model.freezed.dart';
part 'station_model.g.dart';

@freezed
class StationModel with _$StationModel {
  const StationModel._();

  const factory StationModel({
    required String id,
    required String name,
    required String code,
    required double latitude,
    required double longitude,
    required String state,
    required String district,
    String? basin,
    required String status,
    required DateTime lastUpdatedAt,
    required double latestWaterLevel,
  }) = _StationModel;

  factory StationModel.fromJson(Map<String, dynamic> json) =>
      _$StationModelFromJson(json);

  Station toEntity() {
    return Station(
      id: id,
      name: name,
      code: code,
      latitude: latitude,
      longitude: longitude,
      state: state,
      district: district,
      basin: basin,
      status: status,
      lastUpdatedAt: lastUpdatedAt,
      latestWaterLevel: latestWaterLevel,
    );
  }
}
