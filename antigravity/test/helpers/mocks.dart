import 'package:mockito/annotations.dart';
import 'package:nova/data/datasources/remote/station_remote_data_source.dart';
import 'package:nova/domain/repositories/station_repository.dart';

@GenerateMocks([
  StationRemoteDataSource,
  StationRepository,
])
void main() {}
