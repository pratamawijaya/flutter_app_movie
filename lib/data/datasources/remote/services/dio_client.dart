import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/model/now_playing_response.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/services/api_key_interceptor.dart';

class DioClient {
  late Dio _dio;
  late Alice _alice;
  final baseUrl = "https://api.themoviedb.org/3/";

  DioClient() {
    _alice = Alice();

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initInterceptors();
  }

  Future<NowPlayingResponse> getNowPlaying() async {
    Response response = await _dio.get('movie/now_playing');
    print("Now playing info : ${response.data}");
    NowPlayingResponse result = NowPlayingResponse.fromJson(response.data);
    return result;
  }

  void initInterceptors() {
    _dio.interceptors.add(_alice.getDioInterceptor());
    _dio.interceptors.add(ApiKeyInterceptor());
  }
}
