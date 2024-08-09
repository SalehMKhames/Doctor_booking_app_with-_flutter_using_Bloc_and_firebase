import 'package:dartz/dartz.dart';

import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';

import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:image_picker/image_picker.dart';


abstract class UserCredentialsRepo
{
  Future<Either<Failure, UserCredentials>> userLogin(String email, String password);

  Future<Either<Failure, UserCredentials>> userRegister(String email, String password);

  Future<Either<Failure, Unit>> resetPassword(String id, String newPassword);

  Future<Either<Failure, Unit>> userDelete(String id);

  Future<Either<Failure, Unit>> userUploadData(String Database, String name, String email, String birthDate, String phone, String medicalStatus);

  Future<Either<Failure, Unit>> doctorUploadData(String Database, String name, String bio, XFile profileImage, String special, String address);
}