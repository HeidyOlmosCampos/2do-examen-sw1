import 'package:dio/dio.dart';
import '../share_preferens/user_preferences.dart';

class DioConfig {
  static const String baseUrl =
      'https://back-sci-production.up.railway.app/api';

  static Dio get dioWithAuthorization {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = UserPreferences();
        final token = prefs.accessToken;
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));

    return dio;
  }

  static Dio get dioWithoutAuthorization {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ));
  }
}
