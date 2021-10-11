import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class GetNowPlayingMovie extends UseCase<List<Movie>, NoParams> {
  final MovieDbRepository _movieDbRepository;

  GetNowPlayingMovie(this._movieDbRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    print("get now playing usecase");
    return _movieDbRepository.getNowPlayingMovie();
  }
}
