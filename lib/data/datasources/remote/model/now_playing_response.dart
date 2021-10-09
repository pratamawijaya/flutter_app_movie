import 'dart:convert';

import 'package:flutter_news_app_playground/data/datasources/remote/model/movie_response.dart';

class NowPlayingResponse {
  final int page;
  final int totalPages;
  final int totalResult;
  final List<MovieResponse> movies;

  NowPlayingResponse(
      {required this.page,
      required this.totalPages,
      required this.totalResult,
      required this.movies});

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> movieResultsJson = jsonDecode(json["results"]);
    List<MovieResponse> itemsList = List<MovieResponse>.from(
        movieResultsJson.map((i) => MovieResponse.fromJson(i)));

    return NowPlayingResponse(
        page: json['page'],
        totalPages: json['total_page'],
        totalResult: json['total_result'],
        movies: itemsList);
  }
}
