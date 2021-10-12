import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class GetNowPlayingMovie extends UseCase<List<Movie>, NowPlayingParams> {
  final MovieDbRepository _movieDbRepository;

  GetNowPlayingMovie(this._movieDbRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NowPlayingParams params) {
    print("get now playing usecase");
    return _movieDbRepository.getNowPlayingMovie(params.page);
  }
}

class NowPlayingParams extends Equatable {
  int page;

  NowPlayingParams(this.page);

  @override
  List<Object?> get props => [page];
}
