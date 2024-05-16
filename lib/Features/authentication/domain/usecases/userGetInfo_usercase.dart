import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';

import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

class UserGetInfo
{
  final UserCredentialsRepo userRepo;

  const UserGetInfo({required this.userRepo});

  Future<Either<Failure, User>> execute(User user) async => await userRepo.userGetInfo(user.id);
}