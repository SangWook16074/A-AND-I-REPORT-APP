import 'dart:convert';

import 'package:a_and_i_report_web_server/src/feature/articles/data/datasources/post_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostRemoteDatasourceImpl', () {
    test('createPost는 post(json)와 thumbnail 파트를 multipart로 전송한다', () async {
      FormData? capturedFormData;
      RequestOptions? capturedOptions;

      final dio = Dio()
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              capturedOptions = options;
              capturedFormData = options.data as FormData;
              handler.resolve(
                Response<Map<String, dynamic>>(
                  requestOptions: options,
                  statusCode: 201,
                  data: _responseJson(),
                ),
              );
            },
          ),
        );

      final datasource = PostRemoteDatasourceImpl(dio);
      final thumbnail = MultipartFile.fromBytes(
        <int>[1, 2, 3],
        filename: 'thumbnail.webp',
        contentType: DioMediaType.parse('image/webp'),
      );

      await datasource.createPost(
        'Bearer access-token',
        '제목',
        '본문',
        '11111111-1111-1111-1111-111111111111',
        '멘토',
        'https://example.com/profile.png',
        'Published',
        thumbnail,
      );

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, '/v1/posts');
      expect(capturedOptions!.method, 'POST');
      expect(capturedOptions!.headers['Authorization'], 'Bearer access-token');

      final files = capturedFormData!.files;
      final postPart = files.firstWhere((entry) => entry.key == 'post').value;
      final thumbnailPart =
          files.firstWhere((entry) => entry.key == 'thumbnail').value;

      expect(postPart.filename, 'post.json');
      expect(postPart.contentType?.mimeType, 'application/json');
      expect(
        jsonDecode(await _readMultipartAsString(postPart)),
        <String, dynamic>{
          'title': '제목',
          'contentMarkdown': '본문',
          'author': <String, dynamic>{
            'id': '11111111-1111-1111-1111-111111111111',
            'nickname': '멘토',
            'profileImageUrl': 'https://example.com/profile.png',
          },
          'status': 'Published',
        },
      );

      expect(thumbnailPart.filename, 'thumbnail.webp');
      expect(thumbnailPart.contentType?.mimeType, 'image/webp');
    });

    test('patchPost는 post(json) 파트를 multipart로 전송한다', () async {
      FormData? capturedFormData;
      RequestOptions? capturedOptions;

      final dio = Dio()
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              capturedOptions = options;
              capturedFormData = options.data as FormData;
              handler.resolve(
                Response<Map<String, dynamic>>(
                  requestOptions: options,
                  statusCode: 200,
                  data: _responseJson(),
                ),
              );
            },
          ),
        );

      final datasource = PostRemoteDatasourceImpl(dio);

      await datasource.patchPost(
        'Bearer access-token',
        'post-id',
        '수정 제목',
        '수정 본문',
        'Draft',
        null,
      );

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.path, '/v1/posts/post-id');
      expect(capturedOptions!.method, 'PATCH');
      expect(capturedOptions!.headers['Authorization'], 'Bearer access-token');

      final files = capturedFormData!.files;
      final postPart = files.firstWhere((entry) => entry.key == 'post').value;
      expect(postPart.filename, 'post.json');
      expect(postPart.contentType?.mimeType, 'application/json');
      expect(
        jsonDecode(await _readMultipartAsString(postPart)),
        <String, dynamic>{
          'title': '수정 제목',
          'contentMarkdown': '수정 본문',
          'status': 'Draft',
        },
      );
      expect(files.any((entry) => entry.key == 'thumbnail'), isFalse);
    });
  });
}

Map<String, dynamic> _responseJson() {
  return <String, dynamic>{
    'success': true,
    'data': <String, dynamic>{
      'id': 'post-id',
      'title': '제목',
      'contentMarkdown': '본문',
      'thumbnailUrl': 'https://example.com/thumbnail.webp',
      'author': <String, dynamic>{
        'id': '11111111-1111-1111-1111-111111111111',
        'nickname': '멘토',
        'profileImage': 'https://example.com/profile.png',
      },
      'status': 'Published',
      'createdAt': DateTime.utc(2026, 1, 1).toIso8601String(),
      'updatedAt': DateTime.utc(2026, 1, 1).toIso8601String(),
    },
    'error': null,
  };
}

Future<String> _readMultipartAsString(MultipartFile file) async {
  final bytes = await file.finalize().fold<List<int>>(
    <int>[],
    (acc, chunk) => acc..addAll(chunk),
  );
  return utf8.decode(bytes);
}
