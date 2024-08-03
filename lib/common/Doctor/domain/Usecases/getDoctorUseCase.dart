import 'package:dartz/dartz.dart';
import 'package:doctory/common/Doctor/domain/Repository/Doctor_Repo.dart';
import 'package:doctory/common/Doctor/domain/entity/doctor.dart';
import 'package:doctory/core/ErrorHandling/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Getdoctorusecase
{
  DoctorRepo doctorRepo;

  Getdoctorusecase({required this.doctorRepo});

  Future<Either<Failure, Doctor>> getDocData(String id) async => await doctorRepo.getDoctorData(id);
}