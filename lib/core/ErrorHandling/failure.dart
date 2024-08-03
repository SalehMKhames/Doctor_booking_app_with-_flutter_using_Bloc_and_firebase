import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable
{
  final String Message;

  const Failure({required this.Message});
  @override
  List<Object> get props => [Message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.Message});
} //500

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.Message});
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.Message});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({required super.Message});
} //400

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.Message});
} //401
