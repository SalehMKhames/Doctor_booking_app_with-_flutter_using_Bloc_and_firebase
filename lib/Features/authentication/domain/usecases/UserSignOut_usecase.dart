import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

@LazySingleton()
class UsersignoutUsecase
{
  final UserCredentialsRepo userRepo;

  UsersignoutUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute() async => await userRepo.userSignOut();
}