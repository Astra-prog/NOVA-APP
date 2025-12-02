import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../core/errors/failures.dart';
import '../entities/station.dart';
import '../entities/water_level_point.dart';

part 'station_repository.g.dart';

@riverpod
StationRepository stationRepository(Ref ref) => throw UnimplementedError();

abstract class StationRepository {
  Future<Either<AppFailure, List<Station>>> getStations({
    String? state,
    String? district,
    String? status,
  });

  Future<Either<AppFailure, Station>> getStationDetail(String stationId);

  Future<Either<AppFailure, List<WaterLevelPoint>>> getStationTimeSeries(
    String stationId,
    DateTime from,
    DateTime to,
  );
}
