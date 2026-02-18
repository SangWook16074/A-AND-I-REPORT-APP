import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_command.freezed.dart';

/// 계정 활성화 도메인 명령 모델입니다.
///
/// UI 계층 입력값을 도메인 유스케이스로 전달할 때 사용합니다.
@freezed
abstract class ActivateCommand with _$ActivateCommand {
  const factory ActivateCommand({
    required String token,
    required String password,
  }) = _ActivateCommand;
}
