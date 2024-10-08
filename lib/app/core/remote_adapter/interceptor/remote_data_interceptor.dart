import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RemoteDataInterceptor extends Interceptor {
  RemoteDataInterceptor({
    required this.apiKey,
  });

  final String apiKey;
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      print('${options.method} --> ${options.path}');
      print('headers: ${options.headers}');
      print('data: ${options.data}');
    }
    options.queryParameters.addAll({'appid': apiKey});
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      print(
        'SUCCESS ${response.statusCode} <-- ${response.requestOptions.path}',
      );
      print('body: ${response.data}');
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print('ERROR ${err.response?.statusCode} <-- ${err.requestOptions.path}');
      print('body: ${err.response?.data}');
    }
    return super.onError(err, handler);
  }
}
