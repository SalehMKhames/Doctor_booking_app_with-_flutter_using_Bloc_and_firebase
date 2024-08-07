import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart';
import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserCredentialsRepo)
class UserCredentialsImpl implements UserCredentialsRepo
{
  final AuthRemoteSource remoteSource;

  UserCredentialsImpl({required this.remoteSource,});

  @override
  Future<Either<Failure, UserCredentials>> userRegister(String email, String password) async
  {
    try
    {
      final result = await remoteSource.register(email, password);
      return Right(result);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }

  }

  @override
  Future<Either<Failure, UserCredentials>> userLogin(String email, String password) async
  {
    try
    {
      final result = await remoteSource.logIn(email, password);
      return Right(result);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> userDelete(String id) async
  {
    try{
      final result = await remoteSource.deleteAccount(id);
      return Right(result);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(String id, String newPassword) async
  {
    try{
      final result = await remoteSource.resetPassword(id, newPassword);
      return Right(result);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> userUploadData(
      String name, String email, String birthDate, String phone, String medicalStatus)
  async
  {
    try{
      final result = await remoteSource.uploadData(name, email, birthDate, phone, medicalStatus);
      return Right(result);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return left(UnauthorizedFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return left(BadRequestFailure(Message: e.message));
    }
  }
}