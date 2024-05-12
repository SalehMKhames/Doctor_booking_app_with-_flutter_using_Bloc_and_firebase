import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';

import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

class DeleteUsecase
{
  final UserRepo userRepo;

  DeleteUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(User user) async => await userRepo.userSignOut(user.id);
}