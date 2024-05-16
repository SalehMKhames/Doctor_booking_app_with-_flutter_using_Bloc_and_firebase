import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {} //500

class EmptyCacheFailure extends Failure {}

class OfflineFailure extends Failure {}

class BadRequestFailure extends Failure {} //400

class UnauthorizedFailure extends Failure {} //401
