import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import "../entities/userCredentials.dart";
import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

@LazySingleton()
class RegisterUsecase
{
  final UserCredentialsRepo userRepo;

  RegisterUsecase({required this.userRepo});

  Future<Either<Failure, UserCredentials>> execute(String email, String password) async
    => await userRepo.userRegister(email, password);
}
