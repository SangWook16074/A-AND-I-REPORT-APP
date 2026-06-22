import 'package:dio/dio.dart';

/// 학습 코스 서비스가 비활성(딤) 상태일 때 발생하는 차단 예외입니다.
class ServiceClosedException implements Exception {
  const ServiceClosedException();

  static const String defaultMessage = '현재 학습 코스 서비스가 종료되어 요청을 처리할 수 없습니다.';

  String get message => defaultMessage;

  @override
  String toString() => message;
}

/// 학습 코스 서비스가 비활성일 때 REPORT/ONLINE-JUDGE 관련 API 호출을
/// 네트워크로 나가기 전에 차단하는 Interceptor 입니다.
///
/// SSE 제출 스트림은 항상 REST 응답으로 받은 `streamUrl`에 연결되므로,
/// 여기서 REST 호출을 막으면 streamUrl 자체를 얻을 수 없어 스트림도 함께 차단됩니다.
class ServiceGateInterceptor extends Interceptor {
  ServiceGateInterceptor({required this.isServiceActive});

  /// 현재 학습 코스 서비스 활성화 여부를 반환합니다(요청 시점 평가).
  final bool Function() isServiceActive;

  /// 비활성 시 차단할 경로 토큰(REPORT + ONLINE-JUDGE).
  ///
  /// - REPORT(과제): `/outline`, `/weeks`, `/assignments`
  /// - ONLINE-JUDGE: `/submissions`, `/problems`, `/testcases`
  static const List<String> _gatedPathTokens = <String>[
    '/outline',
    '/weeks',
    '/assignments',
    '/submissions',
    '/problems',
    '/testcases',
  ];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (isServiceActive() || !_isGatedPath(options.uri.path)) {
      handler.next(options);
      return;
    }

    // 후속 에러 인터셉터(전역 스낵바 알림 등)는 타지 않도록 reject 합니다.
    handler.reject(
      DioException(
        requestOptions: options,
        type: DioExceptionType.cancel,
        error: const ServiceClosedException(),
        message: ServiceClosedException.defaultMessage,
      ),
    );
  }

  bool _isGatedPath(String path) {
    return _gatedPathTokens.any(path.contains);
  }
}
