import 'package:dartz/dartz.dart';

import "../entities/userCredentials.dart";
import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

class SignoutUsecase
{
  final UserRepo userRepo;

  SignoutUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(UserCredentials user) async => await userRepo.userSignOut(user.email);
}
