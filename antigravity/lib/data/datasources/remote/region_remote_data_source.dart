import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/region_model.dart';
import '../../../core/network/dio_provider.dart';

part 'region_remote_data_source.g.dart';

abstract class RegionRemoteDataSource {
  Future<RegionModel> getRegionSummary(
      {required String regionType, required String regionName});
  Future<List<String>> getAvailableRegions(String regionType);
}

@riverpod
RegionRemoteDataSource regionRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return RegionRemoteDataSourceImpl(dio);
}

class RegionRemoteDataSourceImpl implements RegionRemoteDataSource {
  final Dio _dio;

  RegionRemoteDataSourceImpl(this._dio);

  @override
  Future<RegionModel> getRegionSummary({
    required String regionType,
    required String regionName,
  }) async {
    try {
      final response = await _dio.get(
        '/regions/summary',
        queryParameters: {
          'type': regionType,
          'name': regionName,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return RegionModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to load region summary: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<List<String>> getAvailableRegions(String regionType) async {
    try {
      final response = await _dio.get(
        '/regions',
        queryParameters: {'type': regionType},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((item) => item.toString()).toList();
      } else {
        throw Exception(
            'Failed to load available regions: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
