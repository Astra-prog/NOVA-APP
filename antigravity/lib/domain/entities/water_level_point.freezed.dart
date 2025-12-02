// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_level_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaterLevelPoint _$WaterLevelPointFromJson(Map<String, dynamic> json) {
  return _WaterLevelPoint.fromJson(json);
}

/// @nodoc
mixin _$WaterLevelPoint {
  String get stationId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get waterLevel => throw _privateConstructorUsedError;
  String? get qualityFlag => throw _privateConstructorUsedError;

  /// Serializes this WaterLevelPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaterLevelPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaterLevelPointCopyWith<WaterLevelPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterLevelPointCopyWith<$Res> {
  factory $WaterLevelPointCopyWith(
          WaterLevelPoint value, $Res Function(WaterLevelPoint) then) =
      _$WaterLevelPointCopyWithImpl<$Res, WaterLevelPoint>;
  @useResult
  $Res call(
      {String stationId,
      DateTime timestamp,
      double waterLevel,
      String? qualityFlag});
}

/// @nodoc
class _$WaterLevelPointCopyWithImpl<$Res, $Val extends WaterLevelPoint>
    implements $WaterLevelPointCopyWith<$Res> {
  _$WaterLevelPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaterLevelPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = null,
    Object? timestamp = null,
    Object? waterLevel = null,
    Object? qualityFlag = freezed,
  }) {
    return _then(_value.copyWith(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      waterLevel: null == waterLevel
          ? _value.waterLevel
          : waterLevel // ignore: cast_nullable_to_non_nullable
              as double,
      qualityFlag: freezed == qualityFlag
          ? _value.qualityFlag
          : qualityFlag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaterLevelPointImplCopyWith<$Res>
    implements $WaterLevelPointCopyWith<$Res> {
  factory _$$WaterLevelPointImplCopyWith(_$WaterLevelPointImpl value,
          $Res Function(_$WaterLevelPointImpl) then) =
      __$$WaterLevelPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stationId,
      DateTime timestamp,
      double waterLevel,
      String? qualityFlag});
}

/// @nodoc
class __$$WaterLevelPointImplCopyWithImpl<$Res>
    extends _$WaterLevelPointCopyWithImpl<$Res, _$WaterLevelPointImpl>
    implements _$$WaterLevelPointImplCopyWith<$Res> {
  __$$WaterLevelPointImplCopyWithImpl(
      _$WaterLevelPointImpl _value, $Res Function(_$WaterLevelPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaterLevelPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = null,
    Object? timestamp = null,
    Object? waterLevel = null,
    Object? qualityFlag = freezed,
  }) {
    return _then(_$WaterLevelPointImpl(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      waterLevel: null == waterLevel
          ? _value.waterLevel
          : waterLevel // ignore: cast_nullable_to_non_nullable
              as double,
      qualityFlag: freezed == qualityFlag
          ? _value.qualityFlag
          : qualityFlag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaterLevelPointImpl implements _WaterLevelPoint {
  const _$WaterLevelPointImpl(
      {required this.stationId,
      required this.timestamp,
      required this.waterLevel,
      this.qualityFlag});

  factory _$WaterLevelPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaterLevelPointImplFromJson(json);

  @override
  final String stationId;
  @override
  final DateTime timestamp;
  @override
  final double waterLevel;
  @override
  final String? qualityFlag;

  @override
  String toString() {
    return 'WaterLevelPoint(stationId: $stationId, timestamp: $timestamp, waterLevel: $waterLevel, qualityFlag: $qualityFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaterLevelPointImpl &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.waterLevel, waterLevel) ||
                other.waterLevel == waterLevel) &&
            (identical(other.qualityFlag, qualityFlag) ||
                other.qualityFlag == qualityFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stationId, timestamp, waterLevel, qualityFlag);

  /// Create a copy of WaterLevelPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaterLevelPointImplCopyWith<_$WaterLevelPointImpl> get copyWith =>
      __$$WaterLevelPointImplCopyWithImpl<_$WaterLevelPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaterLevelPointImplToJson(
      this,
    );
  }
}

abstract class _WaterLevelPoint implements WaterLevelPoint {
  const factory _WaterLevelPoint(
      {required final String stationId,
      required final DateTime timestamp,
      required final double waterLevel,
      final String? qualityFlag}) = _$WaterLevelPointImpl;

  factory _WaterLevelPoint.fromJson(Map<String, dynamic> json) =
      _$WaterLevelPointImpl.fromJson;

  @override
  String get stationId;
  @override
  DateTime get timestamp;
  @override
  double get waterLevel;
  @override
  String? get qualityFlag;

  /// Create a copy of WaterLevelPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaterLevelPointImplCopyWith<_$WaterLevelPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
