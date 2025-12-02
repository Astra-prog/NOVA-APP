// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_overview_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$regionOverviewControllerHash() =>
    r'7b7d8ba1e6bbc470e4bcd64f0db699ff7b55e6e9';

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

abstract class _$RegionOverviewController
    extends BuildlessAutoDisposeAsyncNotifier<RegionSummary> {
  late final String regionType;
  late final String regionName;

  FutureOr<RegionSummary> build({
    required String regionType,
    required String regionName,
  });
}

/// See also [RegionOverviewController].
@ProviderFor(RegionOverviewController)
const regionOverviewControllerProvider = RegionOverviewControllerFamily();

/// See also [RegionOverviewController].
class RegionOverviewControllerFamily extends Family<AsyncValue<RegionSummary>> {
  /// See also [RegionOverviewController].
  const RegionOverviewControllerFamily();

  /// See also [RegionOverviewController].
  RegionOverviewControllerProvider call({
    required String regionType,
    required String regionName,
  }) {
    return RegionOverviewControllerProvider(
      regionType: regionType,
      regionName: regionName,
    );
  }

  @override
  RegionOverviewControllerProvider getProviderOverride(
    covariant RegionOverviewControllerProvider provider,
  ) {
    return call(
      regionType: provider.regionType,
      regionName: provider.regionName,
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
  String? get name => r'regionOverviewControllerProvider';
}

/// See also [RegionOverviewController].
class RegionOverviewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RegionOverviewController,
        RegionSummary> {
  /// See also [RegionOverviewController].
  RegionOverviewControllerProvider({
    required String regionType,
    required String regionName,
  }) : this._internal(
          () => RegionOverviewController()
            ..regionType = regionType
            ..regionName = regionName,
          from: regionOverviewControllerProvider,
          name: r'regionOverviewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$regionOverviewControllerHash,
          dependencies: RegionOverviewControllerFamily._dependencies,
          allTransitiveDependencies:
              RegionOverviewControllerFamily._allTransitiveDependencies,
          regionType: regionType,
          regionName: regionName,
        );

  RegionOverviewControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.regionType,
    required this.regionName,
  }) : super.internal();

  final String regionType;
  final String regionName;

  @override
  FutureOr<RegionSummary> runNotifierBuild(
    covariant RegionOverviewController notifier,
  ) {
    return notifier.build(
      regionType: regionType,
      regionName: regionName,
    );
  }

  @override
  Override overrideWith(RegionOverviewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RegionOverviewControllerProvider._internal(
        () => create()
          ..regionType = regionType
          ..regionName = regionName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        regionType: regionType,
        regionName: regionName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RegionOverviewController,
      RegionSummary> createElement() {
    return _RegionOverviewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegionOverviewControllerProvider &&
        other.regionType == regionType &&
        other.regionName == regionName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, regionType.hashCode);
    hash = _SystemHash.combine(hash, regionName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RegionOverviewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<RegionSummary> {
  /// The parameter `regionType` of this provider.
  String get regionType;

  /// The parameter `regionName` of this provider.
  String get regionName;
}

class _RegionOverviewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RegionOverviewController,
        RegionSummary> with RegionOverviewControllerRef {
  _RegionOverviewControllerProviderElement(super.provider);

  @override
  String get regionType =>
      (origin as RegionOverviewControllerProvider).regionType;
  @override
  String get regionName =>
      (origin as RegionOverviewControllerProvider).regionName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
