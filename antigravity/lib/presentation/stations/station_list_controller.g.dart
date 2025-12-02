// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stationListControllerHash() =>
    r'a3ab889c4351d83af8362716019587184ea19b1c';

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

abstract class _$StationListController
    extends BuildlessAutoDisposeAsyncNotifier<List<Station>> {
  late final String? stateFilter;
  late final String? district;
  late final String? status;

  FutureOr<List<Station>> build({
    String? stateFilter,
    String? district,
    String? status,
  });
}

/// See also [StationListController].
@ProviderFor(StationListController)
const stationListControllerProvider = StationListControllerFamily();

/// See also [StationListController].
class StationListControllerFamily extends Family<AsyncValue<List<Station>>> {
  /// See also [StationListController].
  const StationListControllerFamily();

  /// See also [StationListController].
  StationListControllerProvider call({
    String? stateFilter,
    String? district,
    String? status,
  }) {
    return StationListControllerProvider(
      stateFilter: stateFilter,
      district: district,
      status: status,
    );
  }

  @override
  StationListControllerProvider getProviderOverride(
    covariant StationListControllerProvider provider,
  ) {
    return call(
      stateFilter: provider.stateFilter,
      district: provider.district,
      status: provider.status,
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
  String? get name => r'stationListControllerProvider';
}

/// See also [StationListController].
class StationListControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StationListController,
        List<Station>> {
  /// See also [StationListController].
  StationListControllerProvider({
    String? stateFilter,
    String? district,
    String? status,
  }) : this._internal(
          () => StationListController()
            ..stateFilter = stateFilter
            ..district = district
            ..status = status,
          from: stationListControllerProvider,
          name: r'stationListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stationListControllerHash,
          dependencies: StationListControllerFamily._dependencies,
          allTransitiveDependencies:
              StationListControllerFamily._allTransitiveDependencies,
          stateFilter: stateFilter,
          district: district,
          status: status,
        );

  StationListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stateFilter,
    required this.district,
    required this.status,
  }) : super.internal();

  final String? stateFilter;
  final String? district;
  final String? status;

  @override
  FutureOr<List<Station>> runNotifierBuild(
    covariant StationListController notifier,
  ) {
    return notifier.build(
      stateFilter: stateFilter,
      district: district,
      status: status,
    );
  }

  @override
  Override overrideWith(StationListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StationListControllerProvider._internal(
        () => create()
          ..stateFilter = stateFilter
          ..district = district
          ..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stateFilter: stateFilter,
        district: district,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<StationListController, List<Station>>
      createElement() {
    return _StationListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StationListControllerProvider &&
        other.stateFilter == stateFilter &&
        other.district == district &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stateFilter.hashCode);
    hash = _SystemHash.combine(hash, district.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StationListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Station>> {
  /// The parameter `stateFilter` of this provider.
  String? get stateFilter;

  /// The parameter `district` of this provider.
  String? get district;

  /// The parameter `status` of this provider.
  String? get status;
}

class _StationListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StationListController,
        List<Station>> with StationListControllerRef {
  _StationListControllerProviderElement(super.provider);

  @override
  String? get stateFilter =>
      (origin as StationListControllerProvider).stateFilter;
  @override
  String? get district => (origin as StationListControllerProvider).district;
  @override
  String? get status => (origin as StationListControllerProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
