import 'package:dartz/dartz.dart';

import 'package:doctory/authentication/domain/entities/user.dart';

abstract class UserRepo
{
  Future<Either<Failure, User>> userLogin(String email, String password);

  Future<Either<Failure, User>> userRegister(String email, String Password);

  Future<Either<Failure, String>> resetPassword(String email);
}