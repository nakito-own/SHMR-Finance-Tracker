import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shmr_finance/core/deserialize_interceptor.dart';

import '../config/api_config.dart';
import 'auth_provider.dart';

class DioClient {
  final Dio dio;
  final AuthProvider _authProvider;
  final int _maxRetries;

  DioClient._(this._authProvider, {int maxRetries = 3})
      : dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl)),
        _maxRetries = maxRetries {
    dio.interceptors
      ..add(DeserializeInterceptor())
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = await _authProvider.getToken();
            options.headers['Authorization'] = 'Bearer $token';
            return handler.next(options);
          },
        onError: (error, handler) async {
          final status = error.response?.statusCode;
          final attempt = (error.requestOptions.extra['retry'] ?? 0) + 1;
          if (_shouldRetry(status) && attempt <= _maxRetries) {
            final delay = Duration(seconds: 1 << (attempt - 1));
            await Future.delayed(delay);
            final options = error.requestOptions..extra['retry'] = attempt;
            try {
              final response = await dio.fetch(options);
              return handler.resolve(response);
            } catch (e) {
              return handler.reject(e as DioException);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  static bool _shouldRetry(int? status) {
    const codes = {500, 502, 503, 504, 408, 429};
    return status != null && codes.contains(status);
  }

  static DioClient? _instance;
  factory DioClient(AuthProvider provider) => _instance ??= DioClient._(provider);
}