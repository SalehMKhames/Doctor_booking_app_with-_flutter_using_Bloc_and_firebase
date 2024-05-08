import 'package:dartz/dartz.dart';

import "../entities/user.dart";
import "../repositiories/user_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

class LoginUsecase
{
  final UserRepo userRepo;

  LoginUsecase({required this.userRepo});

  Future<Either<Failure, User>> execute(User user) async => await userRepo.userLogin(user.email!, user.password!);
}
