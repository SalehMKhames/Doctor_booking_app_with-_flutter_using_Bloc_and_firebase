import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/domain/Repository/Doctor_Repo.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetdoctorbynameUsecase
{
  DoctorRepo doctorRepo;

  GetdoctorbynameUsecase({required this.doctorRepo});

  Future<Either<Failure, Doctor>> execute(String name) async => await doctorRepo.getDoctorData(name);
}