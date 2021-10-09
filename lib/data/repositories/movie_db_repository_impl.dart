import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class MovieDbRepositoryImpl implements MovieDbRepository {
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() {
    // TODO: implement getNowPlayingMovie
    throw UnimplementedError();
  }
}
