import 'dart:io';

import 'package:dio/dio.dart';
import 'package:app_test_fiap/app/core/containers/injection_container.dart';
import 'package:app_test_fiap/app/core/storage_adapter/secure_storage/secure_storage_service.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    SecureStorageService? secureStorageService,
  }) : _storageService =
            secureStorageService ?? dependency.get<SecureStorageService>();

  final SecureStorageService? _storageService;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await _addTokenUsuario(options);
    return handler.next(options);
  }

  Future<void> _addTokenUsuario(RequestOptions options) async {
    final token = await _storageService!.read('token') ?? '';
    if (token.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
  }
}
