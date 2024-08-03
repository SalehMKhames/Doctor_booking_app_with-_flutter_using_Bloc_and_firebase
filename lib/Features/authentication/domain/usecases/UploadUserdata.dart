import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';


@LazySingleton()
class Uploaduserdata
{
  UserCredentialsRepo userCredRepo;

  Uploaduserdata({required this.userCredRepo});

  Future<Either<Failure, Unit>> execute(String name, String email, String birth, String phone, String status) async
      => await userCredRepo.userUploadData(name, email, birth, phone, status);
}