import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import "../entities/userCredentials.dart";
import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

@LazySingleton()
class ResetPasswordUsecase
{
  final UserCredentialsRepo userRepo;

  ResetPasswordUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(UserCredentials user) async => await userRepo.resetPassword(user.email, user.password);
}
