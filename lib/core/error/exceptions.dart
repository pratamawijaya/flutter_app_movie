import 'package:equatable/equatable.dart';

class ServerException implements Exception {
  String? message;

  ServerException(this.message);
}

class CacheException implements Exception {}

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  String? message;

  ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [""];
}
