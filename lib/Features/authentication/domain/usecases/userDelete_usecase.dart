import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:injectable/injectable.dart';

import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

@LazySingleton()
class DeleteUsecase
{
  final UserCredentialsRepo userRepo;

  DeleteUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(User user) async => await userRepo.userDelete(user.id);
}