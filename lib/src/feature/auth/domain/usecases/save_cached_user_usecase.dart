import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';

/// 사용자 정보를 캐시에 저장하는 유스케이스 구현체다.
final class SaveCachedUserUsecaseImpl implements SaveCachedUserUsecase {
  const SaveCachedUserUsecaseImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<void> call(User user) async {
    await authRepository.saveCachedUser(user);
  }
}

/// 사용자 정보를 캐시에 저장하는 유스케이스 인터페이스다.
abstract class SaveCachedUserUsecase {
  Future<void> call(User user);
}
