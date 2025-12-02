import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/region_summary.dart';
import '../../domain/repositories/region_repository.dart';
import '../datasources/remote/region_remote_data_source.dart';

part 'region_repository_impl.g.dart';

@riverpod
RegionRepository regionRepository(Ref ref) {
  final remoteDataSource = ref.watch(regionRemoteDataSourceProvider);
  return RegionRepositoryImpl(remoteDataSource);
}

class RegionRepositoryImpl implements RegionRepository {
  final RegionRemoteDataSource _remoteDataSource;

  RegionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppFailure, RegionSummary>> getRegionSummary(
      {required String regionType, required String regionName}) async {
    try {
      final model = await _remoteDataSource.getRegionSummary(
          regionType: regionType, regionName: regionName);
      return right(model.toEntity());
    } catch (e) {
      return left(AppFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<String>>> getAvailableRegions(
      String regionType) async {
    try {
      final regions = await _remoteDataSource.getAvailableRegions(regionType);
      return right(regions);
    } catch (e) {
      return left(AppFailure.serverError(e.toString()));
    }
  }
}
