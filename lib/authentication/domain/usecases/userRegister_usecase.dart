import 'package:dartz/dartz.dart';

import "../entities/user.dart";
import "../repositiories/user_repo.dart";

class RegisterUsecase
{
  final UserRepo userRepo;

  RegisterUsecase({required this.userRepo});

  Future<Either<Failure, User>> execute(User user) async => await userRepo.userRegister(user.email!, user.password!);
}
