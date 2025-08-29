import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  Dio provideDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://flower.elevateegy.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // ✅ هنا ضيف الـ token في الهيدر مره واحدة
    dio.options.headers['token'] =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjhhNGRjMDJhOGJjYTMwN2Y5ZGYwODlhIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NTY0Mjk2OTF9.N8SGLseqee5U1IKd3BXeihVUZLhrXu3B2MnK9XfS7z8";

    // Logger
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

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
