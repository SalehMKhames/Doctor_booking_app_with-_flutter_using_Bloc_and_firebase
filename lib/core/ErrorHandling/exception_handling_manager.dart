import 'package:dartz/dartz.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';

mixin ExceptionManager
{
  Future<Either<Failure,T>> handleExeption<T>(Future<Right<Failure, T>> Function() tryCall,) async
  {
    try{
      final result = await tryCall();
      return Right(result as T);
    }
    on ServerException catch (e)
    {
      return Left(ServerFailure(Message: e.message));
    }
    on BadRequestException catch (e)
    {
      return Left(BadRequestFailure(Message: e.message));
    }
    on OfflineException catch (e)
    {
      return Left(OfflineFailure(Message: e.message));
    }
    on UnauthorizedException catch (e)
    {
      return Left(UnauthorizedFailure(Message: e.message));
    }
    on EmptyCacheException catch (e)
    {
      return Left(EmptyCacheFailure(Message: e.message));
    }
    catch(err){
      return Left(ServerFailure(Message: err.toString()));
    }
  }
}

