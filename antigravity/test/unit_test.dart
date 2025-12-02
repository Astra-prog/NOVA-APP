import 'package:nova/data/repositories/station_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nova/data/models/station_model.dart';
import 'helpers/mocks.mocks.dart';

void main() {
  group('StationRepository', () {
    late StationRepositoryImpl repository;
    late MockStationRemoteDataSource dataSource;

    setUp(() {
      dataSource = MockStationRemoteDataSource();
      repository = StationRepositoryImpl(dataSource);
    });

    final tStationModel = StationModel(
      id: '1',
      name: 'Test Station',
      code: 'TS01',
      latitude: 0,
      longitude: 0,
      state: 'Test State',
      district: 'Test District',
      status: 'active',
      lastUpdatedAt: DateTime.now(),
      latestWaterLevel: 10.0,
    );

    test('getStations returns list of stations', () async {
      when(dataSource.getStations(
        state: anyNamed('state'),
        district: anyNamed('district'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => [tStationModel, tStationModel, tStationModel]);

      final result = await repository.getStations();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should not return left'),
        (r) => expect(r.length, 3),
      );
      verify(dataSource.getStations(
        state: anyNamed('state'),
        district: anyNamed('district'),
        status: anyNamed('status'),
      ));
    });

    test('getStationDetail returns station', () async {
      when(dataSource.getStationDetail('1'))
          .thenAnswer((_) async => tStationModel);

      final result = await repository.getStationDetail('1');

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should not return left'),
        (r) => expect(r.id, '1'),
      );
      verify(dataSource.getStationDetail('1'));
    });
  });
}
