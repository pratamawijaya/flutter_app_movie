import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String poster;

  Movie({required this.id, required this.title, required this.poster});

  @override
  List<Object?> get props => [id, title];
}
