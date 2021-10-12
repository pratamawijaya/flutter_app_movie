import 'package:json_annotation/json_annotation.dart';

part 'genre_model_response.g.dart';

@JsonSerializable()
class GenreModelResponse {
  int? id;
  String? name;

  GenreModelResponse(this.id, this.name);

  factory GenreModelResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelResponseToJson(this);
}
