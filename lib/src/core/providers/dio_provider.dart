import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/interceptors/api_interceptor.dart';
import 'package:a_and_i_report_web_server/src/core/interceptors/auth_interceptor.dart';
import 'package:a_and_i_report_web_server/src/core/interceptors/service_gate_interceptor.dart';
import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/core/utils/app_messenger.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/local_auth_datasource_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_session_revision_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';

part 'dio_provider.g.dart';

/// HTTP 통신을 위한 [Dio] 인스턴스를 제공하는 Provider입니다.
///
/// 애플리케이션 전반에서 API 호출 시 이 Provider를 통해 Dio 클라이언트를 주입받아 사용합니다.
/// 필요한 경우 Interceptor나 기본 옵션(BaseOptions)을 이곳에서 설정할 수 있습니다.
@riverpod
Dio dio(Ref ref) {
  final localAuthDatasource = ref.read(localAuthDatasourceProvider);
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  // 학습 코스 서비스가 비활성(딤)일 때 REPORT/ONLINE-JUDGE 호출을 가장 먼저 차단합니다.
  dio.interceptors.add(
    ServiceGateInterceptor(
      isServiceActive: () => ref.read(courseServiceActiveProvider),
    ),
  );

  dio.interceptors.add(
    ApiInterceptor(
      localAuthDatasource: localAuthDatasource,
    ),
  );

  dio.interceptors.add(
    AuthInterceptor(
      localAuthDatasource: localAuthDatasource,
      dio: dio,
      onTokenExpired: (refreshToken) async {
        final logoutDio = Dio(dio.options.copyWith());
        if (refreshToken != null && refreshToken.isNotEmpty) {
          try {
            await logoutDio.post(
              '/v2/auth/logout',
              data: {'refreshToken': refreshToken},
              options: Options(
                headers: {'Content-Type': 'application/json'},
              ),
            );
          } catch (_) {
            // 서버 로그아웃 실패여도 로컬 세션은 정리한다.
          }
        }

        await localAuthDatasource.deleteUserToken();
        await localAuthDatasource.deleteRefreshToken();
        await localAuthDatasource.deleteCachedUserJson();

        await ref
            .read(userViewModelProvider.notifier)
            .onEvent(const UserViewEvent.clear());
        ref.read(authViewModelProvider.notifier).expireSession();
        showGlobalSnackBar('세션이 만료되어 로그아웃되었습니다. 다시 로그인해주세요.');
      },
      onTokenRefreshed: (_, __) async {
        ref.read(authSessionRevisionProvider.notifier).state++;
      },
    ),
  );

  return dio;
}
