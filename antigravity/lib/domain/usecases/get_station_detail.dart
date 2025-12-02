import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/errors/failures.dart';
import '../entities/station.dart';
import '../entities/water_level_point.dart';
import '../repositories/station_repository.dart';

part 'get_station_detail.g.dart';

@riverpod
GetStationDetail getStationDetail(Ref ref) {
  throw UnimplementedError('Provider will be overridden in Data Layer');
}

class GetStationDetail {
  final StationRepository _repository;

  GetStationDetail(this._repository);

  Future<Either<AppFailure, Station>> execute(String stationId) {
    return _repository.getStationDetail(stationId);
  }

  Future<Either<AppFailure, List<WaterLevelPoint>>> getTimeSeries(
    String stationId,
    DateTime from,
    DateTime to,
  ) {
    return _repository.getStationTimeSeries(stationId, from, to);
  }
}
