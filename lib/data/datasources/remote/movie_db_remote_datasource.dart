import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/model/genre_response.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/model/now_playing_response.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/services/dio_client.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/services/list_api.dart';

abstract class MovieDbRemoteDatasource {
  Future<NowPlayingResponse> getNowPlaying(int page);

  Future<GenreResponse> getGenre();

  Future<NowPlayingResponse> getMovieByGenre(String genre);
}

class MovieDbRemoteDatasourceImpl implements MovieDbRemoteDatasource {
  final DioClient _httpClient;

  MovieDbRemoteDatasourceImpl(this._httpClient);

  @override
  Future<NowPlayingResponse> getNowPlaying(int page) async {
    var query = {"page": page};
    var response = await _httpClient.getRequest(
      NewsApi.NOW_PLAYING,
      queryParameters: query,
    );

    if (response.statusCode == 200) {
      NowPlayingResponse result = NowPlayingResponse.fromJson(response.data);
      var len = result.results!.length;
      return result;
    } else {
      throw ServerException(response.statusMessage);
    }
  }

  @override
  Future<GenreResponse> getGenre() async {
    var response = await _httpClient.getRequest(NewsApi.GENRE);

    if (response.statusCode == 200) {
      GenreResponse result = GenreResponse.fromJson(response.data);
      return result;
    } else {
      throw ServerException(response.statusMessage);
    }
  }

  @override
  Future<NowPlayingResponse> getMovieByGenre(String genre) async {
    var response = await _httpClient.getRequest(NewsApi.GENRE);
    if (response.statusCode == 200) {
      NowPlayingResponse result = NowPlayingResponse.fromJson(response.data);
      return result;
    } else {
      throw ServerException(response.statusMessage);
    }
  }
}
