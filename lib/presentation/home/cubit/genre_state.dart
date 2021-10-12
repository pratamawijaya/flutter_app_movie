part of 'genre_cubit.dart';

@immutable
abstract class GenreState {}

class GenreInitial extends GenreState {}

class GenreLoading extends GenreState {}

class GenreError extends GenreState {
  final String msg;

  GenreError(this.msg);
}

class GenreLoaded extends GenreState {
  final List<Genre> genres;

  GenreLoaded(this.genres);
}
