// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      backdropPath: json['backdrop_path'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
    };
