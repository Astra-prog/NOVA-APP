import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/region_summary.dart';
import '../../domain/usecases/get_region_summary.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<RegionSummary> build() {
    return _fetchSummary();
  }

  Future<RegionSummary> _fetchSummary() async {
    final useCase = ref.watch(getRegionSummaryProvider);
    final result = await useCase(regionType: 'National', regionName: 'India');
    return result.fold(
      (failure) => throw failure,
      (summary) => summary,
    );
  }

  Future<void> refresh() async {
    // Set loading state without destroying current data if possible
    // For now, we'll just reload
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchSummary());
  }
}
