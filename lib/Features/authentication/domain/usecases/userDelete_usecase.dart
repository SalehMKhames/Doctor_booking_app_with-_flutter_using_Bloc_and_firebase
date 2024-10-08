import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

import "../repositiories/user_credentials_repo.dart";
import 'package:doctory/core/ErrorHandling/failure.dart';

@LazySingleton()
class DeleteUsecase
{
  final UserCredentialsRepo userRepo;

  DeleteUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(UuidV4 id) async => await userRepo.userDelete(id);
}