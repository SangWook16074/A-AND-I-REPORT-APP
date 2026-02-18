import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_result.freezed.dart';

/// 계정 활성화 실패 원인 분류입니다.
enum ActivateFailureReason {
  tokenMissing,
  tokenInvalidOrExpired,
  networkError,
}

/// 계정 활성화 유스케이스 결과 모델입니다.
@freezed
abstract class ActivateResult with _$ActivateResult {
  const factory ActivateResult.success() = ActivateSuccess;
  const factory ActivateResult.failure(ActivateFailureReason reason) =
      ActivateFailure;
}
