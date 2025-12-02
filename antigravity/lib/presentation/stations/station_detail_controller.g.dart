// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stationTimeSeriesHash() => r'ddcd80ca7fcccb00628dceb1703cc279e23b83e4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [stationTimeSeries].
@ProviderFor(stationTimeSeries)
const stationTimeSeriesProvider = StationTimeSeriesFamily();

/// See also [stationTimeSeries].
class StationTimeSeriesFamily
    extends Family<AsyncValue<List<WaterLevelPoint>>> {
  /// See also [stationTimeSeries].
  const StationTimeSeriesFamily();

  /// See also [stationTimeSeries].
  StationTimeSeriesProvider call(
    String stationId,
  ) {
    return StationTimeSeriesProvider(
      stationId,
    );
  }

  @override
  StationTimeSeriesProvider getProviderOverride(
    covariant StationTimeSeriesProvider provider,
  ) {
    return call(
      provider.stationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stationTimeSeriesProvider';
}

/// See also [stationTimeSeries].
class StationTimeSeriesProvider
    extends AutoDisposeFutureProvider<List<WaterLevelPoint>> {
  /// See also [stationTimeSeries].
  StationTimeSeriesProvider(
    String stationId,
  ) : this._internal(
          (ref) => stationTimeSeries(
            ref as StationTimeSeriesRef,
            stationId,
          ),
          from: stationTimeSeriesProvider,
          name: r'stationTimeSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stationTimeSeriesHash,
          dependencies: StationTimeSeriesFamily._dependencies,
          allTransitiveDependencies:
              StationTimeSeriesFamily._allTransitiveDependencies,
          stationId: stationId,
        );

  StationTimeSeriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stationId,
  }) : super.internal();

  final String stationId;

  @override
  Override overrideWith(
    FutureOr<List<WaterLevelPoint>> Function(StationTimeSeriesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StationTimeSeriesProvider._internal(
        (ref) => create(ref as StationTimeSeriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stationId: stationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WaterLevelPoint>> createElement() {
    return _StationTimeSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StationTimeSeriesProvider && other.stationId == stationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StationTimeSeriesRef
    on AutoDisposeFutureProviderRef<List<WaterLevelPoint>> {
  /// The parameter `stationId` of this provider.
  String get stationId;
}

class _StationTimeSeriesProviderElement
    extends AutoDisposeFutureProviderElement<List<WaterLevelPoint>>
    with StationTimeSeriesRef {
  _StationTimeSeriesProviderElement(super.provider);

  @override
  String get stationId => (origin as StationTimeSeriesProvider).stationId;
}

String _$stationDetailControllerHash() =>
    r'f9513ee2e35fabbee7172db49bc5843709f207aa';

abstract class _$StationDetailController
    extends BuildlessAutoDisposeAsyncNotifier<Station> {
  late final String stationId;

  FutureOr<Station> build(
    String stationId,
  );
}

/// See also [StationDetailController].
@ProviderFor(StationDetailController)
const stationDetailControllerProvider = StationDetailControllerFamily();

/// See also [StationDetailController].
class StationDetailControllerFamily extends Family<AsyncValue<Station>> {
  /// See also [StationDetailController].
  const StationDetailControllerFamily();

  /// See also [StationDetailController].
  StationDetailControllerProvider call(
    String stationId,
  ) {
    return StationDetailControllerProvider(
      stationId,
    );
  }

  @override
  StationDetailControllerProvider getProviderOverride(
    covariant StationDetailControllerProvider provider,
  ) {
    return call(
      provider.stationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stationDetailControllerProvider';
}

/// See also [StationDetailController].
class StationDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StationDetailController,
        Station> {
  /// See also [StationDetailController].
  StationDetailControllerProvider(
    String stationId,
  ) : this._internal(
          () => StationDetailController()..stationId = stationId,
          from: stationDetailControllerProvider,
          name: r'stationDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stationDetailControllerHash,
          dependencies: StationDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              StationDetailControllerFamily._allTransitiveDependencies,
          stationId: stationId,
        );

  StationDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stationId,
  }) : super.internal();

  final String stationId;

  @override
  FutureOr<Station> runNotifierBuild(
    covariant StationDetailController notifier,
  ) {
    return notifier.build(
      stationId,
    );
  }

  @override
  Override overrideWith(StationDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StationDetailControllerProvider._internal(
        () => create()..stationId = stationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stationId: stationId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<StationDetailController, Station>
      createElement() {
    return _StationDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StationDetailControllerProvider &&
        other.stationId == stationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StationDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Station> {
  /// The parameter `stationId` of this provider.
  String get stationId;
}

class _StationDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StationDetailController,
        Station> with StationDetailControllerRef {
  _StationDetailControllerProviderElement(super.provider);

  @override
  String get stationId => (origin as StationDetailControllerProvider).stationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
