import 'package:dartz/dartz.dart';

import 'package:doctory/authentication/domain/entities/user.dart';

abstract class UserRepo
{
  Future<Either<Failure, User>> userLogin(String email, String password);

  Future<Either<Failure, User>> userRegister(String email, String password);

  Future<Either<Failure, Unit> resetPassword(String email);

  Future<Either<Failure, Unit>> userSignOut(String email);
}