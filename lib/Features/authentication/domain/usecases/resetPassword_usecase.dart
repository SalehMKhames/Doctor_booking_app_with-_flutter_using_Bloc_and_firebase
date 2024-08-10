import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

@LazySingleton()
class ResetPasswordUsecase
{
  final UserCredentialsRepo userRepo;

  ResetPasswordUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(UuidV4 id, String newPass) async
    => await userRepo.resetPassword(id, newPass);
}
