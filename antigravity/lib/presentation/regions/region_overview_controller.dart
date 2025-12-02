import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/region_summary.dart';
import '../../domain/usecases/get_region_summary.dart';

part 'region_overview_controller.g.dart';

@riverpod
class RegionOverviewController extends _$RegionOverviewController {
  @override
  FutureOr<RegionSummary> build(
      {required String regionType, required String regionName}) {
    return _fetchSummary(regionType, regionName);
  }

  Future<RegionSummary> _fetchSummary(
      String regionType, String regionName) async {
    final useCase = ref.watch(getRegionSummaryProvider);
    final result =
        await useCase(regionType: regionType, regionName: regionName);
    return result.fold(
      (failure) => throw failure,
      (summary) => summary,
    );
  }
}
