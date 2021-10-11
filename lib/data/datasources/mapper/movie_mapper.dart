import 'package:flutter_news_app_playground/data/datasources/remote/model/movie_response.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';

class MovieMapper {
  Movie mapToDomain(MovieResponse model) {
    return Movie(id: model.id, title: model.title);
  }

  List<Movie> mapToListDomain(List<MovieResponse> listModel) {
    List<Movie> list = <Movie>[];
    listModel.map((e) => list.add(mapToDomain(e)));
    return list;
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
