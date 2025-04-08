import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_result.freezed.dart';

@freezed
class HomeResult<T> with _$HomeResult<T> {
  const factory HomeResult.success(List<T> data) = Success;
  const factory HomeResult.error(String message) = Error;
}
