import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  int id;
  String name;

  Genre(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}
