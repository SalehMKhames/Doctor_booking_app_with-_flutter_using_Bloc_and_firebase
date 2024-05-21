import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/data/data_sources/user_LocalDataSource.dart';
import 'package:doctory/common/user/data/data_sources/user_RemoteDataSource.dart';
import 'package:doctory/common/user/domain/entity/user.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

class UserRepoImpl extends UserRepo
{
  final UserRemotedatasource userRemotedatasource;
  final UserLocalSource userLocalSource;

  UserRepoImpl({required super.user, required this.userRemotedatasource, required this.userLocalSource});

  @override
  Future<Either<Failure, User>> getUserData(String id) async
  {
    try{
      final result = await userRemotedatasource.getUserData(id);
      await userLocalSource.cachingUser("User_info", user);

      return right(result);
    }on ServerException {
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
  Future<Either<Failure, Unit>> uploadUserData(User userdata) async
  {
    try{
      final result = await userRemotedatasource.uploadData(userdata);
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