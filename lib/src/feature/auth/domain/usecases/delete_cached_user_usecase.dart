import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';

/// 캐시된 사용자 정보를 삭제하는 유스케이스 구현체다.
final class DeleteCachedUserUsecaseImpl implements DeleteCachedUserUsecase {
  const DeleteCachedUserUsecaseImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<void> call() async {
    await authRepository.deleteCachedUser();
  }
}

/// 캐시된 사용자 정보를 삭제하는 유스케이스 인터페이스다.
abstract class DeleteCachedUserUsecase {
  Future<void> call();
}
