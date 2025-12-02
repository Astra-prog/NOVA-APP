// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegionSummary _$RegionSummaryFromJson(Map<String, dynamic> json) {
  return _RegionSummary.fromJson(json);
}

/// @nodoc
mixin _$RegionSummary {
  String get regionType =>
      throw _privateConstructorUsedError; // district, state, basin
  String get regionName => throw _privateConstructorUsedError;
  int get stationCount => throw _privateConstructorUsedError;
  int get stationsOnline => throw _privateConstructorUsedError;
  double get percentageCritical => throw _privateConstructorUsedError;
  double get percentageWarning => throw _privateConstructorUsedError;
  double get percentageNormal => throw _privateConstructorUsedError;
  String get overallTrend =>
      throw _privateConstructorUsedError; // increasing, decreasing, stable
  String get narrativeSummary => throw _privateConstructorUsedError;

  /// Serializes this RegionSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionSummaryCopyWith<RegionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionSummaryCopyWith<$Res> {
  factory $RegionSummaryCopyWith(
          RegionSummary value, $Res Function(RegionSummary) then) =
      _$RegionSummaryCopyWithImpl<$Res, RegionSummary>;
  @useResult
  $Res call(
      {String regionType,
      String regionName,
      int stationCount,
      int stationsOnline,
      double percentageCritical,
      double percentageWarning,
      double percentageNormal,
      String overallTrend,
      String narrativeSummary});
}

