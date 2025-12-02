import 'package:flutter_test/flutter_test.dart';
import 'package:nova/domain/entities/station.dart';
import 'package:nova/domain/usecases/get_stations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import '../helpers/mocks.mocks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nova/domain/repositories/station_repository.dart';

void main() {
  group('GetStations Use Case', () {
    late MockStationRepository mockRepository;
    late ProviderContainer container;

    setUp(() {
      mockRepository = MockStationRepository();
      container = ProviderContainer(
        overrides: [
          stationRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should return list of stations on success', () async {
      // Arrange
      final testStations = [
        Station(
          id: '1',
          name: 'Test Station',
          code: 'TS001',
          latitude: 28.0,
          longitude: 77.0,
          state: 'Delhi',
          district: 'New Delhi',
          status: 'normal',
          lastUpdatedAt: DateTime.now(),
          latestWaterLevel: 10.0,
        ),
      ];

      when(mockRepository.getStations(
        state: anyNamed('state'),
        district: anyNamed('district'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => Right(testStations));

      // Act
      final useCase = container.read(getStationsProvider);
      final result = await useCase();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (stations) {
          expect(stations.length, 1);
          expect(stations.first.name, 'Test Station');
        },
      );
    });

    test('should handle empty station list', () async {
      // Arrange
      when(mockRepository.getStations(
        state: anyNamed('state'),
        district: anyNamed('district'),
        status: anyNamed('status'),
      )).thenAnswer((_) async => const Right([]));

      // Act
      final useCase = container.read(getStationsProvider);
      final result = await useCase();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (stations) => expect(stations.isEmpty, true),
      );
    });
  });
}
