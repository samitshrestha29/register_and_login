import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/core/api_constant.dart';

class ApiClient {
  Future request(String endpoint, {String type = 'get'}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseUrl,
          headers: {
            "Content-Type": "Aplication/json",
          },
        ),
      );
      final result =
          type == 'get' ? await dio.get(endpoint) : await dio.post(endpoint);
      return result.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
