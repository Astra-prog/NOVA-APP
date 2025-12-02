import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_summary.freezed.dart';
part 'region_summary.g.dart';

@freezed
class RegionSummary with _$RegionSummary {
  const factory RegionSummary({
    required String regionType, // district, state, basin
    required String regionName,
    required int stationCount,
    required int stationsOnline,
    required double percentageCritical,
    required double percentageWarning,
    required double percentageNormal,
    required String overallTrend, // increasing, decreasing, stable
    required String narrativeSummary,
  }) = _RegionSummary;

  factory RegionSummary.fromJson(Map<String, dynamic> json) =>
      _$RegionSummaryFromJson(json);
}
