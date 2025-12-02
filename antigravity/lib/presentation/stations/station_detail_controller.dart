import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/station.dart';
import '../../domain/entities/water_level_point.dart';
import '../../domain/usecases/get_station_detail.dart';

part 'station_detail_controller.g.dart';

@riverpod
class StationDetailController extends _$StationDetailController {
  @override
  FutureOr<Station> build(String stationId) {
    return _fetchStation(stationId);
  }

  Future<Station> _fetchStation(String stationId) async {
    final useCase = ref.watch(getStationDetailProvider);
    final result = await useCase.execute(stationId);
    return result.fold(
      (failure) => throw failure,
      (station) => station,
    );
  }
}

@riverpod
Future<List<WaterLevelPoint>> stationTimeSeries(
  Ref ref,
  String stationId,
) async {
  final useCase = ref.watch(getStationDetailProvider);
  // Default to last 6 months
  final to = DateTime.now();
  final from = to.subtract(const Duration(days: 180));

  final result = await useCase.getTimeSeries(stationId, from, to);
  return result.fold(
    (failure) => throw failure,
    (points) => points,
  );
}
