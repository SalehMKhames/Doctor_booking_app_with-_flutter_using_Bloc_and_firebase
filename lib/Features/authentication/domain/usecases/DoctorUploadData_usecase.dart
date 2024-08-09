import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';


@LazySingleton()
class DoctoruploaddataUsecase
{
  UserCredentialsRepo userCredRepo;

  DoctoruploaddataUsecase({required this.userCredRepo});

  Future<Either<Failure, Unit>> execute(String dbName, String name, String bio, XFile profileImage, String special, String address) async
  => await userCredRepo.doctorUploadData(dbName, name, bio, profileImage, special, address);
}