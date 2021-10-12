import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/data/datasources/local/movie_db_local_datasource.dart';
import 'package:flutter_news_app_playground/data/datasources/mapper/genre_mapper.dart';
import 'package:flutter_news_app_playground/data/datasources/mapper/movie_mapper.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/movie_db_remote_datasource.dart';
import 'package:flutter_news_app_playground/domain/entities/genre.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class MovieDbRepositoryImpl implements MovieDbRepository {
  final MovieDbRemoteDatasource movieDbRemoteDatasource;
  final MovieDbLocalDatasource movieDbLocalDatasource;
  final MovieMapper movieMapper;
  final GenreMapper genreMapper;

  MovieDbRepositoryImpl(this.movieDbRemoteDatasource,
      this.movieDbLocalDatasource, this.movieMapper, this.genreMapper);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie(int page) async {
    try {
      var response = await movieDbRemoteDatasource.getNowPlaying(page);
      var listMovie = response.results;
      if (listMovie != null) {
        return Right(movieMapper.mapToListDomain(listMovie));
      } else {
        return Left(ServerFailure("list movie null"));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Genre>>> getGenre() async {
    try {
      var response = await movieDbRemoteDatasource.getGenre();
      var listResult = response.genres;

      if (listResult != null) {
        return Right(genreMapper.mapToListDomain(listResult));
      } else {
        return Left(ServerFailure("list genre null"));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
