import 'package:dio/dio.dart';
import 'package:motopay_assessment_test/src/core/constants/api_config.dart';

class ApiClient {
  final Dio _client = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
    ),
  );

  Future<Response> get(
    String subPath, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await _client.get(subPath, queryParameters: parameters);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
