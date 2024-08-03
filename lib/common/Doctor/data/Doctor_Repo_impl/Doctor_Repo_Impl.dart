import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/data/Data_Sources/Doctor_LocalDataSource.dart';
import 'package:doctory/common/Doctor/data/Data_Sources/Doctor_RemoteDataSource.dart';
import 'package:doctory/common/Doctor/domain/Repository/Doctor_Repo.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/core/ErrorHandling/exceptions.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DoctorRepo)
class DoctorRepoImpl extends DoctorRepo
{
  final DoctorRemotedatasource remotedatasource;
  final DoctorLocaldatasource localdatasource;

  const DoctorRepoImpl({required this.remotedatasource, required this.localdatasource});

  @override
  Future<Either<Failure, Doctor>> getDoctorData(String id) async
  {
    try{
      final res = await remotedatasource.getUserData(id);
      await localdatasource.cachingDoctor("Doctor_info", res);

      return right(res);
    }
    on ServerException catch(e){
      return Left(ServerFailure(Message: e.message));
    }
    on BadRequestException catch(e){
      return Left(BadRequestFailure(Message: e.message));
    }
    on UnauthorizedException catch(e){
      return Left(BadRequestFailure(Message: e.message));
    }
  }

}