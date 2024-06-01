import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_LocalDataSource.dart';
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
  final AuthLocalSource localSource;

  UserCredentialsImpl({required this.remoteSource, required this.localSource});

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
  Future<Either<Failure, Unit>> userDelete(String id) async
  {
    try{
      final result = await remoteSource.deleteAccount(id);
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
  Future<Either<Failure, Unit>> resetPassword(String id, String newPassword) async
  {
    try{
      final result = await remoteSource.resetPassword(id, newPassword);
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
}