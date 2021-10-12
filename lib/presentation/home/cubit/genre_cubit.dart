import 'package:bloc/bloc.dart';
import 'package:flutter_news_app_playground/core/usecase/usecase.dart';
import 'package:flutter_news_app_playground/domain/entities/genre.dart';
import 'package:flutter_news_app_playground/domain/usecases/get_genre.dart';
import 'package:meta/meta.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GetGenre _getGenreUseCase;
  int selectedGenre = 0;

  GenreCubit(this._getGenreUseCase) : super(GenreInitial());

  Future<void> fetchGenre() async {
    emit(GenreLoading());
    final data = await _getGenreUseCase.call(NoParams());
    data.fold(
        (l) => emit(GenreError(l.toString())), (r) => emit(GenreLoaded(r)));
  }

  selectGenre(int id) {
    print("selected genre -> $id");
    selectedGenre = id;
  }
}
