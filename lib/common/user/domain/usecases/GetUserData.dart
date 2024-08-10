import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton()
class GetuserdataUsecase
{
  UserRepo userRepo;
  GetuserdataUsecase({required this.userRepo});

  Future<Either<Failure, User>> execute(String id) async => await userRepo.getUserData(id);
}