import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final String? overview;

  MovieResponse(
      {required this.backdropPath,
      required this.id,
      required this.title,
      required this.posterPath,
      required this.overview});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
