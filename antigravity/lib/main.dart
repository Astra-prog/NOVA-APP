import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'domain/repositories/station_repository.dart';
import 'domain/repositories/region_repository.dart';
import 'data/repositories/station_repository_impl.dart' as station_impl;
import 'data/repositories/region_repository_impl.dart' as region_impl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    overrides: [
      stationRepositoryProvider.overrideWith(
          (ref) => ref.watch(station_impl.stationRepositoryProvider)),
      regionRepositoryProvider.overrideWith(
          (ref) => ref.watch(region_impl.regionRepositoryProvider)),
    ],
    child: const NovaApp(),
  ));
}
