import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class GetNowPlayingMovie extends UseCase<List<Movie>, NoParams> {
  final MovieDbRepository movieDbRepository;

  GetNowPlayingMovie(this.movieDbRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return movieDbRepository.getNowPlayingMovie();
  }
}
