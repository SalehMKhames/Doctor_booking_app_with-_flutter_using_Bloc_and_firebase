import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_LocalDataSource.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart';
import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';


class UserCredentialsImpl implements UserCredentialsRepo
{
  final UserRemoteSource remoteSource;
  final UserLocalSource localSource;


  UserCredentialsImpl({required this.remoteSource, required this.localSource});

  @override
  Future<Either<Failure, Unit>> resetPassword(String id, String newPassword)
  {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> userDelete(String id)
  {
    // TODO: implement userDelete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> userGetInfo(String id)
  {
    // TODO: implement userGetInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredentials>> userLogin(String email, String password) async
  {
    try
    {
      final result = await remoteSource.logIn(email, password);
      await localSource.cachingUserCredentials("User", result);

      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }
    on UnauthorizedException {
      return left(UnauthorizedFailure());
    }
    on BadRequestException {
      return left(BadRequestFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredentials>> userRegister(String email, String password) async
  {
    try
    {
      final result = await remoteSource.register(email, password);
      await localSource.cachingUserCredentials("User", result);

      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }
    on UnauthorizedException {
      return left(UnauthorizedFailure());
    }
    on BadRequestException {
      return left(BadRequestFailure());
    }
    // else{
    //   return Left(ServerFailure());
    // }
  }

  @override
  Future<Either<Failure, Unit>> userSignOut(String email) async
  {
    // TODO: implement userSignOut
    throw UnimplementedError();
  }

}