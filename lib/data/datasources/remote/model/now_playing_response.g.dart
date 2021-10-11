// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingResponse _$NowPlayingResponseFromJson(Map<String, dynamic> json) =>
    NowPlayingResponse(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalResult: json['total_result'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NowPlayingResponseToJson(NowPlayingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_result': instance.totalResult,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
