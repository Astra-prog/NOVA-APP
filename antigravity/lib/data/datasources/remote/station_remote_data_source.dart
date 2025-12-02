import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/station_model.dart';
import '../../models/water_level_point_model.dart';
import '../../../core/network/dio_provider.dart';

part 'station_remote_data_source.g.dart';

abstract class StationRemoteDataSource {
  Future<List<StationModel>> getStations(
      {String? state, String? district, String? status});
  Future<StationModel> getStationDetail(String stationId);
  Future<List<WaterLevelPointModel>> getStationTimeSeries(
      String stationId, DateTime from, DateTime to);
}

@riverpod
StationRemoteDataSource stationRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return StationRemoteDataSourceImpl(dio);
}

class StationRemoteDataSourceImpl implements StationRemoteDataSource {
  final Dio _dio;

  StationRemoteDataSourceImpl(this._dio);

  @override
  Future<List<StationModel>> getStations({
    String? state,
    String? district,
    String? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (state != null) queryParams['state'] = state;
      if (district != null) queryParams['district'] = district;
      if (status != null) queryParams['status'] = status;

      final response = await _dio.get(
        '/stations',
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => StationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load stations: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<StationModel> getStationDetail(String stationId) async {
    try {
      final response = await _dio.get('/stations/$stationId');

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return StationModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to load station detail: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<List<WaterLevelPointModel>> getStationTimeSeries(
      String stationId, DateTime from, DateTime to) async {
    try {
      final response = await _dio.get(
        '/stations/$stationId/timeseries',
        queryParameters: {
          'from': from.toIso8601String(),
          'to': to.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => WaterLevelPointModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load time series: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
