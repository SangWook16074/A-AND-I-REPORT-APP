import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:a_and_i_report_web_server/src/core/interceptors/auth_interceptor.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_event.dart';

part 'dio_provider.g.dart';

/// HTTP 통신을 위한 [Dio] 인스턴스를 제공하는 Provider입니다.
///
/// 애플리케이션 전반에서 API 호출 시 이 Provider를 통해 Dio 클라이언트를 주입받아 사용합니다.
/// 필요한 경우 Interceptor나 기본 옵션(BaseOptions)을 이곳에서 설정할 수 있습니다.
@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  final authRepository = ref.read(authRepositoryProvider);

  // AuthInterceptor 추가 - 401 발생 시 자동 토큰 갱신
  dio.interceptors.add(
    AuthInterceptor(
      authRepository: authRepository,
      dio: dio,
      onTokenExpired: () {
        // 리프레시 토큰도 만료된 경우 로그아웃 처리
        ref.read(authViewModelProvider.notifier).onEvent(const SignOut());
      },
    ),
  );

  return dio;
}
