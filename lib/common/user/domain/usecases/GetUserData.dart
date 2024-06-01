import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Getuserdata
{
  UserRepo userRepo;
  Getuserdata({required this.userRepo});

  Future<Either<Failure, User>> execute(User user) async => await userRepo.getUserData(user.id);
}