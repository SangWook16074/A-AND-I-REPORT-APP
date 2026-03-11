import 'package:dio/dio.dart';

/// API/네트워크 예외를 사용자 노출용 메시지로 변환합니다.
final class ApiErrorMapper {
  const ApiErrorMapper._();

  /// 예외 객체를 사용자 메시지로 변환합니다.
  static String map(
    Object error, {
    String fallbackMessage = '오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
  }) {
    if (error is DioException) {
      return _mapDioException(error, fallbackMessage: fallbackMessage);
    }

    final normalized = error.toString().replaceFirst(RegExp(r'^Exception:\s*'), '');
    return normalized.isEmpty ? fallbackMessage : normalized;
  }

  /// 서버 에러 코드와 메시지를 사용자 메시지로 변환합니다.
  static String mapApiError({
    String? code,
    String? message,
    String fallbackMessage = '요청 처리 중 오류가 발생했습니다.',
  }) {
    final normalizedCode = code?.trim().toUpperCase();
    final normalizedMessage = message?.trim();

    return switch (normalizedCode) {
      'VALIDATION_ERROR' ||
      'INPUT_ERROR' ||
      'JSON_PARSE_ERROR' ||
      'ENUM_MISMATCH_PHASE' ||
      'ENUM_MISMATCH_STATUS' ||
      'ENUM_MISMATCH_TRACK' ||
      'MISSING_REQUIRED_VALUE' ||
      'BAD_REQUEST' => '요청 값이 올바르지 않습니다.',
      'UNAUTHORIZED' => '로그인이 필요하거나 인증이 만료되었습니다.',
      'FORBIDDEN' => '요청을 수행할 권한이 없습니다.',
      'NOT_FOUND' => normalizedMessage?.isNotEmpty == true
          ? normalizedMessage!
          : '요청한 리소스를 찾을 수 없습니다.',
      'CONFLICT' => normalizedMessage?.isNotEmpty == true
          ? normalizedMessage!
          : '이미 존재하거나 현재 상태에서 처리할 수 없습니다.',
      'UNPROCESSABLE_ENTITY' => normalizedMessage?.isNotEmpty == true
          ? normalizedMessage!
          : '요청은 유효하지만 처리할 수 없습니다.',
      'INTERNAL_SERVER_ERROR' => '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
      _ => normalizedMessage?.isNotEmpty == true ? normalizedMessage! : fallbackMessage,
    };
  }

  static String _mapDioException(
    DioException error, {
    required String fallbackMessage,
  }) {
    if (_isNetworkError(error)) {
      return '네트워크 연결을 확인해주세요.';
    }

    final data = error.response?.data;
    final errorMap = data is Map<String, dynamic> ? data['error'] : null;
    final code = errorMap is Map<String, dynamic> ? errorMap['code']?.toString() : null;
    final message = errorMap is Map<String, dynamic>
        ? errorMap['message']?.toString()
        : null;

    final statusCode = error.response?.statusCode;
    if (statusCode != null) {
      return switch (statusCode) {
        400 => mapApiError(
            code: code,
            message: message,
            fallbackMessage: '요청 값이 올바르지 않습니다.',
          ),
        401 => '로그인이 필요하거나 인증이 만료되었습니다.',
        403 => '요청을 수행할 권한이 없습니다.',
        404 => message?.isNotEmpty == true ? message! : '요청한 리소스를 찾을 수 없습니다.',
        409 => message?.isNotEmpty == true ? message! : '이미 존재하거나 현재 상태에서 처리할 수 없습니다.',
        422 => message?.isNotEmpty == true ? message! : '요청은 유효하지만 처리할 수 없습니다.',
        500 => '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
        _ => mapApiError(
            code: code,
            message: message,
            fallbackMessage: fallbackMessage,
          ),
      };
    }

    return mapApiError(
      code: code,
      message: message,
      fallbackMessage: fallbackMessage,
    );
  }

  static bool _isNetworkError(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.unknown;
  }
}
