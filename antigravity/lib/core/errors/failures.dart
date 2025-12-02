import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const factory AppFailure.serverError([String? message]) = _ServerError;
  const factory AppFailure.networkError([String? message]) = _NetworkError;
  const factory AppFailure.cacheError([String? message]) = _CacheError;
  const factory AppFailure.unauthorized([String? message]) = _Unauthorized;
  const factory AppFailure.unknown([String? message]) = _Unknown;
}
