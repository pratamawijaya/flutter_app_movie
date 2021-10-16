import 'package:flutter/material.dart';
import 'package:flutter_news_app_playground/domain/entities/movie.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class GetMovieEvent extends MainState {
  final List<Movie> movies;
  final int page;

  GetMovieEvent(this.movies, this.page);
}

class Loading extends MainState {}

class Error extends MainState {
  String message;

  Error(this.message);
}

class Loaded extends MainState {
  List<Movie> movie;

  Loaded(this.movie);
}
