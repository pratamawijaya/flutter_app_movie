import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/data/datasources/local/movie_db_local_datasource.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/movie_db_remote_datasource.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';

abstract class MovieDbRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
}