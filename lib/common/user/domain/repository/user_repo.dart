import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

abstract class UserRepo
{
  const UserRepo();

  Future<Either<Failure, User>> getUserData(String id);

  Future<Either<Failure, Unit>> editUserData(String id);
}