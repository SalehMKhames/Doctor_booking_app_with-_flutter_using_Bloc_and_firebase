import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

class Uploaduserdata
{
  UserRepo userRepo;

  Uploaduserdata({required this.userRepo});

  Future<Either<Failure, Unit>> execute(User user) async => await userRepo.uploadUserData(user);
}