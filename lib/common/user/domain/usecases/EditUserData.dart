import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';

@LazySingleton()
class EdituserdataUsecase
{
  UserRepo userRepo;

  EdituserdataUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> execute(String id, String field, String value) async
  => await userRepo.editUserData(id, field, value);
}