import 'package:flutter_news_app_playground/data/datasources/remote/model/movie_response.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';

class MovieMapper {
  Movie mapToDomain(MovieResponse model) {
    return Movie(
        id: model.id ?? 0,
        title: model.title ?? "",
        poster: model.posterPath ?? "");
  }

  List<Movie> mapToListDomain(List<MovieResponse> listModel) {
    return listModel.map<Movie>((e) => mapToDomain(e)).toList();
  }

  MovieResponse mapToModel(Movie model) {
    return MovieResponse(
        backdropPath: "backdropPath",
        id: 0,
        title: "title",
        posterPath: "posterPath",
        overview: "overview");
  }
}
