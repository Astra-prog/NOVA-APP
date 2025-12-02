import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/errors/failures.dart';
import '../entities/station.dart';
import '../repositories/station_repository.dart';

part 'get_stations.g.dart';

@riverpod
GetStations getStations(Ref ref) {
  final repository = ref.watch(stationRepositoryProvider);
  return GetStations(repository);
}

class GetStations {
  final StationRepository _repository;

  GetStations(this._repository);

  Future<Either<AppFailure, List<Station>>> call({
    String? state,
    String? district,
    String? status,
  }) {
    return _repository.getStations(
      state: state,
      district: district,
      status: status,
    );
  }
}
