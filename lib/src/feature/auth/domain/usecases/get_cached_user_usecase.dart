import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';

/// 캐시된 사용자 정보를 조회하는 유스케이스 구현체다.
final class GetCachedUserUsecaseImpl implements GetCachedUserUsecase {
  const GetCachedUserUsecaseImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<User?> call() async {
    return await authRepository.getCachedUser();
  }
}

/// 캐시된 사용자 정보를 조회하는 유스케이스 인터페이스다.
abstract class GetCachedUserUsecase {
  Future<User?> call();
}
