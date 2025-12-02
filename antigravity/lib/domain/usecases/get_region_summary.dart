import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/errors/failures.dart';
import '../entities/region_summary.dart';
import '../repositories/region_repository.dart';

part 'get_region_summary.g.dart';

@riverpod
GetRegionSummary getRegionSummary(Ref ref) {
  final repository = ref.watch(regionRepositoryProvider);
  return GetRegionSummary(repository);
}

class GetRegionSummary {
  final RegionRepository _repository;

  GetRegionSummary(this._repository);

  Future<Either<AppFailure, RegionSummary>> call({
    required String regionType,
    required String regionName,
  }) {
    return _repository.getRegionSummary(
      regionType: regionType,
      regionName: regionName,
    );
  }
}
