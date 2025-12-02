import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/station.dart';
import '../../domain/usecases/get_stations.dart';

part 'map_controller.g.dart';

@riverpod
class MapController extends _$MapController {
  @override
  FutureOr<List<Station>> build() {
    return _fetchStations();
  }

  Future<List<Station>> _fetchStations() async {
    final useCase = ref.watch(getStationsProvider);
    final result = await useCase();
    return result.fold(
      (failure) => throw failure,
      (stations) => stations,
    );
  }
}
