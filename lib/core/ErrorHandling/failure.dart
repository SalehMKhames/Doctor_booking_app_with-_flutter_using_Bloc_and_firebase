import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable
{
  final String Message;

  const Failure({required this.Message});
  @override
  List<Object> get props => [Message];
}

class ServerFailure extends Failure {
  ServerFailure({required super.Message});
} //500

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure({required super.Message});
}

class OfflineFailure extends Failure {
  OfflineFailure({required super.Message});
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required super.Message});
} //400

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.Message});
} //401
