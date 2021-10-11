import 'package:flutter_news_app_playground/data/datasources/remote/services/list_api.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/model/now_playing_response.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/services/dio_client.dart';

abstract class MovieDbRemoteDatasource {
  Future<NowPlayingResponse> getNowPlaying();
}

class MovieDbRemoteDatasourceImpl implements MovieDbRemoteDatasource {
  final DioClient _httpClient;

  MovieDbRemoteDatasourceImpl(this._httpClient);

  @override
  Future<NowPlayingResponse> getNowPlaying() async {
    var response = await _httpClient.getRequest(NewsApi.NOW_PLAYING);
    NowPlayingResponse result = NowPlayingResponse.fromJson(response.data);
    return result;
  }
}
