import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../core/errors/failures.dart';
import '../entities/region_summary.dart';

part 'region_repository.g.dart';

@riverpod
RegionRepository regionRepository(Ref ref) => throw UnimplementedError();

abstract class RegionRepository {
  Future<Either<AppFailure, RegionSummary>> getRegionSummary({
    required String regionType,
    required String regionName,
  });

  Future<Either<AppFailure, List<String>>> getAvailableRegions(
      String regionType);
}
