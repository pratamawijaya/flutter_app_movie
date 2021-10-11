import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/model/movie_response.dart';

part 'now_playing_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NowPlayingResponse {
  final int? page;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResult;
  final List<MovieResponse>? results;

  NowPlayingResponse(
      {required this.page,
      required this.totalPages,
      required this.totalResult,
      required this.results});

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingResponseToJson(this);
}
