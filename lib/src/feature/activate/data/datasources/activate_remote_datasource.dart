import 'package:a_and_i_report_web_server/src/feature/activate/data/dtos/activate_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/data/dtos/activate_response_dto.dart';
import 'package:dio/dio.dart';

class ActivateNetworkException implements Exception {}

class ActivateInvalidTokenException implements Exception {}

class ActivateRemoteDatasource {
  ActivateRemoteDatasource(
    this._dio, {
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final Dio _dio;
  final String _baseUrl;

  Future<void> activate(ActivateRequestDto request) async {
    const endpoints = <String>['/v1/auth/activate', '/activate'];
    for (var i = 0; i < endpoints.length; i++) {
      final endpoint = endpoints[i];
      final isLastEndpoint = i == endpoints.length - 1;

      try {
        final response = await _dio.post(
          _buildUrl(endpoint),
          data: request.toJson(),
        );
        _validateResponse(response);
        return;
      } on DioException catch (e) {
        if (_isNetworkError(e)) {
          throw ActivateNetworkException();
        }

        final statusCode = e.response?.statusCode;
        final shouldTryFallback =
            !isLastEndpoint && (statusCode == 404 || statusCode == 405);
        if (shouldTryFallback) {
          continue;
        }

        throw ActivateInvalidTokenException();
      }
    }

    throw ActivateInvalidTokenException();
  }

  String _buildUrl(String endpoint) {
    if (_baseUrl.trim().isEmpty) {
      return endpoint;
    }

    return Uri.parse(_baseUrl).resolve(endpoint).toString();
  }

  bool _isNetworkError(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.unknown;
  }

  void _validateResponse(Response<dynamic> response) {
    if (response.data is! Map<String, dynamic>) {
      throw ActivateInvalidTokenException();
    }

    final dto =
        ActivateResponseDto.fromJson(response.data as Map<String, dynamic>);
    final isSuccess = dto.success && (dto.data?.success ?? false);
    if (!isSuccess) {
      throw ActivateInvalidTokenException();
    }
  }
}
