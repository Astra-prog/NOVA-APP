import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/region_summary.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
class RegionModel with _$RegionModel {
  const RegionModel._();

  const factory RegionModel({
    required String regionType,
    required String regionName,
    required int stationCount,
    required int stationsOnline,
    required double percentageCritical,
    required double percentageWarning,
    required double percentageNormal,
    required String overallTrend,
    required String narrativeSummary,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  RegionSummary toEntity() {
    return RegionSummary(
      regionType: regionType,
      regionName: regionName,
      stationCount: stationCount,
      stationsOnline: stationsOnline,
      percentageCritical: percentageCritical,
      percentageWarning: percentageWarning,
      percentageNormal: percentageNormal,
      overallTrend: overallTrend,
      narrativeSummary: narrativeSummary,
    );
  }
}
