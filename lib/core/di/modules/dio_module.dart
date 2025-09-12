import 'package:dio/dio.dart';
import 'package:flower_app/core/di/modules/shared_preferences_module.dart';
import 'package:flower_app/core/keys/shared_key.dart';
import 'package:flower_app/core/utils/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  Dio provideDio(PrettyDioLogger logger) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (status) =>
            status != null && status < 500,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = SharedPrefHelper().getString(
            key: SharedPrefKeys.tokenKey,
          );
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] =
                'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    // إضافة الـ Logger
    dio.interceptors.add(logger);

    return dio;
  }

  @singleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    );
  }
}
