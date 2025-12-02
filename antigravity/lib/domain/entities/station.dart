import 'package:freezed_annotation/freezed_annotation.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
class Station with _$Station {
  const factory Station({
    required String id,
    required String name,
    required String code,
    required double latitude,
    required double longitude,
    required String state,
    required String district,
    String? basin,
    required String status, // critical, warning, normal, above_normal
    required DateTime lastUpdatedAt,
    required double latestWaterLevel,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}
