import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/station.dart';
import '../../domain/entities/water_level_point.dart';
import '../../domain/repositories/station_repository.dart';
import '../datasources/remote/station_remote_data_source.dart';

part 'station_repository_impl.g.dart';

@riverpod
StationRepository stationRepository(Ref ref) {
  final remoteDataSource = ref.watch(stationRemoteDataSourceProvider);
  return StationRepositoryImpl(remoteDataSource);
}

class StationRepositoryImpl implements StationRepository {
  final StationRemoteDataSource _remoteDataSource;

  StationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppFailure, List<Station>>> getStations({
    String? state,
    String? district,
    String? status,
  }) async {
    try {
      final models = await _remoteDataSource.getStations(
        state: state,
        district: district,
        status: status,
      );
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(AppFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, Station>> getStationDetail(String stationId) async {
    try {
      final model = await _remoteDataSource.getStationDetail(stationId);
      return right(model.toEntity());
    } catch (e) {
      return left(AppFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<WaterLevelPoint>>> getStationTimeSeries(
    String stationId,
    DateTime from,
    DateTime to,
  ) async {
    try {
      final models =
          await _remoteDataSource.getStationTimeSeries(stationId, from, to);
      return right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(AppFailure.serverError(e.toString()));
    }
  }
}
