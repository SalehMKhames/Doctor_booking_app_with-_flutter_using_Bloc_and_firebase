import 'package:dartz/dartz.dart';

import "../entities/user.dart";
import "../repositiories/user_repo.dart";

class ResetPasswordUsecase
{
  final UserRepo userRepo;

  ResetPasswordUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(User user) async => await userRepo.resetPassword(user.email!);
}
