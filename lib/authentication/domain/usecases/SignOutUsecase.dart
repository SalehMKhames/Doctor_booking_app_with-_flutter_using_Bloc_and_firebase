import 'package:dartz/dartz.dart';

import "../entities/user.dart";
import "../repositiories/user_repo.dart";

class SignoutUsecase
{
  final UserRepo userRepo;

  SignoutUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(User user) async => await userRepo.userSignOut(user.email!);
}