/// @nodoc
class _$RegionSummaryCopyWithImpl<$Res, $Val extends RegionSummary>
    implements $RegionSummaryCopyWith<$Res> {
  _$RegionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionType = null,
    Object? regionName = null,
    Object? stationCount = null,
    Object? stationsOnline = null,
    Object? percentageCritical = null,
    Object? percentageWarning = null,
    Object? percentageNormal = null,
    Object? overallTrend = null,
    Object? narrativeSummary = null,
  }) {
    return _then(_value.copyWith(
      regionType: null == regionType
          ? _value.regionType
          : regionType // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      stationCount: null == stationCount
          ? _value.stationCount
          : stationCount // ignore: cast_nullable_to_non_nullable
              as int,
      stationsOnline: null == stationsOnline
          ? _value.stationsOnline
          : stationsOnline // ignore: cast_nullable_to_non_nullable
              as int,
      percentageCritical: null == percentageCritical
          ? _value.percentageCritical
          : percentageCritical // ignore: cast_nullable_to_non_nullable
              as double,
      percentageWarning: null == percentageWarning
          ? _value.percentageWarning
          : percentageWarning // ignore: cast_nullable_to_non_nullable
              as double,
      percentageNormal: null == percentageNormal
          ? _value.percentageNormal
          : percentageNormal // ignore: cast_nullable_to_non_nullable
              as double,
      overallTrend: null == overallTrend
          ? _value.overallTrend
          : overallTrend // ignore: cast_nullable_to_non_nullable
              as String,
      narrativeSummary: null == narrativeSummary
          ? _value.narrativeSummary
          : narrativeSummary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionSummaryImplCopyWith<$Res>
    implements $RegionSummaryCopyWith<$Res> {
  factory _$$RegionSummaryImplCopyWith(
          _$RegionSummaryImpl value, $Res Function(_$RegionSummaryImpl) then) =
      __$$RegionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String regionType,
      String regionName,
      int stationCount,
      int stationsOnline,
      double percentageCritical,
      double percentageWarning,
      double percentageNormal,
      String overallTrend,
      String narrativeSummary});
}

/// @nodoc
class __$$RegionSummaryImplCopyWithImpl<$Res>
    extends _$RegionSummaryCopyWithImpl<$Res, _$RegionSummaryImpl>
    implements _$$RegionSummaryImplCopyWith<$Res> {
  __$$RegionSummaryImplCopyWithImpl(
      _$RegionSummaryImpl _value, $Res Function(_$RegionSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionType = null,
    Object? regionName = null,
    Object? stationCount = null,
    Object? stationsOnline = null,
    Object? percentageCritical = null,
    Object? percentageWarning = null,
    Object? percentageNormal = null,
    Object? overallTrend = null,
    Object? narrativeSummary = null,
  }) {
    return _then(_$RegionSummaryImpl(
      regionType: null == regionType
          ? _value.regionType
          : regionType // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      stationCount: null == stationCount
          ? _value.stationCount
          : stationCount // ignore: cast_nullable_to_non_nullable
              as int,
      stationsOnline: null == stationsOnline
          ? _value.stationsOnline
          : stationsOnline // ignore: cast_nullable_to_non_nullable
              as int,
      percentageCritical: null == percentageCritical
          ? _value.percentageCritical
          : percentageCritical // ignore: cast_nullable_to_non_nullable
              as double,
      percentageWarning: null == percentageWarning
          ? _value.percentageWarning
          : percentageWarning // ignore: cast_nullable_to_non_nullable
              as double,
      percentageNormal: null == percentageNormal
          ? _value.percentageNormal
          : percentageNormal // ignore: cast_nullable_to_non_nullable
              as double,
      overallTrend: null == overallTrend
          ? _value.overallTrend
          : overallTrend // ignore: cast_nullable_to_non_nullable
              as String,
      narrativeSummary: null == narrativeSummary
          ? _value.narrativeSummary
          : narrativeSummary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionSummaryImpl implements _RegionSummary {
  const _$RegionSummaryImpl(
      {required this.regionType,
      required this.regionName,
      required this.stationCount,
      required this.stationsOnline,
      required this.percentageCritical,
      required this.percentageWarning,
      required this.percentageNormal,
      required this.overallTrend,
      required this.narrativeSummary});

  factory _$RegionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionSummaryImplFromJson(json);

  @override
  final String regionType;
// district, state, basin
  @override
  final String regionName;
  @override
  final int stationCount;
  @override
  final int stationsOnline;
  @override
  final double percentageCritical;
  @override
  final double percentageWarning;
  @override
  final double percentageNormal;
  @override
  final String overallTrend;
// increasing, decreasing, stable
  @override
  final String narrativeSummary;

  @override
  String toString() {
    return 'RegionSummary(regionType: $regionType, regionName: $regionName, stationCount: $stationCount, stationsOnline: $stationsOnline, percentageCritical: $percentageCritical, percentageWarning: $percentageWarning, percentageNormal: $percentageNormal, overallTrend: $overallTrend, narrativeSummary: $narrativeSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionSummaryImpl &&
            (identical(other.regionType, regionType) ||
                other.regionType == regionType) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.stationCount, stationCount) ||
                other.stationCount == stationCount) &&
            (identical(other.stationsOnline, stationsOnline) ||
                other.stationsOnline == stationsOnline) &&
            (identical(other.percentageCritical, percentageCritical) ||
                other.percentageCritical == percentageCritical) &&
            (identical(other.percentageWarning, percentageWarning) ||
                other.percentageWarning == percentageWarning) &&
            (identical(other.percentageNormal, percentageNormal) ||
                other.percentageNormal == percentageNormal) &&
            (identical(other.overallTrend, overallTrend) ||
                other.overallTrend == overallTrend) &&
            (identical(other.narrativeSummary, narrativeSummary) ||
                other.narrativeSummary == narrativeSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      regionType,
      regionName,
      stationCount,
      stationsOnline,
      percentageCritical,
      percentageWarning,
      percentageNormal,
      overallTrend,
      narrativeSummary);

  /// Create a copy of RegionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionSummaryImplCopyWith<_$RegionSummaryImpl> get copyWith =>
      __$$RegionSummaryImplCopyWithImpl<_$RegionSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionSummaryImplToJson(
      this,
    );
  }
}

abstract class _RegionSummary implements RegionSummary {
  const factory _RegionSummary(
      {required final String regionType,
      required final String regionName,
      required final int stationCount,
      required final int stationsOnline,
      required final double percentageCritical,
      required final double percentageWarning,
      required final double percentageNormal,
      required final String overallTrend,
      required final String narrativeSummary}) = _$RegionSummaryImpl;

  factory _RegionSummary.fromJson(Map<String, dynamic> json) =
      _$RegionSummaryImpl.fromJson;

  @override
  String get regionType; // district, state, basin
  @override
  String get regionName;
  @override
  int get stationCount;
  @override
  int get stationsOnline;
  @override
  double get percentageCritical;
  @override
  double get percentageWarning;
  @override
  double get percentageNormal;
  @override
  String get overallTrend; // increasing, decreasing, stable
  @override
  String get narrativeSummary;

  /// Create a copy of RegionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionSummaryImplCopyWith<_$RegionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
