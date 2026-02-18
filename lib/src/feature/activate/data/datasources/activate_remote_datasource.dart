import 'package:a_and_i_report_web_server/src/feature/activate/data/dtos/activate_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/data/dtos/activate_response_dto.dart';
import 'package:dio/dio.dart';

class ActivateNetworkException implements Exception {}

class ActivateInvalidTokenException implements Exception {}

class ActivateRemoteDatasource {
  ActivateRemoteDatasource(this._dio);

  final Dio _dio;

  Future<void> activate(ActivateRequestDto request) async {
    try {
      final response = await _dio.post(
        '/activate',
        data: request.toJson(),
      );

      if (response.data is! Map<String, dynamic>) {
        throw ActivateInvalidTokenException();
      }
      final dto =
          ActivateResponseDto.fromJson(response.data as Map<String, dynamic>);
      final isSuccess = dto.success && (dto.data?.success ?? false);
      if (!isSuccess) {
        throw ActivateInvalidTokenException();
      }
    } on DioException catch (e) {
      final isNetworkError = e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown;

      if (isNetworkError) {
        throw ActivateNetworkException();
      }
      throw ActivateInvalidTokenException();
    }
  }
}
