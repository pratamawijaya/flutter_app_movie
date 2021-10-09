import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';

abstract class MovieDbRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
}
