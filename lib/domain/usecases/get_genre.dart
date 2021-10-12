import 'package:dartz/dartz.dart';
import 'package:flutter_news_app_playground/core/error/exceptions.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/genre.dart';
import 'package:flutter_news_app_playground/domain/repositories/movie_db_repository.dart';

class GetGenre extends UseCase<List<Genre>, NoParams> {
  final MovieDbRepository _movieRepository;

  GetGenre(this._movieRepository);

  @override
  Future<Either<Failure, List<Genre>>> call(NoParams params) {
    return _movieRepository.getGenre();
  }
}
