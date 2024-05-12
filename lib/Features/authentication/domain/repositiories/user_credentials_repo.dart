import 'package:dartz/dartz.dart';

import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

abstract class UserRepo
{
  Future<Either<Failure, UserCredentials>> userLogin(String email, String password);

  Future<Either<Failure, UserCredentials>> userRegister(String email, String password);

  Future<Either<Failure, Unit>> resetPassword(String id, String newPassword);

  Future<Either<Failure, Unit>> userSignOut(String email);

  Future<Either<Failure, Unit>> userDelete(String id);

  Future<Either<Failure, User>> userGetInfo(String id);
}