import 'package:dartz/dartz.dart';

import "../entities/userCredentials.dart";
import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

class LoginUsecase
{
  final UserRepo userRepo;

  LoginUsecase({required this.userRepo});

  Future<Either<Failure, UserCredentials>> execute(UserCredentials user) async => await userRepo.userLogin(user.email, user.password);
}
