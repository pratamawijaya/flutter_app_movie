import 'package:dio/dio.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/services/api_key_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late Dio _dio;
  final baseUrl = "https://api.themoviedb.org/3/";

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initInterceptors();
  }

  Future<Response> getRequest(String endpoint) async {
    Response response;
    try {
      response = await _dio.get(endpoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  void initInterceptors() {
    _dio.interceptors.add(ApiKeyInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }
}
