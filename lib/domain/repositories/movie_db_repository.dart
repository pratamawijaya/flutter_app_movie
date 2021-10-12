import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/domain/entities/genre.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';

abstract class MovieDbRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie(int page);

  Future<Either<Failure, List<Genre>>> getGenre();

  Future<Either<Failure, List<Movie>>> getMovieByGenre(String genre);
}
