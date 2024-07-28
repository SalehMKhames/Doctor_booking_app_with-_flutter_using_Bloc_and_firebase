import 'package:dartz/dartz.dart';
import 'package:doctory/common/user/data/Model/UserModel.dart';
import 'package:doctory/common/user/data/data_sources/user_LocalDataSource.dart';
import 'package:doctory/common/user/data/data_sources/user_RemoteDataSource.dart';
import 'package:doctory/common/user/domain/repository/user_repo.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepo)
class UserRepoImpl extends UserRepo
{
  final UserRemotedatasource userRemotedatasource;
  final UserLocalSource userLocalSource;

  UserRepoImpl({required this.userRemotedatasource, required this.userLocalSource});

  @override
  Future<Either<Failure, UserModel>> getUserData(String id) async
  {
    try{
      final result = await userRemotedatasource.getUserData(id);
      await userLocalSource.cachingUser("User_info", result);

      return right(result);
    }on ServerException catch(e){
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
  Future<Either<Failure, Unit>> editUserData(String id) async
  {
    try{
      final result = await userRemotedatasource.editUserData(id);
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