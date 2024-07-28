import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Edituserdata
{
  UserRepo userRepo;

  Edituserdata({required this.userRepo});

  Future<Either<Failure, Unit>> execute(String id) async
  => await userRepo.editUserData(id);
}