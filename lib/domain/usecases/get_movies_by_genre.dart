import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class GetMoviesByGenre extends UseCase<List<Movie>, ParamGenre> {
  final MovieDbRepository _repo;

  GetMoviesByGenre(this._repo);

  @override
  Future<Either<Failure, List<Movie>>> call(ParamGenre params) {
    return _repo.getMovieByGenre(params.genre);
  }
}

class ParamGenre {
  String genre;

  ParamGenre(this.genre);
}
