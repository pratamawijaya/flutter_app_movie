import 'package:flutter_news_app_playground/data/datasources/remote/model/genre_model_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GenreResponse {
  List<GenreModelResponse>? genres;

  GenreResponse(this.genres);

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
