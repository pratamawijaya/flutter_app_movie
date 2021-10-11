import 'package:flutter_news_app_playground/data/datasources/local/movie_db_local_datasource.dart';
import 'package:flutter_news_app_playground/data/datasources/mapper/movie_mapper.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/movie_db_remote_datasource.dart';
import 'package:flutter_news_app_playground/data/datasources/remote/services/dio_client.dart';
import 'package:flutter_news_app_playground/data/repositories/movie_db_repository_impl.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';
import 'package:flutter_news_app_playground/domain/usecases/get_now_playing.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // mapper
  sl.registerLazySingleton(() => MovieMapper());

  // http client
  sl.registerLazySingleton(() => DioClient());

  // datasources
  sl.registerLazySingleton<MovieDbRemoteDatasource>(
      () => MovieDbRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<MovieDbLocalDatasource>(
      () => MovieDbLocalDatasourceImpl());

  // repository
  sl.registerLazySingleton<MovieDbRepository>(
      () => MovieDbRepositoryImpl(sl(), sl(), sl()));

  // usecase
  sl.registerLazySingleton(() => GetNowPlayingMovie(sl()));
}
