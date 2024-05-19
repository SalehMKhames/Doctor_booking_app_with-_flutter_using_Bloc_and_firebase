import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

abstract class UserRepo
{
  final User user;

  const UserRepo({required this.user});

  Future<Either<Failure, Unit>> uploadUserData(User userdata);

  Future<Either<Failure, User>> getUserData(String id);
}