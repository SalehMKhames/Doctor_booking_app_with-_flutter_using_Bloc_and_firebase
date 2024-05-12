import 'package:dartz/dartz.dart';

import "../entities/userCredentials.dart";
import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

class RegisterUsecase
{
  final UserRepo userRepo;

  RegisterUsecase({required this.userRepo});

  Future<Either<Failure, UserCredentials>> execute(UserCredentials user) async => await userRepo.userRegister(user.email, user.password);
}
