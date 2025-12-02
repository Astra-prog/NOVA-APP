import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/station.dart';
import '../../domain/usecases/get_stations.dart';

part 'station_list_controller.g.dart';

@riverpod
class StationListController extends _$StationListController {
  @override
  FutureOr<List<Station>> build(
      {String? stateFilter, String? district, String? status}) {
    return _fetchStations();
  }

  Future<List<Station>> _fetchStations() async {
    final useCase = ref.watch(getStationsProvider);
    final result =
        await useCase(state: stateFilter, district: district, status: status);
    return result.fold(
      (failure) => throw failure,
      (stations) => stations,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
