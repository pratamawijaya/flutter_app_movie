import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/data/datasources/local/movie_db_local_datasource.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/movie_db_remote_datasource.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class MovieDbRepositoryImpl implements MovieDbRepository {
  final MovieDbRemoteDatasource movieDbRemoteDatasource;
  final MovieDbLocalDatasource movieDbLocalDatasource;

  MovieDbRepositoryImpl(
      this.movieDbRemoteDatasource, this.movieDbLocalDatasource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    try {
      var response = await movieDbRemoteDatasource.getNowPlaying();
      var listMovie = response.results;
      return Right(listMovie); // todo : create mapper
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
