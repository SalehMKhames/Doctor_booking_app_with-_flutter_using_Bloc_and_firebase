import 'package:dartz/dartz.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_LocalDataSource.dart';
import 'package:doctory/Features/authentication/data/Data%20sources/auth_RemoteDataSource.dart';
import 'package:doctory/Features/authentication/domain/entities/userCredentials.dart';
import 'package:doctory/Features/authentication/domain/repositiories/user_credentials_repo.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';


class UserCredentialsIMP implements UserRepo
{
  final UserRemoteSource remoteSource;
  final UserLocalSource localSource;


  UserCredentialsIMP({required this.remoteSource, required this.localSource});

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
  Future<Either<Failure, UserCredentials>> userLogin(String email, String password) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredentials>> userRegister(String email, String password) async
  {
    try
    {
      final result = await remoteSource.Register(email, password);
      await localSource.cachedUserCredentials("User", result);

      return Right(result);
    }
    on Ser
    catch(){}
  }

  @override
  Future<Either<Failure, Unit>> userSignOut(String email) {
    // TODO: implement userSignOut
    throw UnimplementedError();
  }

}